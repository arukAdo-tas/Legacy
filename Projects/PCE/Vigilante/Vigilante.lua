--Vigilante Enhanced HUD

gui.register( function ()

	agg.setFont("gse5x7")
	agg.lineColor(255,200,200,255)
	

--Colors
rgbgreen = {0,200,0,200} rgbyellow = {255,255,0,255} rgborange = {255,100,0,255} rgbpink = {255,0,255,255}
rgbcyan = {0,255,255,255} rgbFbox = {210,150,150,255} rgbred = {255,0,0,255} rgbblue = {0,100,255,255}
rgbblack = {0,0,0,255} rgbwhite = {255,255,255,255} rgbredjimmy = {255, 0, 100, 255} rgbbluekaze = {100,0,250,255}

	agg.setFont("gse5x7")					--font

--Kaze Infos
	-- 1 byte (memory.readbyte(0x1F0458) the timmer of kaze hp bar refill
	-- 1 byte (memory.readbyte(0x1F040A) hp bar
	-- 2 byte (memory.readbyte(0x1F0432) X kaze
	-- 2 byte (memory.readbyte(0x1F0433) another X kaze
	-- 2 byte (memory.readbyte(0x1F0434) Y kaze
	-- 2 byte (memory.readbyte(0x1F0435) another Y kaze

	KazeSpeed = (memory.readbyte(0x1F0421));
	KazeX = (memory.readword(0x1F0433));
	KazeX2 = (memory.readword(0x1F0432))/256;
	KazeY = (memory.readword(0x1F0435));
	KazeY2 = (memory.readword(0x1F0434))/256;
	KazeHP = (memory.readbyte(0x1F040A));
	KazeHPcounter = (memory.readbyte(0x1F0458));
	


	doSomeText(113, 15, ""..KazeHPcounter.."", rgbwhite[1], rgbwhite[2], rgbwhite[3], rgbwhite[4])
	doSomeText(42, 15, ""..KazeHP.."", rgbwhite[1], rgbwhite[2], rgbwhite[3], rgbwhite[4])
	doSomeText(48, 23, "X:"..KazeX.."", rgbwhite[1], rgbwhite[2], rgbwhite[3], rgbwhite[4])
--	doSomeText(48, 23, "Speed:"..KazeSpeed.."", rgbwhite[1], rgbwhite[2], rgbwhite[3], rgbwhite[4])
--	doSomeText(KazeX, KazeY2, ""..KazeY2.."", rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4])
	

--Input display
	Joy1 = joypad.read(1)
	doPlayerJoy(14, 0, Joy1, rgbbluekaze[1], rgbbluekaze[2], rgbbluekaze[3], rgbbluekaze[4], rgbwhite[1], rgbwhite[2], rgbwhite[3], rgbwhite[4])


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
