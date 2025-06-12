.ORIG   x3000

    LD      R6, STACK_INIT      ; Initialize the stack pointer
    JSR     READ_NUMBERS        ; Read 8 numbers into ARRAY
    JSR     BUBBLE_SORT         ; Sort the numbers in ARRAY
    JSR     DISPLAY_SORTED      ; Print the sorted array
    HALT

STACK_INIT  .FILL xFE00

READ_NUMBERS
    ; -- Save Registers --
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
    ADD     R6, R6, #-1         ; Push R0
    STR     R0, R6, #0

    ; -- Initialize Loop --
    AND     R1, R1, #0          ; R1 = loop counter = 0
    LEA     R2, ARRAY           ; R2 = pointer to ARRAY

RN_LOOP    ; -- Check if 8 numbers have been read --
    ADD     R4, R1, #-8         ; Check if loop counter has reached 8
    BRzp    RN_DONE             ; If so, we are done reading numbers

    LEA     R0, PROMPT_STR
    PUTS                        ; Display "Enter a number (0-100): "

    LEA     R3, BUFFER          ; R3 = pointer to input buffer

RN_GETC_LOOP
    GETC                        ; Read a character into R0
    OUT                         ; Echo it to the console
    ADD     R4, R0, #-10        ; Check for newline character (ASCII x0A)
    BRz     RN_END_GETC         ; If newline, end input reading
    STR     R0, R3, #0          ; Store character in the buffer
    ADD     R3, R3, #1          ; Increment buffer pointer
    BR      RN_GETC_LOOP

RN_END_GETC
    AND     R4, R4, #0          ; Null-terminate the string in the buffer
    STR     R4, R3, #0

    ; -- Convert Input to Integer and Validate --
    LEA     R0, BUFFER          ; Pass buffer address in R0
    JSR     ASCII_TO_INT        ; Convert string to integer -> returns in R0
    ADD     R5, R0, #0          ; Copy result to R5 for validation

    BRn     RN_INVALID          ; If N is set, number is negative (invalid)

    LD      R3, CONST_NEG_101   ; Load -101 into R3
    ADD     R4, R5, R3          ; R4 = number - 101
    BRp     RN_INVALID          ; If P is set, number > 100 (invalid)

    ; -- Store Valid Number and Continue Loop --
    STR     R5, R2, #0          ; Store the valid number in ARRAY
    ADD     R2, R2, #1          ; Increment array pointer
    ADD     R1, R1, #1          ; Increment loop counter
    BR      RN_LOOP             ; Loop again

RN_INVALID
    LEA     R0, ERROR_STR
    PUTS                        ; Display the error message
    BR      RN_LOOP             ; Re-prompt for the same array element

RN_DONE
    ; -- Restore Registers --
    LDR     R0, R6, #0          ; Pop R0
    ADD     R6, R6, #1
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

CONST_NEG_101   .FILL #-101

ASCII_TO_INT
    ; -- Save Registers --
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

    AND     R2, R2, #0          ; R2 = accumulator = 0
    LD      R4, ASCII_NEG_ZERO  ; R4 = -'0'

A2I_LOOP
    LDR     R3, R0, #0          ; Load next character from string
    BRz     A2I_DONE            ; If null terminator, we are done

    ; -- Multiply accumulator by 10 --
    ADD     R1, R2, R2          ; R1 = acc * 2
    ADD     R1, R1, R1          ; R1 = acc * 4
    ADD     R1, R1, R2          ; R1 = acc * 5
    ADD     R2, R1, R1          ; R2 = acc * 10

    ; -- Add new digit --
    ADD     R3, R3, R4          ; Convert ASCII char to digit (e.g., '1' -> 1)
    ADD     R2, R2, R3          ; Add digit to accumulator

    ADD     R0, R0, #1          ; Increment string pointer
    BR      A2I_LOOP

A2I_DONE
    ADD     R0, R2, #0          ; Move result to R0 for return

    ; -- Restore Registers --
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

ASCII_NEG_ZERO  .FILL #-48

BUBBLE_SORT
    ; -- Save Registers --
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
    ADD     R6, R6, #-1         ; Push R0
    STR     R0, R6, #0

BS_OUTER_LOOP
    AND     R1, R1, #0          ; R1 = swapped_flag = 0
    AND     R3, R3, #0
    ADD     R3, R3, #7          ; R3 = inner loop count = (ARRAY_SIZE - 1)
    LEA     R2, ARRAY           ; R2 = pointer to current element

