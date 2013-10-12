--Castlevania: Symphony Of The Night


-- RAM WATCH --
--      playerHP = memory.readbyte(0x1fffff)
local Xdummy = 0;
local Ydummy = 0;
local input={}
local var=0
while true do
        var = 0;
		input = joypad.get(1);
	if input.triangle and input.circle then
     if input.left then
	  joypad.set(1, {left=1, triangle=1})
	  var=1
	  psxjin.frameadvance()
	  end
     if input.right then
      joypad.set(1, {right=1, triangle=1})
	  var=1
	  psxjin.frameadvance()
      end
	 if input.square then
	  joypad.set(1, {square=1})
	  psxjin.frameadvance()
	  end
	 if var==0 then
	  joypad.set(1, {triangle=1})
	  psxjin.frameadvance()
	  end
	joypad.set(1, {circle=1})
   end
        XPOS = memory.readdwordsigned(0x973F0);
        XVEL = memory.readbyte(0x733E2);
        YPOS = memory.readdwordsigned(0x973F4);
        YVEL = memory.readbyte(0x733E6);
		
		CAMX = memory.readbyte(0x733DA);
        CAMY = memory.readbyte(0x733DE);
		XCAM = memory.readbyte(0x4E314);
		MAP_WIDTH = memory.readword(0x730C8);
		
		XPOS_SUB = memory.readbyte(0x733D9);
		YPOS_SUB = memory.readbyte(0x733DD);
		XPOS_REAL = XPOS+XPOS_SUB/256;
        YPOS_REAL = YPOS+YPOS_SUB/256;
		XVEL_REAL = (XPOS_REAL-Xdummy);
		YVEL_REAL = (YPOS_REAL-Ydummy);
		SHIFTX = 0;
            SHIFTX_STAR = ' ';
            if CAMX < 128 then
                    if XPOS < 128 then
                            SHIFTX = XPOS-CAMX;
                    else
                            SHIFTX = 128-CAMX;
                            SHIFTX_STAR = '*';
                    end
            elseif CAMX > 128 then
                    if XPOS > MAP_WIDTH - 128 then
                            SHIFTX = XPOS-MAP_WIDTH+256-CAMX;
                    else
                            SHIFTX = 128-CAMX;
                            SHIFTX_STAR = '*';
                    end
     
            end
		
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
		level = memory.readbyte(0x97BE8);
		nextlvl = 0;
       
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
       
         
gui.text(50, 2, "X:" .. XPOS_REAL .. "");
gui.text(50, 10, "Y:" .. YPOS_REAL .. "");

gui.text(107, 2, "XV:" .. XVEL_REAL .. "");
gui.text(107, 10, "YV:" .. YVEL_REAL .. "");

if (SHIFTX<3 and SHIFTX>-3) then
gui.text(165, 2, "SHFT:N");
end
if (SHIFTX>=3) then
gui.text(165, 2, "SHFT:" .. SHIFTX .. SHIFTX_STAR .. "");
end
if (SHIFTX<=-3) then
gui.text(165, 2, "SHFT:" .. SHIFTX .. SHIFTX_STAR .. "");
end

gui.text(165, 10, "X:" .. XVEL .. "/Y:" .. YVEL .. "");

gui.text(0, 214, "MP:" .. curMP .. "");
gui.text(0, 222, "STR:" .. STR .. " INT:" .. INT .. " CON:" .. CON);

if (ctrl>=1) then 
gui.text(197, 2, "CTRL:N");
end
if (ctrl<1) then
gui.text(197, 2, "CTRL:Y");
end
if (Invul<=0) then
gui.text(197, 10, "INV:N");
end
if (Invul>0) then
gui.text(197, 10, "INV:" .. Invul .. "");
end

