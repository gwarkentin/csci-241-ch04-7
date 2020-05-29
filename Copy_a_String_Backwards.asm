; Program:     Chapter 4, Pr 7, Modified
; Description: Copies a string backwards
; Student:     Gabriel Warkentin
; Date:        02/22/2020
; Class:       CSCI 241
; Instructor:  Mr. Ding

INCLUDE Irvine32.inc

.data
source  byte  "This is the source string",0
target  byte  SIZEOF source DUP(1)					; used 1 to ensure the terminator works
og byte "Original: ",0
ng byte "Reversed: ",0

.code
main proc

	mov  esi, offset source + SIZEOF source - 2		; source pointer, starts at byte before null terminator
	mov  edi, offset target							; target pointer
	mov  ecx,SIZEOF source - 1						; loop counter, excluding null terminator
L1:
	mov  al   , [esi]								; get a character from source
	mov  [edi], al									; store it in the target
	dec  esi										; move to next character backwards in source
	inc  edi										; move to next character forwards  in target
	loop L1											; repeat for entire string

	mov [edi], BYTE PTR 0							; null terminate target at end of coppied string

	call outputs

	mov esi, offset source + SIZEOF source - 2		; starts at byte before null terminator
	mov edi, offset source							; starts at begginning
	mov ecx, (SIZEOF source - 1) / 2				; exchange only first half with second half
L2:
	mov al    , [edi]								; move letter from end of string memory to register
	xchg [esi], al									; exchange with letter from front of string in memory 
	mov [edi] , al									; mov letter to end of string in memory
	dec esi											; mov to next letter backwards
	inc edi											; mov to next letter forwards
	loop L2

	call outputs

	call WaitMsg
	exit
main endp

outputs proc
	mov edx, offset og
	call WriteString
	mov edx, offset source
	call WriteString
	call CrLf
	mov edx, offset ng
	call WriteString
	mov edx, offset target
	call WriteString
	call CrLf
	ret
outputs endp

end ; main