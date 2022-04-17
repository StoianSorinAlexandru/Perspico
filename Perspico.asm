.586
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern malloc: proc
extern memset: proc
extern exit: proc
extern printf: proc

includelib canvas.lib
include drawlib1.asm 
extern BeginDrawing: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
window_title DB "Exemplu proiect desenare",0
area_width EQU 640
area_height EQU 480
area DD 0
format2 db "%d", 13, 10,0

v1 DD 0
v2 DD 0 
v3 DD 0
v4 DD 0
my1 DD 0
my2 DD 0
x DD 0
y DD 0
poz0 DD 36
posmut DD 0
diff DD 0

;int_vector dd 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0
;;int_vector dd 3, 6, 8, 4, 2, 9, 12, 11, 5, 0, 1, 7, 13, 14, 10, 15
int_vector dd 3, 6, 8, 4, 2, 9, 12, 11, 5, 0, 1, 7, 13, 14, 10, 15
col dd 0

;;;;;;;;;;;;;;;;;;;
;indicii casutelor:  
;;;;;;;;;;;;;;;;;;;
cx0 EQU 144
cy0 EQU 64

cx1 EQU 240
cy1 EQU 64

cx2 EQU 336
cy2 EQU 64

cx3 EQU 432
cy3 EQU 64

cx4 EQU 144
cy4 EQU 160

cx5 EQU 240
cy5 EQU 160

cx6 EQU 336
cy6 EQU 160

cx7 EQU 432
cy7 EQU 160

cx8 EQU 144
cy8 EQU 256

cx9 EQU 240
cy9 EQU 256

cxA EQU 336
cyA EQU 256

cxB EQU 432
cyB EQU 256

cxC EQU 144
cyC EQU 352

cxD EQU 240
cyD EQU 352

cxE EQU 336
cyE EQU 352

cxF EQU 432
cyF EQU 352

;dimensiunea casutei
csize EQU 64
;;;;;;;;;;;;;;;;;;;

counter DD 0 ; numara evenimentele de tip timer

arg0 EQU 4
arg1 EQU 8
arg2 EQU 12
arg3 EQU 16
arg4 EQU 20
arg5 EQU 24
arg6 EQU 28
arg7 EQU 32

symbol_width EQU 10
symbol_height EQU 20
include digits.inc
include letters.inc

.code


