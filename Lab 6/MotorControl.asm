;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Tue Mar 14 12:30:06 2017
;--------------------------------------------------------
$name MotorControl
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _initializePin_PARM_2
	public _main
	public _SPI_ISR
	public _T2_ISR
	public _reverse
	public _power_level
	public _pwm_count
	public __c51_external_startup
	public _initializeADC
	public _initializePin
	public _getADCAtPin
	public _delayUs
	public _delay
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_P0             DATA 0x80
_SP             DATA 0x81
_DPL            DATA 0x82
_DPH            DATA 0x83
_EMI0TC         DATA 0x84
_EMI0CF         DATA 0x85
_OSCLCN         DATA 0x86
_PCON           DATA 0x87
_TCON           DATA 0x88
_TMOD           DATA 0x89
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_CKCON          DATA 0x8e
_PSCTL          DATA 0x8f
_P1             DATA 0x90
_TMR3CN         DATA 0x91
_TMR4CN         DATA 0x91
_TMR3RLL        DATA 0x92
_TMR4RLL        DATA 0x92
_TMR3RLH        DATA 0x93
_TMR4RLH        DATA 0x93
_TMR3L          DATA 0x94
_TMR4L          DATA 0x94
_TMR3H          DATA 0x95
_TMR4H          DATA 0x95
_USB0ADR        DATA 0x96
_USB0DAT        DATA 0x97
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_CPT1CN         DATA 0x9a
_CPT0CN         DATA 0x9b
_CPT1MD         DATA 0x9c
_CPT0MD         DATA 0x9d
_CPT1MX         DATA 0x9e
_CPT0MX         DATA 0x9f
_P2             DATA 0xa0
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0DAT        DATA 0xa3
_P0MDOUT        DATA 0xa4
_P1MDOUT        DATA 0xa5
_P2MDOUT        DATA 0xa6
_P3MDOUT        DATA 0xa7
_IE             DATA 0xa8
_CLKSEL         DATA 0xa9
_EMI0CN         DATA 0xaa
__XPAGE         DATA 0xaa
_SBCON1         DATA 0xac
_P4MDOUT        DATA 0xae
_PFE0CN         DATA 0xaf
_P3             DATA 0xb0
_OSCXCN         DATA 0xb1
_OSCICN         DATA 0xb2
_OSCICL         DATA 0xb3
_SBRLL1         DATA 0xb4
_SBRLH1         DATA 0xb5
_FLSCL          DATA 0xb6
_FLKEY          DATA 0xb7
_IP             DATA 0xb8
_CLKMUL         DATA 0xb9
_SMBTC          DATA 0xb9
_AMX0N          DATA 0xba
_AMX0P          DATA 0xbb
_ADC0CF         DATA 0xbc
_ADC0L          DATA 0xbd
_ADC0H          DATA 0xbe
_SFRPAGE        DATA 0xbf
_SMB0CN         DATA 0xc0
_SMB1CN         DATA 0xc0
_SMB0CF         DATA 0xc1
_SMB1CF         DATA 0xc1
_SMB0DAT        DATA 0xc2
_SMB1DAT        DATA 0xc2
_ADC0GTL        DATA 0xc3
_ADC0GTH        DATA 0xc4
_ADC0LTL        DATA 0xc5
_ADC0LTH        DATA 0xc6
_P4             DATA 0xc7
_TMR2CN         DATA 0xc8
_TMR5CN         DATA 0xc8
_REG01CN        DATA 0xc9
_TMR2RLL        DATA 0xca
_TMR5RLL        DATA 0xca
_TMR2RLH        DATA 0xcb
_TMR5RLH        DATA 0xcb
_TMR2L          DATA 0xcc
_TMR5L          DATA 0xcc
_TMR2H          DATA 0xcd
_TMR5H          DATA 0xcd
_SMB0ADM        DATA 0xce
_SMB1ADM        DATA 0xce
_SMB0ADR        DATA 0xcf
_SMB1ADR        DATA 0xcf
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_SCON1          DATA 0xd2
_SBUF1          DATA 0xd3
_P0SKIP         DATA 0xd4
_P1SKIP         DATA 0xd5
_P2SKIP         DATA 0xd6
_USB0XCN        DATA 0xd7
_PCA0CN         DATA 0xd8
_PCA0MD         DATA 0xd9
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xdd
_PCA0CPM4       DATA 0xde
_P3SKIP         DATA 0xdf
_ACC            DATA 0xe0
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_IT01CF         DATA 0xe4
_CKCON1         DATA 0xe4
_SMOD1          DATA 0xe5
_EIE1           DATA 0xe6
_EIE2           DATA 0xe7
_ADC0CN         DATA 0xe8
_PCA0CPL1       DATA 0xe9
_PCA0CPH1       DATA 0xea
_PCA0CPL2       DATA 0xeb
_PCA0CPH2       DATA 0xec
_PCA0CPL3       DATA 0xed
_PCA0CPH3       DATA 0xee
_RSTSRC         DATA 0xef
_B              DATA 0xf0
_P0MDIN         DATA 0xf1
_P1MDIN         DATA 0xf2
_P2MDIN         DATA 0xf3
_P3MDIN         DATA 0xf4
_P4MDIN         DATA 0xf5
_EIP1           DATA 0xf6
_EIP2           DATA 0xf7
_SPI0CN         DATA 0xf8
_PCA0L          DATA 0xf9
_PCA0H          DATA 0xfa
_PCA0CPL0       DATA 0xfb
_PCA0CPH0       DATA 0xfc
_PCA0CPL4       DATA 0xfd
_PCA0CPH4       DATA 0xfe
_VDM0CN         DATA 0xff
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0x9392
_TMR5RL         DATA 0xcbca
_TMR2           DATA 0xcdcc
_TMR3           DATA 0x9594
_TMR4           DATA 0x9594
_TMR5           DATA 0xcdcc
_SBRL1          DATA 0xb5b4
_ADC0           DATA 0xbebd
_ADC0GT         DATA 0xc4c3
_ADC0LT         DATA 0xc6c5
_PCA0           DATA 0xfaf9
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xeeed
_PCA0CP0        DATA 0xfcfb
_PCA0CP4        DATA 0xfefd
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_TF1            BIT 0x8f
_TR1            BIT 0x8e
_TF0            BIT 0x8d
_TR0            BIT 0x8c
_IE1            BIT 0x8b
_IT1            BIT 0x8a
_IE0            BIT 0x89
_IT0            BIT 0x88
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_S0MODE         BIT 0x9f
_SCON0_6        BIT 0x9e
_MCE0           BIT 0x9d
_REN0           BIT 0x9c
_TB80           BIT 0x9b
_RB80           BIT 0x9a
_TI0            BIT 0x99
_RI0            BIT 0x98
_SCON_6         BIT 0x9e
_MCE            BIT 0x9d
_REN            BIT 0x9c
_TB8            BIT 0x9b
_RB8            BIT 0x9a
_TI             BIT 0x99
_RI             BIT 0x98
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P2_7           BIT 0xa7
_EA             BIT 0xaf
_ESPI0          BIT 0xae
_ET2            BIT 0xad
_ES0            BIT 0xac
_ET1            BIT 0xab
_EX1            BIT 0xaa
_ET0            BIT 0xa9
_EX0            BIT 0xa8
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_5           BIT 0xb5
_P3_6           BIT 0xb6
_P3_7           BIT 0xb7
_IP_7           BIT 0xbf
_PSPI0          BIT 0xbe
_PT2            BIT 0xbd
_PS0            BIT 0xbc
_PT1            BIT 0xbb
_PX1            BIT 0xba
_PT0            BIT 0xb9
_PX0            BIT 0xb8
_MASTER0        BIT 0xc7
_TXMODE0        BIT 0xc6
_STA0           BIT 0xc5
_STO0           BIT 0xc4
_ACKRQ0         BIT 0xc3
_ARBLOST0       BIT 0xc2
_ACK0           BIT 0xc1
_SI0            BIT 0xc0
_MASTER1        BIT 0xc7
_TXMODE1        BIT 0xc6
_STA1           BIT 0xc5
_STO1           BIT 0xc4
_ACKRQ1         BIT 0xc3
_ARBLOST1       BIT 0xc2
_ACK1           BIT 0xc1
_SI1            BIT 0xc0
_TF2            BIT 0xcf
_TF2H           BIT 0xcf
_TF2L           BIT 0xce
_TF2LEN         BIT 0xcd
_TF2CEN         BIT 0xcc
_T2SPLIT        BIT 0xcb
_TR2            BIT 0xca
_T2CSS          BIT 0xc9
_T2XCLK         BIT 0xc8
_TF5H           BIT 0xcf
_TF5L           BIT 0xce
_TF5LEN         BIT 0xcd
_TMR5CN_4       BIT 0xcc
_T5SPLIT        BIT 0xcb
_TR5            BIT 0xca
_TMR5CN_1       BIT 0xc9
_T5XCLK         BIT 0xc8
_CY             BIT 0xd7
_AC             BIT 0xd6
_F0             BIT 0xd5
_RS1            BIT 0xd4
_RS0            BIT 0xd3
_OV             BIT 0xd2
_F1             BIT 0xd1
_PARITY         BIT 0xd0
_CF             BIT 0xdf
_CR             BIT 0xde
_PCA0CN_5       BIT 0xde
_CCF4           BIT 0xdc
_CCF3           BIT 0xdb
_CCF2           BIT 0xda
_CCF1           BIT 0xd9
_CCF0           BIT 0xd8
_ACC_7          BIT 0xe7
_ACC_6          BIT 0xe6
_ACC_5          BIT 0xe5
_ACC_4          BIT 0xe4
_ACC_3          BIT 0xe3
_ACC_2          BIT 0xe2
_ACC_1          BIT 0xe1
_ACC_0          BIT 0xe0
_AD0EN          BIT 0xef
_AD0TM          BIT 0xee
_AD0INT         BIT 0xed
_AD0BUSY        BIT 0xec
_AD0WINT        BIT 0xeb
_AD0CM2         BIT 0xea
_AD0CM1         BIT 0xe9
_AD0CM0         BIT 0xe8
_B_7            BIT 0xf7
_B_6            BIT 0xf6
_B_5            BIT 0xf5
_B_4            BIT 0xf4
_B_3            BIT 0xf3
_B_2            BIT 0xf2
_B_1            BIT 0xf1
_B_0            BIT 0xf0
_SPIF           BIT 0xff
_WCOL           BIT 0xfe
_MODF           BIT 0xfd
_RXOVRN         BIT 0xfc
_NSSMD1         BIT 0xfb
_NSSMD0         BIT 0xfa
_TXBMT          BIT 0xf9
_SPIEN          BIT 0xf8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_pwm_count:
	ds 1
