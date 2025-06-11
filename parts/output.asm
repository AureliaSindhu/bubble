;------------------------------------------------------------------
;  OUTPUT PROGRAM
;
;  This program is the section of the program that is called after
;  the bubble sort routine to display the sorted array. 
;------------------------------------------------------------------

	.ORIG X3000
	LEA R6, STACK_INIT
	JSR     READ_NUMBERS
	JSR DISPLAY_SORTED
	HALT


;-------------------------------
; READ_NUMBERS Subroutine
; Description: Prompts the user to enter 8 numbers, validates them (0-100),
;              and stores them in the ARRAY.
;-------------------------------
READ_NUMBERS
        ; -- Save Registers using the Stack (PUSH) --
        ADD     R6, R6, #-1         ; Push R7
        STR     R7, R6, #0
        ADD     R6, R6, #-1         ; Push R5
        STR     R5, R6, #0
        ADD     R6, R6, #-1         ; Push R4
        STR     R4, R6, #0
        ADD     R6, R6, #-1         ; Push R3
        STR     R3, R6, #0
        ADD     R6, R6, #-1         ; Push R2
        STR     R2, R6, #0
        ADD     R6, R6, #-1         ; Push R1
        STR     R1, R6, #0

        ; -- Initialize Loop --
        AND     R1, R1, #0          ; R1 = loop counter = 0.
        LEA     R2, ARRAY           ; R2 = pointer to ARRAY.

RN_LOOP
        ; -- Prompt and Get Input String --
        LEA     R0, PROMPT_STR
        PUTS                        ; Display "Enter a number (0-100): "

        LEA     R3, BUFFER          ; R3 = pointer to input buffer.
RN_GETC_LOOP
        GETC                        ; Read a character into R0.
        OUT                         ; Echo it to the console.
        LD      R4, NEWLINE_NEG     ; Check if the character is newline (Enter key).
        ADD     R4, R0, R4
        BRz     RN_END_GETC         ; If newline, end input reading.
        STR     R0, R3, #0          ; Store character in the buffer.
        ADD     R3, R3, #1          ; Increment buffer pointer.
        BR      RN_GETC_LOOP
RN_END_GETC
        AND     R4, R4, #0          ; Null-terminate the string in the buffer.
        STR     R4, R3, #0

        ; -- Convert Input to Integer and Validate --
        LEA     R0, BUFFER          ; Pass buffer address in R0.
        JSR     ASCII_TO_INT        ; Convert string to integer -> returns in R0.
        ADD     R5, R0, #0          ; Copy result to R5 for validation.

        ADD     R5, R5, #0          ; Check if number is negative.
        BRn     RN_INVALID          ; If N is set, number is < 0 (invalid).

        LD      R3, CONST_NEG_101   ; Load -101 into R3.
        ADD     R4, R5, R3          ; R4 = number - 101.
        BRp     RN_INVALID          ; If P is set, number > 100 (invalid).

        ; -- Store Valid Number and Continue Loop --
        STR     R5, R2, #0          ; Store the valid number in ARRAY.
        ADD     R2, R2, #1          ; Increment array pointer.
        ADD     R1, R1, #1          ; Increment loop counter.
        ADD     R4, R1, #-8         ; Check if we have read 8 numbers.
        BRn     RN_LOOP             ; If count < 8, loop again.
        BR      RN_DONE             ; Otherwise, finish.

RN_INVALID
        LEA     R0, ERROR_STR
        PUTS                        ; Display the error message.
        BR      RN_LOOP             ; Re-prompt for the same array element.

RN_DONE
        ; -- Restore Registers from the Stack (in reverse order) --
        LDR     R1, R6, #0          ; Pop R1
        ADD     R6, R6, #1
        LDR     R2, R6, #0          ; Pop R2
        ADD     R6, R6, #1
        LDR     R3, R6, #0          ; Pop R3
        ADD     R6, R6, #1
        LDR     R4, R6, #0          ; Pop R4
        ADD     R6, R6, #1
        LDR     R5, R6, #0          ; Pop R5
        ADD     R6, R6, #1
        LDR     R7, R6, #0          ; Pop R7
        ADD     R6, R6, #1
        RET

;-------------------------------
; ASCII_TO_INT Subroutine
; Input:  R0 = Pointer to a null-terminated string of digits.
; Output: R0 = Converted binary integer.
;-------------------------------
ASCII_TO_INT
        ; -- Save Registers using the Stack --
        ADD     R6, R6, #-1         ; Push R7
        STR     R7, R6, #0
        ADD     R6, R6, #-1         ; Push R4
        STR     R4, R6, #0
        ADD     R6, R6, #-1         ; Push R3
        STR     R3, R6, #0
        ADD     R6, R6, #-1         ; Push R2
        STR     R2, R6, #0
        ADD     R6, R6, #-1         ; Push R1
        STR     R1, R6, #0

        AND     R2, R2, #0          ; R2 = accumulator = 0.
        LD      R4, ASCII_NEG_ZERO  ; R4 = -'0'.

