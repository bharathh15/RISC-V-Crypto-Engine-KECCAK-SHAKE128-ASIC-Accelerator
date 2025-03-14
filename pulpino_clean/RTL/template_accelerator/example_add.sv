///////////////////////////////////////////////////////////////////////////////
// @file     example_add.sv
// @brief    Example adder for accelerator template
// @author   Patrick Karl <patrick.karl@tum.de>
// @license  TBD
///////////////////////////////////////////////////////////////////////////////

import cfg_types_pkg::*;

module example_add
#(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
)
(
    input   logic                       clk,
    input   logic                       rst_n,

    output  acc_state_t                 accel_state,
    output  acc_error_t                 accel_error,

    input   logic                       start,     //doubt
    output  logic                       done,      
    input   logic [7:0]                 max_cnt,
    input   logic [7:0]                 incr,

    output  logic                       mem_en_a,
    output  logic [ADDR_WIDTH-1:0]      mem_addr_a,
    output  logic                       mem_we_a,
    output  logic [DATA_WIDTH-1:0]      mem_wdata_a,
    output  logic [DATA_WIDTH/8-1:0]    mem_be_a,
    input   logic [DATA_WIDTH-1:0]      mem_rdata_a,

    output  logic                       mem_en_b,
    output  logic [ADDR_WIDTH-1:0]      mem_addr_b,
    output  logic                       mem_we_b,
    output  logic [DATA_WIDTH-1:0]      mem_wdata_b,
    output  logic [DATA_WIDTH/8-1:0]    mem_be_b,
    input   logic [DATA_WIDTH-1:0]      mem_rdata_b
);

//internal signals to connect the keccak module and this module

    logic [63:0] din_internal;        // 64-bit signal, using `logic`
    logic [63:0] dout_internal;       // 64-bit signal, using `logic`
    logic din_valid_internal;         // 1-bit flag signal, using `logic`
    logic buffer_full_internal;
    logic last_block_internal;
    logic dout_valid_internal;
    logic start_bit;
    logic done_bit;

keccak keccak_instance (
    .clk                (clk                    ),                  
    .rst_n              (rst_n                  ),                
    .start              (start_bit              ),                
    .din                (din_internal           ),         
    .din_valid          (din_valid_internal     ),    
    .buffer_full        (buffer_full_internal   ), 
    .last_block         (last_block_internal    ),  
    .ready              (done_bit               ),                
    .dout               (dout_internal          ),        
    .dout_valid         (dout_valid_internal    )   
);




    enum {IDLE, READ, WAIT, WRITE} state, n_state;

    // Address counter
    logic [7:0]             addr_cnt;
    logic                   en_mem;
    logic                   wr_mem; 
    logic [4:0]             counter;  // counter to keep track of the amount of input data received
    
    //////////////////////////////////////////////////////////////////
    // Assignments
    //////////////////////////////////////////////////////////////////
    assign mem_en_a     = en_mem;
    assign mem_en_b     = en_mem;

    assign mem_we_a     = wr_mem;
    assign mem_we_b     = wr_mem;

    assign mem_addr_a   = addr_cnt;
    assign mem_addr_b   = addr_cnt + 1;  //changes made here to read the data from memory location B which is the next block of memory location A.

    //assign   din_internal = {mem_rdata_a, mem_rdata_b};  
    assign din_internal[63:32] = mem_rdata_b;
    assign din_internal[31:0] =  mem_rdata_a;
    assign   mem_wdata_b = dout_internal[63:32];
    assign   mem_wdata_a = dout_internal[31:0];

   //adder that adds incr to each byte (here its 4 bytes)
   /*
   genvar i;
    generate
        for (i=0; i<DATA_WIDTH/8; i++) begin
            assign mem_wdata_a[8*i+7 -:8]   = mem_rdata_a[8*i+7 -:8] + incr;
            assign mem_be_a[i]              = 1'b1;

            assign mem_wdata_b[8*i+7 -:8]   = mem_rdata_b[8*i+7 -:8] + incr;
            assign mem_be_b[i]              = 1'b1;
        end
    endgenerate

   */
    
    
    //////////////////////////////////////////////////////////////////
    // FSM
    //////////////////////////////////////////////////////////////////

    // State register, asynchronous active low reset
    always_ff @(posedge clk, negedge rst_n)
        if (!rst_n) state <= IDLE;
        else        state <= n_state;

    // Next state logic
    always_comb begin
        n_state = state; 
        unique case (state)
            IDLE: begin
                start_bit = 1'b1;
                din_valid_internal = 1'b0;
                last_block_internal = 1'b0;
                if (start) n_state = READ;
            end

            READ: begin
                start_bit = 1'b0;
                
                if(!buffer_full_internal) begin
                    if(addr_cnt >= 2) begin
                        din_valid_internal  = 1'b1;
                    end
                n_state = READ; 
                end else begin

                    n_state = WAIT;

                end
            end
            WAIT: begin
                start_bit = 1'b0;
                  din_valid_internal   = 1'b0;
                  last_block_internal = 1'b1;
                if(done_bit) begin
                    n_state = WRITE;
                end else begin
                    n_state = WAIT;
                end
            end

            WRITE: begin
                start_bit = 1'b0;
                if (dout_valid_internal) begin
                    n_state = WRITE;
                end else begin 
                    n_state = IDLE;
                end
            end  

            default : begin
                   n_state = IDLE;
                end    
        endcase
    end
    

    // Memory control
    always_comb
    begin
        // Defaults
        wr_mem      = 1'b0;
        en_mem      = 1'b0;
        accel_state = ST_IDLE;
        done        = 1'b0;
        //dout_valid_internal  = 1'b0;
        if (max_cnt[0]) accel_error = ER_INVALID_CFG;
        else            accel_error = ER_OKAY;


        unique case (state)
            IDLE : begin
                // NULL
            end

            READ : begin
                accel_state = ST_RUNNING;
                en_mem      = 1'b1;
            end

            WAIT: begin
                accel_state = ST_RUNNING;
                en_mem      = 1'b0;
            end

            WRITE : begin
                accel_state = ST_RUNNING;
                en_mem      = 1'b1;
                wr_mem      = 1'b1;
                if(!dout_valid_internal) begin
                    done = 1'b1;
                end
                
            end

        endcase
    end


    // Address counter
    always_ff @(posedge clk, negedge rst_n)
    begin
        if (!rst_n) 
            addr_cnt <= 1'b0;
        else begin
            unique case (state)
                IDLE : begin
                     addr_cnt <= 1'b0;
                end
                READ : begin
                    
                            addr_cnt <= addr_cnt + 2;  // Properly increment the counter
                    

                end


                WAIT: begin
                    addr_cnt <= 1'b0;
                end
                
                WRITE : begin
                   
                  
                            addr_cnt <= addr_cnt + 2;  // Properly increment the counter
                    
                end
                default : begin
                    // NULL
                end
            endcase
        end
    end

    // Counter logic for input data
    // always_ff @(posedge clk, negedge rst_n) begin
    //     if (!rst_n) counter <= 0;
    //     else begin
    //         if (state == READ && counter < 21) counter <= counter + 1;
    //         else if (state == WRITE && counter < 21) counter <= counter + 1;
    //     end
    // end

endmodule
