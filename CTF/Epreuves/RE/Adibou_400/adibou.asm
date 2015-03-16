.386
.model flat, stdcall  ;32 bit memory model

option casemap:none
include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib
include C:\masm32\include\user32.inc
includelib C:\masm32\lib\user32.lib

.data
MsgBoxCaption  db "Adibou",0 
chaine2 db "1",0
MsgBoxWin db "Bravo ! Tu peux valider avec ce flag.", 0
MsgBoxFail db "Mauvais Mot De Passe!",0


.code
start:
	mov esi, offset chaine2
	xor eax,eax
	xor ecx,ecx
	xor edx,edx
	jmp algo
algo:
	lodsb
	test al,al
	je tes
	add cl,al
	rol eax,cl
	add ecx,eax
	jmp algo
fail:
	invoke MessageBox, NULL, addr MsgBoxFail, addr MsgBoxCaption, MB_OK
	invoke ExitProcess, NULL
tes:
	xor ebx,ebx
	mov eax,ecx
	mov ebx,0D80F0602h
	cmp eax,ebx
	jne fail
	invoke MessageBox, NULL, addr MsgBoxWin, addr MsgBoxCaption, MB_OK
	invoke ExitProcess, NULL

end start