; char* selectfile(void);
_selectfile::
	push af ; af, bc, de, is are destroyed during selectfile system call
	push bc
	push de
	push ix
	call 0xB8C3 ; selectfile
	pop ix
	pop de
	pop bc
	jr c, _selectfile2 	
	pop af ; restore af
	ld hl, #0000 ; no file was selected
	ret
_selectfile2:: ; selected a file
	pop af  ; af must be restored in both cases
	ret

