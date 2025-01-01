local ui = {}

function ui:OffsetToScale(Offset: number, UI)
	local X = UI.AbsoluteSize.X
	local Y = UI.AbsoluteSize.Y
	
	return Offset/X, Offset/Y
end

function ui:ScaleToOffset(Scale: number, UI)
	local X = UI.AbsoluteSize.X
	local Y = UI.AbsoluteSize.Y
	
	return Scale*X, Scale*Y
end

function ui:ResizewMinandMax(Offset: number, min: GuiObject, UI)
	local Scale = ui:OffsetToScale(Offset, UI)
	local Resize = (Scale < 1) and Scale or 1
	
	if Scale > min.Size.X.Scale then
		min.Size = UDim2.fromScale(Resize, 0.25)
	end
end

function ui:customDialog(custom: GuiObject)
	if typeof(custom) ~= "ScreenGui" then return false end
	if custom.Name ~= "DialogTableau" then return false end
	
	if typeof(custom:FindFirstChild("Main")) ~= "Frame" then return false end
	if typeof(custom.Main:FindFirstChild("Title") ~= "TextLabel") then return false end
	if typeof(custom.Main:FindFirstChild("Dialog") ~= "Frame") then return false end	
	
	if not custom.Main.Dialog:FindFirstChildOfClass("UIListLayout") then
		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.Wraps = true
		UIListLayout.Parent = custom.Main.Dialog
	end
	
	if custom.Main:FindFirstChild("Options") then
		if typeof(custom.Main.Options) ~= "Frame" then return false end
		if not custom.Main.Options:FindFirstChild("UIListLayout") then return false end
		if typeof(custom.Main.Options:FindFirstChild("Template")) ~= "TextButton" then return false end
	end
	return true
end

return ui
