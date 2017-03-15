;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Tue Mar 14 23:09:02 2017
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
	public _IMAGES_LEN
	public _LED_setIntensity
	public _main
	public _LED_write_PARM_2
	public _LED_animate_PARM_3
	public _LED_animate_PARM_2
	public _IMAGES
	public _LED_display
	public _LED_animate
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
_IMAGES:
	ds 32
_LED_display_grid_1_56:
	ds 3
_LED_animate_PARM_2:
	ds 1
_LED_animate_PARM_3:
	ds 2
_LED_animate_grid_1_59:
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
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:10: unsigned char IMAGES[4][8] = {
	mov	_IMAGES,#0x7C
	mov	(_IMAGES + 0x0001),#0x32
	mov	(_IMAGES + 0x0002),#0x11
	mov	(_IMAGES + 0x0003),#0x81
	mov	(_IMAGES + 0x0004),#0x81
	mov	(_IMAGES + 0x0005),#0x88
	mov	(_IMAGES + 0x0006),#0x4C
	mov	(_IMAGES + 0x0007),#0x3E
	mov	(_IMAGES + 0x0008),#0x3C
	mov	(_IMAGES + 0x0009),#0x62
	mov	(_IMAGES + 0x000a),#0xF0
	mov	(_IMAGES + 0x000b),#0xC0
	mov	(_IMAGES + 0x000c),#0x03
	mov	(_IMAGES + 0x000d),#0x0F
	mov	(_IMAGES + 0x000e),#0x06
	mov	(_IMAGES + 0x000f),#0x3C
	mov	(_IMAGES + 0x0010),#0x38
	mov	(_IMAGES + 0x0011),#0x41
	mov	(_IMAGES + 0x0012),#0x83
	mov	(_IMAGES + 0x0013),#0x87
	mov	(_IMAGES + 0x0014),#0xE1
	mov	(_IMAGES + 0x0015),#0xC1
	mov	(_IMAGES + 0x0016),#0x82
	mov	(_IMAGES + 0x0017),#0x1C
	mov	(_IMAGES + 0x0018),#0x0C
	mov	(_IMAGES + 0x0019),#0x4E
	mov	(_IMAGES + 0x001a),#0x87
	mov	(_IMAGES + 0x001b),#0x85
	mov	(_IMAGES + 0x001c),#0xA1
	mov	(_IMAGES + 0x001d),#0xE1
	mov	(_IMAGES + 0x001e),#0x72
	mov	(_IMAGES + 0x001f),#0x30
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
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:18: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	using	0
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:20: printf("\x1b[2J");
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
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:27: );
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:26: __FILE__, __DATE__, __TIME__
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:25: "===================\n",
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
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:29: LED_init();
	lcall	_LED_init
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:30: printf("\x1b[s");
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
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:31: while (1) {
L002002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:32: LED_animate(IMAGES, 4, 30);
	mov	_LED_animate_PARM_2,#0x04
	mov	_LED_animate_PARM_3,#0x1E
	clr	a
	mov	(_LED_animate_PARM_3 + 1),a
	mov	dptr,#_IMAGES
	mov	b,#0x40
	lcall	_LED_animate
	sjmp	L002002?
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_display'
;------------------------------------------------------------
;grid                      Allocated with name '_LED_display_grid_1_56'
;i                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:36: void LED_display(unsigned char *grid) {
;	-----------------------------------------
;	 function LED_display
;	-----------------------------------------
_LED_display:
	mov	_LED_display_grid_1_56,dpl
	mov	(_LED_display_grid_1_56 + 1),dph
	mov	(_LED_display_grid_1_56 + 2),b
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:38: for (i = 1; i <= 8; i++) {
	mov	r5,#0x01
	mov	r6,#0x00
L003001?:
	clr	c
	mov	a,#0x08
	subb	a,r5
	clr	a
	subb	a,r6
	jc	L003005?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:39: LED_write(i, grid[i-1]);
	mov	a,r5
	mov	r7,a
	add	a,#0xff
	mov	r0,a
	mov	a,r6
	addc	a,#0xff
	mov	r1,a
	mov	a,r0
	add	a,_LED_display_grid_1_56
	mov	r0,a
	mov	a,r1
	addc	a,(_LED_display_grid_1_56 + 1)
	mov	r1,a
	mov	r2,(_LED_display_grid_1_56 + 2)
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
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:38: for (i = 1; i <= 8; i++) {
	inc	r5
	cjne	r5,#0x00,L003001?
	inc	r6
	sjmp	L003001?
L003005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_animate'
;------------------------------------------------------------
;frames                    Allocated with name '_LED_animate_PARM_2'
;fps                       Allocated with name '_LED_animate_PARM_3'
;grid                      Allocated with name '_LED_animate_grid_1_59'
;i                         Allocated to registers r7 r0 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:43: void LED_animate(unsigned char grid[][8], unsigned char frames, int fps) {
;	-----------------------------------------
;	 function LED_animate
;	-----------------------------------------
_LED_animate:
	mov	_LED_animate_grid_1_59,dpl
	mov	(_LED_animate_grid_1_59 + 1),dph
	mov	(_LED_animate_grid_1_59 + 2),b
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:45: for (i = 0; i < frames; i++) {
	mov	__divsint_PARM_2,_LED_animate_PARM_3
	mov	(__divsint_PARM_2 + 1),(_LED_animate_PARM_3 + 1)
	mov	dptr,#0x03E8
	lcall	__divsint
	mov	r5,dpl
	mov	r6,dph
	mov	r7,#0x00
	mov	r0,#0x00
L004001?:
	mov	r1,_LED_animate_PARM_2
	mov	r2,#0x00
	clr	c
	mov	a,r7
	subb	a,r1
	mov	a,r0
	subb	a,r2
	jnc	L004005?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:46: LED_display(grid[i]);
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
	add	a,_LED_animate_grid_1_59
	mov	r2,a
	mov	a,r3
	addc	a,(_LED_animate_grid_1_59 + 1)
	mov	r3,a
	mov	r4,(_LED_animate_grid_1_59 + 2)
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
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:47: delay(1000/fps);
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
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:45: for (i = 0; i < frames; i++) {
	inc	r7
	cjne	r7,#0x00,L004001?
	inc	r0
	sjmp	L004001?
L004005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:51: char _c51_external_startup(void) {
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:52: PCA0MD &= (~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:53: VDM0CN  = 0x80; // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:54: RSTSRC  = 0x02|0x04; // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:60: CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
	orl	_CLKSEL,#0x02
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:67: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:70: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:72: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x98
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:73: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:74: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:88: TL1   = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:89: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:90: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:91: TR1   = 1; // START Timer1
	setb	_TR1
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:92: TI    = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:95: P0MDOUT |= 0x01;  // set P0.0 and P0.4 as push-pull outputs
	orl	_P0MDOUT,#0x01
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:98: P2MDOUT &= 0x00;
	mov	a,_P2MDOUT
	mov	_P2MDOUT,#0x00
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:99: XBR0 = 0x01;      // Enable UART0 on P0.4(TX0) and P0.5(RX0)
	mov	_XBR0,#0x01
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:100: XBR1 = 0x40;      // enable crossbar
	mov	_XBR1,#0x40
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:102: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delayUs'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:106: void delayUs(unsigned char us) {
;	-----------------------------------------
;	 function delayUs
;	-----------------------------------------
_delayUs:
	mov	r2,dpl
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:108: CKCON  |= 0b_0100_0000;
	orl	_CKCON,#0x40
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:109: TMR3RL  = (-(SYSCLK)/1000000L);
	mov	_TMR3RL,#0xE8
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:110: TMR3    = TMR3RL;
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:111: TMR3CN  = 0x04;
	mov	_TMR3CN,#0x04
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:114: for (i = 0; i < us; i++) {
	mov	r3,#0x00
L006004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L006007?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:115: while (!(TMR3CN & 0x80));
L006001?:
	mov	a,_TMR3CN
	jnb	acc.7,L006001?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:116: TMR3CN &= ~(0x80);
	anl	_TMR3CN,#0x7F
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:114: for (i = 0; i < us; i++) {
	inc	r3
	sjmp	L006004?
L006007?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:118: TMR3CN = 0;
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:122: void delay(unsigned int ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:124: for (j = 0; j < ms; j++) {
	mov	r4,#0x00
	mov	r5,#0x00
L007001?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L007005?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:125: delayUs(249);
	mov	dpl,#0xF9
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_delayUs
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:126: delayUs(249);
	mov	dpl,#0xF9
	lcall	_delayUs
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:127: delayUs(249);
	mov	dpl,#0xF9
	lcall	_delayUs
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:128: delayUs(250);
	mov	dpl,#0xFA
	lcall	_delayUs
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:124: for (j = 0; j < ms; j++) {
	inc	r4
	cjne	r4,#0x00,L007001?
	inc	r5
	sjmp	L007001?
L007005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_spi'
;------------------------------------------------------------
;value                     Allocated to registers r2 
;j                         Allocated to registers r3 
;temp                      Allocated to registers r4 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:134: void LED_spi(unsigned char value) {
;	-----------------------------------------
;	 function LED_spi
;	-----------------------------------------
_LED_spi:
	mov	r2,dpl
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:136: for (j = 1; j <= 8; j++) {
	mov	r3,#0x01
L008001?:
	mov	a,r3
	add	a,#0xff - 0x08
	jc	L008005?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:137: temp = value & 0x80;
	mov	a,#0x80
	anl	a,r2
	mov	r4,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:138: LED_DATA = (temp == 0x80) ? HIGH : LOW;
	cjne	r4,#0x80,L008011?
	setb	c
	sjmp	L008012?
L008011?:
	clr	c
L008012?:
	mov	_P2_4,c
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:141: LED_CLK = HIGH;
	setb	_P2_3
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:142: delayUs(20);
	mov	dpl,#0x14
	push	ar2
	push	ar3
	lcall	_delayUs
	pop	ar3
	pop	ar2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:143: LED_CLK = LOW;
	clr	_P2_3
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:146: value = value << 1;
	mov	a,r2
	add	a,r2
	mov	r2,a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:136: for (j = 1; j <= 8; j++) {
	inc	r3
	sjmp	L008001?
L008005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:150: void LED_pulse(void) {
;	-----------------------------------------
;	 function LED_pulse
;	-----------------------------------------
_LED_pulse:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:151: LED_CS = HIGH;
	setb	_P2_5
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:152: delay(1);
	mov	dptr,#0x0001
	lcall	_delay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:153: LED_CS = LOW;
	clr	_P2_5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_clear'
;------------------------------------------------------------
;j                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:157: void LED_clear(void) {
;	-----------------------------------------
;	 function LED_clear
;	-----------------------------------------
_LED_clear:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:159: for (j = 1; j <= 8; j++) {
	mov	r2,#0x01
L010001?:
	mov	a,r2
	add	a,#0xff - 0x08
	jc	L010005?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:160: LED_spi(j);
	mov	dpl,r2
	push	ar2
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:161: LED_spi(0x00);
	mov	dpl,#0x00
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:162: LED_pulse();
	lcall	_LED_pulse
	pop	ar2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:159: for (j = 1; j <= 8; j++) {
	inc	r2
	sjmp	L010001?
L010005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_setIntensity'
;------------------------------------------------------------
;intensity                 Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:168: void LED_setIntensity(unsigned char intensity) {
;	-----------------------------------------
;	 function LED_setIntensity
;	-----------------------------------------
_LED_setIntensity:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:169: if (intensity > 0x0F) return;
	mov	a,dpl
	mov	r2,a
	add	a,#0xff - 0x0F
	jnc	L011002?
	ret
L011002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:170: LED_spi(0x0A);
	mov	dpl,#0x0A
	push	ar2
	lcall	_LED_spi
	pop	ar2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:171: LED_spi(intensity);
	mov	dpl,r2
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:172: LED_pulse();
	ljmp	_LED_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:176: void LED_init(void) {
;	-----------------------------------------
;	 function LED_init
;	-----------------------------------------
_LED_init:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:177: LED_CS = LOW;
	clr	_P2_5
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:180: LED_spi(0x09);
	mov	dpl,#0x09
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:182: LED_spi(0x00);
	mov	dpl,#0x00
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:183: LED_pulse();
	lcall	_LED_pulse
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:186: LED_spi(0x0A);
	mov	dpl,#0x0A
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:187: LED_spi(LED_INTENSITY);
	mov	dpl,#0x01
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:188: LED_pulse();
	lcall	_LED_pulse
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:191: LED_spi(0x0b);
	mov	dpl,#0x0B
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:192: LED_spi(0x07);
	mov	dpl,#0x07
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:193: LED_pulse();
	lcall	_LED_pulse
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:196: LED_clear();
	lcall	_LED_clear
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:199: LED_spi(0x0C);
	mov	dpl,#0x0C
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:200: LED_spi(0x01);
	mov	dpl,#0x01
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:201: LED_pulse();
	ljmp	_LED_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_write'
;------------------------------------------------------------
;value                     Allocated with name '_LED_write_PARM_2'
;address                   Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:205: void LED_write(unsigned char address, unsigned char value) {
;	-----------------------------------------
;	 function LED_write
;	-----------------------------------------
_LED_write:
	mov	r2,dpl
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:206: if ((address < 1) || (address > 8)) return;
	cjne	r2,#0x01,L013007?
L013007?:
	jc	L013001?
	mov	a,r2
	add	a,#0xff - 0x08
	jnc	L013002?
L013001?:
	ret
L013002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:207: LED_spi(address);
	mov	dpl,r2
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:208: LED_spi(value);
	mov	dpl,_LED_write_PARM_2
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:209: LED_pulse();
	ljmp	_LED_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'LED_test'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:213: void LED_test(void) {
;	-----------------------------------------
;	 function LED_test
;	-----------------------------------------
_LED_test:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:214: LED_spi(0x0F);
	mov	dpl,#0x0F
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:215: LED_spi(0x01);
	mov	dpl,#0x01
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:216: LED_pulse();
	lcall	_LED_pulse
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:217: delay(1000);
	mov	dptr,#0x03E8
	lcall	_delay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:218: LED_spi(0x0F);
	mov	dpl,#0x0F
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:219: LED_spi(0x00);
	mov	dpl,#0x00
	lcall	_LED_spi
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Lab 6\LEDmatrix.c:220: LED_pulse();
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
	db 'LE'
	db 'Dmatrix.c'
	db 0x00
__str_3:
	db 'Mar 14 2017'
	db 0x00
__str_4:
	db '23:09:02'
	db 0x00
__str_5:
	db 0x1B
	db '[s'
	db 0x00

	CSEG

end
