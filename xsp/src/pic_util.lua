p = {}

screenX = 1280
screenY = 720

function p.touch(x, y)
	touchDown(1, x, y)
	mSleep(100)
	touchUp(1, x, y)
	mSleep(1000)
end

function p.find(pic)
	mSleep(1000)
	x, y = findImageInRegionFuzzy(pic,70,0,0,screenX,screenY,0)
	if x ~= -1 and y ~= -1 then        --如果在指定区域找到某图片符合条件
		touchDown(1, x, y);            --那么单击该图片
		mSleep(30)
		touchUp(1, x, y);
		return true
	else                               --如果找不到符合条件的图片
		sysLog("p.find('"..pic.."') failed");
		return false
	end
end

function p.find_inarea(pic,a,b,c,d)
	mSleep(500)
	local x, y = findImageInRegionFuzzy(pic,70,a,b,c,d,0)
	if x ~= -1 and y ~= -1 then        --如果在指定区域找到某图片符合条件
		if pic == '结束关卡.png' then
			sysLog(x..' '..y)
			if p.find_inarea('宝箱.png',233,71,664,501) then
				if not p.find('确认拾取宝箱.png') then
					touchDown(1, 236,70)
					mSleep(100)
					touchUp(1, 236,70)
					mSleep(1000)
				end
			end
		end
		sysLog(x..' '..y)
		mSleep(500)
		touchDown(1, x, y);            --那么单击该图片
		mSleep(30)
		touchUp(1, x, y);
		return true
	else                               --如果找不到符合条件的图片
		sysLog("p.find_inarea('"..pic..','..a..','..b..','..c..','..d.."') failed");
		return false
	end
end

function p.find_hitanother(pic,x,y)
	mSleep(1000)
	a, b = findImageInRegionFuzzy(pic,70,0,0,screenX,screenY)
	if a ~= -1 and b ~= -1 then        --如果在指定区域找到某图片符合条件
		touchDown(1, a, b);            --那么单击该图片
		mSleep(30)
		touchUp(1, a, b);
		return true
	else                               --如果找不到符合条件的图片
		sysLog("p.find_hitanother('"..pic.."') failed");
		return false
	end
end

function p.find_dhitanother(pic,dx,dy)
	mSleep(1000)
	a, b = findImageInRegionFuzzy(pic,70,0,0,screenX,screenY,0)
	if a ~= -1 and b ~= -1 then        --如果在指定区域找到某图片符合条件
		touchDown(1, a+dx, b+dy);            --那么单击该图片
		mSleep(30)
		touchUp(1, a+dx, b+dy);
		return true
	else                               --如果找不到符合条件的图片
		sysLog("p.find_dhitanother('"..pic.."') failed");
		return false
	end
end

function p.sel_lvl(lvl)
	mSleep(1000)
	if lvl == -1 then
		return
	end
	x = 950 
	y = 195 + 80 * lvl
	touchDown(1, x, y);            --那么单击该图片
	touchUp(1, x, y);
	mSleep(1000)
end
