--Legend of Dekobogo Enhanced HUD

gui.register( function ()

	agg.setFont("gse5x7")
	agg.lineColor(255,200,200,255)
	

--Colors
rgbgreen = {0,200,0,200} rgbyellow = {255,255,0,255} rgborange = {255,100,0,255} rgbpink = {255,0,255,255}
rgbcyan = {0,255,255,255} rgbFbox = {210,150,150,255} rgbred = {255,0,0,255} rgbblue = {0,100,255,255}
rgbblack = {0,0,0,255} rgbwhite = {255,255,255,255} rgbredjimmy = {255, 0, 100, 255} rgbbluebimmy = {0,150,255,255}
	agg.setFont("gse6x9")					--lets draw differently
--Input display
--	agg.fillColor (0, 0, 0, 255)	agg.lineColor (0, 0, 0, 0)	agg.rectangle (10, 209, 245, 215)	agg.noFill()	--hide cars hp and put our infos

	Joy1 = joypad.read(1)
	doPlayerJoy(32,219, Joy1, rgbwhite[1], rgbwhite[2], rgbwhite[3], rgbwhite[4])
	--HP
	p1hp = (memory.readbyte(0x1F10C0));
	doSomeText(10, 223, ""..p1hp.."", rgbwhite[1], rgbwhite[2], rgbwhite[3], rgbwhite[4])

	Joy2 = joypad.read(2)
	doPlayerJoy(80,219, Joy2, rgborange[1], rgborange[2], rgborange[3], rgborange[4])
	--HP
	p2hp = (memory.readbyte(0x1F108B));
	doSomeText(58, 223, ""..p2hp.."", rgborange[1], rgborange[2], rgborange[3], rgborange[4])

	Joy3 = joypad.read(3)
	doPlayerJoy(128,219, Joy3, rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4])
	--HP
	p3hp = (memory.readbyte(0x1F10C4)); --wrong address...
	doSomeText(106, 223, ""..p3hp.."", rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4])

	Joy4 = joypad.read(4)
	doPlayerJoy(176,219, Joy4, rgbyellow[1], rgbyellow[2], rgbyellow[3], rgbyellow[4])
	--HP
	p4hp = (memory.readbyte(0x1F001F)); --wrong address...
	doSomeText(154, 223, ""..p4hp.."", rgbyellow[1], rgbyellow[2], rgbyellow[3], rgbyellow[4])

	Joy5 = joypad.read(5)
	doPlayerJoy(224,219, Joy5, rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])
	--HP
	p5hp = (memory.readbyte(0x1F001F)); --wrong address...
	doSomeText(202, 223, ""..p5hp.."", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])


	curFrame = emu.framecount()						--the current frame
	curmoviemode = movie.mode()						--the current movie mode
	moviesize = movie.length()
	if curmoviemode == "playback" then
	agg.fillColor (rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])	agg.lineColor (rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])	agg.triangle (181, 1, 188, 4, 181, 8)	agg.noFill()  --play symbol
 	doSomeText(190, 0, ""..curFrame.."", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4]) 				--draw current frame
	doSomeText(220, 0, "/"..moviesize.."", 0,255,0,255)								--draw movie size
	end
	if curmoviemode == "record" then
	agg.fillColor (rgbred[1], rgbred[2], rgbred[3], rgbred[4])	agg.lineColor (rgbred[1], rgbred[2], rgbred[3], rgbred[4])	agg.roundedRect (211, 1, 218, 8, 255)	agg.noFill()  --record symbol
 	doSomeText(190, 0, ""..curFrame.."", rgbred[1], rgbred[2], rgbred[3], rgbred[4]) 				--draw current frame
	end
	if curmoviemode == "inactive" then
	agg.fillColor (rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4])	agg.lineColor (rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4])	agg.roundedRect (211, 1, 218, 8, 1)	agg.noFill()  --stop symbol
 	doSomeText(220, 0, ""..curFrame.."", rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4]) 				--draw current frame
	end
	
	agg.setFont("verdana18_bold")
end)


function doSomeText(X, Y, Text, r, g, b, a)		--dumb drawing
	agg.lineColor(r, g, b, a)					--textcolor
	agg.text(X, Y, ""..Text.."")				--draw text
end

function doPlayerJoy(X, Y, Joy, r, g, b, a)
--container box
	agg.noFill ()							--Stop fill the box
	agg.lineColor(r, g, b, a)				--Outline color	
-- draw idle pad
				--left button, release
				doButton(X+2, Y+5, X+7, Y+9, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--right button, release
				doButton(X+11, Y+5, X+16, Y+9, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--up button, release
				doButton(X+7, Y+1, X+11, Y+7, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--down button, release
				doButton(X+7, Y+7, X+11, Y+13, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--select button, release
				doButton(X-15, Y-2, X-9, Y-6, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--run button, release
				doButton(X-7, Y-2, X-1, Y-6, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--I button, release
				doButton(X+2, Y-10, X+9, Y-2, 255, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--II button, release
				doButton(X+11, Y-10, X+18, Y-2, 255, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
-- now check if something is press...
		for key,value in pairs(Joy) do	
			--print(key..": "..tostring(value)) --debug
			if (key) == "Left" then
				--left button, hold
				doButton(X+2, Y+5, X+7, Y+9, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Right" then
				--right button, hold
				doButton(X+11, Y+5, X+16, Y+9, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Up" then
				--up button, hold
				doButton(X+7, Y+1, X+11, Y+7, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Down" then
				--down button, hold
				doButton(X+7, Y+7, X+11, Y+13, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Select" then
				--select button, hold
				doButton(X-15, Y-2, X-9, Y-6, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Run" then
				--run button, hold
				doButton(X-7, Y-2, X-1, Y-6, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "I" then
				--I button, hold
				doButton(X+2, Y-10, X+9, Y-2, 255, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "II" then
				--II button, hold
				doButton(X+11, Y-10, X+18, Y-2, 255, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			end
		end
--end
end
function doButton(X1, Y1, X2, Y2, Z, r, g, b, a, r2, g2, b2, a2)
				agg.fillColor(r, g, b, a)				--Inline color
				agg.lineColor(r2, g2, b2, a2)			--Outline color	
				agg.roundedRect (X1, Y1, X2, Y2, Z)
				agg.noFill ()							--Stop fill the box
end
