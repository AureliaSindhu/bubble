; Bubble Sort: prompts user to input 8 digit number, then our program will sort it.

; R0: Used for input/output
; R1: Outer loop counter
; R2: Inner loop counter
; R3: Current array element
; R4: Next array element
; R5: Array length (8)
; R6: Used for comparisons
; R7: Return address

.ORIG x3000

BUBBLE_SORT
    ST R7, SAVE_R7                  ; Save return address
    
    ; Initialize outer loop counter
    AND R1, R1, #0                  ; R1 = 0
    ADD R1, R1, #-8                 ; R1 = -8
    
OUTER_LOOP
    ADD R1, R1, #1                  ; R1++
    BRzp DONE                       ; If R1 >= 0, all passes done
    
    ; Initialize inner loop counter
    AND R2, R2, #0                  ; R2 = 0
    ADD R2, R2, #-7                 ; R2 = -7
    
INNER_LOOP
    ADD R2, R2, #1                  ; R2++
    BRzp OUTER_LOOP                 ; If R2 >= 0, go to outer loop
    
    ; Calculate address of ARRAY[j]
    LEA R6, ARRAY                   ; R6 = &ARRAY[0]
    ADD R6, R6, R2                  ; R6 = &ARRAY[j]

    ; Load A[j] and A[j+1]
    LDR R3, R6, #0                  ; R3 = ARRAY[j]
    LDR R4, R6, #1                  ; R4 = ARRAY[j+1]

    ; Compare if R3 <= R4 skip NO_SWAP
    NOT R7, R4                      ; R7 = ~R4
    ADD R7, R7, #1                  ; R7 = -R4
    ADD R7, R3, R7                  ; R7 = R3 - R4
    BRzp NO_SWAP                    ; R3 <= R4, no swap

    ; Swap A[j] <-> A[j+1]
    STR R4, R6, #0                  ; ARRAY[j] = old R4
    STR R3, R6, #1                  ; ARRAY[j+1] = old R3
    

NO_SWAP
    BR INNER_LOOP                   ; Continue inner loop
    
DONE
    LD R7, SAVE_R7                  ; Restore return address
    RET

; Data
ARRAY   .BLKW 8                     ; Array of 8 words
SAVE_R7 .BLKW 1                     ; Save return address


.END