FIND_BUTON macro v1, v2, x, y
local BUTON_0
local BUTON_1
local BUTON_2
local BUTON_3
local BUTON_4
local BUTON_5
local BUTON_6
local BUTON_7
local BUTON_8
local BUTON_9
local BUTON_A
local BUTON_B
local BUTON_C
local BUTON_D
local BUTON_E
local BUTON_F
local BUTON_SUCCED, BUTON_FAIL, PROGRAM_END

	push ecx
	push eax
	push ebx
	mov eax, v1
	
	BUTON_0:
		
		mov my1, 0; retinem un buton posibil
		mov my2, 0
		
		mov eax, v1
		cmp eax, cx0; comparam x-ul
		jl BUTON_FAIL; daca este mai mic inseamna ca nu e apasat nimic
		cmp eax, cx0+csize; comparam sa fie inauntru
		jg BUTON_1; daca e mai mare atunci poate este pe urmatoarea coloana
		mov eax, v2; verificam y
		cmp eax, cy0
		jl BUTON_FAIL; daca este mai mic inseamna ca nu e apasat nimic
		cmp eax, cy0+csize; comparam sa fie inauntru
		jg BUTON_4; daca e mai mare atunci poate este pe urmatoarea linie
		jle BUTON_SUCCED; am gasit in patratul corect
	
	BUTON_1:
	
		mov my1, 0
		mov my2, 1
		mov eax, v1
		cmp eax, cx1
		jl BUTON_FAIL
		cmp eax, cx1+csize
		jg BUTON_2
		mov eax, v2
		cmp eax, cy1
		jl BUTON_FAIL
		cmp eax, cy1+csize
		jg BUTON_5
		jle BUTON_SUCCED
		
	BUTON_2:
	
		mov my1, 0
		mov my2, 2
		mov eax, v1
		cmp eax, cx2
		jl BUTON_FAIL
		cmp eax, cx2+csize
		jg BUTON_3
		mov eax, v2
		cmp eax, cy2
		jl BUTON_FAIL
		cmp eax, cy2+csize
		jg BUTON_6
		jle BUTON_SUCCED
		
	BUTON_3:
	
		mov my1, 0
		mov my2, 3
		mov eax, v1
		cmp eax, cx3
		jl BUTON_FAIL
		cmp eax, cx3+csize
		jg BUTON_FAIL
		mov eax, v2
		cmp eax, cy3
		jl BUTON_FAIL
		cmp eax, cy3+csize
		jg BUTON_7
		jle BUTON_SUCCED
		
	BUTON_4:
	
		mov my1, 1
		mov my2, 0
		mov eax, v1
		cmp eax, cx4
		jl BUTON_FAIL
		cmp eax, cx4+csize
		jg BUTON_5
		mov eax, v2
		cmp eax, cy4
		jl BUTON_FAIL
		cmp eax, cy4+csize
		jg BUTON_8
		jle BUTON_SUCCED
		
	BUTON_5:
	
		mov my1, 1
		mov my2, 1
		mov eax, v1
		cmp eax, cx5
		jl BUTON_FAIL
		cmp eax, cx5+csize
		jg BUTON_6
		mov eax, v2
		cmp eax, cy5
		jl BUTON_FAIL
		cmp eax, cy5+csize
		jg BUTON_9
		jle BUTON_SUCCED
		
	BUTON_6:
	
		mov my1, 1
		mov my2, 2
		mov eax, v1
		cmp eax, cx6
		jl BUTON_FAIL
		cmp eax, cx6+csize
		jg BUTON_7
		mov eax, v2
		cmp eax, cy6
		jl BUTON_FAIL
		cmp eax, cy6+csize
		jg BUTON_A
		jle BUTON_SUCCED
		
	BUTON_7:
	
		mov my1, 1
		mov my2, 3
		mov eax, v1
		cmp eax, cx7
		jl BUTON_FAIL
		cmp eax, cx7+csize
		jg BUTON_FAIL
		mov eax, v2
		cmp eax, cy7
		jl BUTON_FAIL
		cmp eax, cy7+csize
		jg BUTON_B
		jle BUTON_SUCCED
		
	BUTON_8:
	
		mov my1, 2
		mov my2, 0
		mov eax, v1
		cmp eax, cx8
		jl BUTON_FAIL
		cmp eax, cx8+csize
		jg BUTON_9
		mov eax, v2
		cmp eax, cy8
		jl BUTON_FAIL
		cmp eax, cy8+csize
		jg BUTON_C
		jle BUTON_SUCCED
		
	BUTON_9:
	
		mov my1, 2
		mov my2, 1
		mov eax, v1
		cmp eax, cx9
		jl BUTON_FAIL
		cmp eax, cx9+csize
		jg BUTON_A
		mov eax, v2
		cmp eax, cy9
		jl BUTON_FAIL
		cmp eax, cy9+csize
		jg BUTON_D
		jle BUTON_SUCCED
		
	BUTON_A:
	
		mov my1, 2
		mov my2, 2
		mov eax, v1
		cmp eax, cxA
		jl BUTON_FAIL
		cmp eax, cxA+csize
		jg BUTON_B
		mov eax, v2
		cmp eax, cyA
		jl BUTON_FAIL
		cmp eax, cyA+csize
		jg BUTON_E
		jle BUTON_SUCCED
		
	BUTON_B:
	
		mov my1, 2
		mov my2, 3
		mov eax, v1
		cmp eax, cxB
		jl BUTON_FAIL
		cmp eax, cxB+csize
		jg BUTON_FAIL
		mov eax, v2
		cmp eax, cyB
		jl BUTON_FAIL
		cmp eax, cyB+csize
		jg BUTON_F
		jle BUTON_SUCCED
		
	
	BUTON_C:	

		mov my1, 3
		mov my2, 0
		mov eax, v1
		cmp eax, cxC
		jl BUTON_FAIL
		cmp eax, cxC+csize
		jg BUTON_D
		mov eax, v2
		cmp eax, cyC
		jl BUTON_FAIL
		cmp eax, cyC+csize
		jg BUTON_FAIL
		jle BUTON_SUCCED
		
	BUTON_D:
	
		mov my1, 3
		mov my2, 1
		mov eax, v1
		cmp eax, cxD
		jl BUTON_FAIL
		cmp eax, cxD+csize
		jg BUTON_E
		mov eax, v2
		cmp eax, cyD
		jl BUTON_FAIL
		cmp eax, cyD+csize
		jg BUTON_FAIL
		jle BUTON_SUCCED
		
	BUTON_E:
	
		mov my1, 3
		mov my2, 2
		mov eax, v1
		cmp eax, cxE
		jl BUTON_FAIL
		cmp eax, cxE+csize
		jg BUTON_F
		mov eax, v2
		cmp eax, cyE
		jl BUTON_FAIL
		cmp eax, cyE+csize
		jg BUTON_FAIL
		jle BUTON_SUCCED
		
	BUTON_F:	
	
		mov my1, 3
		mov my2, 3
		mov eax, v1
		cmp eax, cxF
		jl BUTON_FAIL
		cmp eax, cxF+csize
		jg BUTON_FAIL
		mov eax, v2
		cmp eax, cyF
		jl BUTON_FAIL
		cmp eax, cyF+csize
		jg BUTON_FAIL
		jle BUTON_SUCCED
	
	BUTON_FAIL:
		mov posmut, 2
		jmp PROGRAM_END
		
	BUTON_SUCCED:
		mov posmut, 1
		
		mov eax, my1
		mov ebx, 16
		mul ebx
		push eax
		mov eax, my2
		mov ebx, 4
		mul ebx
		mov ebx, eax
		pop eax
		add eax, ebx
		
		
	PROGRAM_END:
	
	mov eax, my1
	mov x, eax
	mov eax, my2
	mov y, eax
	
	pop ebx
	pop eax
	pop ecx
	
	
	
	
	
 endm

