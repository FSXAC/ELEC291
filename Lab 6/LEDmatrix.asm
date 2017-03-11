;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Sat Mar 11 02:21:58 2017
;--------------------------------------------------------
$name LEDmatrix
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
	public _LED_setIntensity
	public _main
	public _LED_write_PARM_2
	public _sprite7
	public _sprite6
	public _sprite5
	public _sprite4
	public _sprite3
	public _sprite2
	public _sprite1
	public _LED_display
	public __c51_external_startup
	public _delayUs
	public _delay
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
_sprite1:
	ds 8
_sprite2:
	ds 8
_sprite3:
	ds 8
_sprite4:
	ds 8
_sprite5:
	ds 8
_sprite6:
	ds 8
_sprite7:
	ds 8
_LED_display_grid_1_55:
	ds 3
_LED_write_PARM_2:
	ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
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
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:10: unsigned char sprite1[8] = {0x00, 0x00, 0x00, 0x18, 0x18, 0x00, 0x00, 0x00};
	mov	_sprite1,#0x00
	mov	(_sprite1 + 0x0001),#0x00
	mov	(_sprite1 + 0x0002),#0x00
	mov	(_sprite1 + 0x0003),#0x18
	mov	(_sprite1 + 0x0004),#0x18
	mov	(_sprite1 + 0x0005),#0x00
	mov	(_sprite1 + 0x0006),#0x00
	mov	(_sprite1 + 0x0007),#0x00
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:11: unsigned char sprite2[8] = {0x00, 0x00, 0x18, 0x24, 0x24, 0x18, 0x00, 0x00};
	mov	_sprite2,#0x00
	mov	(_sprite2 + 0x0001),#0x00
	mov	(_sprite2 + 0x0002),#0x18
	mov	(_sprite2 + 0x0003),#0x24
	mov	(_sprite2 + 0x0004),#0x24
	mov	(_sprite2 + 0x0005),#0x18
	mov	(_sprite2 + 0x0006),#0x00
	mov	(_sprite2 + 0x0007),#0x00
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:12: unsigned char sprite3[8] = {0x00, 0x18, 0x24, 0x5A, 0x5A, 0x24, 0x18, 0x00};
	mov	_sprite3,#0x00
	mov	(_sprite3 + 0x0001),#0x18
	mov	(_sprite3 + 0x0002),#0x24
	mov	(_sprite3 + 0x0003),#0x5A
	mov	(_sprite3 + 0x0004),#0x5A
	mov	(_sprite3 + 0x0005),#0x24
	mov	(_sprite3 + 0x0006),#0x18
	mov	(_sprite3 + 0x0007),#0x00
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:13: unsigned char sprite4[8] = {0x3C, 0x42, 0x99, 0xA5, 0xA5, 0x99, 0x42, 0x3C};
	mov	_sprite4,#0x3C
	mov	(_sprite4 + 0x0001),#0x42
	mov	(_sprite4 + 0x0002),#0x99
	mov	(_sprite4 + 0x0003),#0xA5
	mov	(_sprite4 + 0x0004),#0xA5
	mov	(_sprite4 + 0x0005),#0x99
	mov	(_sprite4 + 0x0006),#0x42
	mov	(_sprite4 + 0x0007),#0x3C
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:14: unsigned char sprite5[8] = {0x42, 0x99, 0x24, 0x42, 0x42, 0x24, 0x99, 0x42};
	mov	_sprite5,#0x42
	mov	(_sprite5 + 0x0001),#0x99
	mov	(_sprite5 + 0x0002),#0x24
	mov	(_sprite5 + 0x0003),#0x42
	mov	(_sprite5 + 0x0004),#0x42
	mov	(_sprite5 + 0x0005),#0x24
	mov	(_sprite5 + 0x0006),#0x99
	mov	(_sprite5 + 0x0007),#0x42
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:15: unsigned char sprite6[8] = {0x3C, 0x42, 0x81, 0x81, 0x81, 0x81, 0x42, 0x3C};
	mov	_sprite6,#0x3C
	mov	(_sprite6 + 0x0001),#0x42
	mov	(_sprite6 + 0x0002),#0x81
	mov	(_sprite6 + 0x0003),#0x81
	mov	(_sprite6 + 0x0004),#0x81
	mov	(_sprite6 + 0x0005),#0x81
	mov	(_sprite6 + 0x0006),#0x42
	mov	(_sprite6 + 0x0007),#0x3C
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:16: unsigned char sprite7[8] = {0x42, 0x81, 0x00, 0x00, 0x00, 0x00, 0x81, 0x42};
	mov	_sprite7,#0x42
	mov	(_sprite7 + 0x0001),#0x81
	mov	(_sprite7 + 0x0002),#0x00
	mov	(_sprite7 + 0x0003),#0x00
	mov	(_sprite7 + 0x0004),#0x00
	mov	(_sprite7 + 0x0005),#0x00
	mov	(_sprite7 + 0x0006),#0x81
	mov	(_sprite7 + 0x0007),#0x42
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;position                  Allocated to registers 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:18: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	using	0
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:20: printf("\x1b[2J");
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
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:27: );
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:26: __FILE__, __DATE__, __TIME__
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:25: "===================\n",
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
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:29: LED_init();
	lcall	_LED_init
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:30: printf("\x1b[s");
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:31: while (1) {
L002002?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:35: LED_display(sprite1);
	mov	dptr,#_sprite1
	mov	b,#0x40
	lcall	_LED_display
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:36: delay(50);
	mov	dptr,#0x0032
	lcall	_delay
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:37: LED_display(sprite2);
	mov	dptr,#_sprite2
	mov	b,#0x40
	lcall	_LED_display
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:38: delay(50);
	mov	dptr,#0x0032
	lcall	_delay
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:39: LED_display(sprite3);
	mov	dptr,#_sprite3
	mov	b,#0x40
	lcall	_LED_display
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:40: delay(50);
	mov	dptr,#0x0032
	lcall	_delay
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:41: LED_display(sprite4);
	mov	dptr,#_sprite4
	mov	b,#0x40
	lcall	_LED_display
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:42: delay(50);
	mov	dptr,#0x0032
	lcall	_delay
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:43: LED_display(sprite5);
	mov	dptr,#_sprite5
	mov	b,#0x40
	lcall	_LED_display
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:44: delay(50);
	mov	dptr,#0x0032
	lcall	_delay
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:45: LED_display(sprite6);
	mov	dptr,#_sprite6
	mov	b,#0x40
	lcall	_LED_display
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:46: delay(50);
	mov	dptr,#0x0032
	lcall	_delay
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:47: LED_display(sprite7);
	mov	dptr,#_sprite7
	mov	b,#0x40
	lcall	_LED_display
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:48: delay(50);
	mov	dptr,#0x0032
	lcall	_delay
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:49: LED_clear();
	lcall	_LED_clear
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:50: delay(5000);
	mov	dptr,#0x1388
	lcall	_delay
	ljmp	L002002?
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_display'
;------------------------------------------------------------
;grid                      Allocated with name '_LED_display_grid_1_55'
;i                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:54: void LED_display(unsigned char *grid) {
;	-----------------------------------------
;	 function LED_display
;	-----------------------------------------
_LED_display:
	mov	_LED_display_grid_1_55,dpl
	mov	(_LED_display_grid_1_55 + 1),dph
	mov	(_LED_display_grid_1_55 + 2),b
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:56: for (i = 1; i <= 8; i++) {
	mov	r5,#0x01
	mov	r6,#0x00
L003001?:
	clr	c
	mov	a,#0x08
	subb	a,r5
	clr	a
	subb	a,r6
	jc	L003005?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:57: LED_write(i, grid[i-1]);
	mov	a,r5
	mov	r7,a
	add	a,#0xff
	mov	r0,a
	mov	a,r6
	addc	a,#0xff
	mov	r1,a
	mov	a,r0
	add	a,_LED_display_grid_1_55
	mov	r0,a
	mov	a,r1
	addc	a,(_LED_display_grid_1_55 + 1)
	mov	r1,a
	mov	r2,(_LED_display_grid_1_55 + 2)
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
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:56: for (i = 1; i <= 8; i++) {
	inc	r5
	cjne	r5,#0x00,L003001?
	inc	r6
	sjmp	L003001?
L003005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:61: char _c51_external_startup(void) {
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:62: PCA0MD &= (~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:63: VDM0CN  = 0x80; // enable VDD monitor
	mov	_VDM0CN,#0x80
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:64: RSTSRC  = 0x02|0x04; // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:70: CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
	orl	_CLKSEL,#0x02
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:77: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:80: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:82: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x98
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:83: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:84: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:98: TL1   = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:99: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:100: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:101: TR1   = 1; // START Timer1
	setb	_TR1
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:102: TI    = 1;  // Indicate TX0 ready
	setb	_TI
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:105: P0MDOUT |= 0x01;  // set P0.0 and P0.4 as push-pull outputs
	orl	_P0MDOUT,#0x01
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:108: P2MDOUT &= 0x00;
	mov	a,_P2MDOUT
	mov	_P2MDOUT,#0x00
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:109: XBR0 = 0x01;      // Enable UART0 on P0.4(TX0) and P0.5(RX0)
	mov	_XBR0,#0x01
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:110: XBR1 = 0x40;      // enable crossbar
	mov	_XBR1,#0x40
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:112: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delayUs'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:116: void delayUs(unsigned char us) {
;	-----------------------------------------
;	 function delayUs
;	-----------------------------------------
_delayUs:
	mov	r2,dpl
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:118: CKCON  |= 0b_0100_0000;
	orl	_CKCON,#0x40
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:119: TMR3RL  = (-(SYSCLK)/1000000L);
	mov	_TMR3RL,#0xE8
	mov	(_TMR3RL >> 8),#0xFF
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:120: TMR3    = TMR3RL;
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:121: TMR3CN  = 0x04;
	mov	_TMR3CN,#0x04
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:124: for (i = 0; i < us; i++) {
	mov	r3,#0x00
L005004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L005007?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:125: while (!(TMR3CN & 0x80));
L005001?:
	mov	a,_TMR3CN
	jnb	acc.7,L005001?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:126: TMR3CN &= ~(0x80);
	anl	_TMR3CN,#0x7F
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:124: for (i = 0; i < us; i++) {
	inc	r3
	sjmp	L005004?
L005007?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:128: TMR3CN = 0;
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:132: void delay(unsigned int ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	mov	r2,dpl
	mov	r3,dph
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:134: for (j = 0; j < ms; j++) {
	mov	r4,#0x00
	mov	r5,#0x00
L006001?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L006005?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:135: delayUs(249);
	mov	dpl,#0xF9
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_delayUs
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:136: delayUs(249);
	mov	dpl,#0xF9
	lcall	_delayUs
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:137: delayUs(249);
	mov	dpl,#0xF9
	lcall	_delayUs
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:138: delayUs(250);
	mov	dpl,#0xFA
	lcall	_delayUs
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:134: for (j = 0; j < ms; j++) {
	inc	r4
	cjne	r4,#0x00,L006001?
	inc	r5
	sjmp	L006001?
L006005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_spi'
;------------------------------------------------------------
;value                     Allocated to registers r2 
;j                         Allocated to registers r3 
;temp                      Allocated to registers r4 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:144: void LED_spi(unsigned char value) {
;	-----------------------------------------
;	 function LED_spi
;	-----------------------------------------
_LED_spi:
	mov	r2,dpl
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:146: for (j = 1; j <= 8; j++) {
	mov	r3,#0x01
L007001?:
	mov	a,r3
	add	a,#0xff - 0x08
	jc	L007005?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:147: temp = value & 0x80;
	mov	a,#0x80
	anl	a,r2
	mov	r4,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:148: LED_DATA = (temp == 0x80) ? HIGH : LOW;
	cjne	r4,#0x80,L007011?
	setb	c
	sjmp	L007012?
L007011?:
	clr	c
L007012?:
	mov	_P2_4,c
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:151: LED_CLK = HIGH;
	setb	_P2_3
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:152: delayUs(20);
	mov	dpl,#0x14
	push	ar2
	push	ar3
	lcall	_delayUs
	pop	ar3
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:153: LED_CLK = LOW;
	clr	_P2_3
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:156: value = value << 1;
	mov	a,r2
	add	a,r2
	mov	r2,a
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:146: for (j = 1; j <= 8; j++) {
	inc	r3
	sjmp	L007001?
L007005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:160: void LED_pulse(void) {
;	-----------------------------------------
;	 function LED_pulse
;	-----------------------------------------
_LED_pulse:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:161: LED_CS = HIGH;
	setb	_P2_5
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:162: delay(1);
	mov	dptr,#0x0001
	lcall	_delay
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:163: LED_CS = LOW;
	clr	_P2_5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_clear'
;------------------------------------------------------------
;j                         Allocated to registers r2 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:167: void LED_clear(void) {
;	-----------------------------------------
;	 function LED_clear
;	-----------------------------------------
_LED_clear:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:169: for (j = 1; j <= 8; j++) {
	mov	r2,#0x01
L009001?:
	mov	a,r2
	add	a,#0xff - 0x08
	jc	L009005?
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:170: LED_spi(j);
	mov	dpl,r2
	push	ar2
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:171: LED_spi(0x00);
	mov	dpl,#0x00
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:172: LED_pulse();
	lcall	_LED_pulse
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:169: for (j = 1; j <= 8; j++) {
	inc	r2
	sjmp	L009001?
L009005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_setIntensity'
;------------------------------------------------------------
;intensity                 Allocated to registers r2 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:178: void LED_setIntensity(unsigned char intensity) {
;	-----------------------------------------
;	 function LED_setIntensity
;	-----------------------------------------
_LED_setIntensity:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:179: if (intensity > 0x0F) return;
	mov	a,dpl
	mov	r2,a
	add	a,#0xff - 0x0F
	jnc	L010002?
	ret
L010002?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:180: LED_spi(0x0A);
	mov	dpl,#0x0A
	push	ar2
	lcall	_LED_spi
	pop	ar2
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:181: LED_spi(intensity);
	mov	dpl,r2
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:182: LED_pulse();
	ljmp	_LED_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_init'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:186: void LED_init(void) {
;	-----------------------------------------
;	 function LED_init
;	-----------------------------------------
_LED_init:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:187: LED_CS = LOW;
	clr	_P2_5
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:190: LED_spi(0x09);
	mov	dpl,#0x09
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:192: LED_spi(0x00);
	mov	dpl,#0x00
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:193: LED_pulse();
	lcall	_LED_pulse
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:196: LED_spi(0x0A);
	mov	dpl,#0x0A
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:197: LED_spi(LED_INTENSITY);
	mov	dpl,#0x03
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:198: LED_pulse();
	lcall	_LED_pulse
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:201: LED_spi(0x0b);
	mov	dpl,#0x0B
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:202: LED_spi(0x07);
	mov	dpl,#0x07
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:203: LED_pulse();
	lcall	_LED_pulse
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:206: LED_clear();
	lcall	_LED_clear
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:209: LED_spi(0x0C);
	mov	dpl,#0x0C
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:210: LED_spi(0x01);
	mov	dpl,#0x01
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:211: LED_pulse();
	ljmp	_LED_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_write'
;------------------------------------------------------------
;value                     Allocated with name '_LED_write_PARM_2'
;address                   Allocated to registers r2 
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:215: void LED_write(unsigned char address, unsigned char value) {
;	-----------------------------------------
;	 function LED_write
;	-----------------------------------------
_LED_write:
	mov	r2,dpl
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:216: if ((address < 1) || (address > 8)) return;
	cjne	r2,#0x01,L012007?
L012007?:
	jc	L012001?
	mov	a,r2
	add	a,#0xff - 0x08
	jnc	L012002?
L012001?:
	ret
L012002?:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:217: LED_spi(address);
	mov	dpl,r2
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:218: LED_spi(value);
	mov	dpl,_LED_write_PARM_2
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:219: LED_pulse();
	ljmp	_LED_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_test'
;------------------------------------------------------------
;------------------------------------------------------------
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:223: void LED_test(void) {
;	-----------------------------------------
;	 function LED_test
;	-----------------------------------------
_LED_test:
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:224: LED_spi(0x0F);
	mov	dpl,#0x0F
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:225: LED_spi(0x01);
	mov	dpl,#0x01
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:226: LED_pulse();
	lcall	_LED_pulse
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:227: delay(1000);
	mov	dptr,#0x03E8
	lcall	_delay
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:228: LED_spi(0x0F);
	mov	dpl,#0x0F
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:229: LED_spi(0x00);
	mov	dpl,#0x00
	lcall	_LED_spi
;	F:\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:230: LED_pulse();
	ljmp	_LED_pulse
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 'LED TESTING'
	db 0x0A
	db 'Author:   Muchen He (44638154)'
	db 0x0A
	db 'File:     %s'
	db 0x0A
	db 'Comp'
	db 'iled: %s, %s'
	db 0x0A
	db '==================='
	db 0x0A
	db 0x00
__str_2:
	db 'F:'
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
	db 'LEDmatrix.c'
	db 0x00
__str_3:
	db 'Mar 11 2017'
	db 0x00
__str_4:
	db '02:21:58'
	db 0x00
__str_5:
	db 0x1B
	db '[s'
	db 0x00

	CSEG

end
