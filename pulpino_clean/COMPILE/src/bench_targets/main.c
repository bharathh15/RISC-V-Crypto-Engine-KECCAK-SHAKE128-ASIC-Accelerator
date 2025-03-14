#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include "gpio.h"
#include "timer.h"
#include "uart.h"
#include "fips202.h"
#include "stackbench.h"

#define DATA_REG_BASE_ADDR     0x1E180000       // Base address of Data Path (DP) RAM
#define CTRL_REG_BASE_ADDR     0x1E100000       // Base address of the control register
#define MAX_CNT                15               // Number of entries in the DP RAM for the example
#define INCR                   2
#define CONTROL_INFO           0x00092001       // control info to be written 
#define START_BIT_OFFSET       0x1E100000       // Offset for the start bit in the control register
#define DONE_BIT_OFFSET        0x1E100010       // Offset for the done bit in the signal register

int t0 = 0, t1 = 0;


void write_to_ram(uint32_t base_addr, uint32_t index, uint32_t value) {
    volatile uint32_t *adderess = (volatile uint32_t*) (base_addr + (index * 4)) ;
    *adderess = value;
}


uint32_t read_from_ram(uint32_t base_addr, uint32_t index) {
    volatile uint32_t * address = ((volatile uint32_t*) (base_addr + (index * 4)));
    uint32_t result = * address;
    return result;
}


int is_done(uint32_t done_signal_addr) {
    return (*((volatile uint32_t*) done_signal_addr) & (0x01)) == 0;
}

void write_to_memory(uint32_t addr, uint32_t info){
  
  volatile uint32_t *ctrl_addr = (volatile uint32_t*) addr;
  *ctrl_addr = info;
}


void main(){

     
    reset_timer();
    start_timer();


        /* Used to initialize GPIOs */
    for (uint8_t i=0; i<8; i++) {
        set_gpio_pin_direction(i, DIR_OUT);
    }



   // printf("Initialising Dual Port RAM with some data in the base address, 0x1E180000 \n");
    for (uint32_t i = 0; i <= MAX_CNT; i++)
    {
        write_to_ram(DATA_REG_BASE_ADDR, i, i);
        //printf("The value written to the DP RAM is %d, at index %d\n", i, i);
    }

        write_to_ram(DATA_REG_BASE_ADDR, 16, 0x1F);

    for (uint32_t i = 17; i < 41; i++){
        write_to_ram(DATA_REG_BASE_ADDR, i, 0x00);
    }

     write_to_ram(DATA_REG_BASE_ADDR, 41, 0x80000000);
    //write_stack();
    t0 = get_time();
    //printf("Start time: %d\n", t0);

    //printf("Writing the Control Register Information and start the accelerator \n");

    write_to_memory(CTRL_REG_BASE_ADDR, CONTROL_INFO );


    while(!is_done(CTRL_REG_BASE_ADDR)){

    }

    //printf("Reading results from DP RAM...\n");
    for (int i = 0; i < 168; i++) {
        uint32_t result = read_from_ram(DATA_REG_BASE_ADDR, i);
        //printf("Result at index [%d: %x] \n", i, result); 
    }


    t1 = get_time();
    //printf("End time: %d\n", t1);
    //uint32_t stack_bytes = check_stack();
    /* Print elapsed time and stack consumption */
    printf("\nElapsed cycles: %d\n", t1-t0);
    //printf("Stack Bytes: %d\n", stack_bytes);

    /* Used to stop simulation */
    uart_wait_tx_done();
    for (uint8_t i=0; i<8; i++) {
        set_gpio_pin_value(i, 1);
    }

}