if (level==1) then nextlvl=(100-curEXP) end
if (level==2) then nextlvl=(250-curEXP) end
if (level==3) then nextlvl=(450-curEXP) end
if (level==4) then nextlvl=(700-curEXP) end
if (level==5) then nextlvl=(1000-curEXP) end
if (level==6) then nextlvl=(1350-curEXP) end
if (level==7) then nextlvl=(1750-curEXP) end
if (level==8) then nextlvl=(2200-curEXP) end
if (level==9) then nextlvl=(2700-curEXP) end
if (level==10) then nextlvl=(3250-curEXP) end
if (level==11) then nextlvl=(3850-curEXP) end
if (level==12) then nextlvl=(4500-curEXP) end
if (level==13) then nextlvl=(5200-curEXP) end
if (level==14) then nextlvl=(5950-curEXP) end
if (level==15) then nextlvl=(6750-curEXP) end
if (level==16) then nextlvl=(7600-curEXP) end
if (level==17) then nextlvl=(8500-curEXP) end
if (level==18) then nextlvl=(9450-curEXP) end
if (level==19) then nextlvl=(10450-curEXP) end
if (level==20) then nextlvl=(11700-curEXP) end
if (level==21) then nextlvl=(13200-curEXP) end
if (level==22) then nextlvl=(15100-curEXP) end
if (level==23) then nextlvl=(17500-curEXP) end
if (level==24) then nextlvl=(20400-curEXP) end
if (level==25) then nextlvl=(23700-curEXP) end
if (level==26) then nextlvl=(27200-curEXP) end
if (level==27) then nextlvl=(30900-curEXP) end
if (level==28) then nextlvl=(35000-curEXP) end
if (level==29) then nextlvl=(39500-curEXP) end
if (level==30) then nextlvl=(44500-curEXP) end
if (level==31) then nextlvl=(50000-curEXP) end
if (level==32) then nextlvl=(56000-curEXP) end
if (level==33) then nextlvl=(61500-curEXP) end
if (level==34) then nextlvl=(68500-curEXP) end
if (level==35) then nextlvl=(76000-curEXP) end
gui.text(169, 226, "Next:" .. nextlvl .. "");
RNG = RNGhigh%RNGlow;
gui.text(129, 229, "RNG:" .. RNG .. "");
--gui.text(117, 232, "RNGB:" .. RNGhigh .. "");

gui.text(169, 232, "Kills:" .. kills .. "");
gui.text(217, 226, "Boss:" .. bossHP .. "");

if (GaibonHP == 200) then flagboss2 = true end
if (drac2HP == 1200) then flagboss3 = true end

if (flagboss2 == true) then
gui.text(217, 232, "Gaibon:" .. GaibonHP .. "");
if (GaibonHP > 201) then flagboss2 = false end
elseif (flagboss3 == true) then
gui.text(217, 232, "Drac:" .. drac2HP .. "");
if (drac2HP > 1201) then flagboss3 = false end
else
gui.text(217, 232, "Revenge:" .. revenge .. "");
end

--memory.writebyte(0x72EFC, 0);
--memory.writebyte(0x97A29, 20); 
--infinite potions

--memory.writebyte(0x97A10, 20); 
--infinite fire boomerangs

--memory.writebyte(0x97A1A, 20);
--infinite antivenoms

--memory.writebyte(0x97A2C, 20);
--infinite manna prisms

--memory.writebyte(0x97A18, 99);
--infinite HRs

--memory.writebyte(0x97964, 3);
--bat relic equipped

--memory.writebyte(0x97971, 3);
--leap stone equipped

--memory.writebyte(0x97968, 3);
--wolf relic equipped

--memory.writebyte(0x9796B, 3);
--mist relic equipped

--memory.writebyte(0x97974, 3);
--jewel of open equipped

--memory.writebyte(0x97BB8, 99);
--99 STR

--memory.writebyte(0x97BB0, 255);
--infinite current MP

--memory.writebyte(0x97BB4, 255);
--255 max MP

--memory.writebyte(0x72F1C, 2);
--invincibility

--memory.writebyte(0x97BA8, 200);
--infinite hearts


--memory.writebyte(0xACEE2, 24);
--memory.writebyte(0xACEE6, 17);
--memory.writebyte(0xACEEA, 9);
--memory.writebyte(0xACEFE, 24);
--memory.writebyte(0xACF02, 17);
--memory.writebyte(0xACF06, 9);

--memory.writebyte(0x7342C, 15);

--005F2CEE < jap version, address to the door in right lake (ferryman) ?
Xdummy = XPOS_REAL;
Ydummy = YPOS_REAL;
psxjin.frameadvance()
end

