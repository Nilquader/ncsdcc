; char padserialwaiting(void);
_padserialwaiting::
	call 0xb86f ; padserialwaiting
	ld l, #0
	rl l ; rotate carry into l
	ret