write_int_2 macro format, nr1

	push eax

	write_int format, nr1
	
	pop eax

endm

write_int macro format, nr1
	push nr1
	push offset format
	call printf
	add esp, 4
endm

write_int_3 macro x

	write_int_2 format2, x

endm 

; procedura make_text afiseaza o litera sau o cifra la coordonatele date
; arg1 - simbolul de afisat (litera sau cifra)
; arg2 - pointer la vectorul de pixeli
; arg3 - pos_x
; arg4 - pos_y
make_text proc
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp+arg1] ; citim simbolul de afisat
	cmp eax, 'A'
	jl make_digit
	cmp eax, 'Z'
	jg make_digit
	sub eax, 'A'
	lea esi, letters
	jmp draw_text
make_digit:
	cmp eax, '0'
	jl make_space
	cmp eax, '9'
	jg make_space
	sub eax, '0'
	lea esi, digits
	jmp draw_text
make_space:	
	mov eax, 26 ; de la 0 pana la 25 sunt litere, 26 e space
	lea esi, letters
	
draw_text:
	mov ebx, symbol_width
	mul ebx
	mov ebx, symbol_height
	mul ebx
	add esi, eax
	mov ecx, symbol_height
bucla_simbol_linii:
	mov edi, [ebp+arg2] ; pointer la matricea de pixeli
	mov eax, [ebp+arg4] ; pointer la coord y
	add eax, symbol_height
	sub eax, ecx
	mov ebx, area_width
	mul ebx
	add eax, [ebp+arg3] ; pointer la coord x
	shl eax, 2 ; inmultim cu 4, avem un DWORD per pixel
	add edi, eax
	push ecx
	mov ecx, symbol_width
bucla_simbol_coloane:
	cmp byte ptr [esi], 0
	je simbol_pixel_alb
	mov dword ptr [edi], 0
	jmp simbol_pixel_next
simbol_pixel_alb:
	mov dword ptr [edi], 0FFFFFFh
simbol_pixel_next:
	inc esi
	add edi, 4
	loop bucla_simbol_coloane
	pop ecx
	loop bucla_simbol_linii
	popa
	mov esp, ebp
	pop ebp
	ret
make_text endp

; un macro ca sa apelam mai usor desenarea simbolului
make_text_macro macro symbol, drawArea, x, y
	push y
	push x
	push drawArea
	push symbol
	call make_text
	add esp, 16
endm
; arg1 - x
; arg2 - y
; arg3 - culoare
draw_point proc
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp+arg2]
	mov ebx, area_width
	mul ebx
	add eax, [ebp+arg1]
	shl eax, 2
	mov ebx, area
	add eax, ebx
	mov ebx, [ebp+arg3]
	mov dword ptr[eax], ebx
	
	popa
	mov esp, ebp
	pop ebp
	ret

draw_point endp

draw_point_macro macro x, y, color

	push color
	push y
	push x
	call draw_point
	add esp, 12

endm
; arg1 - x
; arg2 - y
; arg3 - culoare
; arg4 - lungime
draw_line_horizontal proc

	push ebp
	mov ebp, esp
	pusha
	
	mov ecx, [ebp+arg4]
	

	bucla_desen1:
		
		
		
		draw_point_macro [ebp+arg1], [ebp+arg2], [ebp+arg3]
		
		inc dword ptr[ebp+arg1]
		
	loop bucla_desen1

	popa
	mov esp, ebp
	pop ebp
	ret 
