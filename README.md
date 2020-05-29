# csci-241-ch04-7
Copy_a_String_Backwards

Write a program using the LOOP instruction with indirect operands (not indexed operands) that copies a string from source to target, reversing the character order in the process. Don't use PUSH/POP at this time. Referring to the CopyStr.asm, your algorithm can be like this:
Point ESI to the end of the source string
Point EDI to the beginning of the target string
Initialize the loop counter ECX and start a loop
Get a character from source
Store it in the target
Update ESI and EDI
Make a terminator at the end of the target in your code logic. Don't rely on the target initialization
Call WriteString to output the two strings similar to this:
Original: This is the source string
Reversed: gnirts ecruos eht si sihT
Alternative solution: A little challenging while more efficient is in-place reversing a string: what if using xchg?
* You can choose one of above two methods to implement.
