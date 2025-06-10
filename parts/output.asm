
;-------------------------------
; DISPLAY_SORTED Subroutine
; Description: Outputs the array sorted by bubble sort
;           
;-------------------------------

.ORIG X3000
JSR DISPLAY_SORTED
HALT


DISPLAY_SORTED
	LEA R0, PROMPT_SORTED    ; Load "Sorted Array: " string
	PUTS              ; Display string
	RET



PROMPT_SORTED 		.STRINGZ "Sorted Array: "

.END