A2I_LOOP
        LDR     R3, R0, #0          ; Load next character from string.
        BRz     A2I_DONE            ; If null terminator, we are done.

        ; -- Multiply accumulator by 10 --
        ADD     R1, R2, R2          ; R1 = acc * 2
        ADD     R1, R1, R1          ; R1 = acc * 4
        ADD     R1, R1, R2          ; R1 = acc * 5
        ADD     R2, R1, R1          ; R2 = acc * 10

        ; -- Add new digit --
        ADD     R3, R3, R4          ; Convert ASCII char to digit (e.g., '1' -> 1).
        ADD     R2, R2, R3          ; Add digit to accumulator.

        ADD     R0, R0, #1          ; Increment string pointer.
        BR      A2I_LOOP

A2I_DONE
        ADD     R0, R2, #0          ; Move result to R0 for return.

        ; -- Restore Registers from the Stack (in reverse order) --
        LDR     R1, R6, #0          ; Pop R1
        ADD     R6, R6, #1
        LDR     R2, R6, #0          ; Pop R2
        ADD     R6, R6, #1
        LDR     R3, R6, #0          ; Pop R3
        ADD     R6, R6, #1
        LDR     R4, R6, #0          ; Pop R4
        ADD     R6, R6, #1
        LDR     R7, R6, #0          ; Pop R7
        ADD     R6, R6, #1
        RET


;-------------------------------
; DISPLAY_SORTED Subroutine
; Description: Outputs the array sorted by bubble sort and does
;              necessary ASCII conversion to ensure values are correctly
;			   outputted.
;-------------------------------

DISPLAY_SORTED
	; -- Save Registers using the Stack (PUSH) -- 
    ADD     R6, R6, #-1         ; Push R7
    STR     R7, R6, #0
    ADD     R6, R6, #-1         ; Push R5
    STR     R5, R6, #0
    ADD     R6, R6, #-1         ; Push R4
    STR     R4, R6, #0
    ADD     R6, R6, #-1         ; Push R3
    STR     R3, R6, #0
    ADD     R6, R6, #-1         ; Push R2
    STR     R2, R6, #0
    ADD     R6, R6, #-1         ; Push R1
    STR     R1, R6, #0

    LEA R0, PROMPT_SORTED    ; Load "Sorted Array: " string
    PUTS    	             ; Display string
	
    ; -- Initialize Loop -- 
    AND R1, R1, #0           ; R1 = loop counter = 0
    LEA R2, ARRAY 	     ; R2 = pointer to ARRAY

PRINT_LOOP
    LDR R0, R2, #0   	     ; Load current array value to R0
    JSR PRINT_DECIMAL
    LDR R3, R1, #0
    ADD R3, R3, #-8          ; Checks if we have printed out all 8 values
    BRp DISPLAY_DONE  
    ADD R1, R1, #1
    ADD R2, R2, #1           ; Increment pointer to ARRAY 
    BR PRINT_LOOP

    ; -- Restore Registers from the Stack (in reverse order) --
    LDR     R1, R6, #0          ; Pop R1
    ADD     R6, R6, #1
    LDR     R2, R6, #0          ; Pop R2
    ADD     R6, R6, #1
    LDR     R3, R6, #0          ; Pop R3
    ADD     R6, R6, #1
    LDR     R4, R6, #0          ; Pop R4
    ADD     R6, R6, #1
    LDR     R7, R6, #0          ; Pop R7
    ADD     R6, R6, #1
    RET

;-------------------------------
; PRINT_DECIMAL Subroutine
; Input: R3 = number (0–100)
; Output: ASCII converted integer value
;-------------------------------

PRINT_DECIMAL
    LD R1, CONV_TO_ASCII
    ADD R0, R0, R1
    OUT
    RET

DISPLAY_DONE
	RET


;-------------------------------
; Data & Constants
;-------------------------------

; --- Memory Storage ---
ARRAY   		.BLKW   #8 
BUFFER          .BLKW   #5          ; Accommodates up to '100',newline, and null.
STACK_INIT      .FILL   xFE00
CONV_TO_ASCII   .FILL   x30


; --- Strings ---
PROMPT_SORTED 		.STRINGZ "Sorted Array: "
PROMPT_STR      .STRINGZ "\nEnter a number (0-100): "
ERROR_STR       .STRINGZ "\nInvalid input. Please try again."

; --- Constants ---
NEWLINE_NEG     .FILL   #-10
ASCII_NEG_ZERO  .FILL   #-48
CONST_NEG_101   .FILL   #-101       ; For validation check (number > 100)

.END

