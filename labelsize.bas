#include once "control.bi"
dim shared redraws as sub(as control)
dim label1 as label
dim color1 as integer=rose


on_start color1

label1.controls.caption="hello world"
label1.controls.x=10
label1.controls.y=10
label1.controls.w=textSize(label1.controls.caption)+10
label1.controls.h=texth+10
label1.controls.colors=white
label1.controls.bcolor=black
labelCreate label1.controls
label1.controls.redraw(label1.controls)


sleep 10000
imagedestroy(label1.controls.dc)
