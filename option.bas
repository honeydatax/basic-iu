#include once "control.bi"
public sub onexits()
	beep 
	buttonUp()
end sub
dim shared redraws as sub(as control)
dim options(10) as control
dim color1 as integer=rose
dim n as integer

on_start color1

options(0).x=10
options(0).y=10
options(0).w=40
options(0).h=32
options(0).colors=white
options(0).bcolor=black
options(0).caption=""
options(0).count=10
optionCreate options()
options(0).redraws(options())
options(0).on_click=procptr(onexits)
while 1=1
	options(0).on_checks(options())
	sleep 200
	if inkey=chr(27) then system()
wend

for n=0 to options(0).count-1
	imagedestroy(options(0).dc)
next
