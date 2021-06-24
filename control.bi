dim shared sub1 as sub
public type control
	x as integer
	y as integer
	w as integer
	h as integer
	colors as integer
	bcolor as integer
	caption as string
	value as integer
	tag as string
	names as string
	dc as any ptr
	redraw as sub ptr
	creat as sub ptr
	size as integer
end type 

public type label
	controls as control
end type


public sub labelRedraw(c1 as control)
	line c1.dc,(c1.x,c1.y)-(c1.x+c1.w,c1.y+c1.h),c1.bcolor,bf
	line c1.dc,(c1.x,c1.y)-(c1.x+c1.w,c1.y+c1.h),c1.colors,b
	draw string c1.dc,(c1.x,c1.y),c1.caption,c1.colors
	put (c1.x,c1.y),c1.dc,pset
end sub

public sub labelCreate(c1 as control)
	c1.dc=imagecreate(c1.w,c1.h,c1.colors)
	c1.redraw=procptr(labelRedraw)
end sub

public sub on_start(colors as integer)
	screenres 640,480,4
	line (0,0)-(640,480),colors,bf
end sub 


