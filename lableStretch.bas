#include once "control.bi"
dim shared labelTXT1 as control

public sub onexits()
	destroydc(labelTXT1.dc)
	system()
end sub

dim shared redraws as sub(as control)
dim color1 as integer=rose


on_start color1

labelTXT1.x=10
labelTXT1.y=10
labelTXT1.w=120
labelTXT1.h=20
labelTXT1.ww=240
labelTXT1.hh=80
labelTXT1.colors=white
labelTXT1.bcolor=black
labelTXT1.caption="hello world..."
lbtxtCreate labelTXT1
labelTXT1.redraw(labelTXT1)
labelTXT1.on_click=procptr(onexits)
while 1=1
	labelTXT1.on_check(labelTXT1)
wend
