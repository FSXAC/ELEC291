;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Fri Jan 20 14:29:12 2017
;--------------------------------------------------------
$name melody51
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
	public _PlayNote_PARM_2
	public _main
	public _Saregama
	public _BeethovenPlay
	public _PinkPanther
	public _AdamsFamily
	public _Flintstones
	public _LooneyToons
	public _Melodyplay
	public _delay_ms
	public _EndNote
	public _PlayNote
	public _MelodyTempo
	public _T2ISR
	public _Melodyplay_PARM_2
	public _twentyFourN_us
	public _twentyFourN
	public _twelveN_us
	public _twelveN
	public _sixN_us
	public _sixN
	public _sixtyFourN_us
	public _sixtyFourN
	public _thirtyTwoN_us
	public _thirtyTwoN
	public _sixteenN_us
	public _sixteenN
	public _eighthN_us
	public _eighthN
	public _halfN_us
	public _halfN
	public _wholeN_us
	public _wholeN
	public _qtrN_us
	public _qtrN
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_P0             DATA 0x80
_P1             DATA 0x90
_P2             DATA 0xa0
_P3             DATA 0xb0
_P4             DATA 0xc0
_PMOD           DATA 0xc1
_PSW            DATA 0xd0
_ACC            DATA 0xe0
_B              DATA 0xf0
_SP             DATA 0x81
_DPL            DATA 0x82
_DPH            DATA 0x83
_DP0L           DATA 0x82
_DP0H           DATA 0x83
_DP1L           DATA 0x84
_DP1H           DATA 0x85
_AUXR           DATA 0x8e
_AUXR1          DATA 0xa2
_DPCF           DATA 0xa2
_TCON           DATA 0x88
_TMOD           DATA 0x89
_T2CON          DATA 0xc8
_T2MOD          DATA 0xc9
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TL2            DATA 0xcc
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TH2            DATA 0xcd
_TCONB          DATA 0x91
_RCAP2L         DATA 0xca
_RCAP2H         DATA 0xcb
_WDTRST         DATA 0xa6
_WDTCON         DATA 0xa7
_SCON           DATA 0x98
_SBUF           DATA 0x99
_SADEN          DATA 0xb9
_SADDR          DATA 0xa9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xb7
_PCON           DATA 0x87
_CLKREG         DATA 0x8f
_MEMCON         DATA 0x96
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_P0_7           BIT 0x87
_P0_6           BIT 0x86
_P0_5           BIT 0x85
_P0_4           BIT 0x84
_P0_3           BIT 0x83
_P0_2           BIT 0x82
_P0_1           BIT 0x81
_P0_0           BIT 0x80
_P1_7           BIT 0x97
_P1_6           BIT 0x96
_P1_5           BIT 0x95
_P1_4           BIT 0x94
_P1_3           BIT 0x93
_P1_2           BIT 0x92
_P1_1           BIT 0x91
_P1_0           BIT 0x90
_SCK            BIT 0x97
_MISO           BIT 0x96
_MOSI           BIT 0x95
_T2EX           BIT 0x91
_T2             BIT 0x90
_P2_7           BIT 0xa7
_P2_6           BIT 0xa6
_P2_5           BIT 0xa5
_P2_4           BIT 0xa4
_P2_3           BIT 0xa3
_P2_2           BIT 0xa2
_P2_1           BIT 0xa1
_P2_0           BIT 0xa0
_P3_7           BIT 0xb7
_P3_6           BIT 0xb6
_P3_5           BIT 0xb5
_P3_4           BIT 0xb4
_P3_3           BIT 0xb3
_P3_2           BIT 0xb2
_P3_1           BIT 0xb1
_P3_0           BIT 0xb0
_RD             BIT 0xb7
_WR             BIT 0xb6
_T1             BIT 0xb5
_T0             BIT 0xb4
_INT1           BIT 0xb3
_INT0           BIT 0xb2
_TXD            BIT 0xb1
_RXD            BIT 0xb0
_P4_7           BIT 0xc7
_P4_6           BIT 0xc6
_P4_5           BIT 0xc5
_P4_4           BIT 0xc4
_XTAL2          BIT 0xc7
_XTAL1          BIT 0xc6
_PSEN           BIT 0xc5
_ALE            BIT 0xc4
_CY             BIT 0xd7
_AC             BIT 0xd6
_F0             BIT 0xd5
_RS1            BIT 0xd4
_RS0            BIT 0xd3
_OV             BIT 0xd2
_UD             BIT 0xd1
_P              BIT 0xd0
_ACC_7          BIT 0xe7
_ACC_6          BIT 0xe6
_ACC_5          BIT 0xe5
_ACC_4          BIT 0xe4
_ACC_3          BIT 0xe3
_ACC_2          BIT 0xe2
_ACC_1          BIT 0xe1
_ACC_0          BIT 0xe0
_B_7            BIT 0xf7
_B_6            BIT 0xf6
_B_5            BIT 0xf5
_B_4            BIT 0xf4
_B_3            BIT 0xf3
_B_2            BIT 0xf2
_B_1            BIT 0xf1
_B_0            BIT 0xf0
_TF1            BIT 0x8f
_TR1            BIT 0x8e
_TF0            BIT 0x8d
_TR0            BIT 0x8c
_IE1            BIT 0x8b
_IT1            BIT 0x8a
_IE0            BIT 0x89
_IT0            BIT 0x88
_TF2            BIT 0xcf
_EXF2           BIT 0xce
_RCLK           BIT 0xcd
_TCLK           BIT 0xcc
_EXEN2          BIT 0xcb
_TR2            BIT 0xca
_C_T2           BIT 0xc9
_CP_RL2         BIT 0xc8
_SM0            BIT 0x9f
_FE             BIT 0x9f
_SM1            BIT 0x9e
_SM2            BIT 0x9d
_REN            BIT 0x9c
_TB8            BIT 0x9b
_RB8            BIT 0x9a
_TI             BIT 0x99
_RI             BIT 0x98
_EA             BIT 0xaf
_ET2            BIT 0xad
_ES             BIT 0xac
_ET1            BIT 0xab
_EX1            BIT 0xaa
_ET0            BIT 0xa9
_EX0            BIT 0xa8
_PT2            BIT 0xbd
_PS             BIT 0xbc
_PT1            BIT 0xbb
_PX1            BIT 0xba
_PT0            BIT 0xb9
_PX0            BIT 0xb8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_qtrN:
	ds 2
