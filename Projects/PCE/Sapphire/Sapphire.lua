--Sapphire Enhanced HUD

gui.register( function ()

	agg.setFont("gse5x7")
	agg.lineColor(255,200,200,255)
	

--Colors
rgbgreen = {0,200,0,200} rgbyellow = {255,255,0,255} rgborange = {255,100,0,255} rgbpink = {255,0,255,255}
rgbcyan = {0,255,255,255} rgbFbox = {210,150,150,255} rgbred = {255,0,0,255} rgbblue = {0,100,255,255}
rgbblack = {0,0,0,255} rgbwhite = {255,255,255,255} rgb1p = {255,0,40,255} rgb2p = {0,100,255,255}
--hide players scores bars so we can put our own stuff
	agg.fillColor (0, 0, 0, 255)	agg.lineColor (0, 0, 0, 0)	agg.rectangle (0, 210, 256, 231)	agg.noFill()


	agg.setFont("gse5x7")					--font

-- X P1 0010A016  1byte (over 127 goes negative)
-- Y P1 0010A012  1byte (over 127 goes negative)
-- P1 BOMBS 0010A086 1byte
-- P1 POWERUP 0010A056 1byte (0010AE4B <- not sure what this)
-- BOMB FLAG ? 0010BEF3



	Xp1z = memory.readbyte(0x10A016)*2-44	--fixme
	Yp1z = memory.readbyte(0x10A012)*2-48	--fixme
	Xp1 = memory.readbyte(0x10A016)
	Yp1 = memory.readbyte(0x10A012)
	Bp1 = memory.readbyte(0x10A086)
	Pp1 = memory.readbyte(0x10A056)
	Sp1 = memory.readbyte(0x10A056)

 memory.writebyte(0x10A056, 0)

	Xp2z = memory.readbyte(0x10A017)*2-44	--fixme
	Yp2z = memory.readbyte(0x10A013)*2-48	--fixme
	Xp2 = memory.readbyte(0x10A017)
	Yp2 = memory.readbyte(0x10A013)
	Bp2 = memory.readbyte(0x10A087)
	Pp2 = memory.readbyte(0x10A057)
	Sp2 = memory.readbyte(0x10A057)

	doSomeText(Xp1z, Yp1z-7, "X:"..Xp1.."", rgb1p[1], rgb1p[2], rgb1p[3], rgb1p[4])
	doSomeText(Xp1z, Yp1z-14, "Y:"..Yp1.."", rgb1p[1], rgb1p[2], rgb1p[3], rgb1p[4])
	doSomeText(27, 210, "P1", rgb1p[1], rgb1p[2], rgb1p[3], rgb1p[4])
	doSomeText(115, 210, "Bombs:"..Bp1.."", rgb1p[1], rgb1p[2], rgb1p[3], rgb1p[4])
	doSomeText(155, 210, "Score:"..Sp1.."", rgb1p[1], rgb1p[2], rgb1p[3], rgb1p[4])
	doSomeText(10, 224, "Power:"..Pp1.."", rgb1p[1], rgb1p[2], rgb1p[3], rgb1p[4])
	
	doSomeText(Xp2z, Yp2z-7, "X:"..Xp2.."", rgb2p[1], rgb2p[2], rgb2p[3], rgb2p[4])
	doSomeText(Xp2z, Yp2z-14, "Y:"..Yp2.."", rgb2p[1], rgb2p[2], rgb2p[3], rgb2p[4])
	doSomeText(82, 210, "P2", rgb2p[1], rgb2p[2], rgb2p[3], rgb2p[4])
	doSomeText(115, 217, "Bombs:"..Bp2.."", rgb2p[1], rgb2p[2], rgb2p[3], rgb2p[4])
	doSomeText(155, 217, "Score:"..Sp2.."", rgb2p[1], rgb2p[2], rgb2p[3], rgb2p[4])
	doSomeText(65, 224, "Power:"..Pp2.."", rgb2p[1], rgb2p[2], rgb2p[3], rgb2p[4])

--Input display
	Joy1 = joypad.read(1)
	doPlayerJoy(1, 210, Joy1, rgb1p[1], rgb1p[2], rgb1p[3], rgb1p[4], rgb1p[1], rgb1p[2], rgb1p[3], rgb1p[4])
	Joy2 = joypad.read(2)
	doPlayerJoy(56, 210, Joy2, rgb2p[1], rgb2p[2], rgb2p[3], rgb2p[4], rgb2p[1], rgb2p[2], rgb2p[3], rgb2p[4])


	--HP


	agg.setFont("gse6x9")					--font
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
 	doSomeText(220, 0, ""..curFrame.."", rgbred[1], rgbred[2], rgbred[3], rgbred[4]) 				--draw current frame
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

function doPlayerJoy(X, Y, Joy, r, g, b, a, r2, g2, b2, a2)
--container box
	agg.noFill ()							--Stop fill the box
	agg.lineColor(r, g, b, a)				--Outline color	
-- draw idle pad
				--left button, release
				doButton(X+2, Y+4, X+9, Y+9, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--right button, release
				doButton(X+15, Y+4, X+22, Y+9, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--up button, release
				doButton(X+9, Y+1, X+15, Y+7, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--down button, release
				doButton(X+9, Y+7, X+15, Y+13, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--select button, release
				doButton(X+23, Y+8, X+29, Y+12, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--run button, release
				doButton(X+31, Y+8, X+37, Y+12, 1, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--I button, release
				doButton(X+38, Y+3, X+45, Y+11, 255, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
				--II button, release
				doButton(X+47, Y+3, X+54, Y+11, 255, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4], r, g, b, a)
-- now check if something is press...
		for key,value in pairs(Joy) do	
			--print(key..": "..tostring(value)) --debug
			if (key) == "Left" then
				--left button, hold
				doButton(X+2, Y+4, X+9, Y+9, 1, r2, g2, b2, a2, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Right" then
				--right button, hold
				doButton(X+15, Y+4, X+22, Y+9, 1, r2, g2, b2, a2, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Up" then
				--up button, hold
				doButton(X+9, Y+1, X+15, Y+7, 1, r2, g2, b2, a2, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Down" then
				--down button, hold
				doButton(X+9, Y+7, X+15, Y+13, 1, r2, g2, b2, a2, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Select" then
				--select button, hold
				doButton(X+23, Y+8, X+29, Y+12, 1, r2, g2, b2, a2, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Run" then
				--run button, hold
				doButton(X+31, Y+8, X+37, Y+12, 1, r2, g2, b2, a2, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "I" then
				--I button, hold
				doButton(X+38, Y+3, X+45, Y+11, 255, r2, g2, b2, a2, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "II" then
				--II button, hold
				doButton(X+47, Y+3, X+54, Y+11, 255, r2, g2, b2, a2, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
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
