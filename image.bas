#include once "control.bi"
dim shared image1 as control

public sub onexits()
	destroydc(image1.dc)
	system()
end sub

dim shared redraws as sub(as control)
dim color1 as integer=rose


on_start color1

image1.x=10
image1.y=10
image1.w=64
image1.h=64
image1.ww=128
image1.hh=128
image1.colors=white
image1.bcolor=black
image1.caption="cube.bmp"
imagesCreate image1
image1.redraw(image1)
image1.on_click=procptr(onexits)
while 1=1
	image1.on_check(image1)
wend
