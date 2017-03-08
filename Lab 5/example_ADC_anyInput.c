// Using 10bit ADC
// Measures voltage at any arbitrary pins in LQFP32 (processor) package

// imports
#include <stdio.h>
#include <stdlib.h>
#include <c8051f38x.h>

// system constants
#define SYSCLK 24000000L
#define BAUDRATE 115200L

// measured value of VDD in volts
#define VDD 3.325

// analog input pins
#define ANALOG_0 LQFP32_MUX_P2_0
#define ANALOG_1 LQFP32_MUX_P2_1
#define ANALOG_2 LQFP32_MUX_P2_2
#define ANALOG_3 LQFP32_MUX_P2_3

char _c51_external_startup (void)
{
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
    unsigned char k;
    for (j = 0; j < ms; j++) {
        delayUs(249);
        delayUs(249);
        delayUs(249);
        delayUs(250);
    }
}

// Init ADC
void initializeADC(void) {
    ADC0CF = 0xF8; // SAR clock = 31, Right-justified result
    ADC0CN = 0b_1000_0000; // AD0EN=1, AD0TM=0
    REF0CN = 0b_0000_1000; // Select VDD as the voltage reference
}

// Initialize ADC pins
void initializePin(unsigned char port, unsigned char pin) {
    unsigned char mask;
    mask = 1 << pin;
    switch (port) {
        case 0:
            P0MDIN &= (~mask);
            P0SKIP |= mask;
            break;
        case 1:
            P1MDIN &= (~mask);
            P1SKIP |= mask;
            break;
        case 2:
            P2MDIN &= (~mask);
            P2SKIP |= mask;
            break;
        case 3:
            P3MDIN &= (~mask);
            P3SKIP |= mask;
            break;
        default: break;
    }
}

unsigned int getADCAtPin(unsigned char pin) {
    AMX0P = pin;             // Select positive input from pin
    AMX0N = LQFP32_MUX_GND;  // GND is negative input (Single-ended Mode)
    // Dummy conversion first to select new pin
    AD0BUSY = 1;
    while (AD0BUSY); // Wait for dummy conversion to finish
    // Convert voltage at the pin
    AD0BUSY = 1;
    while (AD0BUSY); // Wait for conversion to complete
    return (ADC0L+(ADC0H*0x100));
}

float getVoltageAtPin(unsigned char pin) {
    return ((getADCAtPin(pin) * VDD / 1024.0));
}

void main(void) {
    volatile float voltages[4];

    printf("\x1b[2J");
    printf(
        "ADC Example Program - Input from any pins\n"
        "File:     %s\n"
        "Compiled: %s, %s\n"
        "===================",
        __FILE__, __DATE__, __TIME__
    );

    // Initialize the pins for analog input
    initializePin(2, 0); // Configure P2.0 as analog input
    initializePin(2, 1); // Configure P2.1 as analog input
    initializePin(2, 2); // Configure P2.2 as analog input
    initializePin(2, 3); // Configure P2.3 as analog input

    // initialize ADC
    initializeADC();

    // constantly check for voltages
    while (1) {
        voltages[0] = getVoltageAtPin(LQFP32_MUX_P2_0);
        voltages[1] = getVoltageAtPin(LQFP32_MUX_P2_1);
        voltages[2] = getVoltageAtPin(LQFP32_MUX_P2_2);
        voltages[3] = getVoltageAtPin(LQFP32_MUX_P2_3);
        printf("\x1b[s");
        printf("V0=%5.3f, V1=%5.3f, V2=%5.3f, V3=%5.3f", voltages[0], voltages[1], voltages[2], voltages[3]);
        printf("\x1b[u");
        delay(100);
    }
}
