--Resident Evil Director's Cut


-- RAM WATCH --
while true do

--Values to cheat past tentacles (get the camera near tentacles)
--memory.writeword(0xC5160, 8198);
--memory.writeword(0xC5158, 6000);

-- Inventory start at C8784, first byte is item/weapon ID second byte is quantity
-- Put flamme bazooka in first slot with 9 rounds:
--memory.writebyte(0xC8784, 9);
--memory.writebyte(0xC8785, 9);

	HP = memory.readword(0xC51AC);
	Tyrant = memory.readword(0xC54B8);
	X = memory.readword(0xC5158);
	Y = memory.readword(0xC5160);
	Z = memory.readword(0xC515C);
	D = memory.readword(0xC5198);

gui.text(93, 0, "D:" .. D .. "|");
gui.text(121, 0, "X:" .. X .. "|");
gui.text(153, 0, "Y:" .. Y .. "|");
gui.text(185, 0, "Z:" .. Z .. "|");
gui.text(215, 0, "HP:" .. HP .. "|");
gui.text(240, 0, "T:" .. Tyrant .. "");

psxjin.frameadvance()
end

