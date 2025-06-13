# LC-3 Bubble Sort Project

A program that implements the bubble sort algorithm in LC-3 assembly language to sort eight user-input integers between 0–100 in ascending order.

## Table of Contents

- [Features](#features)  
- [Prerequisites](#prerequisites)  
- [Installation & Setup](#installation--setup)  
  - [macOS](#macos)  
  - [Windows](#windows)  
- [Usage](#usage)  
- [Memory Map](#memory-map)  

## Features

- Implements bubble sort in LC-3 assembly  
- Handles integers from 0 to 100  
- Memory-efficient, stack-based swapping  
- Input validation for range 0–100  
- Clean, space-separated output  

## Prerequisites

- LC-3 Simulator (available for macOS and Windows)  
- The compiled `.obj` file for this program  
- Basic understanding of LC-3 assembly language  

## Installation & Setup

### MacOs
If you are using macOS or Chromebook, use one of the following online simulators:  

- [LC-3 Web (W. Chargin)](https://wchargin.com/lc3web/)  
- [U of Manitoba LC-3 Simulator](https://lc3.cs.umanitoba.ca/)  
- [LC-3 Tutor](http://lc3tutor.org/)

**Steps:**  
1. In a text editor (e.g., TextEdit, TextMate, Sublime Text, Vim, Atom, VS Code), create your `.asm` file (e.g., `lab2ex1.asm`).  
2. Open your browser and visit one of the simulators above.  
3. Click **Assemble**, then paste your assembly code into the provided window.  
4. Click **Assemble** again, then click **Load Into Simulator**.  
5. To enter input values directly into memory, click the second column at the desired address and edit the value in hexadecimal.  
6. Click **Run**. Any program output will appear in the console area.

### Windows

1. **Install Java** (if needed):  
   - Download from https://www.java.com/en/download/ and follow the installer.  
2. **Download LC3Tools** (includes LC3Edit and simulator):  
   - Go to https://www.purplemath.com/modules/LC3Tools.zip  
   - Extract the ZIP to `C:\LC3Tools`.  
3. **(Optional) Add to PATH** for ease of use:  
   - Open **Control Panel › System and Security › System › Advanced system settings**  
   - Click **Environment Variables**  
   - Under **User variables**, edit `Path` and add `C:\LC3Tools`.  
4. **Verify** by running in PowerShell or CMD:  
   ```powershell
   C:\LC3Tools\lc3edit.exe --version
   C:\LC3Tools\simulator.exe --help
   ```
5. **Copy** your `.asm` and `.obj` files into your project folder (e.g., `C:\LC3Tools\Projects\BubbleSort`).

## Usage

1. **Open** your LC-3 Simulator (e.g. LC3 wchargin simulator).  
2. **Load** the `.obj` file for this project (File → Load Object).  
3. **Run** the program.  
4. **Enter** 8 integers when prompted (each between 0 and 100).  
5. **Observe** the sorted output; the sorted array remains in memory for further inspection.

## Memory Map

| Label             | Purpose                                                                                 |
| ----------------- | --------------------------------------------------------------------------------------- |
| `STACK_INIT`      | Initial stack pointer value (`xFE00`)                                                   |
| `CONST_NEG_101`   | Constant `-101` for input validation                                                    |
| `ASCII_NEG_ZERO`  | ASCII offset for converting characters to digits (`-'0'`)                               |
| `CONST_NEG_100`   | Constant `-100` for detecting the special case of 100                                  |
| `CONV_TO_ASCII`   | ASCII offset for printing digits (`'0'`)                                                |
| `ASCII_ONE`       | ASCII code for the character `'1'`                                                      |
| `SPACE`           | ASCII code for the space character                                                      |
| `ARRAY`           | `.BLKW #8` — eight‐word buffer for the user’s input and then the sorted output          |
| `BUFFER`          | `.BLKW #5` — five‐word input buffer (enough for “100\n\0”)                              |
| `PROMPT_SORTED`   | `".STRINGZ \"\nSorted Array: \"` — printed before displaying the sorted array           |
| `PROMPT_STR`      | `".STRINGZ \"\nEnter a number (0-100): \"` — printed before each input                  |
| `ERROR_STR`       | `".STRINGZ \"\nInvalid input. Please try again.\"` — printed on out-of-range input      |
| `NEWLINE_CHAR`    | `".STRINGZ \"\n\"` — terminates the output with a newline                                |


## Example

- **Input**: 64 34 25 12 22 11 90 5
- **Output**: 5 11 12 22 25 34 64 90

<img src="/output.png" alt="expected output">

## Manufactured by CSS

- Aurelia S.
- Aurelisa S. 
- Brittany C.