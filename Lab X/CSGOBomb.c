#include <stdio.h>
#include <at89lp52.h>

#define CLK     22118400L
#define BAUD    115200L

void sleep(long int time) {
    unsigned long int i;
    for (i = 0; i < time; i++);
}

void main(void) {
    unsigned long int rate = 1000; //500000;
    int i;
    short int dir = -10;
    PMOD = 0;
    while (1) {
    	for (i = 0; i < 5 i++) {
        	P3_7 = 0;
        	sleep(rate);
        	P3_7 = 1;
        	sleep(rate);
        }
        rate += dir;
        if (rate <= 100 || rate >= 1000) dir *= -1;
    }
}
