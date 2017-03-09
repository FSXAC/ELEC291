// Using 10bit ADC
// Measures voltage at any arbitrary pins in LQFP32 (processor) package

// imports
#include <stdio.h>
#include <stdlib.h>
#include <c8051f38x.h>
#include "lab5.h"

#define MEASURE_TEST
#define PROCESSING

void main(void) {
    float voltage_reference = 0, voltage_reference_max = 0;
    float voltage_undertest = 0, voltage_undertest_max = 0;
    float halfPeriod = 0, halfPeriod_temp = 0, periodDiff;
    float frequency;
    char strBuffer[17];
    int cycle = 0;


    printf("\x1b[2J");
    printf("Lab 5 - Phasor Detector\n"
        "Author:   Muchen He (44638154)\n"
        "File:     %s\n"
        "Compiled: %s, %s\n"
        "===================\n",
        __FILE__, __DATE__, __TIME__
    );

    // initialize ADC
    initializeADC();

    // intialize LCD
    LCD_init();

    // Initialize the pins for analog input
    initializePin(1, 4); // Configure P2.3 as analog input
    initializePin(1, 5); // Configure P2.4 as analog input

    // constantly check for voltages
    printf("\x1b[s");
    while (1) {
        printf("\x1b[u");

        // take period measurements
        halfPeriod_temp = getHalfPeriod();
        if (halfPeriod_temp < 5) continue;
        halfPeriod = halfPeriod_temp;
        printf("\nPeriod = %10.2f", 2.0 * ((halfPeriod > 4000) ? halfPeriod / 1000.0 : halfPeriod));
        printf("%s\n", (halfPeriod > 4000) ? "ms" : "us");
        frequency = 1.0 * 500000L / halfPeriod;
        printf("Frequency = %10.2fHz\n", frequency);

        // take measurements (only measure when signal is positive)
        while (!DIGITAL_0);
        while (DIGITAL_0) {
            voltage_reference = getVoltageAtPin(ANALOG_0);
            if (voltage_reference_max < voltage_reference)
            	voltage_reference_max = voltage_reference;
        }

        #ifdef MEASURE_TEST
        // measure the voltage of other signal
        while (!DIGITAL_1);
        while (DIGITAL_1) {
        	voltage_undertest = getVoltageAtPin(ANALOG_1);
        	if (voltage_undertest_max < voltage_undertest)
                voltage_undertest_max = voltage_undertest;
        }

        // measure the time between the two signals
        periodDiff = getPeriodDiff(2.0 * halfPeriod);

        // display phase
        printf("\nPhase = %.2f", (periodDiff > 8000) ? periodDiff / 1000.0 : periodDiff);
        printf("%s\n", (periodDiff > 8000) ? "ms" : "us");

        // calculate and display phase in angles
        printf("Phase = %.2fdeg", 360.0 * periodDiff / (2.0 * halfPeriod));
        #endif

        printf("\n===[REFERENCE (P1.3)]===\n");
        printf("Voltage = %5.3fV\n", voltage_reference);
        printf("Peak V  = %5.3fV\n", voltage_reference_max);

        #ifdef MEASURE_TEST
        printf("\n===[UNDER TEST (P1.4)]===\n");
        printf("Voltage = %5.3fV\n", voltage_undertest);
        printf("Peak V  = %5.3fV\n", voltage_undertest_max);

        #ifdef PROCESSING
        printf("$%.2f,%.2f,%.3f,%.3f!", halfPeriod, periodDiff, voltage_reference_max, voltage_undertest_max);
        #endif
        #endif

        // print to LCD
        if (BUTTON0) {
            if (BUTTON1) {
                // display V-peak-peak (011)
                LCD_print("V-PK-PK:", 1, 1);
                sprintf(strBuffer, "%.3fV, %.3fV", voltage_reference_max*2, voltage_undertest_max*2);
            } else if (BUTTON2) {
                // display frequency domain (101)
                LCD_print("FREQ. DOMAIN:", 1, 1);
                #ifdef MEASURE_TEST
                sprintf(strBuffer, "%.3f%c%.3f%cV", voltage_undertest_max, 0xDA, -360.0 * periodDiff / (2.0 * halfPeriod), 0xDF);
                #endif
            } else {
                // display frequency (001)
                LCD_print("FREQUENCY:", 1, 1);
                sprintf(strBuffer, "%.3f%s", (frequency > 5000) ? frequency / 1000 : frequency, (frequency > 5000) ? "kHz" : "Hz");
            }
        } else if (BUTTON1) {
            // display phase difference
            LCD_print("PHASE:", 1, 1);
            #ifdef MEASURE_TEST
            if (BUTTON2) {
                // display phase in seconds (110)
                sprintf(strBuffer, "%2f%s", (periodDiff > 8000) ? periodDiff / 1000.0 : periodDiff, (periodDiff > 8000) ? "ms" : "us");
            } else {
                // display phase in angle (010)
                sprintf(strBuffer, "%c%+.2f%c", 0xDA, -360.0 * periodDiff / (2.0 * halfPeriod), 0xDF);
            }
            #endif
        } else if (BUTTON2) {
            // display period (100)
            LCD_print("PERIOD:", 1, 1);
            sprintf(strBuffer, "%.3f%s", 2.0 * ((halfPeriod > 4000) ? halfPeriod / 1000.0 : halfPeriod), (halfPeriod > 4000) ? "ms" : "us");
        } else {
            // display both peak voltage (000)
            LCD_print("PEAK VOLTAGES:", 1, 1);
            sprintf(strBuffer, "%.3fV, %.3fV", voltage_reference_max, voltage_undertest_max);
        }
        LCD_print(strBuffer, 2, 1);

        delay(SAMPLE_DELAY);

        if (cycle++ > 1000 / SAMPLE_DELAY) {
            voltage_reference_max = 0;
            voltage_undertest_max = 0;
            cycle = 0;
        }
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

// returns half the period in microseconds
float getHalfPeriod() {
    float halfPeriod;
    unsigned int overflow_count = 0;

    // initalize timer 0
    TR0 = 0;
    TMOD &= 0xF0;
    TMOD |= 0x01;
    TH0 = 0;
    TL0 = 0;
    TF0 = 0;

    // go to start of signal
    while (DIGITAL_0);
    while (!DIGITAL_0);

    // measure 1/2 period
    TR0 = 1;
    while (DIGITAL_0) {
        if (TF0) {
            TF0 = 0;
            overflow_count++;
        }
    }

    // stop and do some calculations
    TR0 = 0;
    halfPeriod = (overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)*1000000L;
    return halfPeriod;
}

float getPeriodDiff(float period) {
    unsigned char overflow_count = 0;

    // initalize timer 0
    TR0 = 0;
    TMOD &= 0xF0;
    TMOD |= 0x01;
    TH0 = 0;
    TL0 = 0;
    TF0 = 0;

    // goto start of first square wave
    while (DIGITAL_0);
    while (!DIGITAL_0);

    // measure until the start of second signal
    if (!DIGITAL_1) {
        // if the other signal is off when we start, just need to wait for the next rising edge
        TR0 = 1;
        while (!DIGITAL_1) {
            if (TF0) {
                TF0 = 0;
                overflow_count++;
            }
        }
        TR0 = 0;
        return (overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)*1000000L;
    } else {
        // if the other signal is on when we start, we need to measure next time when it goes HIGH
        TR0 = 1;
        while (DIGITAL_1) {
            if (TF0) {
                TF0 = 0;
                overflow_count++;
            }
        }
        while (!DIGITAL_1) {
            if (TF0) {
                TF0 = 0;
                overflow_count++;
            }
        }
        TR0 = 0;
        return (overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK)*1000000L - (period);
    }

}

// pulse LCD clock
void LCD_pulse(void) {
    LCD_E = 1;
    delayUs(40);
    LCD_E = 0;
}

// send byte to LCD
void LCD_byte(unsigned char x) {
    // put x in the accumulator
    ACC    = x;
    LCD_D7 = ACC_7;
    LCD_D6 = ACC_6;
    LCD_D5 = ACC_5;
    LCD_D4 = ACC_4;
    LCD_pulse();
    delayUs(40);
    ACC    = x;
    LCD_D7 = ACC_3;
    LCD_D6 = ACC_2;
    LCD_D5 = ACC_1;
    LCD_D4 = ACC_0;
    LCD_pulse();
}

// write data to LCD
void LCD_write(unsigned char x) {
    LCD_RS = 1;
    LCD_byte(x);
    delay(2);
}

// send command to LCD
void LCD_cmd(unsigned char x) {
    LCD_RS = 0;
    LCD_byte(x);
    delay(5);
}

// initialize the LCD in 4 bit mode
void LCD_init(void) {
    LCD_E = 0;
    LCD_RW = 0;
    LCD_A  = 0;
    LCD_K  = 1;
    delay(20);

    // First make sure the LCD is in 8-bit mode and then change to 4-bit mode
    LCD_cmd(0x33);
    LCD_cmd(0x33);
    LCD_cmd(0x32);

    // Configure the LCD
    LCD_cmd(0x28);
    LCD_cmd(0x0c);
    LCD_cmd(0x01);
    delay(20);
}

// prints a string to LCD
void LCD_print(char *string, unsigned char line, bit fillLine) {
    int j = 0;
    LCD_cmd(line == 2 ? 0xc0: 0x80);
    delay(3);

    while (string[j] != 0) LCD_write(string[j++]);
    if (fillLine) for (; j < CHARS_PER_LINE; j++) LCD_write(' ');
}


// ===[STUFF FOR MAX7219 HERE]===
// /* send one byte */
// void LED_spi(unsigned char value) {
//     unsigned char j, temp;
//     for (j = 1; j <= 8; j++) {
//         temp = value & 0x80;
//         LED_DATA = (temp == 0x80) ? HIGH : LOW;
//
//         // toggle clock
//         LED_CLK = HIGH;
//         delayUs(20);
//         LED_CLK = LOW;
//
//         // shift bit one over
//         value = value << 1;
//     }
// }
//
// void LED_pulse(void) {
//     LED_CS = HIGH;
//     delay(1);
//     LED_CS = LOW;
// }
//
// /* clear all MAX7219s */
// void LED_clear(void) {
//     unsigned char j;
//     for (j = 1; j <= 8; j++) {
//         LED_spi(j);
//         LED_spi(0x00);
//         LED_pulse();
//         printf("%x ", j);
//     }
//     printf("\n");
// }
//
// /* initialize the LED */
// void LED_init(void) {
//     LED_CS = LOW;
//
//     // set decode mode (no-decode)
//     LED_spi(0x09);
//     // LED_spi(0xFF);
//     LED_spi(0x00);
//     LED_pulse();
//     printf("decoder set\n");
//
//     // set intensity (0-F)
//     LED_spi(0x0A);
//     LED_spi(0x0D);
//     LED_pulse();
//     printf("intensity set\n");
//
//     // set scan limit (8 digits)
//     LED_spi(0x0b);
//     LED_spi(0x07);
//     LED_pulse();
//     printf("scan limit set\n");
//
//     // clear MAX7219
//     printf("clearing: ");
//     LED_clear();
//
//     // set for normal operation
//     LED_spi(0x0C);
//     LED_spi(0x01);
//     LED_pulse();
//     printf("normal operation set\n");
// }
//
// /* write to MAX7219 */
// void LED_write(char address, char value) {
//     if ((address < 1) || (address > 8)) return;
//     LED_spi(address);
//     LED_spi(value);
//     LED_pulse();
// }
//
// /* turn on ALL LEDs for testing */
// void LED_test(void) {
//     LED_spi(0x0F);
//     LED_spi(0x01);
//     LED_pulse();
//     delay(1000);
//     LED_spi(0x0F);
//     LED_spi(0x00);
//     LED_pulse();
// }
