	

    --Castlevania: Symphony Of The Night
     
    while true do
            XPOS = memory.readdwordsigned(0x973F0);
            XVEL = memory.readbyte(0x733E2);
            YPOS = memory.readdwordsigned(0x973F4);
            YVEL = memory.readbyte(0x733E6);
           
            CAMX = memory.readbyte(0x733DA);
            CAMY = memory.readbyte(0x733DE);
     
            MAP_WIDTH = memory.readword(0x730C8);
     
            XPOS_SUB = memory.readbyte(0x733D9);
            YPOS_SUB = memory.readbyte(0x733DD);
           
            XPOS_REAL = XPOS+XPOS_SUB/256;
            YPOS_REAL = YPOS+YPOS_SUB/256;
           
            DR_DOT = XPOS_REAL-YPOS_REAL;
            UR_DOT = XPOS_REAL+YPOS_REAL;
           
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
     
            gui.text(86,2, "X: "..XPOS_REAL.."");
            gui.text(86,10, "Y: "..YPOS_REAL.."");
            gui.text(150,2, "DR: "..DR_DOT.."");
            gui.text(150,10, "UR: "..UR_DOT.."");
            gui.text(215,2, "SX: "..SHIFTX..SHIFTX_STAR);
            emu.frameadvance()
    end

