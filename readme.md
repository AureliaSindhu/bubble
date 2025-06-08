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

### macOS

1. **Install Homebrew** (if you don’t have it already):  
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. **Install Java** (required by many LC-3 simulators):  
   ```bash
   brew install java
   ```
3. **Download and install LC3Edit & LC3 Simulator**:  
   - **LC3Edit** (assembler & editor):  
     ```bash
     brew install --cask lc3edit
     ```
   - **LC3 Simulator** (e.g. PennSim or xspim for LC-3):  
     ```bash
     brew install --cask pennsim
     ```
4. **Verify installation**:  
   ```bash
   lc3edit --version
   pennsim --help
   ```
5. **Copy the project files** (your `.asm` and `.obj` files) into a working folder of your choice.

### Windows

1. **Install Java** (if not already installed):  
   - Download from https://www.java.com/en/download/  
   - Follow the installer prompts.
2. **Download LC3Tools** (includes LC3Edit and Simulator):  
   - Go to https://www.purplemath.com/modules/LC3Tools.zip  
   - Extract the ZIP to `C:\LC3Tools`.
3. **Add to PATH** (optional, for convenience):  
   - Open **Control Panel › System and Security › System › Advanced system settings**  
   - Click **Environment Variables**  
   - Under **User variables**, edit `Path` and add `C:\LC3Tools`.
4. **Verify installation**:  
   ```powershell
   lc3edit.exe --version
   simulator.exe --help
   ```
5. **Copy the project files** (`.asm` and `.obj`) into `C:\LC3Tools\Projects\BubbleSort` or a folder of your choice.

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