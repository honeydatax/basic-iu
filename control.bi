dim shared sub1 as sub
public const pink=5
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
	count as integer
	dc as any ptr
	on_check as sub(as control)
	on_checks as sub(()as control)
	on_click as sub
	avalue as integer
	redraw as sub(as control)
	redraws as sub(()as control)
	creat as sub ptr
	size as integer
end type 

public type label
	controls as control
end type


public function textSize(s as string)as integer
	return len(s)*8
end function

public sub centerText(c1 as control)
		dim xx as integer
		dim xxx as integer
		xx=textSize(c1.caption)
		if xx<c1.w then
			xxx=(c1.w-xx)/8/2
			c1.caption=space(xxx)+c1.caption
		end if
end sub

public sub rigthText(c1 as control)
		dim xx as integer
		dim xxx as integer
		xx=textSize(c1.caption)
		if xx<c1.w then
			xxx=(c1.w-xx)/8
			xxx=xxx-1
			if xxx<1 then xxx=0
			c1.caption=space(xxx)+c1.caption
		end if
end sub




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

public sub optionRedraw(c1() as control)
	dim i as integer
	for i=0 to c1(0).count
		line c1(i).dc,(0,0)-(c1(0).w-1,c1(0).h-1),c1(0).bcolor,bf
		line c1(i).dc,(0,0)-(c1(0).w-1,c1(0).h-1),c1(0).colors,b
		draw string c1(i).dc,(5,5),c1(i).caption,c1(0).colors
		if c1(i).value<>0 then
			circle c1(i).dc,(18,18),8,c1(0).colors,,,,f
		end if
		put (c1(i).x,c1(i).y),c1(i).dc,pset
	next
end sub





public sub onOptionCheck(c1() as control)
	dim xx as integer
	dim yy as integer
	dim bb as integer
	dim res as integer
	dim i as integer
	dim ii as integer
	res=getmouse(xx,yy,,bb)
	if bb=1 then
		for i=0 to c1(0).count
			if xx>c1(i).x and yy>c1(i).y and xx<c1(i).x+c1(i).w and yy<c1(i).y+c1(i).h then
				for ii=0 to c1(0).count
					c1(ii).value=0
				next
				c1(i).value=1
				c1(0).avalue=i
				optionRedraw c1()
				c1(0).on_click()
			end if
		next
	end if
end sub 







public sub optionCreate(c1() as control)
	dim i as integer
	dim yy as integer
	yy=c1(0).y
	if c1(0).avalue>c1(0).count-1 then c1(0).avalue=0
	for i=0 to c1(0).count
		c1(i).count=c1(0).count
		c1(i).on_checks=procptr(onOptionCheck())
		c1(i).redraws=procptr(optionRedraw())
		c1(i).x=c1(0).x
		c1(i).y=yy
		c1(i).w=c1(0).w
		c1(i).h=c1(0).h
		c1(i).bcolor=c1(0).bcolor
		c1(i).colors=c1(0).colors
		if c1(0).avalue=i then
			c1(i).value=1
		else
			c1(i).value=0
		end if
		c1(i).dc=imagecreate(c1(0).w,c1(0).h,c1(0).bcolor)
		c1(i).on_check=procptr(oncheck())
		c1(i).redraw=procptr(labelRedraw())
		yy=yy+c1(0).h
	next
end sub

public sub percentRedraw(c1 as control)
	dim xx as integer
	dim xxx as integer
	line c1.dc,(0,0)-(c1.w-1,c1.h-1),c1.bcolor,bf
	line c1.dc,(0,0)-(c1.w-1,c1.h-1),c1.colors,b
	if c1.value < 0 then c1.value = 0
	if c1.value > 100 then c1.value = 100
		xx=(c1.w-10)
		if xx<1 then xx=1
		xxx=(xx*c1.value)/100
		line c1.dc,(5,5)-(5+xxx,c1.h-5),c1.colors,bf
	put (c1.x,c1.y),c1.dc,pset
end sub



public sub onPercentCheck(c1 as control)
	dim xx as integer
	dim yy as integer
	dim bb as integer
	dim res as integer
	res=getmouse(xx,yy,,bb)
	if bb=1 then
		if xx>c1.x and yy>c1.y and xx<c1.x+c1.w and yy<c1.y+c1.h then
			c1.on_click()
		end if
	end if
end sub 

public sub percentCreate(c1 as control)
	c1.dc=imagecreate(c1.w,c1.h,c1.bcolor)
	c1.on_check=procptr(onPercentCheck())
	c1.redraw=procptr(percentRedraw())
end sub

public sub destroydc(img as any ptr)
	imageDestroy(img)
end sub

public sub pictureRedraw(c1 as control)
	put (c1.x,c1.y),c1.dc,pset
end sub



public sub onPictureCheck(c1 as control)
	dim xx as integer
	dim yy as integer
	dim bb as integer
	dim res as integer
	res=getmouse(xx,yy,,bb)
	if bb=1 then
		if xx>c1.x and yy>c1.y and xx<c1.x+c1.w and yy<c1.y+c1.h then
			c1.on_click()
		end if
	end if
end sub 

public sub pictureCreate(c1 as control)
	c1.dc=imagecreate(c1.w,c1.h)
	bload c1.caption,c1.dc
	c1.on_check=procptr(onpicturecheck())
	c1.redraw=procptr(pictureRedraw())
end sub


public sub buttonUp()
	dim xx as integer
	dim yy as integer
	dim bb as integer
	dim res as integer
	res=getmouse(xx,yy,,bb)
	while bb=1
		res=getmouse(xx,yy,,bb)
	wend

end sub 


public sub on_start(colors as integer)
	screenres 640,480,4
	line (0,0)-(640,480),colors,bf
end sub 


