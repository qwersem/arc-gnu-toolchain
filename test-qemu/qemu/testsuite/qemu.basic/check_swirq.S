	.include "macros.inc"

#include "ivt.inc"
	start
	;; 	print "Start\n"
	mov	sp, 0x1000
	seti
	sr	18, [aux_irq_hint]
	print	"*** EXIT code 0\n"
	end

	/* The delay between writing to the AUX_IRQ_HINT register and
	the interrupt being taken is implementation specific.  Hence,
	we need to save/restore any clobber register by ISR.  */
	.align 4
	.global IRQ_18
	.type IRQ_18, @function
IRQ_18:
	clri
	push	r11
	push	r12
	sr	0, [aux_irq_hint]
	pop	r12
	pop	r11
	rtie
	print	"*** EXIT code 2424\n"
	end
