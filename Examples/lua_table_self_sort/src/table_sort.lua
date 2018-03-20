---------------------------------------------------
-- ����������
-- һ��Table�����ĵ�����, �����ܱ�֤˳�������Ҫ�Ķ���
-- ����ʹ�� for k, v in pairsByKeys(table, doSort) do 
-- ע�⣺doSort����������뱣֤����������ȶ�����
-- bipairs �Ƿ�ʹ��ipairs����pairs�ķ�ʽ

-- ����1����Ӧ����õ�key����id��
-- ����2����Ӧ����õ�value
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
-- �Զ������򷽷�(���뱣֤�ȶ�����)
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

