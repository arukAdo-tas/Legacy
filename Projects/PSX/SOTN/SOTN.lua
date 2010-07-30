--Castlevania: Symphony Of The Night


-- RAM WATCH --
--	playerHP = memory.readbyte(0x1fffff)
while true do
	XPOS = memory.readbyte(0x973F0);
	XVEL = memory.readbyte(0x733E2);
	YPOS = memory.readbyte(0x973F4);
	YVEL = memory.readbyte(0x733E6);
if (YVEL == 255) then YVEL = 0 end
if (YVEL == 254) then YVEL = 1 end
if (YVEL == 253) then YVEL = 2 end
if (YVEL == 252) then YVEL = 3 end
if (YVEL == 251) then YVEL = 4 end
if (YVEL == 250) then YVEL = 5 end
if (YVEL == 249) then YVEL = 6 end
if (YVEL == 248) then YVEL = 7 end
if (YVEL == 247) then YVEL = 8 end
if (YVEL == 246) then YVEL = 9 end
if (YVEL == 245) then YVEL = 10 end
if (YVEL == 244) then YVEL = 11 end

if (XVEL == 255) then XVEL = 0 end
if (XVEL == 254) then XVEL = 1 end
if (XVEL == 253) then XVEL = 2 end
if (XVEL == 252) then XVEL = 3 end
if (XVEL == 251) then XVEL = 4 end
if (XVEL == 250) then XVEL = 5 end
if (XVEL == 249) then XVEL = 6 end
if (XVEL == 248) then XVEL = 7 end
if (XVEL == 247) then XVEL = 8 end
if (XVEL == 246) then XVEL = 9 end

	
	curMP = memory.readbyte(0x97BB0);
	maxMP = memory.readbyte(0x97BB4);
	STR = memory.readbyte(0x97BB8);
	CON = memory.readbyte(0x97BBC);
	INT = memory.readbyte(0x97BC0);
	LCK = memory.readbyte(0x97BC4);
	curHeart = memory.readbyte(0x97BA8);
	maxHeart = memory.readbyte(0x97BAC);
	curHP = memory.readbyte(0x97BA0);
	maxHP = memory.readbyte(0x97BA4);
	curEXP = memory.readword(0x97BEC);
	rooms = memory.readword(0x3C760);
	kills = memory.readbyte(0x97BF4);
	
	bossHP = memory.readword(0x76ED6);
	GaibonHP = memory.readword(0x774B6);
	drac2HP = memory.readword(0x77282);
	Invul = memory.readbyte(0x72F1C);
	ctrl = memory.readbyte(0x72EFC);
	revenge = memory.readbyte(0x76EF0);
	
	hours = memory.readbyte(0x97C30);
	mins = memory.readbyte(0x97C34);
	secs = memory.readbyte(0x97C38);

	RNGlow = memory.readword(0x09010);
	RNGhigh = memory.readword(0x09012);
	
	
gui.text(86, 2, "X:" .. XPOS .. "");
gui.text(86, 10, "Y:" .. YPOS .. "");

gui.text(109, 2, "X:" .. XVEL .. "");
gui.text(109, 10, "Y:" .. YVEL .. "");

gui.text(124, 0, "HP" .. curHP .. "/" .. maxHP .. "");
gui.text(124, 6, "MP" .. curMP .. "/" .. maxMP .. "");
gui.text(124, 12, "HT" .. curHeart .. "/" .. maxHeart .. "");

gui.text(162, 0, "STR" .. STR .. "");
gui.text(162, 6, "INT" .. INT .. "");
gui.text(162, 12, "CON" .. CON .. "");

gui.text(184, 0, "CTRL" .. ctrl .. "");
gui.text(184, 6, "INVU" .. Invul .. "");
--gui.text(182, 12, "CON" .. CON .. "");

gui.text(209, 0, "" .. hours .. ":" .. mins .. ":" .. secs .. "");
gui.text(209, 6, "Exp" .. curEXP .. "");
--gui.text(207, 0, "RNGA" .. RNGlow .. "");
--gui.text(207, 6, "RNGB" .. RNGhigh .. "");

gui.text(185, 227, "Rooms" .. rooms .. "");
gui.text(185, 233, "Kills" .. kills .. "");

gui.text(225, 227, "Boss" .. bossHP .. "");

if (GaibonHP == 200) then flagboss2 = true end
if (drac2HP == 1200) then flagboss3 = true end

if (flagboss2 == true) then
gui.text(221, 233, "Gaibon" .. GaibonHP .. "");
if (GaibonHP > 201) then flagboss2 = false end
elseif (flagboss3 == true) then
gui.text(221, 233, "Drac" .. drac2HP .. "");
if (drac2HP > 1201) then flagboss3 = false end
else
gui.text(223, 233, "Revenge" .. revenge .. "");
end

pcsx.frameadvance()
end

