local TweenService = game:GetService("TweenService")
local random = Random.new()
local format = {}

local t = {
	["bold"] = {"<b>", "</b>"};
	["italic"] = {"<i>", "</i>"};
	["underline"] = {"<u>", "</u>"};
	["strikethrough"] = {"<s>", "</s>"};
	["color"] = {"<color%(".."%d+, %d+, %d+".."%)>", "</color>"};
	["rainbow"] = {"<rainbow>", "</rainbow>"};
	["background"] = {"<bg%(".."%d+, %d+, %d+".."%)>", "</bg>"};
	
	["wavy"] = {"<wavy>", "</wavy>"};
	["shake"] = {"<shake>", "</shake>"};
}

local function validColor3(str: string)
	str = string.gsub(str, " ","");
	local colortable = string.split(str,",");
	if #colortable ~= 3 then
		return false
	else
		for _,v in ipairs(colortable) do
			if tonumber(v) < 0 or tonumber(v) > 255 then
				return false
			end
		end
	end
	return true
end

format.get = function(text: string)
	local foundFormats = {}
	local newText = text
	
	while task.wait() do
		local checker = #foundFormats
		
		for index, formatTable in pairs(t) do
			local a, b = string.find(newText, formatTable[1])
			local sentData = nil
			local persistentUserdata = 1
			
			if a ~= nil then
				if index == "color" then
					if validColor3(string.sub(newText, a+7, b-2)) then
						sentData = string.sub(newText, a+7, b-2)
						persistentUserdata = #string.sub(newText, a, b)
					end
				elseif index == "background" then
					if validColor3(string.sub(newText, a+4, b-2)) then
						sentData = string.sub(newText, a+4, b-2)
						persistentUserdata = #string.sub(newText, a, b)
					end
				end
				
				if formatTable[2] then
					local formatEnd = formatTable[2]
					local readText = string.sub(newText, a, b)
					local current = b
					
					repeat task.wait()
						if current < #newText then
							current = current + 1
							readText = string.sub(newText, a, current)
						else
							readText = string.sub(newText, a, #newText)
							break
						end
					until string.find(readText, formatEnd)
					
					persistentUserdata = (persistentUserdata ~= 1) and persistentUserdata or #formatTable[1]
					if current > #newText then current = #newText end
					local sign1 = (a - 1 > 1) and a or 1
					local sign2 = (b + 1 < #newText) and b or #newText
					local sign3 = ((current - #formatEnd) + 1) - persistentUserdata
					local sign4 = current - persistentUserdata
					
					local firstSection = (sign1 <= 1) and "" or string.sub(newText, 1, sign1-1)
					local secondSection = (sign2 == #newText) and #newText or sign2 + 1
					newText = firstSection..string.sub(newText, secondSection, #newText)
					
					if sign2 ~= #newText then
						newText = string.sub(newText, 1, sign3 - 1)..string.sub(newText, sign4 + 1, #newText)
						
						if current > #newText then
							current = #newText
						end
						a, b = sign1, (current == #newText) and #newText or (sign4 - #formatEnd)
					else
						return error("[DialogTableau]: Bad formatting")
					end
					
					for i, j in pairs(foundFormats) do
						local begin = j[2]
						local finish = j[3]
						
						if begin > sign2 then
							begin = begin - persistentUserdata
							
							if begin > sign4 then
								begin = begin - #formatEnd
							end
						end
						
						if finish > sign2 then
							finish = finish - persistentUserdata
							
							if finish > sign4 then
								finish = finish - #formatEnd
							end
						end
						
						if finish > #newText then
							finish = #newText
						end
						j[2] = (begin > 0) and begin or 1
						j[3] = (finish > 0) and finish or 1
					end
					table.insert(foundFormats, {index, a, b, sentData})
				end
			end
		end
		if #foundFormats == checker then break end
	end
	return newText, foundFormats
end

format.apply = function(label, order: number, formats: table)
	local formatting = {
		["bold"] = function()
			local txt = label:FindFirstChild("label") or label
			
			if not txt:FindFirstChild("UIStroke") then
				local Stroke = Instance.new("UIStroke")
				Stroke.Color = txt.TextColor3
				Stroke.Thickness = 0.5
				Stroke.Parent = txt
			end
		end;
		["italic"] = function()
			local txt = label:FindFirstChild("label") or label
			if not string.find(txt.Text, "<i>") then
				txt.Text = "<i>"..txt.Text.."</i>"
			end
		end;
		["underline"] = function()
			local txt = label:FindFirstChild("label") or label
			if not string.find(txt.Text, "<u>") then
				txt.Text = "<u>"..txt.Text.."</u>"
			end
		end,
		["strikethrough"] = function()
			local txt = label:FindFirstChild("label") or label
			if not string.find(txt.Text, "<s>") then
				txt.Text = "<s>"..txt.Text.."</s>"
			end
		end,
		["color"] = function(data)
			local txt = label:FindFirstChild("label") or label
			local R, G, B = string.match(data, "(%d+), (%d+), (%d+)")
			
			if R and G and B then
				txt.TextColor3 = Color3.fromRGB(R, G, B)
				if txt:FindFirstChild("UIStroke") then
					txt.UIStroke.Color = txt.TextColor3
				end
			end
		end,
		["rainbow"] = function()
			if not label:FindFirstChild("Rainbow") then
				local txt = label:FindFirstChild("label") or label
				local boolean = Instance.new("BoolValue")
				boolean.Value = true
				boolean.Name = "Rainbow"
				boolean.Parent = label
				
				task.spawn(function()
					while task.wait() do
						txt.TextColor3 = Color3.fromHSV(tick() % 20/20, 1, 1)
						if txt:FindFirstChild("UIStroke") then
							txt.UIStroke.Color = txt.TextColor3
						end
					end
				end)
			end
		end,
		["background"] = function(data)
			local txt = label:FindFirstChild("label") or label
			local R, G, B = string.match(data, "(%d+), (%d+), (%d+)")
			
			if R and G and B then
				txt.BackgroundTransparency = 0
				txt.BackgroundColor3 = Color3.fromRGB(R, G, B)
			end
		end,
		
		["wavy"] = function()
			if not label:FindFirstChild("Wavy") then
				local txt = label:FindFirstChild("label") or label
				local clone = txt:Clone()
				local clonePos = clone.Position - UDim2.new(0, 0, 0.2, 0)
				clone.AnchorPoint = Vector2.new(0, 0)
				clone.Size = UDim2.new(1, 0, 1, 0)
				clone.Parent = label
				
				local boolean = Instance.new("BoolValue")
				boolean.Value = true
				boolean.Name = "Wavy"
				boolean.Parent = label
				
				if txt:FindFirstChild("UIStroke") then
					txt.UIStroke:Destroy()
				end
				txt.TextTransparency = 1
				
				task.wait(random:NextInteger(0.1, 0.3))
				task.spawn(function()
					TweenService:Create(
						clone,
						TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, 0),				
						{Position = clonePos}
					):Play()
				end)
			end
		end;
		["shake"] = function()
			if not label:FindFirstChild("Shake") then
				local txt = label:FindFirstChild("label") or label
				local clone = txt:Clone()
				clone.AnchorPoint = Vector2.new(0, 0)
				clone.Size = UDim2.new(1, 0, 1, 0)
				clone.Parent = label
				
				local boolean = Instance.new("BoolValue")
				boolean.Value = true
				boolean.Name = "Shake"
				boolean.Parent = label
				
				if txt:FindFirstChild("UIStroke") then
					txt.UIStroke:Destroy()
				end
				txt.TextTransparency = 1
				
				task.spawn(function()
					while task.wait() do
						if not clone then break end
						
						local rx = random:NextInteger(-1, 1)
						local ry = random:NextInteger(-1, 1)
						clone.Position = UDim2.new(0, rx, 0, ry)
					end
				end)
			end
		end,
	}
	
	for index, formatTable in pairs(formats) do
		local richFormat = formatTable[1]
		local begin = formatTable[2]
		local finish = formatTable[3]
		
		if order >= begin and order <= finish then
			if formatting[richFormat] then
				formatting[richFormat](formatTable[4])
			end
		end
	end
end

return format
