

	area  madata, data
tot	dcd	0
GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register	
	
	area  moncode, code
	export 	timer_callback
	include etat.inc

timer_callback proc
	
	ldr r10,=tot
	LDRSB R9,[r10]
	MVN r9,r9
	STRB r9,[r10]
	
	
		
	CMP r9,#0
	BEQ on

	; mise a 1 de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00000002
	str	r1, [r3]
	B out
on
		; mise a zero de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00020000
	str	r1, [r3]

; N.B. le registre BSRR est write-only, on ne peut pas le relire	
out 	BX lr
	endp
	end

	


