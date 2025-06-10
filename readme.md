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
5. (Optional) Download the assembled files if you need the `.obj` file.  
6. To enter input values directly into memory, click the second column at the desired address and edit the value in hexadecimal.  
7. Click **Run**. Any program output will appear in the console area.

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

1. **Open** your LC-3 Simulator (e.g. PennSim or LC3Tools’ simulator).  
2. **Load** the `.obj` file for this project (File → Load Object).  
3. **Run** the program.  
4. **Enter** 8 integers when prompted (each between 0 and 100).  
5. **Observe** the sorted output; the sorted array remains in memory for further inspection.

## Memory Map

| Address | Purpose                                  |
| ------- | ---------------------------------------- |
| x3100   | Start of input array (8 words)           |
| x3110   | Scratch space / loop counters            |
| x3120   | Return address / stack frame             |
| …       | …                                        |

*(Adjust addresses as needed in your `.asm`.)*

## Example

- **Input**: 64 34 25 12 22 11 90 -5
- **Output**: -5 11 12 22 25 34 64 90

## Manufactured by CSS

- Aurelia S.
- Aurelisa S. 
- Brittany C.