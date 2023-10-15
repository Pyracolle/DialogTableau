local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

--------------------------------- PRO - DIALOGUE ------------------------------------
-- Writen by @mari230899
-- Created: 25/10/2022
-- Updated: 16/08/2023

-- https://devforum.roblox.com/t/2033941
-- Thanks for using the module!
-------------------------------------------------------------------------------------

-- A template would look like this
-- NORMAL CHAT --------------------------------
                                                               --[[
local ProDialogue = require(game.ReplicatedStorage.ProDialogue)
local player = game.Players.LocalPlayer

local dialogue = ProDialogue.new(player, {
	Body = {
		"Message1",
		"Message2",
	};
	typeSpeed = 0.08; -- // speed at which letters will appear in dialogue \\
	BetweenChat = 0.9; -- // waiting time between dialogues \\
	canSkip = false; -- // Player power to skip dialogues with a click \\
	AllowMovement = false -- // Player power to move in dialogue \\
})

dialogue:Begin("NPC") -- // name of the speaker
dialogue._Completed.Event:Event()
                                                               --]]



-- If you want to create options, create the variable 'chatChoice'
-- chatChoice: table, values on table: string
-- CHOICE CHAT --------------------------------
                                                               --[[
local dialogue = ProDialogue.new(player, {
	Body = {
		"Message1",
		"Message2",
	};
	chatChoice = {"response1, response2"}
})

dialogue:Begin("NPC")

dialogue._Completed.Event:Connect(function(val)
	if val == "Message2" then
		print("player chose the second option")
	end
end)
                                                               --]]

local dialogue = {}
dialogue .__index = dialogue 

local Roact = require(script.Roact)               -- Helps doing frames via script
local PureFrame = require(script.PureFrame)       -- Custom Roact frame maker
local IntError = require(script.IntError)         -- Auxiliar error checker
local onqueue = false                             -- Already using dialogue system

function typewrite(label: TextLabel, txt: string, wt: number, parent: Model)
	for i = 1, #txt, 1 do
		label.Text = string.sub(txt, 1, i)
		parent.Click:Play()
		task.wait(wt)
	end
end

-- Custom type, makes the configuration of the module more friendly
export type DialogueConfig = {
	Body: table,
	typeSpeed: number,
	BetweenChat: number,
	chatChoice: table | nil,
	
	canSkip: boolean,
	AllowMovement: boolean,
}

-- Main ProDialogue constructor
function dialogue.new(player: Player, configuration: DialogueConfig)
	assert(player.Character, "[ProDialogue]: Loaded too fast | CharacterModel equals nil")
	assert(player.PlayerGui, "[ProDialogue]: Loaded too fast | PlayerGui equals nil")
	
	for index, stringopt in configuration.Body do
		IntError(stringopt, "string")
	end
	
	local self = setmetatable({}, dialogue)
	
	-- SPECIAL --
	self._player = player
	self._PlayerGui = player:FindFirstChild("PlayerGui")
	self._Character = player.Character
	self._connection = nil
	
	-- BOOLEAN --
	self._IsActive = false
	
	-- EVENTS --
	self._Completed = Instance.new("BindableEvent")
	
	-- CONFIGURATION --
	self._config = configuration
	self._config.Body = configuration.Body or ""
	self._config.typeSpeed = configuration.typeSpeed or 0.08
	self._config.BetweenChat = configuration.BetweenChat or 0.9
	self._config.canSkip = configuration.canSkip or false
	self._config.AllowMovement = configuration.AllowMovement or false
	self._config.chatChoice = configuration.chatChoice
	
	return self
end

