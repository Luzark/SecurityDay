.386
.model flat, stdcall  ;32 bit memory model

option casemap:none
include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib
include C:\masm32\include\user32.inc
includelib C:\masm32\lib\user32.lib

.data
MsgBoxCaption  db "Resultat bruteforce : ",0 
chaine2 db "1",0


.code
start:
	mov esi, offset chaine2
	xor eax,eax
	xor ebx,ebx
	xor ecx,ecx
	xor edx,edx
	mov edx,0
	jmp control
algobis:
	xor eax,eax
	xor ecx,ecx
	xor ebx,ebx
	add DWORD ptr [chaine2],1
	sub esi,edx
	sub edx,1
	jmp control
control:
	cmp ebx,edx
	je prealgo
	cmp BYTE ptr [chaine2+ebx], 21h
	jl ifless
	cmp BYTE ptr [chaine2+ebx], 7Eh
	jg ifgreater
	add ebx,1
	jmp control
ifless:
	mov BYTE ptr [chaine2+ebx], 21h
	add ebx,1
	jmp control
ifgreater:
	add DWORD ptr [chaine2+ebx], 162
	add ebx,1
	jmp control
prealgo:
	xor edx,edx
	jmp algo
algo:
	lodsb
	add edx,1
	test al,al
	je tes
	add cl,al
	rol eax,cl
	add ecx,eax
	jmp algo
tes:
	xor ebx,ebx
	mov eax,ecx
	mov ebx,0D80F0602h
	cmp eax,ebx
	jne algobis
	invoke MessageBox, NULL, addr chaine2, addr MsgBoxCaption, MB_OK
	invoke ExitProcess, NULL

end start