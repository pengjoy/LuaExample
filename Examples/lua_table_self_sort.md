```
------------------------------
-- 表条件排序
-- 返回1：对应排序好的key（表id）
-- 返回2：对应排序好的value
-----------------------------
function pairsByKeys(t, doSort)
 	local a = {}  
 	local b = {}
 	local idx = 1
    for k,v in pairs(t) do 
    	a[idx] = v;
    	b[a[idx]] = k;
    	idx = idx + 1;
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
-- 自定义排序方法
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
```

结果
```
--------------test----------------
6 : 159 >>> 1480
2 : 100 >>> 1564
8 : 135 >>> 1896
10 : 183 >>> 1747
4 : 119 >>> 1809
--------------sort----------------
8 : 135 >>> 1896
4 : 119 >>> 1809
10 : 183 >>> 1747
2 : 100 >>> 1564
6 : 159 >>> 1480
[Finished in 0.1s]
```