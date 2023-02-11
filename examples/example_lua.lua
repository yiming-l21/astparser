--短除法最大公约数
	self:getMaxResult(18,42)

function getMaxResult(a,b)

	local p,d = math.modf(a)
	if d~= 0 then
		print("参数包含小数,不存在公约数")
	end

	local q,w = math.modf(b)
	if w~=0 then
		print("参数包含小数,不存在公约数")
	end

	local x = 1
	if a and b and a> 0 and  b> 0 then
		if (a/b) >= 1 then
			while  (a%b ~= 0) do
				local t =  a%b
				local y = b +0 --因为lua会引用需要 +0
				a = y
				b = t
			end
			x = b
		else
			while (b%a ~= 0)  do
				local t =  b%a
				local y = a + 0 --因为lua会引用需要 +0
				a = t
				b = y
			end
			x = a
		end
	else
		print("不存在公约数")
	end
	print(x,"公约数.....................")
end