_power_level:
	ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
_initializePin_PARM_2:
	ds 1
	rseg	R_OSEG
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_reverse:
	DBIT	1
_T2_ISR_sloc0_1_0:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x0023
	ljmp	_SPI_ISR
	CSEG at 0x002b
	ljmp	_T2_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:24: volatile unsigned char pwm_count=0;
	mov	_pwm_count,#0x00
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:25: volatile unsigned char power_level = 50;
	mov	_power_level,#0x32
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:26: volatile unsigned bit reverse = 0;
	clr	_reverse
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'T2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:29: void T2_ISR(void) interrupt 5 {
;	-----------------------------------------
;	 function T2_ISR
;	-----------------------------------------
_T2_ISR:
	using	0
	push	acc
	push	psw
	mov	psw,#0x00
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:31: TF2H = 0;
	clr	_TF2H
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:34: pwm_count++;
	inc	_pwm_count
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:35: if (pwm_count > 100) pwm_count = 0;
	mov	a,_pwm_count
	add	a,#0xff - 0x64
	jnc	L002002?
	mov	_pwm_count,#0x00
L002002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:38: if (reverse) {
	jnb	_reverse,L002004?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:39: P2_6 = pwm_count > power_level ? 0 : 1;
	clr	c
	mov	a,_power_level
	subb	a,_pwm_count
	mov  _T2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_6,c
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:40: P2_7 = 0;
	clr	_P2_7
	sjmp	L002006?
L002004?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:42: P2_7 = pwm_count > power_level ? 0 : 1;
	clr	c
	mov	a,_power_level
	subb	a,_pwm_count
	mov  _T2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_7,c
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:43: P2_6 = 0;
	clr	_P2_6
L002006?:
	pop	psw
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'SPI_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:48: void SPI_ISR(void) interrupt 4 {
;	-----------------------------------------
;	 function SPI_ISR
;	-----------------------------------------
_SPI_ISR:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:49: if (RI) {
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:50: RI = 0;
	jbc	_RI,L003006?
	sjmp	L003003?
L003006?:
L003003?:
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:56: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:57: printf("\x1b[2J");
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:64: );
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:63: __FILE__, __DATE__, __TIME__
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:62: "===================\n",
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:67: initializePin(1, 5);
	mov	_initializePin_PARM_2,#0x05
	mov	dpl,#0x01
	lcall	_initializePin
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:68: initializeADC();
	lcall	_initializeADC
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:70: while (1) {
L004002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:71: printf("$%d;\n", getADCAtPin(POT_1));
	mov	dpl,#0x05
	lcall	_getADCAtPin
	mov	r2,dpl
	mov	r3,dph
	push	ar2
	push	ar3
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:72: delay(50);
	mov	dptr,#0x0032
	lcall	_delay
	sjmp	L004002?
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:78: char _c51_external_startup(void) {
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:79: PCA0MD &= (~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:80: VDM0CN  = 0x80; // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:81: RSTSRC  = 0x02|0x04; // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:89: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:94: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:97: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:99: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:100: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:101: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:115: TL1   = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:116: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:117: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:118: TR1   = 1; // START Timer1
	setb	_TR1
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:119: TI    = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:123: P2MDOUT &= 0b_1110_0011;
	anl	_P2MDOUT,#0xE3
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:124: XBR0 = 0x01;      // Enable UART0 on P0.4(TX0) and P0.5(RX0)
	mov	_XBR0,#0x01
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:125: XBR1 = 0x40;      // enable crossbar
	mov	_XBR1,#0x40
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:129: TMR2CN  = 0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN,#0x00
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:130: CKCON  |= 0b_0001_0000;
	orl	_CKCON,#0x10
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:131: TMR2RL  = (-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	mov	_TMR2RL,#0x78
	mov	(_TMR2RL >> 8),#0xEC
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:132: TMR2    = 0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:133: ET2     = 1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:134: TR2     = 1;         // Start Timer2
	setb	_TR2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:136: EA = 1; // Enable interrupts
	setb	_EA
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:138: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'initializeADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:142: void initializeADC(void) {
;	-----------------------------------------
;	 function initializeADC
;	-----------------------------------------
_initializeADC:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:143: ADC0CF = 0xF8; // SAR clock = 31, Right-justified result
	mov	_ADC0CF,#0xF8
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:144: ADC0CN = 0b_1000_0000; // AD0EN=1, AD0TM=0
	mov	_ADC0CN,#0x80
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:145: REF0CN = 0b_0000_1000; // Select VDD as the voltage reference
	mov	_REF0CN,#0x08
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'initializePin'
;------------------------------------------------------------
;pin                       Allocated with name '_initializePin_PARM_2'
;port                      Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:148: void initializePin(unsigned char port, unsigned char pin) {
;	-----------------------------------------
;	 function initializePin
;	-----------------------------------------
_initializePin:
	mov	r2,dpl
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:150: mask = 1 << pin;
	mov	b,_initializePin_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L007012?
L007010?:
	add	a,acc
L007012?:
	djnz	b,L007010?
	mov	r3,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:151: switch (port) {
	mov	a,r2
	add	a,#0xff - 0x03
	jc	L007007?
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L007014?
	jmp	@a+dptr
L007014?:
	ljmp	L007001?
	ljmp	L007002?
	ljmp	L007003?
	ljmp	L007004?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:152: case 0:
L007001?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:153: P0MDIN &= (~mask);
	mov	a,r3
	cpl	a
	anl	_P0MDIN,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:154: P0SKIP |= mask;
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:155: break;
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:156: case 1:
	ret
L007002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:157: P1MDIN &= (~mask);
	mov	a,r3
	cpl	a
	anl	_P1MDIN,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:158: P1SKIP |= mask;
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:159: break;
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:160: case 2:
	ret
L007003?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:161: P2MDIN &= (~mask);
	mov	a,r3
	cpl	a
	anl	_P2MDIN,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:162: P2SKIP |= mask;
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:163: break;
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:164: case 3:
	ret
L007004?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:165: P3MDIN &= (~mask);
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P3MDIN,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:166: P3SKIP |= mask;
	mov	a,r3
	orl	_P3SKIP,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:169: }
L007007?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getADCAtPin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:172: unsigned int getADCAtPin(unsigned char pin) {
;	-----------------------------------------
;	 function getADCAtPin
;	-----------------------------------------
_getADCAtPin:
	mov	_AMX0P,dpl
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:174: AMX0N = LQFP32_MUX_GND;  // GND is negative input (Single-ended Mode)
	mov	_AMX0N,#0x1F
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:176: AD0BUSY = 1;
	setb	_AD0BUSY
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:177: while (AD0BUSY); // Wait for dummy conversion to finish
L008001?:
	jb	_AD0BUSY,L008001?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:179: AD0BUSY = 1;
	setb	_AD0BUSY
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:180: while (AD0BUSY); // Wait for conversion to complete
L008004?:
	jb	_AD0BUSY,L008004?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:181: return (ADC0L+(ADC0H*0x100));
	mov	r2,_ADC0L
	mov	r3,#0x00
	mov	r5,_ADC0H
	mov	r4,#0x00
	mov	a,r4
	add	a,r2
	mov	dpl,a
	mov	a,r5
	addc	a,r3
	mov	dph,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delayUs'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:185: void delayUs(unsigned char us) {
;	-----------------------------------------
;	 function delayUs
;	-----------------------------------------
_delayUs:
	mov	r2,dpl
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:187: CKCON  |= 0b_0100_0000;
	orl	_CKCON,#0x40
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:188: TMR3RL  = (-(SYSCLK)/1000000L);
	mov	_TMR3RL,#0xD0
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:189: TMR3    = TMR3RL;
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:190: TMR3CN  = 0x04;
	mov	_TMR3CN,#0x04
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:193: for (i = 0; i < us; i++) {
	mov	r3,#0x00
L009004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L009007?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:194: while (!(TMR3CN & 0x80));
L009001?:
	mov	a,_TMR3CN
	jnb	acc.7,L009001?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:195: TMR3CN &= ~(0x80);
	anl	_TMR3CN,#0x7F
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:193: for (i = 0; i < us; i++) {
	inc	r3
	sjmp	L009004?
L009007?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:197: TMR3CN = 0;
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:201: void delay(unsigned int ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:203: for (j = 0; j < ms; j++) {
	mov	r4,#0x00
	mov	r5,#0x00
L010001?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L010005?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:204: delayUs(249);
	mov	dpl,#0xF9
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_delayUs
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:205: delayUs(249);
	mov	dpl,#0xF9
	lcall	_delayUs
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:206: delayUs(249);
	mov	dpl,#0xF9
	lcall	_delayUs
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:207: delayUs(250);
	mov	dpl,#0xFA
	lcall	_delayUs
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:203: for (j = 0; j < ms; j++) {
	inc	r4
	cjne	r4,#0x00,L010001?
	inc	r5
	sjmp	L010001?
L010005?:
	ret
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 'PWM and motor output'
	db 0x0A
	db 'Author:   Muchen He (44638154)'
	db 0x0A
	db 'File:   '
	db '  %s'
	db 0x0A
	db 'Compiled: %s, %s'
	db 0x0A
	db '==================='
	db 0x0A
	db 0x00
__str_2:
	db 'C:'
	db 0x5C
	db 'Users'
	db 0x5C
	db 'mansu'
	db 0x5C
	db 'OneDrive'
	db 0x5C
	db 'Documents'
	db 0x5C
	db '2017 UBC'
	db 0x5C
	db 'ELEC 291'
	db 0x5C
	db 'Lab 6'
	db 0x5C
	db 'Mo'
	db 'torControl.c'
	db 0x00
__str_3:
	db 'Mar 14 2017'
	db 0x00
__str_4:
	db '12:30:05'
	db 0x00
__str_5:
	db '$%d;'
	db 0x0A
	db 0x00

	CSEG

end
