'Yuya Oguchi
'Intermediate Programming
'Mr.Randell
'MicroBric


symbol KEY_UP = 16
symbol KEY_DOWN = 17
symbol KEY_LEFT = 19
symbol KEY_RIGHT = 18
symbol KEY_MINUS = 98
symbol KEY_PLUS = 11
symbol KEY_DIAG_CROSS = 20
symbol MID_LEVEL = 65 'define mid point of color

main:
if pinC.1 = 1 then doLeft 'corrision detection left
if pinC.3 = 1 then doRight 'corrision detection right

if pinC.1 = 0 and pinC.3 = 0 then'line tracking
	readadc 8, b1
if b1 < MID_LEVEL Then
	pause 300
	backward A
	backward B
	pause 500
end if
end if


irin B.0, b1
select case b1 
case KEY_UP 'for when the up arrow is pressed
	forward A
	forward B
if pinC.1 = 1 then doLeft
if pinC.3 = 1 then doRight
if pinC.1 = 0 and pinC.3 = 0 then
	readadc 8, b1
if b1 < MID_LEVEL Then
	pause 300
	backward A
	backward B
	pause 500
end if
end if

	case KEY_DOWN 'for when the down arrow is pressed
	backward A
	backward B
if pinC.1 = 1 then doLeft
if pinC.3 = 1 then doRight
if pinC.1 = 0 and pinC.3 = 0 then
readadc 8, b1
if b1 < MID_LEVEL Then
	pause 300
	backward A
	backward B
	pause 500
end if
end if

case KEY_LEFT'for when left arrow is pressed
	backward A
	forward B
if pinC.1 = 1 then doLeft
if pinC.3 = 1 then doRight
if pinC.1 = 0 and pinC.3 = 0 then
	readadc 8, b1
if b1 < MID_LEVEL Then
	pause 300
	backward A
	backward B
	pause 500
end if
end if

	case KEY_RIGHT'for when right arrow is pressed
	forward A
	backward B
if pinC.1 = 1 then doLeft
if pinC.3 = 1 then doRight
if pinC.1 = 0 and pinC.3 = 0 then
	readadc 8, b1
if b1 < MID_LEVEL Then
	pause 300
	backward A
	backward B
	pause 500
end if
end if

	case KEY_MINUS'for when the minus key is pressed
	low B.1, B.3
if pinC.1 = 1 then doLeft
if pinC.3 = 1 then doRight
if pinC.1 = 0 and pinC.3 = 0 then
	readadc 8, b1
if b1 < MID_LEVEL Then
	pause 300
	backward A
	backward B
	pause 500
end if
end if

case KEY_PLUS 'For when plus key is pressed
	high B.1, B.3
play B.2,0
if pinC.1 = 1 then doLeft
if pinC.3 = 1 then doRight
if pinC.1 = 0 and pinC.3 = 0 then
	readadc 8, b1
if b1 < MID_LEVEL Then
	pause 300
	backward A
	backward B
	pause 500
end if
end if

case KEY_DIAG_CROSS'for when cross key is pressed
	halt A
	halt B
if pinC.1 = 1 then doLeft
if pinC.3 = 1 then doRight
if pinC.1 = 0 and pinC.3 = 0 then
	readadc 8, b1
if b1 < MID_LEVEL Then
	pause 300
	backward A
	backward B
	pause 500
end if
end if
end select

goto main

doLeft:'left corrision detection
pause 320
backward A 
backward B
sound B.2,(50,100)
pause 1000
forward A 
backward B
pause 500
goto main

doRight:'Right corrision detection
pause 320
backward A 
backward B
sound B.2,(50,100) 
pause 1000
backward A 
forward B
pause 500
goto main