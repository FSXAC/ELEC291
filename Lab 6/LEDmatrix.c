// Using 10bit ADC
// Measures voltage at any arbitrary pins in LQFP32 (processor) package

// imports
#include <stdio.h>
#include <stdlib.h>
#include <c8051f38x.h>
#include "LEDmatrix.h"

unsigned char sprite1[8] = {0x00, 0x00, 0x00, 0x18, 0x18, 0x00, 0x00, 0x00};
unsigned char sprite2[8] = {0x00, 0x00, 0x18, 0x24, 0x24, 0x18, 0x00, 0x00};
unsigned char sprite3[8] = {0x00, 0x18, 0x24, 0x5A, 0x5A, 0x24, 0x18, 0x00};
unsigned char sprite4[8] = {0x3C, 0x42, 0x99, 0xA5, 0xA5, 0x99, 0x42, 0x3C};
unsigned char sprite5[8] = {0x42, 0x99, 0x24, 0x42, 0x42, 0x24, 0x99, 0x42};
unsigned char sprite6[8] = {0x3C, 0x42, 0x81, 0x81, 0x81, 0x81, 0x42, 0x3C};
unsigned char sprite7[8] = {0x42, 0x81, 0x00, 0x00, 0x00, 0x00, 0x81, 0x42};

void main(void) {
    unsigned char position = 1;
    printf("\x1b[2J");
    printf("LED TESTING\n"
        "Author:   Muchen He (44638154)\n"
        "File:     %s\n"
        "Compiled: %s, %s\n"
        "===================\n",
        __FILE__, __DATE__, __TIME__
    );

    LED_init();
    printf("\x1b[s");
    while (1) {
        // checkers
        // LED_write(position, (position % 2) ? 0x55 : 0xAA);
        // position = (position == 0x08) ? 0x01 : position + 1;
        LED_display(sprite1);
        delay(50);
        LED_display(sprite2);
        delay(50);
        LED_display(sprite3);
        delay(50);
        LED_display(sprite4);
        delay(50);
        LED_display(sprite5);
        delay(50);
        LED_display(sprite6);
        delay(50);
        LED_display(sprite7);
        delay(50);
        LED_clear();
        delay(5000);
    }
}

void LED_display(unsigned char *grid) {
    unsigned int i;
    for (i = 1; i <= 8; i++) {
        LED_write(i, grid[i-1]);
    }
}

char _c51_external_startup(void) {
    PCA0MD &= (~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
    VDM0CN  = 0x80; // enable VDD monitor
    RSTSRC  = 0x02|0x04; // Enable reset on missing clock detector and VDD

    // CLKSEL&=0b_1111_1000; // Not needed because CLKSEL==0 after reset
    #if (SYSCLK == 12000000L)
        //CLKSEL|=0b_0000_0000;  // SYSCLK derived from the Internal High-Frequency Oscillator / 4
    #elif (SYSCLK == 24000000L)
        CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
    #elif (SYSCLK == 48000000L)
        CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
    #else
        #error SYSCLK must be either 12000000L, 24000000L, or 48000000L
    #endif

    OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency

    // Configure UART0
    SCON0 = 0x10;
    #if (SYSCLK/BAUDRATE/2L/256L < 1)
    	TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
    	CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
    	CKCON |=  0x08;
    #elif (SYSCLK/BAUDRATE/2L/256L < 4)
    	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/4L);
    	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 01
    	CKCON |=  0x01;
    #elif (SYSCLK/BAUDRATE/2L/256L < 12)
    	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/12L);
    	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 00
    #else
    	TH1 = 0x10000-(SYSCLK/BAUDRATE/2/48);
    	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 10
    	CKCON |=  0x02;
    #endif

    TL1   = TH1;      // Init Timer1
    TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
    TMOD |= 0x20;
    TR1   = 1; // START Timer1
    TI    = 1;  // Indicate TX0 ready

    // Configure the pins used for motor control and communication
    P0MDOUT |= 0x01;  // set P0.0 and P0.4 as push-pull outputs

    // set port 2 as open drain
    P2MDOUT &= 0x00;
    XBR0 = 0x01;      // Enable UART0 on P0.4(TX0) and P0.5(RX0)
    XBR1 = 0x40;      // enable crossbar

    return 0;
}

// Use timer 3 to delay <us> micro-seconds
void delayUs(unsigned char us) {
    unsigned char i;
    CKCON  |= 0b_0100_0000;
    TMR3RL  = (-(SYSCLK)/1000000L);
    TMR3    = TMR3RL;
    TMR3CN  = 0x04;

    // count <us> overflows
    for (i = 0; i < us; i++) {
        while (!(TMR3CN & 0x80));
        TMR3CN &= ~(0x80);
    }
    TMR3CN = 0;
}

// delays <ms> microseconds
void delay(unsigned int ms) {
    unsigned int j;
    for (j = 0; j < ms; j++) {
        delayUs(249);
        delayUs(249);
        delayUs(249);
        delayUs(250);
    }
}

// ===[STUFF FOR MAX7219 HERE]===
/* send one byte */
void LED_spi(unsigned char value) {
    unsigned char j, temp;
    for (j = 1; j <= 8; j++) {
        temp = value & 0x80;
        LED_DATA = (temp == 0x80) ? HIGH : LOW;

        // toggle clock
        LED_CLK = HIGH;
        delayUs(20);
        LED_CLK = LOW;

        // shift bit one over
        value = value << 1;
    }
}

void LED_pulse(void) {
    LED_CS = HIGH;
    delay(1);
    LED_CS = LOW;
}

/* clear all MAX7219s */
void LED_clear(void) {
    unsigned char j;
    for (j = 1; j <= 8; j++) {
        LED_spi(j);
        LED_spi(0x00);
        LED_pulse();
    }
}


/* set custom intensity for LEDs */
void LED_setIntensity(unsigned char intensity) {
    if (intensity > 0x0F) return;
    LED_spi(0x0A);
    LED_spi(intensity);
    LED_pulse();
}

/* initialize the LED */
void LED_init(void) {
    LED_CS = LOW;

    // set decode mode (no-decode)
    LED_spi(0x09);
    // LED_spi(0xFF);
    LED_spi(0x00);
    LED_pulse();

    // set intensity (0-F)
    LED_spi(0x0A);
    LED_spi(LED_INTENSITY);
    LED_pulse();

    // set scan limit (8 digits)
    LED_spi(0x0b);
    LED_spi(0x07);
    LED_pulse();

    // clear MAX7219
    LED_clear();

    // set for normal operation
    LED_spi(0x0C);
    LED_spi(0x01);
    LED_pulse();
}

/* write to MAX7219 */
void LED_write(unsigned char address, unsigned char value) {
    if ((address < 1) || (address > 8)) return;
    LED_spi(address);
    LED_spi(value);
    LED_pulse();
}

/* turn on ALL LEDs for testing */
void LED_test(void) {
    LED_spi(0x0F);
    LED_spi(0x01);
    LED_pulse();
    delay(1000);
    LED_spi(0x0F);
    LED_spi(0x00);
    LED_pulse();
}