draw_line_horizontal endp

draw_line_horizontal_macro macro x, y, cul, lung
	
	push lung
	push cul
	push y
	push x
	call draw_line_horizontal
	
	add esp, 16

 endm
; arg1 - x
; arg2 - y
; arg3 - culoare
; arg4 - lungime
draw_line_vertical proc

	push ebp
	mov ebp, esp
	pusha
	
	mov ecx, [ebp+arg4]
	

	bucla_desen2:
		
		
		draw_point_macro [ebp+arg1], [ebp+arg2], [ebp+arg3]
		
		inc dword ptr[ebp+arg2]
		
		
	loop bucla_desen2

	popa
	mov esp, ebp
	pop ebp
	ret 
draw_line_vertical endp

draw_line_vertical_macro macro x, y, cul, lung
	
	push lung
	push cul
	push y
	push x
	call draw_line_vertical
	
	add esp, 16

endm
 
; arg1 - x
; arg2 - y
; arg3 - culoare
; arg4 - lungime
; arg5 - latime
draw_box_full proc
 
	push ebp
	mov ebp, esp
	pusha
	
	mov ecx, [ebp+arg5]
	
	bucla_desen3:
	
		draw_line_horizontal_macro [ebp+arg1], [ebp+arg2], [ebp+arg3], [ebp+arg4] 
		
		inc dword ptr [ebp+arg2]
	
	loop bucla_desen3
	
	popa
	mov esp, ebp
	pop ebp
	ret 
 
draw_box_full endp

draw_box_macro macro x, y, culoare, lungime, latime

	push latime
	push lungime
	push culoare
	push y
	push x
	
	call draw_box_full
	
	add esp, 20

endm

;;;;	33FFF9h - gri
;;;;	33FF90h - mustar
;;;; sunt daltonist si nu vad bine culorile:)))
; functia de desenare - se apeleaza la fiecare click
; sau la fiecare interval de 200ms in care nu s-a dat click
; arg1 - evt (0 - initializare, 1 - click, 2 - s-a scurs intervalul fara click)
; arg2 - x
; arg3 - y

show_on_board macro nr, x1, x2
local AFIS_0, AFIS_1, AFIS_2
local END_AFIS

	mov eax, nr

	cmp eax, 0
	je AFIS_0
	cmp eax, 10
	jl AFIS_1
	jmp AFIS_2
	
	AFIS_1:
	
		draw_box_macro x1-26, x2-10, 0FFh, 64, 64
		mov edx, 0
		div ebx
		add edx, '0'
		make_text_macro edx, area, x1, x2
	
		jmp END_AFIS
	
	AFIS_2:
	
		draw_box_macro x1-26, x2-10, 0FFh, 64, 64
		mov edx, 0
		div ebx
		add edx, '0'
		make_text_macro edx, area, x1+5, x2
		mov edx, 0
		div ebx
		add edx, '0'
		make_text_macro edx, area, x1-5, x2
	
		jmp END_AFIS
	
	AFIS_0:
	
		draw_box_macro x1-26, x2-10, 0, 64, 64
	
		jmp END_AFIS
	
	END_AFIS:
	
endm

swap2 macro int_vector, nr1, nr2

	lea esi, int_vector
	push eax
	push ebx

	mov eax, nr1
	mov ebx, nr2
	
	push [esi+eax]
	push [esi+ebx]
	pop [esi+eax]
	pop [esi+ebx]
	
	pop ebx 
	pop eax
	
endm

draw proc
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp+arg1]
	cmp eax, 1
	jz evt_click
	cmp eax, 2
	jz evt_timer ; nu s-a efectuat click pe nimic
	;mai jos e codul care intializeaza fereastra cu pixeli albi
	mov eax, area_width
	mov ebx, area_height
	mul ebx
	shl eax, 2
	push eax
	push 255
	push area
	call memset
	add esp, 12
	
	;;;desenam fundalul
	draw_box_macro 0, 0, 33FF90h, 640, 480
	draw_box_macro 80, 0, 0FFh, 480, 480
	draw_box_macro 80, 0, 33FFF9h, 480, 64
	draw_box_macro 80, 416, 33FFF9h, 480, 64
	draw_box_macro 80, 0, 33FFF9h, 64, 480
	draw_box_macro 496, 0, 33FFF9h, 64, 480
	
	draw_box_macro 144, 128, 33FFF9h, 352, 32
	draw_box_macro 144, 224, 33FFF9h, 352, 32
	draw_box_macro 144, 320, 33FFF9h, 352, 32
	
	draw_box_macro 208, 64, 33FFF9h, 32, 352
	draw_box_macro 304, 64, 33FFF9h, 32, 352
	draw_box_macro 400, 64, 33FFF9h, 32, 352
	
	jmp afisare_litere
	
