#include <C8051f38x.h>

#define SYSCLK 48000000L // SYSCLK frequency in Hz
#define PUSH_SFRPAGE _asm push _SFRPAGE _endasm
#define POP_SFRPAGE _asm pop _SFRPAGE _endasm

volatile unsigned int TickCount=0;

char _c51_external_startup (void)
{
	PCA0MD&=(~WDTE) ;    // DISABLE WDT: clear Watchdog Enable bit
	VDM0CN=0x80; // enable VDD monitor
	RSTSRC=0x02|0x04; // Enable reset on missing clock detector and VDD

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

	// Configure the pin used for output

	// set everything as open drain
	P2MDOUT |= 0b_0000_0000; // P2.2 has the LED
	XBR1     = 0x40; // Enable crossbar and weak pull-ups

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

void main (void) {
	P2_3 = 1;
	P2_4 = 1;
	P2_5 = 1;
	while (1) {
		P2_3 = !P2_3;
		delay(1000);
		P2_4 = !P2_4;
		delay(1000);
		P2_5 = !P2_5;
		delay(1000);
	}
}
