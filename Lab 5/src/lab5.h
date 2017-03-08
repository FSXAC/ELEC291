// system constants
#define SYSCLK 24000000L
#define BAUDRATE 115200L

// measured value of VDD in volts
#define VDD 4.6 //3.325

// analog input pins
#define ANALOG_0 LQFP32_MUX_P2_0
#define ANALOG_1 LQFP32_MUX_P2_1
#define ANALOG_2 LQFP32_MUX_P2_2
#define ANALOG_3 LQFP32_MUX_P2_3
#define NUM_OF_INPUTS 4

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
