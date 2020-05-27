; ce programme est pour l'assembleur RealView (Keil)
	thumb

	area  madata, data, readwrite
FLAG		dcd		0x0000
	import etat	
	export timer_callback
	include etat.inc 
		
	area  moncode, code, readonly
	
	
	
		
timer_callback	proc

	push 	{r4}
	ldr 	r0, =etat;
	ldr	r3, =TIM3_CCR3;
	ldr 	r2, [r0,#E_POS];
	ldr 	r12, [r0,#E_TAI];
	
	;comparaison entre la taille et la position
	cmp 	r12, r2
	beq	Fin

	;conversion
	;index incemente courant dans le tableau d'échantillons du son
	ldr	r1,[r0,#E_SON]	
	ldrsh	r4,[r1,r2,lsl #1]

	;multiplier par 720(resolution)
	ldr 	r12,[r0,#E_RES]
	mul	r4, r12

	;diviser par 2^16
	asr 	r4, #16

	;le offset	
	asr 	r12, #1
	add 	r4, r12

	;la valeur convertie dans TIM3_CCR3
	str 	r4,[r3]

	;position incremente par 1
	add	r2,#1
	str 	r2, [r0,#E_POS]
	

Fin		
	pop 	{r4}	
	bx	lr
	endp
	end
		