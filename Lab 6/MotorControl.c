// Using 10bit ADC
// Measures voltage at any arbitrary pins in LQFP32 (processor) package

// imports
#include <stdio.h>
#include <stdlib.h>
#include <c8051f38x.h>
// #include <ctype.h>

#define SYSCLK    48000000L
#define BAUDRATE  115200L

// make programmer's life easier preprocessors
#define HIGH 1
#define LOW 0

// reference digial voltage
#define VDD 4.4
#define POT_1 LQFP32_MUX_P1_5
#define POT_2 LQFP32_MUX_P1_7

// BUTTONS
#define BTN0 P0_5
#define BTN1 P0_7
#define BTNX P1_6

/* ===[MAX7219 CONTROL]=== */
#define LED_CS P2_5
#define LED_DATA P2_4
#define LED_CLK P2_3
#define LED_INTENSITY 0x01

/* Toggles CS */
void LED_pulse(void);

/* send one byte */
void LED_spi(unsigned char value);

/* clear all MAX7219s */
void LED_clear(void);

/* initialize the LED */
void LED_init(void);

/* write to MAX7219 */
void LED_write(unsigned char address, unsigned char value);

/* test LED matrix */
void LED_test(void);

void LED_display(unsigned char *grid);
void LED_animate(unsigned char grid[][8], unsigned char frames, unsigned char fps, bit forward);

// other function prototpes
char _c51_external_startup(void);
void delayUs(unsigned char us);
void delay(unsigned int ms);
void initializeADC(void);
void initializePin(unsigned char port, unsigned char pin);
unsigned int getADCAtPin(unsigned char pin);

// modes
bit checkButton(unsigned char button);
void changeMode(void);
void mode0(void);
void mode1(void);
void mode2(void);

// ISR / PWM counter
volatile unsigned char pwm_count=0;
volatile unsigned char power_level = 50;
volatile unsigned bit reverse = 0;

// LED matrix thing
unsigned char IMAGE[4][8] = {
    {0x00, 0x00, 0x00, 0x1f, 0xf8, 0x00, 0x00, 0x00},
    {0x01, 0x02, 0x04, 0x18, 0x18, 0x20, 0x40, 0x80},
    {0x10, 0x10, 0x10, 0x18, 0x18, 0x08, 0x08, 0x08},
    {0x80, 0x40, 0x20, 0x18, 0x18, 0x04, 0x02, 0x01}
};
unsigned char IMAGE_MODE0[8] = {0x18, 0x18, 0x18, 0x3c, 0x7e, 0x66, 0x66, 0x24};
unsigned char IMAGE_MODE1[8] = {0x7e, 0xc3, 0x81, 0xf9, 0x01, 0x01, 0xc3, 0x7e};

// demo mode:
// [0] - scanf putty
// [1] - video game
unsigned char mode = 0;

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


// get input character from input stream
char getKey(void) {
	if(!RI) return 0;

	RI = 0;
    return SBUF;
}


// main program
void main(void) {
    printf("\x1b[2J");
    printf("PWM and motor output\n"
        "Author:   Muchen He (44638154)\n"
        "File:     %s\n"
        "Compiled: %s, %s\n"
        "===================\n",
        __FILE__, __DATE__, __TIME__
    );

    // initialize some shit
    initializePin(1, 5); // pot1
    initializePin(1, 7); // pot2
    initializeADC();

    // initalize MAX7219
    LED_init();

    // set motor to off to begin with
    power_level = 0;

    while (1) {
        // check button state
       	changeMode();

        // check modes
        switch (mode) {
            case 0:
                LED_animate(IMAGE, 4, 15, !reverse);
                mode0();
                break;
            case 1:
                LED_display(IMAGE_MODE1);
                mode1();
                break;
            default: break;
        }
    }
}

void changeMode(void) {
	if (!BTNX) {
		delay(50);
		if (!BTNX) mode = (mode == 1) ? 0 : 1;
		while (!BTNX);
		printf("\n=== Mode %d ===\n", mode);
	}
}

void mode0(void) {
    unsigned int inputPWM;
    unsigned int direction;

    // LED matrix
    LED_display(IMAGE_MODE0);

    if (!BTN0) {
    	delay(20);
    	if (!BTN0) {
    		do {
    			// apply changes to motor settings
        		printf("Enter power setting:\n<direction [0, 1]>: ");
        		scanf("%d", &direction);
        		reverse = direction;

                printf("\n<Duty Cycle>: ");
                scanf("%d", &inputPWM);
                power_level = inputPWM;

        		printf("\nSet: %d:%d\n", reverse, power_level);

    		} while (direction > 1 || inputPWM > 100);

    		// wait for button to release
    		while (!BTN0);
    	}
 	}
}

void mode1(void) {
	int potent1Value;
	int potent2Value;
    potent1Value = getADCAtPin(POT_1);
    potent2Value = getADCAtPin(POT_2);
    power_level = 30.0+((100.0-30.0)/(1023.0-30.0))*(potent1Value-30);
    printf("$%d,%d,%d;", potent1Value, potent2Value, BTN1);
    delay(50);
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

// initialize ADC
void initializeADC(void) {
    ADC0CF = 0xF8; // SAR clock = 31, Right-justified result
    ADC0CN = 0b_1000_0000; // AD0EN=1, AD0TM=0
    REF0CN = 0b_0000_1000; // Select VDD as the voltage reference
}

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

void LED_display(unsigned char *grid) {
    unsigned int i;
    for (i = 1; i <= 8; i++) {
        LED_write(i, grid[i-1]);
    }
}

void LED_animate(unsigned char grid[][8], unsigned char frames, unsigned char fps, bit forward) {
    short int i;
    if (forward) {
        for (i = 0; i < frames; i++) {
            LED_display(grid[i]);
            delay(1000/fps);
        }
    } else {
        for (i = frames-1; i >= 0; i--) {
            LED_display(grid[i]);
            if (fps != 0) delay(1000/fps);
        }
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
