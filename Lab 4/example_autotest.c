// f38x_autotest.c: Test the F38x board for short circuits and open circuits.
// The board's pins must be connected in pairs as follows:
//
// P0_1 and P0_2
// P0_0 and P0_3
// P2_2 and P2_1
// P2_3 and P2_0
// P2_4 and P1_7
// P2_5 and P1_6
// P2_6 and P1_5
// P2_7 and P1_4
// P0_6 and P1_1
// P0_7 and P1_2
// P1_0 and P1_3
//
// By:  Jesus Calvino-Fraga (c) 2008-2015
//
// The next comment clears the "C51 command line options:" field when compiling with CrossIDE
//  ~C51~  

#include <C8051f38x.h>
#include <stdio.h>

#define SYSCLK      48000000L  // SYSCLK frequency in Hz
#define BAUDRATE      115200L  // Baud rate of UART in bps

void PORT_Init (void)
{
	P0MDOUT |= 0x10; // Enable UTX as push-pull output
	XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)                     
	XBR1     = 0x40; // Enable crossbar and weak pull-ups
}

void SYSCLK_Init (void)
{
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
	OSCICN |= 0x03;   // Configure internal oscillator for its maximum frequency
	RSTSRC  = 0x04;   // Enable missing clock detector
}
 
void UART0_Init (void)
{
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
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready
}

// Uses Timer3 to delay <us> micro-seconds. 
void Timer3us(unsigned long us)
{
	unsigned long i;               // usec counter
	
	// The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON:
	CKCON|=0b_0100_0000;
	
	TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	
	TMR3CN = 0x04;                 // Sart Timer3 and clear overflow flag
	for (i = 0; i < us; i++)       // Count <us> overflows
	{
		while (!(TMR3CN & 0x80));  // Wait for overflow
		TMR3CN &= ~(0x80);         // Clear overflow indicator
	}
	TMR3CN = 0 ;                   // Stop Timer3 and clear overflow flag
}

void WaitXms (unsigned int ms)
{
	unsigned int j;
	for(j=ms; j!=0; j--)
	{
		Timer3us(249);
		Timer3us(249);
		Timer3us(249);
		Timer3us(250);
	}
}

unsigned char countzero(void)
{
	unsigned char j;
	
	j=0;
	
	if (P0_0==0) j++;
	if (P0_1==0) j++;
	if (P0_2==0) j++;
	if (P0_3==0) j++;
	//if (P0_4==0) j++; // TX pin not in test
	//if (P0_5==0) j++; // RX pin not in test
	if (P0_6==0) j++;
	if (P0_7==0) j++;

	if (P1_0==0) j++;
	if (P1_1==0) j++;
	if (P1_2==0) j++;
	if (P1_3==0) j++;
	if (P1_4==0) j++;
	if (P1_5==0) j++;
	if (P1_6==0) j++;
	if (P1_7==0) j++;

	if (P2_0==0) j++;
	if (P2_1==0) j++;
	if (P2_2==0) j++;
	if (P2_3==0) j++;
	if (P2_4==0) j++;
	if (P2_5==0) j++;
	if (P2_6==0) j++;
	if (P2_7==0) j++;

	if (P3_0==0) j++;

	return j;
}

void Set_Pin_Output (unsigned char pin)
{
	unsigned char mask;
	
	mask=(1<<(pin&0x7));
	switch(pin/0x10)
	{
		case 0: P0MDOUT |= mask; break;
		case 1: P1MDOUT |= mask; break;
		case 2: P2MDOUT |= mask; break; 
		case 3: P3MDOUT |= mask; break; 
	}	
}

void Set_Pin_Input (unsigned char pin)
{
	unsigned char mask;
	
	mask=(1<<(pin&0x7));
	mask=~mask;
	switch(pin/0x10)
	{
		case 0: P0MDOUT &= mask; break;
		case 1: P1MDOUT &= mask; break;
		case 2: P2MDOUT &= mask; break; 
		case 3: P3MDOUT &= mask; break; 
	}	
}

void Set_Pin_One (unsigned char pin)
{
	unsigned char mask;
	
	mask=(1<<(pin&0x7));
	switch(pin/0x10)
	{
		case 0: P0 |= mask; break;
		case 1: P1 |= mask; break;
		case 2: P2 |= mask; break; 
		case 3: P3 |= mask; break; 
	}	
}

