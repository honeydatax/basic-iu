#include once "control.bi"
dim shared redraws as sub(as control)
dim percents as control
dim color1 as integer=rose
dim i as integer

on_start color1

percents.x=10
percents.y=10
percents.w=150
percents.h=50
percents.colors=white
percents.bcolor=black
percents.caption=""
percents.value=0
percentCreate percents
for i=0 to 100 step 10
	percents.value=i
	percents.redraw(percents)
	sleep 500
next
sleep 10000
