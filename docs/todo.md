# LC-3 Bubble Sort Project

## Overview

This project implements the **Bubble Sort algorithm** in **LC-3 assembly language** to sort eight user-input integers between `0-100`. The project demonstrates low-level programming using subroutines, stack operations, ASCII conversion, and TRAP-based I/O.

---

## Project Roles & To-Do List

### Lia – Input & Data Preparation 

#### Tasks
- [ ] **Initialize Stack Pointer**
  - Set `R6 ← xFE00` at program start.
- [ ] **Implement `ReadNumbers` Subroutine**
  - Prompt the user with `PUTS`.
  - Capture input using `TRAP x23`.
  - Call `ASCIItoInt` to convert input to binary.
  - Validate input is between 0–100.
  - Store input into the `ARRAY` using `STR` with pointer offset.
  - Repeat for 8 inputs.
- [ ] **Build ASCII to Integer Conversion (`ASCIItoInt`)**
  - Handle multi-digit inputs (e.g., '17').
  - Subtract ASCII `'0'` to form binary number.
- [ ] **Create Input Prompt Strings**
  - Use `.STRINGZ` and `LEA` with `PUTS` for UI.
- [ ] **Allocate Memory**
  - Define `ARRAY` with `.BLKW 8`.

#### Requirements
- **Addresses & Memory Layout** (20 pts + 20 pts)  
  - `.ORIG` label (program start)  
  - `.FILL` directives if needed  
  - `ARRAY` allocation  
  - Input buffer addresses  
  - Output buffer/newline addresses  
  - Manage overflow and storage allocation (`.BLKW`, range checks)
- **ASCII-to-Integer Conversion** (30 pts)  
  - Subroutine handles multi-digit input correctly.
- **System Calls for Input** (10 pts)  
  - Correct use of `TRAP x23`, `PUTS`, etc., in `ReadNumbers`.
- **Labels & Comments (Input Section)** (20 pts)  
  - Clear documentation of all data labels and the `ReadNumbers` routine.

---

### Lisa – Sorting Logic 

#### Tasks
- [ ] **Implement `BubbleSort` Subroutine**
  - Set a flag to control outer loop.
  - Compare and swap adjacent elements using indirect memory access.  
  - Call `Swap` subroutine when needed.
  - Continue loop while swaps occur.
- [ ] **Create `Swap` Subroutine**
  - Save/restore registers using `PUSH` and `POP` (R1, R2, R7).
  - Use `LDR` and `STR` to exchange two values in memory.
- [ ] **Implement Swap Condition**
  - Use subtraction `(x2 - x1)` and branch on `BRn` to detect needed swaps.
- [ ] **Pointer Arithmetic**
  - Use register-based addressing for array traversal.

#### Requirements
- **Core Instructions** (40 pts)  
  - Use `ADD`, `SUB`, `LDR`, `STR` appropriately.
- **Branching & Loop Control** (30 pts)  
  - Outer loop flag, inner loop iteration, `BRn`, `BRz`, `BRp`.
- **Stack Management** (20 pts + 30 pts)  
  - Initialize SP (`R6 ← xFE00`).  
  - `PUSH`/`POP` in `Swap` (save/restore R1, R2, R7).
- **Pointer Arithmetic** (20 pts)  
  - Register-based addressing to traverse `ARRAY`.
- **Subroutines & Calls** (20 pts)  
  - `BubbleSort` and `Swap` via `JSR`/`JSRR`.
- **Labels & Comments (Sorting Section)** (20 pts)  
  - Document loop labels, swap logic, subroutine entry/exit.

---

### Brit – Output & Conversion 

#### Tasks
- [ ] **Implement `DisplayNumbers` Subroutine**
  - Loop through `ARRAY`, load each value.
  - Call `IntToASCII` to convert to characters.
  - Output digits with `TRAP x21`.
  - Print a space after each number.
- [ ] **Implement `IntToASCII` Subroutine**
  - Divide value into tens and ones digits.
  - Add `'0'` to each digit.
  - Output characters using `TRAP x21`.
- [ ] **Final Output Formatting**
  - Ensure numbers are space-separated.
  - Print newline after final value.
- [ ] **Finalize Program**
  - Restore registers and call `TRAP x25`.

#### Requirements
- **Display to Console** (20 pts)  
  - `DisplayNumbers` correctly prints sorted values.
- **Integer-to-ASCII Conversion** (30 pts)  
  - `IntToASCII` handles tens/ones and adds `'0'`.
- **System Calls for Output** (10 pts)  
  - Proper use of `TRAP x21` and newline.
- **Testing & Verification** (20 pts)  
  - Sample input `11 8 2 17 6 4 3 21` → output `2 3 4 6 8 11 17 21`.
- **Labels & Comments (Output Section)** (20 pts)  
  - Document `DisplayNumbers`, `IntToASCII`, and final formatting.

---

## Deliverables

- LC-3 Source Code (`.asm`)
- LC-3 Object File (`.obj`)
- Test Log and Output (sorted array confirmation)
- Documentation (`README.md`, design notes)

---

## Test Inputs

**Sample Input:**  
`11 8 2 17 6 4 3 21`  
**Expected Output:**  
`2 3 4 6 8 11 17 21`

---

## Enhancement Requests (v1.1 & v1.2)

| Date       | Enhancement                      | Requested By           | Priority | Status |
|------------|----------------------------------|-------------------------|----------|--------|
| 2025-05-21 | Support dynamic array size input | Aurelia Sindhunirmala  | Medium   | v1.1   |
| 2025-05-21 | Add sorting order toggle         | Aurelisa Sindhunirmala | Medium   | v1.1   |
| 2025-05-22 | Display error messages on input  | Brittany Chan          | Low      | v1.2   |

---

## Assembly Concepts Used

- `TRAP x23`, `TRAP x21`, `TRAP x25` – Console I/O
- `JSR`, `JSRR` – Subroutine Calls
- `LDR`, `STR` – Memory Access
- `BR`, `BRn` – Conditional Branching
- `PUSH`, `POP` – Stack Operations with `R6`
- `.ORIG`, `.BLKW`, `.STRINGZ`, `.FILL`, `.END` – LC-3 Directives

---

## Educational Goals

- Understand trade-offs of Bubble Sort (O(n²) time).
- Practice low-level logic for I/O, loops, conditionals, and memory.
- Appreciate the business implications of algorithm choice.