void Set_Pin_Zero (unsigned char pin)
{
	unsigned char mask;
	
	mask=(1<<(pin&0x7));
	mask=~mask;
	switch(pin/0x10)
	{
		case 0: P0 &= mask; break;
		case 1: P1 &= mask; break;
		case 2: P2 &= mask; break; 
		case 3: P3 &= mask; break; 
	}	
}

bit Read_Pin (unsigned char pin)
{
	unsigned char mask, result;
	
	mask=(1<<(pin&0x7));
	switch(pin/0x10)
	{
		default:
		case 0: result = P0 & mask; break;
		case 1: result = P1 & mask; break;
		case 2: result = P2 & mask; break; 
		case 3: result = P3 & mask; break; 
	}
	return (result?1:0);
}

void dofail(unsigned char pin)
{
	printf("P%d.%d FAILED (OPEN)\n", pin/0x10, pin&7);
	while(1);
}

void dofailb(unsigned char pin)
{
	printf("P%d.%d FAILED (SHORT)\n", pin/0x10, pin&7);
	while(1);
}

void dopass(unsigned char pin)
{
	printf("P%d.%d, ", pin/0x10, pin&7);
}

void Test_Pair (unsigned char pin1, unsigned char pin2)
{
	Set_Pin_Output(pin1);
	Set_Pin_Input(pin2);
	Set_Pin_Zero(pin1);
	WaitXms(2);
	if(Read_Pin(pin2)==1) dofail(pin2);
	if (countzero()!=2) dofailb(pin2);
	dopass(pin2);

	Set_Pin_Output(pin2);
	Set_Pin_Input(pin1);
	Set_Pin_Zero(pin2);
	WaitXms(2);
	if(Read_Pin(pin1)==1) dofail(pin1);
	if (countzero()!=2) dofailb(pin1);
	dopass(pin1);
	
	Set_Pin_One(pin1);
	Set_Pin_One(pin2);
	Set_Pin_Input(pin1);
	Set_Pin_Input(pin2);
}

void Check_Pin_Zero (unsigned char pin)
{
	if(Read_Pin(pin)==0)
	{
		printf("P%d.%d is connected to ground\n", pin/0x10, pin&7);
	}
}

void Initial_Check (void)
{
	if (countzero()!=0)
	{
		Check_Pin_Zero(0x00);
		Check_Pin_Zero(0x01);
		Check_Pin_Zero(0x02);
		Check_Pin_Zero(0x03);
		//Check_Pin_Zero(0x04);
		//Check_Pin_Zero(0x05);
		Check_Pin_Zero(0x06);
		Check_Pin_Zero(0x07);
		Check_Pin_Zero(0x10);
		Check_Pin_Zero(0x11);
		Check_Pin_Zero(0x12);
		Check_Pin_Zero(0x13);
		Check_Pin_Zero(0x14);
		Check_Pin_Zero(0x15);
		Check_Pin_Zero(0x16);
		Check_Pin_Zero(0x17);
		Check_Pin_Zero(0x20);
		Check_Pin_Zero(0x21);
		Check_Pin_Zero(0x22);
		Check_Pin_Zero(0x23);
		Check_Pin_Zero(0x24);
		Check_Pin_Zero(0x25);
		Check_Pin_Zero(0x26);
		Check_Pin_Zero(0x27);
		Check_Pin_Zero(0x30);
		while(1);
	}
}

void main(void)
{
	PCA0MD &= ~0x40; // WDTE = 0 (clear watchdog timer enable)
	PORT_Init();     // Initialize Port I/O
	SYSCLK_Init ();  // Initialize Oscillator
	UART0_Init();    // Initialize UART0

	#define TOUT 500

	printf("\n\nF38x board autotest\n");
	Initial_Check();

	Test_Pair(0x01, 0x02); // P0.1 and P0.2
	Test_Pair(0x00, 0x03); // P0.0 and P0.3
	Test_Pair(0x22, 0x21); // P2.2 and P2.1
	Test_Pair(0x23, 0x20); // etc.
	printf("\n");
	Test_Pair(0x24, 0x17);
	Test_Pair(0x25, 0x16);
	Test_Pair(0x26, 0x15);
	Test_Pair(0x27, 0x14);
	printf("\n");
	Test_Pair(0x06, 0x11);
	Test_Pair(0x07, 0x12);
	Test_Pair(0x10, 0x13);
	
	printf("\n\nSuccess!\n");
	
	Set_Pin_Output(0x30);
	while(1)
	{
		P3_0=0;
		WaitXms(TOUT);
		P3_0=1;
		WaitXms(TOUT);
	}
}
