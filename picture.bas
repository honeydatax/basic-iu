#include once "control.bi"
dim shared picture1 as control

public sub onexits()
	destroydc(picture1.dc)
	system()
end sub

dim shared redraws as sub(as control)
dim color1 as integer=rose


on_start color1

picture1.x=10
picture1.y=10
picture1.w=64
picture1.h=64
picture1.colors=white
picture1.bcolor=black
picture1.caption="cube.bmp"
pictureCreate picture1
picture1.redraw(picture1)
picture1.on_click=procptr(onexits)
while 1=1
	picture1.on_check(picture1)
wend
