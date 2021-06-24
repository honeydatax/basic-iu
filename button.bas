#include once "control.bi"
public sub onexits()
	system()
end sub
dim shared redraws as sub(as control)
dim label1 as label
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
