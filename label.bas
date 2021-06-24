#include once "control.bi"
dim label1 as label
dim color1 as integer=5

on_start color1

label1.controls.x=10
label1.controls.y=10
label1.controls.w=100
label1.controls.h=32
label1.controls.colors=color1
label1.controls.bcolor=0
label1.controls.caption="hello world"
labelCreate label1.controls
label1.controls.redraw(label1.controls)

sleep 10000
