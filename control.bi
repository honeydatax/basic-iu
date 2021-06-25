dim shared sub1 as sub
public const rose=5
public const white=15
public const black=0
public const texth=8
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
	on_check as sub(as control)
	on_click as sub
	avalue as integer
	redraw as sub(as control)
	creat as sub ptr
	size as integer
end type 

public type label
	controls as control
end type


public function textSize(s as string)as integer
	return len(s)*8
end function

public sub labelRedraw(c1 as control)
	line c1.dc,(0,0)-(c1.w-1,c1.h-1),c1.bcolor,bf
	line c1.dc,(0,0)-(c1.w-1,c1.h-1),c1.colors,b
	draw string c1.dc,(5,5),c1.caption,c1.colors
	if c1.avalue<>0 and c1.value<>0 then
		line c1.dc,(0,0)-(c1.w-1,c1.h-1),c1.colors
		line c1.dc,(0,c1.h-1)-(c1.w-1,0),c1.colors
	end if
	put (c1.x,c1.y),c1.dc,pset
end sub

public sub oncheck(c1 as control)
	dim xx as integer
	dim yy as integer
	dim bb as integer
	dim res as integer
	res=getmouse(xx,yy,,bb)
	if bb=1 then
		if xx>c1.x and yy>c1.y and xx<c1.x+c1.w and yy<c1.y+c1.h then
			if c1.avalue<>0 then
				c1.value=c1.value+1
				if c1.value<>1 AND c1.value<>0 then c1.value=0
				labelRedraw c1
			end if 
			c1.on_click()
		end if
	end if
end sub 

public sub labelCreate(c1 as control)
	c1.dc=imagecreate(c1.w,c1.h,c1.bcolor)
	c1.on_check=procptr(oncheck())
	c1.redraw=procptr(labelRedraw())
end sub


public sub on_start(colors as integer)
	screenres 640,480,4
	line (0,0)-(640,480),colors,bf
end sub 


