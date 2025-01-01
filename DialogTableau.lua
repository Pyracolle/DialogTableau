local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

------------------------------ DIALOG <-> TABLEAU --------------------------------
-- Last Update: 02/01/2025
-- Documentation: https://github.com/Pyracolle/DialogTableau

-- Writen by @mari230899
-- Thanks for using the module!
----------------------------------------------------------------------------------
--]]

local DialogTableau = {}
DialogTableau.__index = DialogTableau

local Roact = require(script.Roact)               -- Helps doing frames via script
local Signal = require(script.Signal)             -- Replace BindableEvents
local IntError = require(script.IntError)         -- Auxiliar error checker
local PureFrame = require(script.PureFrame)       -- Custom Roact frame maker
local queueData = {}                              -- Already using dialog system              

export type DialogConfig = {
	Body: table,                                  -- Main dialog table
	actor: string,                                -- Title of the dialog frame
	typeSpeed: number,                            -- Delay between every letter
	BetweenChat: number,                          -- Delay between every text
	chatChoice: table | nil,                      -- Toggle dialog choices
	
	canSkip: boolean,                             -- Allow skipping dialogs
	AllowMovement: boolean,                       -- Character can move in dialog
	TextFont: Enum.Font,                          -- Defines the font for the dialog
	headshot: number,                             -- Headshot of the actor in-dialog
	typeSound: number,                            -- Sound of every tick of dialog
	customUI: GuiObject,                          -- For user creativity
}

local txtFormat = require(script.PureFrame.txtFormat)
local uiProcess = require(script.PureFrame.UIprocedure)

----------------------
-- MAIN CONSTRUCTOR --
----------------------
function DialogTableau.new(configuration: DialogConfig)
	for index, corpse in configuration.Body do
		IntError(corpse, "string")
	end
	
	local self = setmetatable({}, DialogTableau)
	-- EVENTS --
	self.Completed = Signal.new()
	self.Chatted = Signal.new()
	
	-- CONFIGURATION --
	self._config = configuration
	self._config.Body = configuration.Body or ""
	self._config.actor = configuration.actor or "dummy"
	self._config.typeSpeed = configuration.typeSpeed or 0.08
	self._config.BetweenChat = configuration.BetweenChat or 0.9
	self._config.chatChoice = configuration.chatChoice or nil
	self._config.canSkip = configuration.canSkip or false
	self._config.AllowMovement = configuration.AllowMovement or false
	self._config.TextFont = configuration.TextFont or Enum.Font.TitilliumWeb
	self._config.headshot = configuration.headshot or 0
	self._config.typeSound = configuration.typeSound or 16480552135
	self.customUI = configuration.customUI or nil
	return self
end

----------------------
-- MODULE FUNCTIONS --
----------------------

