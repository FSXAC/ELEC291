;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Wed Mar 15 12:46:17 2017
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
	public _IMAGES_LEN
	public _LED_setIntensity
	public _main
	public _getKey
	public _T2_ISR
	public _reverse
	public _LED_write_PARM_2
	public _LED_animate_PARM_3
	public _LED_animate_PARM_2
	public _mode
	public _IMAGE
	public _power_level
	public _pwm_count
	public _checkButton
	public _changeMode
	public _mode0
	public _mode1
	public _mode2
	public __c51_external_startup
	public _initializeADC
	public _initializePin
	public _getADCAtPin
	public _delayUs
	public _delay
	public _LED_display
	public _LED_animate
	public _LED_spi
	public _LED_pulse
	public _LED_clear
	public _LED_init
	public _LED_write
	public _LED_test
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
_IMAGE:
	ds 32
_mode:
	ds 1
_mode0_inputPWM_1_79:
	ds 2
_mode0_direction_1_79:
	ds 2
_LED_display_grid_1_102:
	ds 3
_LED_animate_PARM_2:
	ds 1
_LED_animate_PARM_3:
	ds 2
_LED_animate_grid_1_105:
	ds 3
_LED_write_PARM_2:
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
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:71: volatile unsigned char pwm_count=0;
	mov	_pwm_count,#0x00
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:72: volatile unsigned char power_level = 50;
	mov	_power_level,#0x32
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:76: unsigned char IMAGE[4][8] = {
	mov	_IMAGE,#0x7C
	mov	(_IMAGE + 0x0001),#0x32
	mov	(_IMAGE + 0x0002),#0x11
	mov	(_IMAGE + 0x0003),#0x81
	mov	(_IMAGE + 0x0004),#0x81
	mov	(_IMAGE + 0x0005),#0x88
	mov	(_IMAGE + 0x0006),#0x4C
	mov	(_IMAGE + 0x0007),#0x3E
	mov	(_IMAGE + 0x0008),#0x3C
	mov	(_IMAGE + 0x0009),#0x62
	mov	(_IMAGE + 0x000a),#0xF0
	mov	(_IMAGE + 0x000b),#0xC0
	mov	(_IMAGE + 0x000c),#0x03
	mov	(_IMAGE + 0x000d),#0x0F
	mov	(_IMAGE + 0x000e),#0x06
	mov	(_IMAGE + 0x000f),#0x3C
	mov	(_IMAGE + 0x0010),#0x38
	mov	(_IMAGE + 0x0011),#0x41
	mov	(_IMAGE + 0x0012),#0x83
	mov	(_IMAGE + 0x0013),#0x87
	mov	(_IMAGE + 0x0014),#0xE1
	mov	(_IMAGE + 0x0015),#0xC1
	mov	(_IMAGE + 0x0016),#0x82
	mov	(_IMAGE + 0x0017),#0x1C
	mov	(_IMAGE + 0x0018),#0x0C
	mov	(_IMAGE + 0x0019),#0x4E
	mov	(_IMAGE + 0x001a),#0x87
	mov	(_IMAGE + 0x001b),#0x85
	mov	(_IMAGE + 0x001c),#0xA1
	mov	(_IMAGE + 0x001d),#0xE1
	mov	(_IMAGE + 0x001e),#0x72
	mov	(_IMAGE + 0x001f),#0x30
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:88: unsigned char mode = 0;
	mov	_mode,#0x00
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:73: volatile unsigned bit reverse = 0;
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
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:91: void T2_ISR(void) interrupt 5 {
;	-----------------------------------------
;	 function T2_ISR
;	-----------------------------------------
_T2_ISR:
	using	0
	push	acc
	push	psw
	mov	psw,#0x00
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:93: TF2H = 0;
	clr	_TF2H
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:96: pwm_count++;
	inc	_pwm_count
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:97: if (pwm_count > 100) pwm_count = 0;
	mov	a,_pwm_count
	add	a,#0xff - 0x64
	jnc	L002002?
	mov	_pwm_count,#0x00
L002002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:100: if (reverse) {
	jnb	_reverse,L002004?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:101: P2_6 = pwm_count > power_level ? 0 : 1;
	clr	c
	mov	a,_power_level
	subb	a,_pwm_count
	mov  _T2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_6,c
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:102: P2_7 = 0;
	clr	_P2_7
	sjmp	L002006?
L002004?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:104: P2_7 = pwm_count > power_level ? 0 : 1;
	clr	c
	mov	a,_power_level
	subb	a,_pwm_count
	mov  _T2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_7,c
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:105: P2_6 = 0;
	clr	_P2_6
L002006?:
	pop	psw
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'getKey'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:111: char getKey(void) {
;	-----------------------------------------
;	 function getKey
;	-----------------------------------------
_getKey:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:112: if(!RI) return 0;
	jb	_RI,L003002?
	mov	dpl,#0x00
	ret
L003002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:114: RI = 0;
	clr	_RI
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:115: return SBUF;
	mov	dpl,_SBUF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:120: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:121: printf("\x1b[2J");
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
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:128: );
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:127: __FILE__, __DATE__, __TIME__
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:126: "===================\n",
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
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:131: initializePin(1, 5);
	mov	_initializePin_PARM_2,#0x05
	mov	dpl,#0x01
	lcall	_initializePin
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:132: initializeADC();
	lcall	_initializeADC
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:135: LED_init();
	lcall	_LED_init
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:138: power_level = 0;
	mov	_power_level,#0x00
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:140: while (1) {
L004007?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:142: changeMode();
	lcall	_changeMode
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:145: switch (mode) {
	clr	a
	cjne	a,_mode,L004015?
	sjmp	L004001?
L004015?:
	mov	a,#0x01
	cjne	a,_mode,L004016?
	sjmp	L004002?
L004016?:
	mov	a,#0x02
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:146: case 0: mode0(); break;
	cjne	a,_mode,L004005?
	sjmp	L004003?
L004001?:
	lcall	_mode0
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:147: case 1: mode1(); break;
	sjmp	L004005?
L004002?:
	lcall	_mode1
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:148: case 2: mode2(); break;
	sjmp	L004005?
L004003?:
	lcall	_mode2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:150: }
L004005?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:153: LED_animate(IMAGE, 4, 30);
	mov	_LED_animate_PARM_2,#0x04
	mov	_LED_animate_PARM_3,#0x1E
	clr	a
	mov	(_LED_animate_PARM_3 + 1),a
	mov	dptr,#_IMAGE
	mov	b,#0x40
	lcall	_LED_animate
	sjmp	L004007?
;------------------------------------------------------------
;Allocation info for local variables in function 'checkButton'
;------------------------------------------------------------
;button                    Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:157: bit checkButton(unsigned char button) {
;	-----------------------------------------
;	 function checkButton
;	-----------------------------------------
_checkButton:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:158: if (!button) {
	mov	a,dpl
	mov	r2,a
	jnz	L005004?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:159: delay(50);
	mov	dptr,#0x0032
	push	ar2
	lcall	_delay
	pop	ar2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:160: if (!button) {
	mov	a,r2
	jnz	L005004?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:161: return 1;
	setb	c
	ret
L005004?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:165: return 0;
	clr	c
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'changeMode'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:168: void changeMode(void) {
;	-----------------------------------------
;	 function changeMode
;	-----------------------------------------
_changeMode:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:169: if (!BTNX) {
	jb	_P1_6,L006008?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:170: delay(50);
	mov	dptr,#0x0032
	lcall	_delay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:171: if (!BTNX) mode = (mode == 2) ? 0 : mode + 1;
	jb	_P1_6,L006003?
	mov	a,#0x02
	cjne	a,_mode,L006010?
	mov	r2,#0x00
	sjmp	L006011?
L006010?:
	mov	a,_mode
	inc	a
	mov	r2,a
L006011?:
	mov	_mode,r2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:172: while (!BTNX);
L006003?:
	jnb	_P1_6,L006003?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:173: printf("\n=== Mode %d ===\n", mode);
	mov	r2,_mode
	mov	r3,#0x00
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
L006008?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'mode0'
;------------------------------------------------------------
;inputPWM                  Allocated with name '_mode0_inputPWM_1_79'
;direction                 Allocated with name '_mode0_direction_1_79'
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:177: void mode0(void) {
;	-----------------------------------------
;	 function mode0
;	-----------------------------------------
_mode0:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:183: if (!BTN0) {
	jnb	_P0_5,L007018?
	ret
L007018?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:184: delay(20);
	mov	dptr,#0x0014
	lcall	_delay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:185: if (!BTN0) {
	jnb	_P0_5,L007019?
	ret
L007019?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:186: do {
L007002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:188: printf("Enter power setting:\n<direction [0, 1]>: ");
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:189: scanf("%d", &direction);
	mov	a,#_mode0_direction_1_79
	push	acc
	mov	a,#(_mode0_direction_1_79 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:190: reverse = direction;
	mov	a,_mode0_direction_1_79
	orl	a,(_mode0_direction_1_79 + 1)
	add	a,#0xff
	mov	_reverse,c
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:192: printf("\n<Duty Cycle>: ");
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:193: scanf("%d", &inputPWM);
	mov	a,#_mode0_inputPWM_1_79
	push	acc
	mov	a,#(_mode0_inputPWM_1_79 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:194: power_level = inputPWM;
	mov	_power_level,_mode0_inputPWM_1_79
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:196: printf("\nSet: %d:%d\n", reverse, power_level);
	mov	r2,_power_level
	mov	r3,#0x00
	mov	c,_reverse
	clr	a
	rlc	a
	mov	r4,a
	mov	r5,#0x00
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_9
	push	acc
	mov	a,#(__str_9 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:198: } while (direction > 1 || inputPWM > 100);
	clr	c
	mov	a,#0x01
	subb	a,_mode0_direction_1_79
	clr	a
	subb	a,(_mode0_direction_1_79 + 1)
	jnc	L007020?
	ljmp	L007002?
L007020?:
	clr	c
	mov	a,#0x64
	subb	a,_mode0_inputPWM_1_79
	clr	a
	subb	a,(_mode0_inputPWM_1_79 + 1)
	jnc	L007021?
	ljmp	L007002?
L007021?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:201: while (!BTN0);
L007005?:
	jnb	_P0_5,L007005?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'mode1'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:206: void mode1(void) {
;	-----------------------------------------
;	 function mode1
;	-----------------------------------------
_mode1:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:207: delay(100);
	mov	dptr,#0x0064
	ljmp	_delay
;------------------------------------------------------------
;Allocation info for local variables in function 'mode2'
;------------------------------------------------------------
;potentValue               Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:210: void mode2(void) {
;	-----------------------------------------
;	 function mode2
;	-----------------------------------------
_mode2:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:212: potentValue = getADCAtPin(POT_1);
	mov	dpl,#0x05
	lcall	_getADCAtPin
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:213: power_level = 100.0*potentValue / 1023.0;
	mov	r2,dpl
	mov  r3,dph
	push	ar2
	push	ar3
	lcall	___sint2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0xC8
	mov	a,#0x42
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xC0
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fs2uchar
	mov	_power_level,dpl
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:214: printf("$%d;", potentValue);
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:215: delay(50);
	mov	dptr,#0x0032
	ljmp	_delay
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:218: char _c51_external_startup(void) {
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:219: PCA0MD &= (~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:220: VDM0CN  = 0x80; // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:221: RSTSRC  = 0x02|0x04; // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:229: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:234: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:237: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:239: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:240: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:241: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:255: TL1   = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:256: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:257: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:258: TR1   = 1; // START Timer1
	setb	_TR1
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:259: TI    = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:263: P2MDOUT &= 0b_1110_0011;
	anl	_P2MDOUT,#0xE3
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:264: XBR0 = 0x01;      // Enable UART0 on P0.4(TX0) and P0.5(RX0)
	mov	_XBR0,#0x01
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:265: XBR1 = 0x40;      // enable crossbar
	mov	_XBR1,#0x40
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:269: TMR2CN  = 0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN,#0x00
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:270: CKCON  |= 0b_0001_0000;
	orl	_CKCON,#0x10
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:271: TMR2RL  = (-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	mov	_TMR2RL,#0x78
	mov	(_TMR2RL >> 8),#0xEC
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:272: TMR2    = 0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:273: ET2     = 1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:274: TR2     = 1;         // Start Timer2
	setb	_TR2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:276: EA = 1; // Enable interrupts
	setb	_EA
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:278: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'initializeADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:282: void initializeADC(void) {
;	-----------------------------------------
;	 function initializeADC
;	-----------------------------------------
_initializeADC:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:283: ADC0CF = 0xF8; // SAR clock = 31, Right-justified result
	mov	_ADC0CF,#0xF8
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:284: ADC0CN = 0b_1000_0000; // AD0EN=1, AD0TM=0
	mov	_ADC0CN,#0x80
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:285: REF0CN = 0b_0000_1000; // Select VDD as the voltage reference
	mov	_REF0CN,#0x08
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'initializePin'
;------------------------------------------------------------
;pin                       Allocated with name '_initializePin_PARM_2'
;port                      Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:288: void initializePin(unsigned char port, unsigned char pin) {
;	-----------------------------------------
;	 function initializePin
;	-----------------------------------------
_initializePin:
	mov	r2,dpl
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:290: mask = 1 << pin;
	mov	b,_initializePin_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L012012?
L012010?:
	add	a,acc
L012012?:
	djnz	b,L012010?
	mov	r3,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:291: switch (port) {
	mov	a,r2
	add	a,#0xff - 0x03
	jc	L012007?
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L012014?
	jmp	@a+dptr
L012014?:
	ljmp	L012001?
	ljmp	L012002?
	ljmp	L012003?
	ljmp	L012004?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:292: case 0:
L012001?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:293: P0MDIN &= (~mask);
	mov	a,r3
	cpl	a
	anl	_P0MDIN,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:294: P0SKIP |= mask;
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:295: break;
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:296: case 1:
	ret
L012002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:297: P1MDIN &= (~mask);
	mov	a,r3
	cpl	a
	anl	_P1MDIN,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:298: P1SKIP |= mask;
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:299: break;
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:300: case 2:
	ret
L012003?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:301: P2MDIN &= (~mask);
	mov	a,r3
	cpl	a
	anl	_P2MDIN,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:302: P2SKIP |= mask;
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:303: break;
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:304: case 3:
	ret
L012004?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:305: P3MDIN &= (~mask);
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P3MDIN,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:306: P3SKIP |= mask;
	mov	a,r3
	orl	_P3SKIP,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:309: }
L012007?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getADCAtPin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:312: unsigned int getADCAtPin(unsigned char pin) {
;	-----------------------------------------
;	 function getADCAtPin
;	-----------------------------------------
_getADCAtPin:
	mov	_AMX0P,dpl
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:314: AMX0N = LQFP32_MUX_GND;  // GND is negative input (Single-ended Mode)
	mov	_AMX0N,#0x1F
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:316: AD0BUSY = 1;
	setb	_AD0BUSY
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:317: while (AD0BUSY); // Wait for dummy conversion to finish
L013001?:
	jb	_AD0BUSY,L013001?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:319: AD0BUSY = 1;
	setb	_AD0BUSY
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:320: while (AD0BUSY); // Wait for conversion to complete
L013004?:
	jb	_AD0BUSY,L013004?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:321: return (ADC0L+(ADC0H*0x100));
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
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:325: void delayUs(unsigned char us) {
;	-----------------------------------------
;	 function delayUs
;	-----------------------------------------
_delayUs:
	mov	r2,dpl
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:327: CKCON  |= 0b_0100_0000;
	orl	_CKCON,#0x40
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:328: TMR3RL  = (-(SYSCLK)/1000000L);
	mov	_TMR3RL,#0xD0
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:329: TMR3    = TMR3RL;
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:330: TMR3CN  = 0x04;
	mov	_TMR3CN,#0x04
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:333: for (i = 0; i < us; i++) {
	mov	r3,#0x00
L014004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L014007?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:334: while (!(TMR3CN & 0x80));
L014001?:
	mov	a,_TMR3CN
	jnb	acc.7,L014001?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:335: TMR3CN &= ~(0x80);
	anl	_TMR3CN,#0x7F
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:333: for (i = 0; i < us; i++) {
	inc	r3
	sjmp	L014004?
L014007?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:337: TMR3CN = 0;
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:341: void delay(unsigned int ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:343: for (j = 0; j < ms; j++) {
	mov	r4,#0x00
	mov	r5,#0x00
L015001?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L015005?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:344: delayUs(249);
	mov	dpl,#0xF9
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_delayUs
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:345: delayUs(249);
	mov	dpl,#0xF9
	lcall	_delayUs
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:346: delayUs(249);
	mov	dpl,#0xF9
	lcall	_delayUs
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:347: delayUs(250);
	mov	dpl,#0xFA
	lcall	_delayUs
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:343: for (j = 0; j < ms; j++) {
	inc	r4
	cjne	r4,#0x00,L015001?
	inc	r5
	sjmp	L015001?
L015005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_display'
;------------------------------------------------------------
;grid                      Allocated with name '_LED_display_grid_1_102'
;i                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:351: void LED_display(unsigned char *grid) {
;	-----------------------------------------
;	 function LED_display
;	-----------------------------------------
_LED_display:
	mov	_LED_display_grid_1_102,dpl
	mov	(_LED_display_grid_1_102 + 1),dph
	mov	(_LED_display_grid_1_102 + 2),b
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:353: for (i = 1; i <= 8; i++) {
	mov	r5,#0x01
	mov	r6,#0x00
L016001?:
	clr	c
	mov	a,#0x08
	subb	a,r5
	clr	a
	subb	a,r6
	jc	L016005?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:354: LED_write(i, grid[i-1]);
	mov	a,r5
	mov	r7,a
	add	a,#0xff
	mov	r0,a
	mov	a,r6
	addc	a,#0xff
	mov	r1,a
	mov	a,r0
	add	a,_LED_display_grid_1_102
	mov	r0,a
	mov	a,r1
	addc	a,(_LED_display_grid_1_102 + 1)
	mov	r1,a
	mov	r2,(_LED_display_grid_1_102 + 2)
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	lcall	__gptrget
	mov	_LED_write_PARM_2,a
	mov	dpl,r7
	push	ar5
	push	ar6
	lcall	_LED_write
	pop	ar6
	pop	ar5
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:353: for (i = 1; i <= 8; i++) {
	inc	r5
	cjne	r5,#0x00,L016001?
	inc	r6
	sjmp	L016001?
L016005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_animate'
;------------------------------------------------------------
;frames                    Allocated with name '_LED_animate_PARM_2'
;fps                       Allocated with name '_LED_animate_PARM_3'
;grid                      Allocated with name '_LED_animate_grid_1_105'
;i                         Allocated to registers r7 r0 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:358: void LED_animate(unsigned char grid[][8], unsigned char frames, int fps) {
;	-----------------------------------------
;	 function LED_animate
;	-----------------------------------------
_LED_animate:
	mov	_LED_animate_grid_1_105,dpl
	mov	(_LED_animate_grid_1_105 + 1),dph
	mov	(_LED_animate_grid_1_105 + 2),b
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:360: for (i = 0; i < frames; i++) {
	mov	__divsint_PARM_2,_LED_animate_PARM_3
	mov	(__divsint_PARM_2 + 1),(_LED_animate_PARM_3 + 1)
	mov	dptr,#0x03E8
	lcall	__divsint
	mov	r5,dpl
	mov	r6,dph
	mov	r7,#0x00
	mov	r0,#0x00
L017001?:
	mov	r1,_LED_animate_PARM_2
	mov	r2,#0x00
	clr	c
	mov	a,r7
	subb	a,r1
	mov	a,r0
	subb	a,r2
	jnc	L017005?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:361: LED_display(grid[i]);
	mov	ar2,r7
	mov	a,r0
	swap	a
	rr	a
	anl	a,#0xf8
	xch	a,r2
	swap	a
	rr	a
	xch	a,r2
	xrl	a,r2
	xch	a,r2
	anl	a,#0xf8
	xch	a,r2
	xrl	a,r2
	mov	r3,a
	mov	a,r2
	add	a,_LED_animate_grid_1_105
	mov	r2,a
	mov	a,r3
	addc	a,(_LED_animate_grid_1_105 + 1)
	mov	r3,a
	mov	r4,(_LED_animate_grid_1_105 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	lcall	_LED_display
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar5
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:362: delay(1000/fps);
	mov	dpl,r5
	mov	dph,r6
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	lcall	_delay
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar5
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:360: for (i = 0; i < frames; i++) {
	inc	r7
	cjne	r7,#0x00,L017001?
	inc	r0
	sjmp	L017001?
L017005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_spi'
;------------------------------------------------------------
;value                     Allocated to registers r2 
;j                         Allocated to registers r3 
;temp                      Allocated to registers r4 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:368: void LED_spi(unsigned char value) {
;	-----------------------------------------
;	 function LED_spi
;	-----------------------------------------
_LED_spi:
	mov	r2,dpl
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:370: for (j = 1; j <= 8; j++) {
	mov	r3,#0x01
L018001?:
	mov	a,r3
	add	a,#0xff - 0x08
	jc	L018005?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:371: temp = value & 0x80;
	mov	a,#0x80
	anl	a,r2
	mov	r4,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:372: LED_DATA = (temp == 0x80) ? HIGH : LOW;
	cjne	r4,#0x80,L018011?
	setb	c
	sjmp	L018012?
L018011?:
	clr	c
L018012?:
	mov	_P2_4,c
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:375: LED_CLK = HIGH;
	setb	_P2_3
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:376: delayUs(20);
	mov	dpl,#0x14
	push	ar2
	push	ar3
	lcall	_delayUs
	pop	ar3
	pop	ar2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:377: LED_CLK = LOW;
	clr	_P2_3
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:380: value = value << 1;
	mov	a,r2
	add	a,r2
	mov	r2,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:370: for (j = 1; j <= 8; j++) {
	inc	r3
	sjmp	L018001?
L018005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:384: void LED_pulse(void) {
;	-----------------------------------------
;	 function LED_pulse
;	-----------------------------------------
_LED_pulse:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:385: LED_CS = HIGH;
	setb	_P2_5
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:386: delay(1);
	mov	dptr,#0x0001
	lcall	_delay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:387: LED_CS = LOW;
	clr	_P2_5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_clear'
;------------------------------------------------------------
;j                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:391: void LED_clear(void) {
;	-----------------------------------------
;	 function LED_clear
;	-----------------------------------------
_LED_clear:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:393: for (j = 1; j <= 8; j++) {
	mov	r2,#0x01
L020001?:
	mov	a,r2
	add	a,#0xff - 0x08
	jc	L020005?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:394: LED_spi(j);
	mov	dpl,r2
	push	ar2
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:395: LED_spi(0x00);
	mov	dpl,#0x00
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:396: LED_pulse();
	lcall	_LED_pulse
	pop	ar2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:393: for (j = 1; j <= 8; j++) {
	inc	r2
	sjmp	L020001?
L020005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_setIntensity'
;------------------------------------------------------------
;intensity                 Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:401: void LED_setIntensity(unsigned char intensity) {
;	-----------------------------------------
;	 function LED_setIntensity
;	-----------------------------------------
_LED_setIntensity:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:402: if (intensity > 0x0F) return;
	mov	a,dpl
	mov	r2,a
	add	a,#0xff - 0x0F
	jnc	L021002?
	ret
L021002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:403: LED_spi(0x0A);
	mov	dpl,#0x0A
	push	ar2
	lcall	_LED_spi
	pop	ar2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:404: LED_spi(intensity);
	mov	dpl,r2
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:405: LED_pulse();
	ljmp	_LED_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:409: void LED_init(void) {
;	-----------------------------------------
;	 function LED_init
;	-----------------------------------------
_LED_init:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:410: LED_CS = LOW;
	clr	_P2_5
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:413: LED_spi(0x09);
	mov	dpl,#0x09
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:415: LED_spi(0x00);
	mov	dpl,#0x00
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:416: LED_pulse();
	lcall	_LED_pulse
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:419: LED_spi(0x0A);
	mov	dpl,#0x0A
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:420: LED_spi(LED_INTENSITY);
	mov	dpl,#0x01
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:421: LED_pulse();
	lcall	_LED_pulse
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:424: LED_spi(0x0b);
	mov	dpl,#0x0B
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:425: LED_spi(0x07);
	mov	dpl,#0x07
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:426: LED_pulse();
	lcall	_LED_pulse
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:429: LED_clear();
	lcall	_LED_clear
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:432: LED_spi(0x0C);
	mov	dpl,#0x0C
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:433: LED_spi(0x01);
	mov	dpl,#0x01
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:434: LED_pulse();
	ljmp	_LED_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_write'
;------------------------------------------------------------
;value                     Allocated with name '_LED_write_PARM_2'
;address                   Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:438: void LED_write(unsigned char address, unsigned char value) {
;	-----------------------------------------
;	 function LED_write
;	-----------------------------------------
_LED_write:
	mov	r2,dpl
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:439: if ((address < 1) || (address > 8)) return;
	cjne	r2,#0x01,L023007?
L023007?:
	jc	L023001?
	mov	a,r2
	add	a,#0xff - 0x08
	jnc	L023002?
L023001?:
	ret
L023002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:440: LED_spi(address);
	mov	dpl,r2
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:441: LED_spi(value);
	mov	dpl,_LED_write_PARM_2
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:442: LED_pulse();
	ljmp	_LED_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_test'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:446: void LED_test(void) {
;	-----------------------------------------
;	 function LED_test
;	-----------------------------------------
_LED_test:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:447: LED_spi(0x0F);
	mov	dpl,#0x0F
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:448: LED_spi(0x01);
	mov	dpl,#0x01
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:449: LED_pulse();
	lcall	_LED_pulse
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:450: delay(1000);
	mov	dptr,#0x03E8
	lcall	_delay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:451: LED_spi(0x0F);
	mov	dpl,#0x0F
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:452: LED_spi(0x00);
	mov	dpl,#0x00
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\MotorControl.c:453: LED_pulse();
	ljmp	_LED_pulse
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
_IMAGES_LEN:
	db 0x04,0x00	;  4
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
	db 'Mar 15 2017'
	db 0x00
__str_4:
	db '12:46:16'
	db 0x00
__str_5:
	db 0x0A
	db '=== Mode %d ==='
	db 0x0A
	db 0x00
__str_6:
	db 'Enter power setting:'
	db 0x0A
	db '<direction [0, 1]>: '
	db 0x00
__str_7:
	db '%d'
	db 0x00
__str_8:
	db 0x0A
	db '<Duty Cycle>: '
	db 0x00
__str_9:
	db 0x0A
	db 'Set: %d:%d'
	db 0x0A
	db 0x00
__str_10:
	db '$%d;'
	db 0x00

	CSEG

end