BS_INNER_LOOP
    LDR     R4, R2, #0          ; R4 = current_element (x1)
    LDR     R5, R2, #1          ; R5 = next_element (x2)

    ; -- Compare elements: is x2 < x1? --
    NOT     R0, R4              ; R0 = -x1 - 1
    ADD     R0, R0, #1          ; R0 = -x1
    ADD     R0, R5, R0          ; R0 = x2 - x1
    BRzp    BS_NO_SWAP          ; If (x2 - x1) >= 0, they are in order, so skip swap

    ; -- Swap elements since x2 < x1 --
    STR     R5, R2, #0          ; M[R2]   <- x2
    STR     R4, R2, #1          ; M[R2+1] <- x1
    ADD     R1, R1, #1          ; Set swapped_flag = 1 to indicate a swap occurred

BS_NO_SWAP
    ADD     R2, R2, #1          ; Advance pointer to the next pair
    ADD     R3, R3, #-1         ; Decrement inner loop counter
    BRp     BS_INNER_LOOP       ; Continue inner loop if counter > 0

    ; -- Check if any swaps were made in the last pass --
    ADD     R1, R1, #0          ; Set Condition Codes based on swapped_flag
    BRp     BS_OUTER_LOOP       ; If swapped_flag = 1, another pass is needed

BS_DONE
    ; -- Restore Registers --
    LDR     R0, R6, #0          ; Pop R0
    ADD     R6, R6, #1
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

DISPLAY_SORTED
    ; -- Save Registers --
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
    ADD     R6, R6, #-1         ; Push R0
    STR     R0, R6, #0

    LEA     R0, PROMPT_SORTED   ; Load "Sorted Array: " string
    PUTS                        ; Display string

    ; -- Initialize Loop --
    AND     R1, R1, #0          ; R1 = loop counter = 0
    LEA     R2, ARRAY           ; R2 = pointer to ARRAY

PRINT_LOOP
    ADD     R3, R1, #-8         ; Checks if we have printed all 8 values (R1 - 8)
    BRzp    DISPLAY_DONE        ; If R1 >= 8, then the loop is finished

    LDR     R0, R2, #0          ; Load current array value to R0
    JSR     PRINT_DECIMAL       ; Call subroutine to print the number in R0

    LD      R0, SPACE           ; Load a space character
    OUT                         ; Print the space

    ADD     R1, R1, #1          ; Increment loop counter
    ADD     R2, R2, #1          ; Increment pointer to ARRAY
    BR      PRINT_LOOP

DISPLAY_DONE
    LEA     R0, NEWLINE_CHAR
    PUTS
    ; -- Restore Registers --
    LDR     R0, R6, #0          ; Pop R0
    ADD     R6, R6, #1
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

SPACE       .FILL x20

PRINT_DECIMAL
    ; -- Save Registers --
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

    ADD     R1, R0, #0 

    ; -- Check for the special case of 100 --
    LD      R3, CONST_NEG_100
    ADD     R4, R1, R3
    BRnp    PD_LT100

    ; -- Case: Number is 100 --
    LD      R0, ASCII_ONE       ; Load '1' into R0 for printing
    OUT
    LD      R0, CONV_TO_ASCII   ; Load '0' into R0 for printing
    OUT
    OUT                         ; Print '0' again
    BR      PD_EXIT

PD_LT100
    ; -- Case: Number is less than 100 --
    AND     R2, R2, #0          ; R2 will hold the tens digit, clear it first

PD_DIV10_LOOP
    ADD     R3, R1, #-10
    BRn     PD_DONE_DIV         ; If R1 < 10, we have the ones digit
    ADD     R1, R3, #0          ; R1 = R1 - 10
    ADD     R2, R2, #1          ; Increment the tens digit count
    BR      PD_DIV10_LOOP

PD_DONE_DIV
    ; R2 = tens digit, R1 = ones digit
    ADD     R5, R1, #0          ; Save ones digit into R5
    LD      R4, CONV_TO_ASCII   ; R4 = ASCII offset '0'

    ; -- Check if tens digit is zero to avoid printing a leading '0' --
    ADD     R0, R2, #0          ; Use R0 for temp, check if tens digit is zero
    BRz     PD_PRINT_ONES_ONLY  ; If tens digit is 0, skip printing it

    ; -- Print the tens digit (only if it's not zero) --
    ADD     R0, R2, R4
    OUT

PD_PRINT_ONES_ONLY
    ADD     R0, R5, R4
    OUT

PD_EXIT
    ; -- Restore Registers --
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

CONST_NEG_100   .FILL   #-100
CONV_TO_ASCII   .FILL   x30         ; ASCII value for '0'
ASCII_ONE       .FILL   x31         ; ASCII value for '1'

ARRAY           .BLKW   #8
BUFFER          .BLKW   #5          ; Accommodates '100', newline, and null

PROMPT_SORTED   .STRINGZ "\nSorted Array: "
PROMPT_STR      .STRINGZ "\nEnter a number (0-100): "
ERROR_STR       .STRINGZ "\nInvalid input. Please try again."
NEWLINE_CHAR    .STRINGZ "\n"

.END