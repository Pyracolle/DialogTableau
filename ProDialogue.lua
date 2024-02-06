local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

--------------------------------- PRO - DIALOGUE ------------------------------------
-- Writen by @mari230899
-- Created: 25/10/2022
-- Updated: 06/02/2024

-- https://devforum.roblox.com/t/2033941 (outdated info)
-- Thanks for using the module!
-------------------------------------------------------------------------------------
--]]

-- CLASSIC FORMAT --
--[[
local config = {
	Body = {                    -- only this table is necessary
		"Hi adventurer",
		"I hope you are good!"
	};
	AllowMovement = false;
	canSkip = false;
}

local ProDialogue = require(game.ReplicatedStorage.ProDialogue)
local constructor = ProDialogue.new(config)

script.Parent.ProximityPrompt.Triggered:Connect(function(player)
	constructor:Begin(player, "Guideman") -- u can add an optional image
end)
--]]

-- CHOICE FORMAT --
--[[
local config = {
	Body = {
		"Hi adventurer",
		"How are you?"
	};
	AllowMovement = false;
	chatChoice = {"GOOD", "Im sad :("};
}

local ProDialogue = require(game.ReplicatedStorage.ProDialogue)
local constructor = ProDialogue.new(config)

script.Parent.ProximityPrompt.Triggered:Connect(function(player)
	constructor:Begin(player, "Guideman")
	constructor._Completed.Event:Connect(function(answer)
		if answer == "GOOD" then
			-- create another dialogue or smt
		end
	end)
end)
--]]

local dialogue = {}
dialogue .__index = dialogue 

local Roact = require(script.Roact)               -- Helps doing frames via script
local PureFrame = require(script.PureFrame)       -- Custom Roact frame maker
local IntError = require(script.IntError)         -- Auxiliar error checker
local onqueue = false                             -- Already using dialogue system

export type DialogueConfig = {
	Body: table,                                  -- Main dialogue table
	typeSpeed: number,                            -- Delay between every letter
	BetweenChat: number,                          -- Delay between every text
	chatChoice: table | nil,                      -- Classic and Options
	
	canSkip: boolean,                             -- A button to skip dialogue will appear
	AllowMovement: boolean,                       -- Character can move in dialogue
}

-- Main ProDialogue constructor
function dialogue.new(configuration: DialogueConfig)
	for index, corpse in configuration.Body do
		IntError(corpse, "string")
	end
	local self = setmetatable({}, dialogue)
	
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
	self._config.chatChoice = configuration.chatChoice or nil
	
	return self
end

function dialogue:Begin(player: Player, actor: string, imageIcon: string)
	assert(self._config, "[ProDialogue]: Call the function from the constructor")
	IntError(player, "Player")
	IntError(actor, "string")
	
	local Character = player.Character
	local PlayerGui = player:WaitForChild("PlayerGui")
	local Humanoid = Character:WaitForChild("Humanoid")
	local WalkSpeed = Humanoid.WalkSpeed
	local JumpPower = Humanoid.JumpPower
	local UI = nil
	local SelectedOption = nil
	local allowIcon = false
	local skipinst = false
	
	if typeof(imageIcon) == "string" then
		allowIcon = true
	end
	
	if onqueue == false then
		if PlayerGui ~= nil then
			onqueue = true
			self._IsActive = true
			
			-- // Block Humanoid movement \\ --
			if not self._config.AllowMovement then
				Humanoid.WalkSpeed = 0   
				Humanoid.JumpPower = 0
			end
			
			-- // Create dialogue UI \\ --
			if allowIcon then
				UI = PureFrame["dialogue_1_icon"]()
			else
				UI = PureFrame["dialogue_1"]()
			end
			
			Roact.mount(UI, PlayerGui)
			local Interface = PlayerGui:WaitForChild("ProDialogue")
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
			audio.Parent = Character
			
			if self._config.canSkip then
				Interface.Main.skip.Visible = true
				Interface.Main.skip.MouseButton1Click:Connect(function()
					skipinst = true
				end)
			end
			
			local function typewrite(text: string)
				for i = 1, #text, 1 do
					Character.Click:Play()
					if self._IsActive == false then break end
					
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
					if self._IsActive == false then break end
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
				
				if self._config.chatChoice ~= nil and self._IsActive then
					IntError(self._config.chatChoice, "table")
					
					if #self._config.chatChoice ~= 0 and #self._config.chatChoice < 4 then
						local ChoiceUI
						if allowIcon then
							ChoiceUI = PureFrame["dialogue_2_icon"]()
						else
							ChoiceUI = PureFrame["dialogue_2"]()
						end
						
						Roact.mount(ChoiceUI, PlayerGui)
						Interface = PlayerGui:WaitForChild("ProDialogue")
						Interface.Main.Title.Text = actor
						typewrite(self._config.Body[#self._config.Body])
						
						pcall(function()
							Interface.Main.Icon.Image = imageIcon
						end)
						
						for index, txt in pairs(self._config.chatChoice) do
							local btn = Interface.Main.Options["Opt"..tostring(index)]
							btn.Visible = true
							btn.Text = txt
							
							btn.MouseButton1Click:Connect(function()
								SelectedOption = txt
							end)
						end
						repeat RunService.Heartbeat:Wait() until SelectedOption ~= nil
						Interface:Destroy()
					end
				end
				onqueue = false
				skipinst = false
				
				Humanoid.WalkSpeed = WalkSpeed
				Humanoid.JumpPower = JumpPower
				Character.Click:Destroy()
				self._Completed:Fire(SelectedOption)
			end))
		else
			warn("[ProDialogue]: Player UI instances didn't load")
		end
	end
end

function dialogue:Destroy()
	assert(self._config, "[ProDialogue]: Call the function from the constructor")
	
	if onqueue == true then
		self._IsActive = false
	end
end

return dialogue
