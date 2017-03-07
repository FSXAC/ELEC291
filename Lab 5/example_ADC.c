// Using 10bit ADC
// Measures voltage at P2.0 (PIN 18) in LQFP32 (processor) package

// imports
#include <stdio.h>
#include <stdlib.h>
#include <c8051f38x.h>

#define SYSCLK 24000000L
#define BAUDRATE 115200L

char _c51_external_startup (void) {
    PCA0MD &= (~0x40);    // DISABLE WDT: clear Watchdog Enable bit
    // CLKSEL&=0b_1111_1000; // Not needed because CLKSEL==0 after reset
    #if (SYSCLK == 12000000L)
        //CLKSEL|=0b_0000_0000;  // SYSCLK derived from the Internal High-Frequency Oscillator / 4
    #elif (SYSCLK == 24000000L)
        CLKSEL |= 0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
    #elif (SYSCLK == 48000000L)
        CLKSEL |= 0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
    #else
        #error SYSCLK must be either 12000000L, 24000000L, or 48000000L
    #endif
    OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency

    // Configure P2.0 as Analog Input
    P2MDIN &= 0b_1111_1110; // P2.0 only
    P2SKIP |= 0b_0000_0001; // Skip Crossbar decoding for this pin

    // Init ADC multiplexer to read the voltage between P2.0 and ground.
    // IMPORTANT: check section 6.5 in datasheet.  The constants for
    // each pin are available in "c8051f38x.h" both for the 32 and 48
    // pin packages.
    AMX0P = LQFP32_MUX_P2_0; // Select positive input from P0.0
    AMX0N = LQFP32_MUX_GND;  // GND is negative input (Single-ended Mode)

    // Init ADC
    ADC0CF   = 0xF8; // SAR clock = 31, Right-justified result
    ADC0CN   = 0b_1000_0000; // AD0EN=1, AD0TM=0
  	REF0CN = 0b_0000_1000; //Select VDD as the voltage reference

    VDM0CN   = 0x80;       // enable VDD monitor
    RSTSRC   = 0x02|0x04;  // Enable reset on missing clock detector and VDD
    P0MDOUT |= 0x11;     // Enable Uart TX as push-pull output, P0.0 as output
    XBR0     = 0x01;         // Enable UART on P0.4(TX) and P0.5(RX)
    XBR1     = 0x40;         // Enable crossbar and weak pull-ups

    #if (SYSCLK/BAUDRATE/2L/256L < 1)
        TH1    = 0x10000-((SYSCLK/BAUDRATE)/2L);
        CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
        CKCON |= 0x08;
    #elif (SYSCLK/BAUDRATE/2L/256L < 4)
        TH1    = 0x10000-(SYSCLK/BAUDRATE/2L/4L);
        CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 01
        CKCON |= 0x01;
    #elif (SYSCLK/BAUDRATE/2L/256L < 12)
        TH1    = 0x10000-(SYSCLK/BAUDRATE/2L/12L);
        CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 00
    #else
        TH1    = 0x10000-(SYSCLK/BAUDRATE/2/48);
        CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 10
        CKCON |= 0x02;
    #endif

    TL1   = TH1;     // Init timer 1
    TMOD &= 0x0f;  // TMOD: timer 1 in 8-bit autoreload
    TMOD |= 0x20;
    TR1   = 1;       // Start timer1
    SCON  = 0x52;

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
	unsigned char k;
	for(j = 0; j < ms; j++)
		for (k = 0; k < 4; k++) Timer3us(250);
}
