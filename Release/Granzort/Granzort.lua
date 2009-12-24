--Granzort Enhanced HUD

gui.register( function ()

	agg.setFont("gse5x7")
	agg.lineColor(255,200,200,255)
	

--Colors
rgbgreen = {0,255,0,255} rgbyellow = {255,255,0,255} rgborange = {255,100,0,255} rgbpink = {255,0,255,255}
rgbcyan = {0,255,255,255} rgbFbox = {210,150,150,255} rgbred = {255,0,0,255} rgbblue = {0,0,255,255}
rgbblack = {0,0,0,255} rgbwhite = {255,255,255,255} rgbredjimmy = {255, 0, 100, 255} rgbbluebimmy = {0,150,255,255}
	agg.setFont("gse6x9")					--lets draw differently
--Input display
	Joy1 = joypad.read(1)
	doPlayerJoy(-1,219, Joy1, rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])
--Player MP
	playerMP = memory.readbyte(0x1f0376)
	doSomeText(42, 202, ""..playerMP.."", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])
--boss HP
	bossHP = 0
	boss1HP = memory.readbyte(0x1f1714)
	if boss1HP > 0 and boss1HP < 21 then bossHP = boss1HP end
	doSomeText(135, 223, "Boss:", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])
	doSomeText(167, 223, ""..bossHP.."", rgbred[1], rgbred[2], rgbred[3], rgbred[4])
--speed
	speedH = memory.readbyte(0x1f0386)
	if speedH == 251 then speedH = 5 end
	if speedH == 252 then speedH = 4 end
	if speedH == 253 then speedH = 3 end
	if speedH == 254 then speedH = 2 end
	if speedH == 255 then speedH = 1 end
	doSomeText(57, 223, "Speed H:", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])
	doSomeText(105, 223, ""..speedH.."", rgbred[1], rgbred[2], rgbred[3], rgbred[4])
	speedV = memory.readbyte(0x1f0384)
	if speedV == 248 then speedV = 8 end
	if speedV == 249 then speedV = 7 end
	if speedV == 250 then speedV = 6 end
	if speedV == 251 then speedV = 5 end
	if speedV == 252 then speedV = 4 end
	if speedV == 253 then speedV = 3 end
	if speedV == 254 then speedV = 2 end
	if speedV == 255 then speedV = 1 end
	doSomeText(113, 223, "V:", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])
	doSomeText(125, 223, ""..speedV.."", rgbred[1], rgbred[2], rgbred[3], rgbred[4])

	
	curFrame = emu.framecount()						--the current frame
	curmoviemode = movie.mode()						--the current movie mode
	moviesize = movie.length()
	if curmoviemode == "playback" then
	agg.fillColor (rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])	agg.lineColor (rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])	agg.triangle (181, 224, 188, 227, 181, 231)	agg.noFill()  --play symbol
 	doSomeText(190, 223, ""..curFrame.."", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4]) 				--draw current frame
	doSomeText(220, 223, "/"..moviesize.."", 0,255,0,255)								--draw movie size
	end
	if curmoviemode == "record" then
	agg.fillColor (rgbred[1], rgbred[2], rgbred[3], rgbred[4])	agg.lineColor (rgbred[1], rgbred[2], rgbred[3], rgbred[4])	agg.roundedRect (181, 224, 188, 231, 255)	agg.noFill()  --record symbol
 	doSomeText(190, 223, ""..curFrame.."", rgbred[1], rgbred[2], rgbred[3], rgbred[4]) 				--draw current frame
	end
	if curmoviemode == "inactive" then
	agg.fillColor (rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4])	agg.lineColor (rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4])	agg.roundedRect (181, 224, 188, 231, 1)	agg.noFill()  --stop symbol
 	doSomeText(190, 223, ""..curFrame.."", rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4]) 				--draw current frame
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
				doButton(X+2, Y+4, X+9, Y+9, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Right" then
				--right button, hold
				doButton(X+15, Y+4, X+22, Y+9, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Up" then
				--up button, hold
				doButton(X+9, Y+1, X+15, Y+7, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Down" then
				--down button, hold
				doButton(X+9, Y+7, X+15, Y+13, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Select" then
				--select button, hold
				doButton(X+23, Y+8, X+29, Y+12, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "Run" then
				--run button, hold
				doButton(X+31, Y+8, X+37, Y+12, 1, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "I" then
				--I button, hold
				doButton(X+38, Y+3, X+45, Y+11, 255, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
			elseif (key) == "II" then
				--II button, hold
				doButton(X+47, Y+3, X+54, Y+11, 255, r, g, b, a, rgbblack[1], rgbblack[2], rgbblack[3], rgbblack[4])
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
