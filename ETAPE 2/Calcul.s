	thumb

	area  madata, data, readwrite
	
	export 	calcul
		
	area  moncode, code, readonly
	import TabSin
	import TabCos
		
calcul proc
	push	{lr,r4-r6}		;l'adresse de la programme dans la pile

	mov	r12 ,#1			;donner	2 octets dans r12
	mul 	r0,r0,r12		;r0=i en c ,calcul le décalage de l'adresse dans le sin et cos

	ldr	r5,=TabSin		;r5=sin

	ldr	r6,=TabCos		;r6=cos
	ldrsh 	r1,[r5,r0,lsl #1]	;r1=r5+r0*2^1 (lsl #1=decalage à gauche =2^#1=10(binaire))
	ldrsh 	r2,[r6,r0,lsl #1]	;r2=r6+r0*2^1

	
	mul 	r1,r1,r1		;r1=r1.F*r1.F	sin^2
	
	mul 	r2,r2,r2		;r2=r2.F*r2.F	cos^2

	add	r0,r1,r2		;r0=r1+r2	sin^2+cos^2

	pop	{lr,r4-r6}			

	bx	lr			;sauter dans l'adresse de la fonction de c
	
	endp
	end