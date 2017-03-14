// Using 10bit ADC
// Measures voltage at any arbitrary pins in LQFP32 (processor) package

// imports
#include <stdio.h>
#include <stdlib.h>
#include <c8051f38x.h>

#define SYSCLK    48000000L
#define BAUDRATE  115200L

char _c51_external_startup(void);
void delayUs(unsigned char us);
void delay(unsigned int ms);

// ISR / PWM counter
volatile unsigned char pwm_count=0;
volatile unsigned char power_level = 50;
volatile unsigned bit reverse = 0;

void main(void) {
    printf("\x1b[2J");
    printf("PWM and motor output\n"
        "Author:   Muchen He (44638154)\n"
        "File:     %s\n"
        "Compiled: %s, %s\n"
        "===================\n",
        __FILE__, __DATE__, __TIME__
    );

    while (1) {
        delay(2000);
        reverse = !reverse;
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
    // set port 2(3 to 5) as open drain
    P2MDOUT &= 0b_1110_0011;
    XBR0 = 0x01;      // Enable UART0 on P0.4(TX0) and P0.5(RX0)
    XBR1 = 0x40;      // enable crossbar

    // CHANGED: GENERATING PWM SIGNAL
    // Initialize timer 2 for periodic interrupts
	TMR2CN  = 0x00;   // Stop Timer2; Clear TF2;
	CKCON  |= 0b_0001_0000;
	TMR2RL  = (-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	TMR2    = 0xffff;   // Set to reload immediately
	ET2     = 1;         // Enable Timer2 interrupts
	TR2     = 1;         // Start Timer2

	EA = 1; // Enable interrupts

    return 0;
}

// Timer 2 ISR
void T2_ISR(void) interrupt 5 {
    // clear timer 2 interrupt flag
    TF2H = 0;

    // count pwm
    pwm_count++;
    if (pwm_count > 100) pwm_count = 0;

    // generate <power_level>% duty cycle
    if (reverse) {
    	P2_6 = pwm_count > power_level ? 0 : 1;
    	P2_7 = 0;
    } else {
    	P2_7 = pwm_count > power_level ? 0 : 1;
    	P2_6 = 0;
    }
}

// Serial ISR
void SPI_ISR(void) interrupt 4 using 1{
	if (RI) {
		RI = 0;
		//scanf("%d", &power_level);
		// get input stream right here
	}
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
