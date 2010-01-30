--Legend of Dekobogo Enhanced HUD

gui.register( function ()

	agg.setFont("gse5x7")
	agg.lineColor(255,200,200,255)
	

--Colors
rgbgreen = {0,200,0,200} rgbyellow = {255,255,0,255} rgborange = {255,100,0,255} rgbpink = {255,0,255,255}
rgbcyan = {0,255,255,255} rgbFbox = {210,150,150,255} rgbred = {255,0,0,255} rgbblue = {0,100,255,255}
rgbblack = {0,0,0,255} rgbwhite = {255,255,255,255} rgbredjimmy = {255, 0, 100, 255} rgbbluebimmy = {0,150,255,255}

--	agg.setFont("gse6x9")					--font
	agg.setFont("gse5x7")					--font
--hide players hp bars so we can put our own stuff
	agg.fillColor (0, 0, 0, 255)	agg.lineColor (0, 0, 0, 0)	agg.rectangle (10, 209, 245, 215)	agg.noFill()

--Players Infos
	p1hp = (memory.readbyte(0x1F10C0));
	p1scroll = (memory.readword(0x1F1008));
	p1Y = (memory.readword(0x1F1004))/p1scroll-61;
	p1X = (memory.readword(0x1F1006))/p1scroll-30;
	p2hp = (memory.readbyte(0x1F10C4));
	p2scroll = (memory.readword(0x1F1018));
	p2Y = (memory.readword(0x1F1014))/p2scroll-61;
	p2X = (memory.readword(0x1F1016))/p2scroll-30;
	p3hp = (memory.readbyte(0x1F108B));
	p3scroll = (memory.readword(0x1F1028));
	p3Y = (memory.readword(0x1F1024))/p3scroll-61;
	p3X = (memory.readword(0x1F1026))/p3scroll-30;
	p4hp = (memory.readbyte(0x1F10CC));
	p4scroll = (memory.readword(0x1F1038));
	p4Y = (memory.readword(0x1F1034))/p4scroll-61;
	p4X = (memory.readword(0x1F1036))/p4scroll-30;
	p5hp = (memory.readbyte(0x1F10D0));
	p5scroll = (memory.readword(0x1F1048));
	p5Y = (memory.readword(0x1F1044))/p5scroll-61;
	p5X = (memory.readword(0x1F1046))/p5scroll-30;
	cpuhp = (memory.readbyte(0x1F10D4));
	cpuscroll = (memory.readword(0x1F1058));
	cpuY = (memory.readword(0x1F1054))/cpuscroll-61;
	cpuX = (memory.readword(0x1F1056))/cpuscroll-30;

--Input display
	Joy1 = joypad.read(1)
	Joy2 = joypad.read(2)
	Joy3 = joypad.read(3)
	Joy4 = joypad.read(4)
	Joy5 = joypad.read(5)
	doPlayerJoy(0,219, Joy1, rgbwhite[1], rgbwhite[2], rgbwhite[3], rgbwhite[4])
	doPlayerJoy(48,219, Joy2, rgborange[1], rgborange[2], rgborange[3], rgborange[4])
	doPlayerJoy(96,219, Joy3, rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4])
	doPlayerJoy(144,219, Joy4, rgbyellow[1], rgbyellow[2], rgbyellow[3], rgbyellow[4])
	doPlayerJoy(192,219, Joy5, rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])


	--HP
	doSomeText(p1X-2, p1Y+12, ""..p1hp.."", rgbwhite[1], rgbwhite[2], rgbwhite[3], rgbwhite[4])
	doSomeText(p2X-2, p2Y+12, ""..p2hp.."", rgborange[1], rgborange[2], rgborange[3], rgborange[4])
	doSomeText(p3X-2, p3Y+12, ""..p3hp.."", rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4])
	doSomeText(p4X-2, p4Y+12, ""..p4hp.."", rgbyellow[1], rgbyellow[2], rgbyellow[3], rgbyellow[4])
	doSomeText(p5X-2, p5Y+12, ""..p5hp.."", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])
	doSomeText(cpuX-2, cpuY+12, ""..cpuhp.."", 100, 100, 100, 100)

	-- 2 bytes (memory.readbyte(0x1F1004) (memory.readbyte(0x1F1014) (memory.readbyte(0x1F1024) (memory.readbyte(0x1F1034) (memory.readbyte(0x1F1044) (memory.readbyte(0x1F1054)

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
				doButton(X+20, Y-2, X+26, Y-6, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--run button, release
				doButton(X+28, Y-2, X+34, Y-6, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
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
				doButton(X+20, Y-2, X+26, Y-6, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Run" then
				--run button, hold
				doButton(X+28, Y-2, X+34, Y-6, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
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