evt_click:

	push eax
	mov eax, [ebp+arg2]
	mov v1, eax
	mov eax, [ebp+arg3]
	mov v2, eax
	FIND_BUTON v1, v2, v3, v4
	
	mov eax, 1
	cmp eax, posmut
	jne NOT_OK
	
	
	
	mov ebx, 10
	mov eax, posmut
	mov edx, 0
	div ebx
	add edx, '0'
	;make_text_macro edx, area, 100, 100
	
	pop eax
	mov ebx, 10
	mov eax, v3
	mov edx, 0
	div ebx
	add edx, '0'
	;make_text_macro edx, area, 100, 10
	mov eax, v4
	mov edx, 0
	div ebx
	add edx, '0'
	;make_text_macro edx, area, 110, 10
	
	mov eax, v3
	mov ebx, 16
	mul ebx
	push eax
	
	mov eax, v4
	mov ebx, 4
	mul ebx
	mov ebx ,eax
	pop eax
	add eax, ebx
	
	push eax
	sub eax, poz0
	cmp eax, 4
	je POSIBIL
	
	cmp eax, -4
	je POSIBIL
	
	cmp eax, 16
	je POSIBIL
	
	cmp eax, -16
	je POSIBIL
	
	pop eax
	jmp IMPOSIBIL
	
	POSIBIL:
	pop eax
	swap2 int_vector,eax, poz0
	mov poz0, eax
	
	IMPOSIBIL:
	
	inc counter
	jmp afisare_litere
	
	NOT_OK:
		pop eax
		jmp afisare_litere
	
evt_timer:

	
	inc counter
	
afisare_litere:
	;afisam valoarea counter-ului curent (sute, zeci si unitati)
	mov ebx, 10
	mov eax, counter
	;cifra unitatilor
	mov edx, 0
	div ebx
	add edx, '0'
	make_text_macro edx, area, 30, 10
	;cifra zecilor
	mov edx, 0
	div ebx
	add edx, '0'
	make_text_macro edx, area, 20, 10
	;cifra sutelor
	mov edx, 0
	div ebx
	add edx, '0'
	make_text_macro edx, area, 10, 10
	lea esi, int_vector
	mov ecx, 0
	show_on_board [esi+4*ecx], 170, 74
	inc ecx
	show_on_board [esi+4*ecx], 266, 74
	inc ecx
	show_on_board [esi+4*ecx], 362, 74
	inc ecx
	show_on_board [esi+4*ecx], 458, 74
	inc ecx
	show_on_board [esi+4*ecx], 170, 170
	inc ecx
	show_on_board [esi+4*ecx], 266, 170
	inc ecx
	show_on_board [esi+4*ecx], 362, 170
	inc ecx
	show_on_board [esi+4*ecx], 458, 170
	inc ecx
	show_on_board [esi+4*ecx], 170, 266
	inc ecx
	show_on_board [esi+4*ecx], 266, 266
	inc ecx
	show_on_board [esi+4*ecx], 362, 266
	inc ecx
	show_on_board [esi+4*ecx], 458, 266
	inc ecx
	show_on_board [esi+4*ecx], 170, 362
	inc ecx
	show_on_board [esi+4*ecx], 266, 362
	inc ecx
	show_on_board [esi+4*ecx], 362, 362
	inc ecx
	show_on_board [esi+4*ecx], 458, 362
	inc ecx
	
final_draw:
	popa
	mov esp, ebp
	pop ebp
	ret
draw endp



start:
	;alocam memorie pentru zona de desenat
	mov eax, area_width
	mov ebx, area_height
	mul ebx
	shl eax, 2
	push eax
	call malloc
	add esp, 4
	mov area, eax
	;apelam functia de desenare a ferestrei
	; typedef void (*DrawFunc)(int evt, int x, int y);
	; void __cdecl BeginDrawing(const char *title, int width, int height, unsigned int *area, DrawFunc draw);
	push offset draw
	push area
	push area_height
	push area_width
	push offset window_title
	call BeginDrawing
	add esp, 20
	
	;terminarea programului
	push 0
	call exit
end start
