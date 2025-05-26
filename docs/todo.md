# Assembly Project To-do List

## Input Handling
- Display user input prompt ("Enter number (0-100): ")
- Read each character and store inputted values into array of size 8
- Implement ASCII conversion for input processing
- Validate input range (0-100)
- Handle variable digit inputs (1-3 digits) within valid range
- Loop until array is completely filled
- Manage overflow and storage allocation

## Sorting Implementation (Bubble Sort)
- Use pointers to compare adjacent elements
- Implement conditional branching for swap decisions
  - Compare array[i] with array[i+1]
  - Swap if array[i] > array[i+1] for ascending order
- Create swap subroutine for exchanging memory values
- Use stack/stack pointer for register management during subroutines
- Perform multiple passes until array is fully sorted

## Key Subroutines
1. ReadNumbers
   - Handle user input
   - Validate range
   - Store in array
   
2. BubbleSort
   - Main sorting logic
   - Comparison and swapping
   
3. Swap
   - Exchange memory values
   - Preserve register values
   
4. DisplayNumbers
   - Convert to ASCII
   - Output formatted results

## Output Processing
- Implement ASCII conversion for display
- Use loop to output array elements
- Utilize TRAP x21 for character output
- End with TRAP x25 for program termination

## Memory Management
- Track array location and size
- Manage register allocation
- Handle stack operations
