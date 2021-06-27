#include once "control.bi"
dim shared redraws as sub(as control)
dim shared label1 as label
public sub onexits()
	imagedestroy(label1.controls.dc)
	system()
end sub
dim color1 as integer=rose


on_start color1

label1.controls.x=10
label1.controls.y=10
label1.controls.w=100
label1.controls.h=32
label1.controls.colors=white
label1.controls.bcolor=black
label1.controls.caption="exit"
labelCreate label1.controls
label1.controls.redraw(label1.controls)
label1.controls.on_click=procptr(onexits)
while 1=1
	label1.controls.on_check(label1.controls)
wend