function dialogue:Begin(actor: string, imageIcon: string)
	assert(self._Character, "[ProDialogue]: Call the function from the constructor")
	
	local Humanoid = self._Character:WaitForChild("Humanoid")
	local WalkSpeed = Humanoid.WalkSpeed
	local JumpPower = Humanoid.JumpPower
	local UI = nil
	local SelectedOption = nil
	local skipinst = false
	
	if onqueue == false then
		if self._PlayerGui ~= nil then
			IntError(actor, "string")
			onqueue = true
			self._IsActive = true
			
			-- // Block Humanoid movement \\ --
			if not self._config.AllowMovement then
				Humanoid.WalkSpeed = 0   
				Humanoid.JumpPower = 0
			end
			
			-- // Create dialogue UI \\ --
			if typeof(imageIcon) ~= "string" then
				UI = PureFrame["dialogue_Model1"]()
			else
				UI = PureFrame["dialogue_Model2"]()
			end
			
			Roact.mount(UI, self._PlayerGui)
			local Interface = self._PlayerGui:WaitForChild("ProDialogue")
			Interface.Main.Title.Text = actor
			
			pcall(function()
				Interface.Main.Icon.Image = imageIcon
			end)
			
			-- // Load the previous \\ --
			local audio = Instance.new("Sound")
			audio.SoundId = "rbxassetid://4499400560"
			audio.Name = "Click"
			audio.Volume = 2
			audio.PlaybackSpeed = 1.8
			audio.RollOffMaxDistance = 15
			audio.Parent = self._Character
			
			self._connection = UserInputService.InputBegan:Connect(function(input, gp)
				if self._config.canSkip then
					if not gp and input.UserInputType == Enum.UserInputType.MouseButton1 then
						skipinst = true
					end
				end
			end)
			
			local function typewrite(text: string)
				for i = 1, #text, 1 do
					self._Character.Click:Play()
					
					if self._IsActive == false then
						repeat task.wait()
							Interface.Main.Description.Text = text
						until self._IsActive
						break
					end
					
					if skipinst then
						Interface.Main.Description.Text = text
						skipinst = false
						break
					end
					Interface.Main.Description.Text = string.sub(text, 1, i)
					task.wait(self._config.typeSpeed)
				end
			end
			
			-- // Actual dialogue system \\ --
			coroutine.resume(coroutine.create(function()
				for index, txt in ipairs(self._config.Body) do
					TweenService:Create(
						Interface.Main, TweenInfo.new(
							0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, true
						),
						{Position = Interface.Main.Position - UDim2.new(0, 0, 0.01, 0)}
					):Play()
					
					typewrite(txt)
					task.wait(self._config.BetweenChat)
				end
				Interface:Destroy()
				
				if self._config.chatChoice then
					local ChoiceChatUI = PureFrame["dialogue_Model3"]()
					Roact.mount(ChoiceChatUI, self._PlayerGui)
					
					Interface = self._PlayerGui:WaitForChild("ProDialogue")
					Interface.Main.Title.Text = actor
					Interface.Main.Description.Text = self._config.Body[#self._config.Body]
					
					for index, choice in pairs(self._config.chatChoice) do
						IntError(choice, "string")
						
						local btn = Instance.new("TextButton")
						local Id = "rbxasset://fonts/families/ComicNeueAngular.json"
						btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
						btn.BackgroundTransparency = 0.6
						btn.FontFace = Font.new(Id, Enum.FontWeight.Regular)
						btn.TextColor3 = Color3.fromRGB(255, 255, 255)
						btn.Size = UDim2.new(1, 0, 0, 44)
						btn.TextSize = 20
						btn.Name = choice
						btn.Text = choice
						btn.Parent = Interface.Options
					end
					
					repeat RunService.Heartbeat:Wait()
						for index, choice in pairs(Interface.Options:GetChildren()) do
							if choice:IsA("TextButton") then
								choice.MouseButton1Click:Connect(function()
									SelectedOption = choice.Text
								end)
							end
						end
					until SelectedOption ~= nil
					Interface:Destroy()
				end
				onqueue = false
				skipinst = false
				
				if self._connection then
					self._connection:Disconnect()
				end
				
				Humanoid.WalkSpeed = WalkSpeed
				Humanoid.JumpPower = JumpPower
				self._Character.Click:Destroy()
				self._Completed:Fire(SelectedOption)
			end))
		else
			warn("[ProDialogue]: Player UI instances didn't load")
		end
	end
end

function dialogue:Pause(timer: number)
	assert(self._Character, "[ProDialogue]: Call the function from the constructor")
	
	if onqueue == true then
		self._IsActive = false
		
		if timer ~= nil then
			IntError(timer, "number")
			
			coroutine.resume(coroutine.create(function()
				task.wait(timer)
				self._IsActive = true
			end))
		end
	end
end

function dialogue:Resume()
	assert(self._Character, "[ProDialogue]: Call the function from the constructor")
	
	if onqueue == true and self._IsActive == false then
		self._IsActive = true
	end
end

return dialogue
