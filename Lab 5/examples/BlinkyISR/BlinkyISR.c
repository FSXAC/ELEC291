#include <C8051f38x.h>

#define SYSCLK 48000000L // SYSCLK frequency in Hz
#define TIMER_0_FREQ 1000L // For a 1ms tick
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
	P2MDOUT|=0b_0000_0010; // P2.1 has the LED
	XBR1     = 0x40; // Enable crossbar and weak pull-ups

	// Initialize timer 0 for periodic interrupts
	TR0=0;
	TF0=0;
	CKCON|=0b_0000_0100; // Timer 0 uses the system clock
	TMOD&=0xf0;
	TMOD|=0x01; // Timer 0 in mode 1: 16-bit timer
	// Initialize reload value
	TH0=(65536L-(SYSCLK/(TIMER_0_FREQ)))/0x100;
	TL0=(65536L-(SYSCLK/(TIMER_0_FREQ)))%0x100;
	ET0=1;     // Enable Timer0 interrupts
	TR0=1;     // Start Timer0
	
	EA=1; // Enable global interrupts
	
	return 0;
}

void Timer0_ISR (void) interrupt INTERRUPT_TIMER0
{
	PUSH_SFRPAGE;
	SFRPAGE=0x0;
	// Timer 0 in 16-bit mode doesn't have auto reload, so reload here
	TH0=(0x10000L-(SYSCLK/(TIMER_0_FREQ)))/0x100;
	TL0=(0x10000L-(SYSCLK/(TIMER_0_FREQ)))%0x100;
	
	TickCount++;
	if(TickCount==500)
	{
		TickCount=0;
		P2_1=!P2_1; // Toggle P2_1 (where the LED is)
	}

	POP_SFRPAGE;
}

void main (void)
{
	while(1)
	{
	}
}
