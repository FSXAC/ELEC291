// system constants
#define SYSCLK 24000000L
#define BAUDRATE 115200L

// make programmer's life easier preprocessors
#define HIGH 1
#define LOW 0

// measured value of VDD in volts
#define VDD 3.38 //3.325

// analog input pins
#define ANALOG_0 LQFP32_MUX_P1_4 // REF
#define ANALOG_1 LQFP32_MUX_P1_5 // TEST
#define DIGITAL_0 P2_4 // REF zero cross
#define DIGITAL_1 P2_3 // TEST zero cross

// function prototypes
/* C51 bullshit */
char _c51_external_startup(void);

/* delay microseconds */
void delayUs(unsigned char us);

/* delay milliseconds */
void delay(unsigned int ms);

/* start ADC */
void initializeADC(void);

/* setup pin mode for analog input */
void initializePin(unsigned char port, unsigned char pin);

/* get ADC value from analog pins */
unsigned int getADCAtPin(unsigned char pin);

/* get voltage from ADC value */
float getVoltageAtPin(unsigned char pin);

/* get period of signal based on comparitor zero cross input */
double getHalfPeriod(void);

/* ===[MAX7219 CONTROL]=== */
#define LED_CS P2_7
#define LED_DATA P2_6
#define LED_CLK P2_5

/* Toggles CS */
void LED_pulse(void);

/* send one byte */
void LED_spi(unsigned char data);

/* clear all MAX7219s */
void LED_clear(void);

/* initialize the LED */
void LED_init(void);

/* write to MAX7219 */
void LED_write(char address, char data);

/* test LED matrix */
void LED_test(void);
