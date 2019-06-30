require("pic_util")
require("io_util")
init(0,1); 

sysLog('start');
--i.init()

function battle_loop()
	while true
	do
		p.find_inarea('结束关卡.png',323,598,557,635)
		p.find_inarea('下一层.png',358,599,622,650)
		if p.find_inarea('显示地图.png',358,599,622,650) then 
			return
		end 
	end
end

while true
do
	--battle_loop()
	if p.find('1-1.png') then
		p.sel_lvl(0)
		if p.find('开始.png') then
			battle_loop()
		else
			p.touch(63,393)
		end
	end
	mSleep(1000)
	
	if p.find('1-2.png') then
		p.sel_lvl(0)
		if p.find('开始.png') then
			battle_loop()
		else
			p.touch(63,393)
		end
	end
	mSleep(1000)
end
