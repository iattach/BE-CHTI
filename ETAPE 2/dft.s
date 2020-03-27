	thumb

	area  madata, data, readwrite
	
	export Mk
		
	area  moncode, code, readonly
	import TabSin
	import TabCos

N 	equ 64				;N = 64

Mk	proc
	push	{lr}			;empiler lr

	ldr	r2,=TabCos		;r2=cos 
	
	push	{r9}
	mov	r9,r0			;r9=r0 r0 =>l'adresse du table signal
	bl	Sigma			;sauter dans le calcul de la partie réel
					;r12 resultat partie reel
	push	{r7-r8}
	smull	r7,r8,r12,r12		;32 bit high =>r8 ; 32 bit low=>r7 
					
	
	mov	r0,r9			;r0=r9 r0 =>l'adresse du table signal
	ldr	r2,=TabSin		;r2=sin
	bl	Sigma			;sauter dans le calcul de la partie réel
					;r12 resultat partie reel

	smlal	r7,r8,r12,r12		;32 bit high +r8=>r8 ; 32 bit low+r7=>r7
	
	mov	r0,r8			;r0=>r8	32bit*32bit=64bit on garde seulement le high pour le 32bit

	pop	{r7-r9}
	pop	{lr}			;dépiler lr
	bx	lr
	
	endp

Sigma 	proc

	mov 	r3,#0			;affecter r3 avec 0 => i
	mov 	r12,#0			;affecter r12 avec 0
Debut
	;la boucle commence 
	cmp	r3,#N			;comparaison r3 et N 64 => r3<=N
	beq	Fin			;si r3==N sauter dans la fin , on finit le boucle

	;partie sinon

	push	{r4}			;empiler/utiliser r4
	ldrsh 	r4,[r0,r3,lsl #1]	;r4=r0+r3*2^1 (lsl #1=decalage à gauche =2^#1=10(binaire))
					;r0 =>	l'adresse de base du signal

	push	{r5}			;empiler/utiliser r6
	mul	r5,r3,r1		;r6=r3*r1 =>k*i
					;r1 => la valeur de k
	
	and	r5,#0xBF		;(ik)%N=64 =>0xBF
	
	push	{r6}			;empiler/utiliser r5	recupperer cos/sin dans r5
	ldrsh 	r6,[r2,r5,lsl #1]	;r5=r2+r6*2^1 (lsl #1=decalage à gauche =2^#1=10(binaire))
					;r2 l'adresse de la table (cos ou sin)
	
	mul 	r4,r4,r6		;x/signal(i)*sin/cos(ik2pi/N)
	add	r12,r12,r4		;r12=r12+r4 => re(k)=re(k-1)+x(i)*sin/cos
	
	add	r3,#1			;r3=r3+1 i++
	
	pop	{r4-r6}			;dépiler/vider r4-r6

	b	Debut
	
Fin	
	mov	r0,r12			;r0=r12
	bx	lr 
	endp
	end