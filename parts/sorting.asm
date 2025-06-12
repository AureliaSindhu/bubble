;------------------------------------------------------------------
; BUBBLESORT Subroutine
;------------------------------------------------------------------
BUBBLESORT
        ; save R1–R7 that we’ll clobber
        ADD     R6, R6, #-1   ; push R7
        STR     R7, R6, #0
        ADD     R6, R6, #-1   ; push R5
        STR     R5, R6, #0
        ADD     R6, R6, #-1   ; push R4
        STR     R4, R6, #0
        ADD     R6, R6, #-1   ; push R3
        STR     R3, R6, #0
        ADD     R6, R6, #-1   ; push R2
        STR     R2, R6, #0
        ADD     R6, R6, #-1   ; push R1
        STR     R1, R6, #0

B_OUTER
        AND     R1, R1, #0    ; SWAPPED = 0
        LEA     R2, ARRAY     ; R2 → ARRAY base
        AND     R3, R3, #0
        ADD     R3, R3, #7    ; inner loop count = 7

B_INNER
        LDR     R4, R2, #0    ; x1 = M[R2]
        LDR     R5, R2, #1    ; x2 = M[R2+1]
        NOT     R7, R4        ; R7 = –x1
        ADD     R7, R7, #1
        ADD     R6, R5, R7    ; R6 = x2 – x1
        BRn     B_DO_SWAP     ; if x2 < x1, swap

B_SKIP
        ADD     R2, R2, #1
        ADD     R3, R3, #-1
        BRp     B_INNER
        BRz     B_CHECK_DONE
        BR      B_OUTER

B_DO_SWAP
        JSR     SWAP          ; swap M[R2] and M[R2+1]
        ADD     R1, R1, #1    ; SWAPPED = 1
        ADD     R2, R2, #1
        ADD     R3, R3, #-1
        BRp     B_INNER

B_CHECK_DONE
        ; restore R1–R7
        LDR     R1, R6, #0    ADD R6, R6, #1
        LDR     R2, R6, #0    ADD R6, R6, #1
        LDR     R3, R6, #0    ADD R6, R6, #1
        LDR     R4, R6, #0    ADD R6, R6, #1
        LDR     R5, R6, #0    ADD R6, R6, #1
        LDR     R7, R6, #0    ADD R6, R6, #1
        RET

;------------------------------------------------------------------
; SWAP Subroutine
;------------------------------------------------------------------
SWAP
        ; save R1, R2, R7
        ADD     R6, R6, #-1   ; push R1
        STR     R1, R6, #0
        ADD     R6, R6, #-1   ; push R2
        STR     R2, R6, #0
        ADD     R6, R6, #-1   ; push R7
        STR     R7, R6, #0

        LDR     R1, R2, #0    ; R1 = x1
        LDR     R3, R2, #1    ; R3 = x2
        STR     R3, R2, #0    ; M[R2]   ← x2
        STR     R1, R2, #1    ; M[R2+1] ← x1

        ; restore R1, R2, R7
        LDR     R7, R6, #0    ADD R6, R6, #1
        LDR     R2, R6, #0    ADD R6, R6, #1
        LDR     R1, R6, #0    ADD R6, R6, #1
        RET