_qtrN_us:
	ds 2
_wholeN:
	ds 2
_wholeN_us:
	ds 2
_halfN:
	ds 2
_halfN_us:
	ds 2
_eighthN:
	ds 2
_eighthN_us:
	ds 2
_sixteenN:
	ds 2
_sixteenN_us:
	ds 2
_thirtyTwoN:
	ds 2
_thirtyTwoN_us:
	ds 2
_sixtyFourN:
	ds 2
_sixtyFourN_us:
	ds 2
_sixN:
	ds 2
_sixN_us:
	ds 2
_twelveN:
	ds 2
_twelveN_us:
	ds 2
_twentyFourN:
	ds 2
_twentyFourN_us:
	ds 2
_Melodyplay_PARM_2:
	ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
_PlayNote_PARM_2:
	ds 1
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
	CSEG at 0x002b
	ljmp	_T2ISR
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
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'T2ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:41: void T2ISR(void) interrupt 5 {
;	-----------------------------------------
;	 function T2ISR
;	-----------------------------------------
_T2ISR:
	using	0
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:42: MelodyPin = ~MelodyPin;
	setb	_P3_7
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:43: TF2 = 0;
	clr	_TF2
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'MelodyTempo'
;------------------------------------------------------------
;Tempo                     Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:46: void MelodyTempo(int Tempo){
;	-----------------------------------------
;	 function MelodyTempo
;	-----------------------------------------
_MelodyTempo:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:47: qtrN = ((60000/Tempo));
	mov	__divslong_PARM_2,r2
	mov	a,r3
	mov	(__divslong_PARM_2 + 1),a
	rlc	a
	subb	a,acc
	mov	(__divslong_PARM_2 + 2),a
	mov	(__divslong_PARM_2 + 3),a
	mov	dptr,#0xEA60
	clr	a
	mov	b,a
	lcall	__divslong
	mov	r2,dpl
	mov	r3,dph
	mov	_qtrN,r2
	mov	(_qtrN + 1),r3
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:48: wholeN = qtrN*4;
	mov	_wholeN,_qtrN
	mov	a,(_qtrN + 1)
	xch	a,_wholeN
	add	a,acc
	xch	a,_wholeN
	rlc	a
	xch	a,_wholeN
	add	a,acc
	xch	a,_wholeN
	rlc	a
	mov	(_wholeN + 1),a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:49: halfN = (qtrN*2);
	mov	_halfN,_qtrN
	mov	a,(_qtrN + 1)
	xch	a,_halfN
	add	a,acc
	xch	a,_halfN
	rlc	a
	mov	(_halfN + 1),a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:50: eighthN = (qtrN/2);
	mov	_eighthN,_qtrN
	mov	a,(_qtrN + 1)
	clr	c
	rrc	a
	xch	a,_eighthN
	rrc	a
	xch	a,_eighthN
	mov	(_eighthN + 1),a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:51: sixteenN = (qtrN/4);
	mov	_sixteenN,_qtrN
	mov	a,(_qtrN + 1)
	clr	c
	rrc	a
	xch	a,_sixteenN
	rrc	a
	xch	a,_sixteenN
	clr	c
	rrc	a
	xch	a,_sixteenN
	rrc	a
	xch	a,_sixteenN
	mov	(_sixteenN + 1),a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:52: thirtyTwoN = (qtrN/8);
	mov	_thirtyTwoN,_qtrN
	mov	a,(_qtrN + 1)
	swap	a
	rl	a
	xch	a,_thirtyTwoN
	swap	a
	rl	a
	anl	a,#0x1f
	xrl	a,_thirtyTwoN
	xch	a,_thirtyTwoN
	anl	a,#0x1f
	xch	a,_thirtyTwoN
	xrl	a,_thirtyTwoN
	xch	a,_thirtyTwoN
	mov	(_thirtyTwoN + 1),a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:53: sixtyFourN = (qtrN/16);
	mov	_sixtyFourN,_qtrN
	mov	a,(_qtrN + 1)
	swap	a
	xch	a,_sixtyFourN
	swap	a
	anl	a,#0x0f
	xrl	a,_sixtyFourN
	xch	a,_sixtyFourN
	anl	a,#0x0f
	xch	a,_sixtyFourN
	xrl	a,_sixtyFourN
	xch	a,_sixtyFourN
	mov	(_sixtyFourN + 1),a
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:54: sixN = (wholeN/6);
	mov	__divuint_PARM_2,#0x06
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	mov	dpl,_wholeN
	mov	dph,(_wholeN + 1)
	lcall	__divuint
	mov	_sixN,dpl
	mov	(_sixN + 1),dph
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:55: twelveN = (wholeN/12);
	mov	__divuint_PARM_2,#0x0C
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	mov	dpl,_wholeN
	mov	dph,(_wholeN + 1)
	lcall	__divuint
	mov	_twelveN,dpl
	mov	(_twelveN + 1),dph
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:56: twentyFourN = (wholeN/24);
	mov	__divuint_PARM_2,#0x18
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	mov	dpl,_wholeN
	mov	dph,(_wholeN + 1)
	lcall	__divuint
	mov	_twentyFourN,dpl
	mov	(_twentyFourN + 1),dph
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PlayNote'
;------------------------------------------------------------
;PitchL                    Allocated with name '_PlayNote_PARM_2'
;PitchH                    Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:59: void PlayNote(const unsigned char PitchH, const unsigned char PitchL){
;	-----------------------------------------
;	 function PlayNote
;	-----------------------------------------
_PlayNote:
	mov	r2,dpl
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:60: RCAP2H = PitchH;
	mov	_RCAP2H,r2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:61: RCAP2L = PitchL;
	mov	_RCAP2L,_PlayNote_PARM_2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:62: TH2 = PitchH;
	mov	_TH2,r2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:63: TL2 = PitchL;
	mov	_TL2,_PlayNote_PARM_2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:64: TF2 = 0;
	clr	_TF2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:65: TR2 = 1;
	setb	_TR2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:66: ET2 = 1;
	setb	_ET2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:67: EA = 1;
	setb	_EA
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'EndNote'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:70: void EndNote(void){
;	-----------------------------------------
;	 function EndNote
;	-----------------------------------------
_EndNote:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:71: EA = 0;
	clr	_EA
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:72: TR2 = 0;
	clr	_TR2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:73: TF2 = 0;
	clr	_TF2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:74: MelodyPin = 1;
	setb	_P3_7
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay_ms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:77: void delay_ms(unsigned int ms){
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	mov	r2,dpl
	mov	r3,dph
L006001?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:78: for(;ms>0;ms--)
	mov	a,r2
	orl	a,r3
	jz	L006007?
	mov	r4,#0x01
	sjmp	L006008?
L006007?:
	mov	r4,#0x00
L006008?:
	mov	a,r4
	jz	L006005?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:79: Delay10MC(100);
	mov	dpl,#0x64
	push	ar2
	push	ar3
	lcall	_Delay10MC
	pop	ar3
	pop	ar2
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:78: for(;ms>0;ms--)
	dec	r2
	cjne	r2,#0xff,L006015?
	dec	r3
L006015?:
	sjmp	L006001?
L006005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Melodyplay'
;------------------------------------------------------------
;interval                  Allocated with name '_Melodyplay_PARM_2'
;Pitch                     Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:82: void Melodyplay(const int Pitch, unsigned int interval){
;	-----------------------------------------
;	 function Melodyplay
;	-----------------------------------------
_Melodyplay:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:83: if(Pitch!=0)
	mov	a,r2
	orl	a,r3
	jz	L007002?
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:84: PlayNote(Pitch >> 8, Pitch);
	mov	dpl,r3
	mov	_PlayNote_PARM_2,r2
	lcall	_PlayNote
L007002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:85: delay_ms(interval);
	mov	dpl,_Melodyplay_PARM_2
	mov	dph,(_Melodyplay_PARM_2 + 1)
	lcall	_delay_ms
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:86: EndNote();
	ljmp	_EndNote
;------------------------------------------------------------
;Allocation info for local variables in function 'LooneyToons'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:89: void LooneyToons(){ //d=4,o=5,b=140
;	-----------------------------------------
;	 function LooneyToons
;	-----------------------------------------
_LooneyToons:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:90: MelodyTempo(140);
	mov	dptr,#0x008C
	lcall	_MelodyTempo
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:91: Melodyplay(pitch_C6, qtrN); //c6
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:92: Melodyplay(pitch_F6, eighthN); //8f6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE9A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:93: Melodyplay(pitch_E6, eighthN); //8e6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE85
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:94: Melodyplay(pitch_D6, eighthN); //8d6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE56
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:95: Melodyplay(pitch_C6, eighthN); //8c6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:96: Melodyplay(pitch_A5, qtrN); //a.
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFDC8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:97: Melodyplay(pitch_A5, eighthN); //a.
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFDC8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:98: Melodyplay(pitch_C6, eighthN); //8c6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:99: Melodyplay(pitch_F6, eighthN); //8f6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE9A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:100: Melodyplay(pitch_E6, eighthN); //8e6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE85
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:101: Melodyplay(pitch_D6, eighthN); //8d6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE56
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:102: Melodyplay(pitch_Eb6, eighthN); //8d#6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE6E
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:103: Melodyplay(pitch_E6, qtrN); //e.6
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE85
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:104: Melodyplay(pitch_E6, eighthN); //e.6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE85
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:105: Melodyplay(pitch_E6, eighthN); //8e6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE85
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:106: Melodyplay(pitch_E6, eighthN); //8e6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE85
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:107: Melodyplay(pitch_C6, eighthN); //8c6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:108: Melodyplay(pitch_D6, eighthN); //8d6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE56
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:109: Melodyplay(pitch_C6, eighthN); //8c6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:110: Melodyplay(pitch_E6, eighthN); //8e6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE85
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:111: Melodyplay(pitch_C6, eighthN); //8c6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:112: Melodyplay(pitch_D6, eighthN); //8d6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE56
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:113: Melodyplay(pitch_C6, eighthN); //8c6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:114: Melodyplay(pitch_A5, eighthN); //8a
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFDC8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:115: Melodyplay(pitch_C6, eighthN); //8c6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:116: Melodyplay(pitch_G5, eighthN); //8g
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD82
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:117: Melodyplay(pitch_Bb5, eighthN); //8a#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFDE8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:118: Melodyplay(pitch_A5, eighthN); //8a
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFDC8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:119: Melodyplay(pitch_F5, eighthN); //8f
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD34
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:120: Melodyplay(pitch_P, wholeN); //1P
	mov	_Melodyplay_PARM_2,_wholeN
	mov	(_Melodyplay_PARM_2 + 1),(_wholeN + 1)
	mov	dptr,#0x0000
	ljmp	_Melodyplay
;------------------------------------------------------------
;Allocation info for local variables in function 'Flintstones'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:123: void Flintstones(){//d=4,o=5,b=200
;	-----------------------------------------
;	 function Flintstones
;	-----------------------------------------
_Flintstones:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:124: MelodyTempo(200);
	mov	dptr,#0x00C8
	lcall	_MelodyTempo
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:125: Melodyplay(pitch_Ab5, qtrN); //g#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFDA6
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:126: Melodyplay(pitch_Db5, qtrN); //c#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFC7A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:127: Melodyplay(pitch_P, eighthN); //8p
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:128: Melodyplay(pitch_Db6, qtrN); //c#6
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE3D
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:129: Melodyplay(pitch_Bb5, eighthN); //8a#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFDE8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:130: Melodyplay(pitch_Ab5, qtrN); //g#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFDA6
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:131: Melodyplay(pitch_Db5, qtrN); //c#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFC7A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:132: Melodyplay(pitch_P, eighthN); //8p
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:133: Melodyplay(pitch_Ab5, qtrN); //g#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFDA6
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:134: Melodyplay(pitch_Gb5, eighthN); //8f#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD5C
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:135: Melodyplay(pitch_F5, eighthN); //8f
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD34
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:136: Melodyplay(pitch_F5, eighthN); //8f
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD34
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:137: Melodyplay(pitch_Gb5, eighthN); //8f#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD5C
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:138: Melodyplay(pitch_Ab5, eighthN); //8g#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFDA6
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:139: Melodyplay(pitch_Db5, qtrN); //c#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFC7A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:140: Melodyplay(pitch_Eb5, qtrN); //d#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFCDC
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:141: Melodyplay(pitch_F5, halfN); //2f
	mov	_Melodyplay_PARM_2,_halfN
	mov	(_Melodyplay_PARM_2 + 1),(_halfN + 1)
	mov	dptr,#0xFD34
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:142: Melodyplay(pitch_P, halfN); //2p
	mov	_Melodyplay_PARM_2,_halfN
	mov	(_Melodyplay_PARM_2 + 1),(_halfN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:143: Melodyplay(pitch_Ab5, qtrN); //g#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFDA6
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:144: Melodyplay(pitch_Db5, qtrN); //c#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFC7A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:145: Melodyplay(pitch_P, eighthN); //8p
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:146: Melodyplay(pitch_Db6, qtrN); //c#6
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE3D
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:147: Melodyplay(pitch_Bb5, eighthN); //8a#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFDE8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:148: Melodyplay(pitch_Ab5, qtrN); //g#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFDA6
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:149: Melodyplay(pitch_Db5, qtrN); //c#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFC7A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:150: Melodyplay(pitch_P, eighthN); //8p
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:151: Melodyplay(pitch_Ab5, qtrN); //g#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFDA6
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:152: Melodyplay(pitch_Gb5, eighthN); //8f#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD5C
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:153: Melodyplay(pitch_F5, eighthN); //8f
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD34
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:154: Melodyplay(pitch_F5, eighthN); //8f
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD34
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:155: Melodyplay(pitch_Gb5, eighthN); //8f#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD5C
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:156: Melodyplay(pitch_Ab5, eighthN); //8g#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFDA6
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:157: Melodyplay(pitch_Db5, qtrN); //c#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFC7A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:158: Melodyplay(pitch_Eb5, qtrN); //d#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFCDC
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:159: Melodyplay(pitch_Db5, halfN); //2c#
	mov	_Melodyplay_PARM_2,_halfN
	mov	(_Melodyplay_PARM_2 + 1),(_halfN + 1)
	mov	dptr,#0xFC7A
	ljmp	_Melodyplay
;------------------------------------------------------------
;Allocation info for local variables in function 'AdamsFamily'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:162: void AdamsFamily(){ //d=4, o=6, b=50
;	-----------------------------------------
;	 function AdamsFamily
;	-----------------------------------------
_AdamsFamily:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:163: MelodyTempo(50);
	mov	dptr,#0x0032
	lcall	_MelodyTempo
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:164: Melodyplay(pitch_P, thirtyTwoN); //32P
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:165: Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE3D
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:166: Melodyplay(pitch_Gb6, sixteenN); //16f#
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFEAE
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:167: Melodyplay(pitch_Bb6, thirtyTwoN); //32a#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFEF4
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:168: Melodyplay(pitch_Gb6, sixteenN); //16f#
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFEAE
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:169: Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE3D
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:170: Melodyplay(pitch_C6, sixteenN); //16c
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:171: Melodyplay(pitch_Ab6, eighthN); //8g#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFED3
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:172: Melodyplay(pitch_Gb6, thirtyTwoN); //32f#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFEAE
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:173: Melodyplay(pitch_F6, sixteenN); //16f
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFE9A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:174: Melodyplay(pitch_Ab6, thirtyTwoN); //32g#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFED3
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:175: Melodyplay(pitch_F6, sixteenN); //16f
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFE9A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:176: Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE3D
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:177: Melodyplay(pitch_Bb5, sixteenN); //16a#5
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFDE8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:178: Melodyplay(pitch_Gb6, eighthN); //8f#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFEAE
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:179: Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE3D
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:180: Melodyplay(pitch_Gb6, sixteenN); //16f#
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFEAE
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:181: Melodyplay(pitch_Bb6, thirtyTwoN); //32a#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFEF4
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:182: Melodyplay(pitch_Gb6, sixteenN); //16f#
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFEAE
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:183: Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE3D
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:184: Melodyplay(pitch_C6, sixteenN); //16c
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:185: Melodyplay(pitch_Ab6, eighthN); //8g#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFED3
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:186: Melodyplay(pitch_Gb6, thirtyTwoN); //32f#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFEAE
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:187: Melodyplay(pitch_F6, sixteenN); //16f
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFE9A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:188: Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE3D
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:189: Melodyplay(pitch_Eb6, sixteenN); //16d#
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFE6E
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:190: Melodyplay(pitch_F6, thirtyTwoN); //32f
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE9A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:191: Melodyplay(pitch_Gb6, qtrN); //f#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFEAE
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:192: Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE3D
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:193: Melodyplay(pitch_Eb6, thirtyTwoN); //32d#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE6E
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:194: Melodyplay(pitch_F6, thirtyTwoN); //32f
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE9A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:195: Melodyplay(pitch_Gb6, qtrN); //f#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFEAE
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:196: Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE3D
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:197: Melodyplay(pitch_Eb6, thirtyTwoN); //32d#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE6E
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:198: Melodyplay(pitch_G6, thirtyTwoN); //32g
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFEC1
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:199: Melodyplay(pitch_Ab6, qtrN); //g#
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFED3
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:200: Melodyplay(pitch_Eb6, thirtyTwoN); //32d#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE6E
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:201: Melodyplay(pitch_F6, thirtyTwoN); //32f
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE9A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:202: Melodyplay(pitch_G6, thirtyTwoN); //32g
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFEC1
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:203: Melodyplay(pitch_Ab6, sixteenN); //16g#.
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFED3
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:204: Melodyplay(pitch_Ab6, eighthN); //16g#.
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFED3
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:205: Melodyplay(pitch_Eb6, thirtyTwoN); //32d#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE6E
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:206: Melodyplay(pitch_F6, thirtyTwoN); //32f
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE9A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:207: Melodyplay(pitch_G6, thirtyTwoN); //32g
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFEC1
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:208: Melodyplay(pitch_Ab6, sixteenN); //16g#.
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFED3
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:209: Melodyplay(pitch_Ab6, eighthN); //16g#.
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFED3
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:210: Melodyplay(pitch_Db6, thirtyTwoN); //32c#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE3D
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:211: Melodyplay(pitch_Eb6, thirtyTwoN); //32d#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE6E
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:212: Melodyplay(pitch_F6, thirtyTwoN); //32f
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFE9A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:213: Melodyplay(pitch_Gb6, thirtyTwoN); //32f#
	mov	_Melodyplay_PARM_2,_thirtyTwoN
	mov	(_Melodyplay_PARM_2 + 1),(_thirtyTwoN + 1)
	mov	dptr,#0xFEAE
	ljmp	_Melodyplay
;------------------------------------------------------------
;Allocation info for local variables in function 'PinkPanther'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:216: void PinkPanther(){//d=4,o=5,b=160
;	-----------------------------------------
;	 function PinkPanther
;	-----------------------------------------
_PinkPanther:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:217: MelodyTempo(160);
	mov	dptr,#0x00A0
	lcall	_MelodyTempo
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:218: Melodyplay(pitch_Eb5, eighthN); //8d#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFCDC
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:219: Melodyplay(pitch_E5, eighthN); //8e
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD0A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:220: Melodyplay(pitch_P, halfN); //2p
	mov	_Melodyplay_PARM_2,_halfN
	mov	(_Melodyplay_PARM_2 + 1),(_halfN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:221: Melodyplay(pitch_Gb5, eighthN); //8f#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD5C
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:222: Melodyplay(pitch_G5, eighthN); //8g
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD82
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:223: Melodyplay(pitch_P, halfN); //2p
	mov	_Melodyplay_PARM_2,_halfN
	mov	(_Melodyplay_PARM_2 + 1),(_halfN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:224: Melodyplay(pitch_Eb5, eighthN); //8d#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFCDC
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:225: Melodyplay(pitch_E5, eighthN); //8e
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD0A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:226: Melodyplay(pitch_P, sixteenN); //16p
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:227: Melodyplay(pitch_Gb5, eighthN); //8f#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD5C
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:228: Melodyplay(pitch_G5, eighthN); //8g
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD82
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:229: Melodyplay(pitch_P, sixteenN); //16p
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:230: Melodyplay(pitch_C6, eighthN); //8c6
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:231: Melodyplay(pitch_B5, eighthN); //8b
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE06
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:232: Melodyplay(pitch_P, sixteenN); //16p
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:233: Melodyplay(pitch_Eb5, eighthN); //8d#
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFCDC
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:234: Melodyplay(pitch_E5, eighthN); //8e
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFD0A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:235: Melodyplay(pitch_P, sixteenN); //16p
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:236: Melodyplay(pitch_B5, eighthN); //8b
	mov	_Melodyplay_PARM_2,_eighthN
	mov	(_Melodyplay_PARM_2 + 1),(_eighthN + 1)
	mov	dptr,#0xFE06
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:237: Melodyplay(pitch_Bb5, halfN); //2a#
	mov	_Melodyplay_PARM_2,_halfN
	mov	(_Melodyplay_PARM_2 + 1),(_halfN + 1)
	mov	dptr,#0xFDE8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:238: Melodyplay(pitch_P, halfN); //2p
	mov	_Melodyplay_PARM_2,_halfN
	mov	(_Melodyplay_PARM_2 + 1),(_halfN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:239: Melodyplay(pitch_A5, sixteenN); //16a
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFDC8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:240: Melodyplay(pitch_G5, sixteenN); //16g
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFD82
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:241: Melodyplay(pitch_E5, sixteenN); //16e
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFD0A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:242: Melodyplay(pitch_D5, sixteenN); //16d
	mov	_Melodyplay_PARM_2,_sixteenN
	mov	(_Melodyplay_PARM_2 + 1),(_sixteenN + 1)
	mov	dptr,#0xFCAD
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:243: Melodyplay(pitch_E5, halfN); //2e
	mov	_Melodyplay_PARM_2,_halfN
	mov	(_Melodyplay_PARM_2 + 1),(_halfN + 1)
	mov	dptr,#0xFD0A
	ljmp	_Melodyplay
;------------------------------------------------------------
;Allocation info for local variables in function 'BeethovenPlay'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:246: void BeethovenPlay(){
;	-----------------------------------------
;	 function BeethovenPlay
;	-----------------------------------------
_BeethovenPlay:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:247: MelodyTempo(240);
	mov	dptr,#0x00F0
	lcall	_MelodyTempo
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:248: Melodyplay(pitch_E6, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE85
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:249: Melodyplay(pitch_Eb6, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE6E
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:250: Melodyplay(pitch_E6, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE85
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:251: Melodyplay(pitch_Eb6, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE6E
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:252: Melodyplay(pitch_E6, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE85
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:253: Melodyplay(pitch_B5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE06
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:254: Melodyplay(pitch_D6, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE56
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:255: Melodyplay(pitch_C6, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:256: Melodyplay(pitch_A5, halfN);
	mov	_Melodyplay_PARM_2,_halfN
	mov	(_Melodyplay_PARM_2 + 1),(_halfN + 1)
	mov	dptr,#0xFDC8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:257: Melodyplay(pitch_C5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFC44
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:258: Melodyplay(pitch_E6, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE85
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:259: Melodyplay(pitch_A6, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFEE4
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:260: Melodyplay(pitch_B6, halfN);
	mov	_Melodyplay_PARM_2,_halfN
	mov	(_Melodyplay_PARM_2 + 1),(_halfN + 1)
	mov	dptr,#0xFF03
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:262: Melodyplay(pitch_E5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFD0A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:263: Melodyplay(pitch_A5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFDC8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:264: Melodyplay(pitch_B5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE06
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:265: Melodyplay(pitch_C6, halfN);
	mov	_Melodyplay_PARM_2,_halfN
	mov	(_Melodyplay_PARM_2 + 1),(_halfN + 1)
	mov	dptr,#0xFE22
	ljmp	_Melodyplay
;------------------------------------------------------------
;Allocation info for local variables in function 'Saregama'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:268: void Saregama(){
;	-----------------------------------------
;	 function Saregama
;	-----------------------------------------
_Saregama:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:269: MelodyTempo(240);
	mov	dptr,#0x00F0
	lcall	_MelodyTempo
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:270: Melodyplay(pitch_Db5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFC7A
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:271: Melodyplay(pitch_Eb5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFCDC
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:272: Melodyplay(pitch_F5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFD34
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:273: Melodyplay(pitch_Gb5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFD5C
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:274: Melodyplay(pitch_Ab5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFDA6
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:275: Melodyplay(pitch_Bb5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFDE8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:276: Melodyplay(pitch_C6, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:277: Melodyplay(pitch_Db6, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE3D
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:278: Melodyplay(pitch_P, wholeN);
	mov	_Melodyplay_PARM_2,_wholeN
	mov	(_Melodyplay_PARM_2 + 1),(_wholeN + 1)
	mov	dptr,#0x0000
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:279: Melodyplay(pitch_Db6, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE3D
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:280: Melodyplay(pitch_C6, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFE22
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:281: Melodyplay(pitch_Bb5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFDE8
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:282: Melodyplay(pitch_Ab5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFDA6
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:283: Melodyplay(pitch_Gb5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFD5C
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:284: Melodyplay(pitch_F5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFD34
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:285: Melodyplay(pitch_Eb5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFCDC
	lcall	_Melodyplay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:286: Melodyplay(pitch_Db5, qtrN);
	mov	_Melodyplay_PARM_2,_qtrN
	mov	(_Melodyplay_PARM_2 + 1),(_qtrN + 1)
	mov	dptr,#0xFC7A
	ljmp	_Melodyplay
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:289: void main(){
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:290: while(1){
L014002?:
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:291: AdamsFamily();
	lcall	_AdamsFamily
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:292: delay_ms(1000);
	mov	dptr,#0x03E8
	lcall	_delay_ms
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:293: LooneyToons();
	lcall	_LooneyToons
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:294: delay_ms(1000);
	mov	dptr,#0x03E8
	lcall	_delay_ms
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:295: Flintstones();
	lcall	_Flintstones
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:296: delay_ms(1000);
	mov	dptr,#0x03E8
	lcall	_delay_ms
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:297: PinkPanther();
	lcall	_PinkPanther
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:298: delay_ms(1000);
	mov	dptr,#0x03E8
	lcall	_delay_ms
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:299: BeethovenPlay();
	lcall	_BeethovenPlay
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:300: delay_ms(1000);
	mov	dptr,#0x03E8
	lcall	_delay_ms
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:301: Saregama();
	lcall	_Saregama
;	C:\Users\mansu\OneDrive\Documents\2017 UBC\ELEC 291\Tone\melody51.c:302: delay_ms(1000);
	mov	dptr,#0x03E8
	lcall	_delay_ms
	sjmp	L014002?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST

	CSEG

end
