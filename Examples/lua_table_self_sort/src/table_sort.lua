---------------------------------------------------
-- 表条件排序
-- 一个Table遍历的迭代器, 这样能保证顺序便利所要的东西
-- 可以使用 for k, v in pairsByKeys(table, doSort) do 
-- 注意：doSort这个函数必须保证这个排序是稳定排序
-- bipairs 是否使用ipairs还是pairs的方式

-- 返回1：对应排序好的key（表id）
-- 返回2：对应排序好的value
-------------------------------------------------- 
function pairsByKeys(t, doSort, bipairs)
	local a = {}
	local b = {}
	local idx = 1

	if (bipairs == nil or (not bipairs)) then
		for k,v in pairs(t) do
			a[idx] = v;
			b[a[idx]] = k;
			idx = idx + 1;
		end
	else
		for k,v in ipairs(t) do
			a[idx] = v;
			b[a[idx]] = k;
			idx = idx + 1;
		end
	end
	
	if nil == doSort then
		table.sort(a)
	else
		table.sort(a, doSort)
	end

	local i = 0
	return function()
		i = i + 1
		if a[i] == nil then return nil
		else return b[a[i]], a[i]
		end
	end
end

print("--------------test----------------")

local unSortTable = {}
for i=1,10 do
	if i % 2 == 0 then
		unSortTable[i] = {}
		unSortTable[i].key = math.random(100, 200)
		unSortTable[i].value = math.random(1000, 2000)		
	end	
end

for k,v in pairs(unSortTable) do
	print(k .. " : " .. v.key .. " >>> " .. v.value)
end

print("--------------sort----------------")

------------------------------
-- 自定义排序方法(必须保证稳定排序)
-----------------------------
function sortFunc(a , b)
    if a.value > b.value then 
        return true;
    end
    return false;
end

for k, v in pairsByKeys(unSortTable , sortFunc) do
    print(k .. " : " .. v.key .. " >>> " .. v.value)
end