-- Starts (but not resumes) the local player dialog
function DialogTableau:Begin(player: Player)
	assert(self._config, "[DialogTableau]: Call the function from the constructor")
	IntError(player, "Player")
	
	local Character = player.Character
	local PlayerGui = player:WaitForChild("PlayerGui")
	local Humanoid = Character:WaitForChild("Humanoid")
	local WalkSpeed = Humanoid.WalkSpeed
	local JumpPower = Humanoid.JumpPower
	
	if not PlayerGui:FindFirstChild("DialogTableau") then
		local SelectedOption = nil
		local skipinst = false
		local UI = nil
		queueData[player.UserId] = {hasData = true, IsActive = true}
		
		-- // Block Humanoid movement \\ --
		if not self._config.AllowMovement then
			Humanoid.WalkSpeed = 0   
			Humanoid.JumpPower = 0
		end
		
		if self.customUI then
			if not uiProcess:customDialog(self.customUI) then
				return error("[DialogTableau]: Error accepting customUI")
			end
			if typeof(self.customUI.Main:FindFirstChild("imgShot")) == "ImageLabel" then
				self.customUI.Main.Image = "rbxassetid://"..self._config.headshot
			end
		else
			if self._config.headshot == 0 then
				UI = PureFrame["dialog_1"](self._config.TextFont.Name) else
				UI = PureFrame["dialog_1_headshot"](self._config.TextFont.Name, self._config.headshot)
			end
			Roact.mount(UI, PlayerGui)
		end
		
		-- // Create dialog UI \\ --
		local Interface = PlayerGui:WaitForChild("DialogTableau")
		Interface.Main.Title.Text = self._config.actor
		
		uiProcess:ResizewMinandMax(
			Interface.Main.Title.TextBounds.X,
			Interface.Main.Title,
			Interface.Main
		)
		
		if self._config.canSkip then
			if Interface.Main:FindFirstChild("skip") then
				Interface.Main.skip.Visible = true
				Interface.Main.skip.MouseButton1Click:Connect(function()
					skipinst = true
				end)
			end
		end
		
		-- // Actual Dialog system \\ --
		local audio = Instance.new("Sound")
		audio.SoundId = "rbxassetid://"..tostring(self._config.typeSound)
		audio.Name = "Click"
		audio.Looped = true
		audio.Volume = 2
		audio.PlaybackSpeed = 0.2/self._config.typeSpeed
		audio.RollOffMaxDistance = 15
		audio.Parent = Character
		
		local function typewrite(text: string)
			local newText, formats = txtFormat.get(text)
			
			pcall(function()
				TweenService:Create(
					Interface.Main, TweenInfo.new(
						0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, true
					),
					{Position = Interface.Main.Position - UDim2.new(0, 0, 0.01, 0)}
				):Play()
			end)
			
			if Interface:FindFirstChild("Main") then
				for i, t in pairs(Interface.Main.Dialog:GetChildren()) do
					if t:IsA("TextLabel") then t:Destroy() end
				end
			end
			
			local function addLetter(t: string, order: number)
				local label = Instance.new("TextLabel")
				local strFont = self._config.TextFont.Name
				label.AnchorPoint = Vector2.new(0.5, 0.5)
				label.AutomaticSize = Enum.AutomaticSize.XY
				label.BackgroundTransparency = 1
				label.Name = "label"
				label.Text = t
				label.FontFace = Font.new(
					"rbxasset://fonts/families/"..strFont..".json",
					Enum.FontWeight.Regular
				)
				
				label.TextColor3 = Color3.fromRGB(255, 255, 255)
				label.TextSize = 25
				label.TextWrapped = true
				label.RichText = true
				
				txtFormat.apply(label, order, formats)
				if Interface:FindFirstChild("Main") then
					label.Parent = Interface.Main.Dialog else label:Destroy()
				end
			end
			
			if Character:FindFirstChild("Click") then
				Character.Click:Play()
			end
			for i = 1, #newText, 1 do
				if Interface:FindFirstChild("Main") then
					if skipinst then
						for t = i, #newText do
							addLetter(string.sub(newText, t, t), t)
						end
						skipinst = false
						break
					else
						addLetter(string.sub(newText, i, i), i)
						task.wait(self._config.typeSpeed)
					end
				end
			end
			if Character:FindFirstChild("Click") then
				Character.Click:Stop()
			end
		end
		
		coroutine.resume(coroutine.create(function()
			for index, txt in ipairs(self._config.Body) do
				if queueData[player.UserId] then
					if queueData[player.UserId].hasData then
						if not queueData[player.UserId].IsActive then
							skipinst = true
							repeat task.wait() until queueData[player.UserId].IsActive == true
							Interface.Main.Visible = true
						end
						
						typewrite(txt)
						self.Chatted:Fire(txt)
						task.wait(self._config.BetweenChat)
						skipinst = false
					end
				end
			end
			Interface:Destroy()
			
			-- // Activate options for current player \\ --
			if queueData[player.UserId] and typeof(self._config.chatChoice) == "table" then
				if #self._config.chatChoice ~= 0 and #self._config.chatChoice <= 6 then
					
					if queueData[player.UserId].IsActive then
						if not self.customUI then
							if self._config.headshot == 0 then
								UI = PureFrame["dialog_2"](self._config.TextFont.Name) else
								UI = PureFrame["dialog_2_headshot"](self._config.TextFont.Name, self._config.headshot)
							end
							Roact.mount(UI, PlayerGui)
						end
						
						skipinst = true
						Interface = PlayerGui:WaitForChild("DialogTableau")
						Interface.Main.Title.Text = self._config.actor
						uiProcess:ResizewMinandMax(
							Interface.Main.Title.TextBounds.X,
							Interface.Main.Title,
							Interface.Main
						)
						typewrite(self._config.Body[#self._config.Body])
						
						if Interface:FindFirstChild("Main") then
							local UpTween = TweenService:Create(
								Interface.Main, TweenInfo.new(
									0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In
								),
								{Position = Interface.Main.Position - UDim2.new(0, 0, 0.05, 0)}
							)
							UpTween:Play()
							UpTween.Completed:Wait()
							
							for index, txt in pairs(self._config.chatChoice) do
								if not Interface:FindFirstChild("Main") then break end
								local btn = Interface.Main.Options.Template:Clone()
								btn.Visible = true
								btn.Text = " "..txt.." "
								btn.Parent = Interface.Main.Options
								
								btn.MouseButton1Click:Connect(function()
									SelectedOption = txt
								end)
							end
							
							repeat RunService.Heartbeat:Wait()
								if queueData[player.UserId] then
									if queueData[player.UserId].hasData == false then
										break
									end
								end
							until SelectedOption ~= nil
						end
						Interface:Destroy()
					end
				end
			end
			
			
			if Character:FindFirstChild("Click") then Character.Click:Destroy() end
			if queueData[player.UserId] then
				queueData[player.UserId].IsActive = false
				queueData[player.UserId].hasData = false
			end
			
			Humanoid.WalkSpeed = WalkSpeed
			Humanoid.JumpPower = JumpPower
			self.Completed:Fire(SelectedOption)
		end))
	end
end

-- Pauses the current local player thread
function DialogTableau:Pause(player: Player, dialogVisible: boolean)
	assert(self._config, "[DialogTableau]: Call the function from the constructor")
	IntError(player, "Player")
	dialogVisible = dialogVisible or true
	
	local PlayerGui = player:WaitForChild("PlayerGui")
	local Character = player.Character
	local Humanoid = Character:WaitForChild("Humanoid")
	
	if PlayerGui:FindFirstChild("DialogTableau") then
		queueData[player.UserId].IsActive = false
		Humanoid.WalkSpeed = 16
		Humanoid.JumpPower = 50

		local dialog = PlayerGui.DialogTableau.Main
		if dialogVisible == false then
			dialog.Visible = false
		end
	end
end

-- Resumes dialog thread, won't do anything if it isn't paused
function DialogTableau:Resume(player: Player)
	assert(self._config, "[DialogTableau]: Call the function from the constructor")
	IntError(player, "Player")
	
	local PlayerGui = player:WaitForChild("PlayerGui")
	local Character = player.Character
	local Humanoid = Character:WaitForChild("Humanoid")
	
	if PlayerGui:FindFirstChild("DialogTableau") then
		queueData[player.UserId].IsActive = true
		
		if not self._config.AllowMovement then
			Humanoid.WalkSpeed = 0   
			Humanoid.JumpPower = 0
		end
	else
		error("[DialogTableau]: This method doesn't create a dialog, use ':Begin' instead")
	end
end

-- Halt the local player dialog. To save current tableau, use ":Pause()" instead
function DialogTableau:Stop(player: Player)
	assert(self._config, "[DialogTableau]: Call the function from the constructor")
	IntError(player, "Player")
	
	local PlayerGui = player:WaitForChild("PlayerGui")
	local Character = player.Character
	local Humanoid = Character:WaitForChild("Humanoid")
	
	if PlayerGui:FindFirstChild("DialogTableau") then
		queueData[player.UserId].IsActive = false
		queueData[player.UserId].hasData = false
	end
end

-- Apart from stopping the dialog, it will also dismantle and make it unusable 
function DialogTableau:Destroy(player: Player)
	self:Stop(player)
	self.Completed:DisconnectAll()
	self.Chatted:DisconnectAll()
	
	-- locking the dialog access (cut the references to the dialog)
	setmetatable(self, {__metatable = error(
		'[DialogTableau]: Current dialog thread has been destroyed!')
	})
end

game.Players.PlayerRemoving:Connect(function(player)
	queueData[player.UserId] = nil
end)

return DialogTableau
