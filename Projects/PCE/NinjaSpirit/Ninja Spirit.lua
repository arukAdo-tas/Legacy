--Ninja Spirit Enhanced HUD

gui.register( function ()
--Colors
rgbgreen = {0,255,0,255} rgbyellow = {255,255,0,255} rgborange = {255,100,0,255} rgbpink = {255,0,255,255}
rgbcyan = {0,255,255,255} rgbFbox = {210,150,150,255} rgbred = {255,0,0,255} rgbblue = {0,0,255,255}
rgbblack = {0,0,0,255} rgbwhite = {255,255,255,255} rgbredjimmy = {255, 0, 100, 255} rgbbluebimmy = {0,150,255,255}

--	agg.setFont("gse5x7")
--	agg.lineColor(255,200,200,255)

	agg.setFont("gse6x9")					--change font
--Input display
	Joy1 = joypad.read(1)
	doPlayerJoy(-1,219, Joy1, rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])
--boss HP display
	bossHP = 0
	boss1HP = memory.readbyte(0x1f18b8)
	if boss1HP > 2 and boss1HP < 65 then bossHP = boss1HP end
	boss2HP = memory.readbyte(0x1f18C6)
	if boss2HP > 2 and boss2HP < 161 then bossHP = boss2HP end
	boss3HP = memory.readbyte(0x1f18aD)
	if boss3HP > 2 and boss3HP < 256 then bossHP = boss3HP-9 end
	boss4HP = memory.readbyte(0x1f188F)
	if boss4HP > 2 and boss4HP < 161 then bossHP = boss4HP end
	boss4bHP = memory.readbyte(0x1f1884)
	if boss4bHP > 2 and boss4bHP < 161 then bossHP = bossHP+boss4bHP end
	boss7HP = memory.readbyte(0x1f1875)
	if boss7HP > 2 and boss7HP < 256 then bossHP = boss7HP end
	doSomeText(216, 223, "Boss", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])
	doSomeText(242, 223, ""..bossHP.."", rgbred[1], rgbred[2], rgbred[3], rgbred[4])
--Scrolling
	scrollx = memory.readbyte(0x1f0503)
	doSomeText(57, 223, "ScrollY", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])
	doSomeText(100, 223, ""..scrollx.."", rgbred[1], rgbred[2], rgbred[3], rgbred[4])
	scrolly = memory.readbyte(0x1f0036)
	doSomeText(118, 223, "X", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])
	doSomeText(126, 223, ""..scrolly.."", rgbred[1], rgbred[2], rgbred[3], rgbred[4])
--Positions
	posy = memory.readbyte(0x1f14B7)
	doSomeText(144, 223, "PosY", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])
	doSomeText(169, 223, ""..posy.."", rgbred[1], rgbred[2], rgbred[3], rgbred[4])
	posx = memory.readbyte(0x1f13B1)
	doSomeText(188, 223, "X", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])
	doSomeText(195, 223, ""..posx.."", rgbred[1], rgbred[2], rgbred[3], rgbred[4])


--Enhanced frame counter	
	curFrame = emu.framecount()						--the current frame
	curmoviemode = movie.mode()						--the current movie mode
	movielength = movie.length()						--the current movie length
	if curmoviemode == "playback" then
	agg.fillColor (rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])	agg.lineColor (rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4])	agg.triangle (262, 224, 269, 227, 262, 231)	agg.noFill()  --play symbol
 	doSomeText(273, 223, ""..curFrame.."", rgbgreen[1], rgbgreen[2], rgbgreen[3], rgbgreen[4]) 				--draw current frame
	doSomeText(305, 223, "/"..movielength.."", 0,255,0,255)								--draw movie length
	end
	if curmoviemode == "record" then
	agg.fillColor (rgbred[1], rgbred[2], rgbred[3], rgbred[4])	agg.lineColor (rgbred[1], rgbred[2], rgbred[3], rgbred[4])	agg.roundedRect (262, 224, 269, 231, 255)	agg.noFill()  --record symbol
 	doSomeText(273, 223, ""..curFrame.."", rgbred[1], rgbred[2], rgbred[3], rgbred[4]) 				--draw current frame
	end
	if curmoviemode == "inactive" then
	agg.fillColor (rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4])	agg.lineColor (rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4])	agg.roundedRect (262, 224, 269, 231, 1)	agg.noFill()  --stop symbol
 	doSomeText(273, 223, ""..curFrame.."", rgbblue[1], rgbblue[2], rgbblue[3], rgbblue[4]) 				--draw current frame
	end
--end	
	agg.setFont("verdana18_bold")				--set back system font
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
