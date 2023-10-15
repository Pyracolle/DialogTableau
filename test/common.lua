local ProDialogue = require(game.ReplicatedStorage.ProDialogue)
local NPCTorso = workspace.NPC.Torso
local ProximityPrompt: ProximityPrompt = NPCTorso.ProximityPrompt

ProximityPrompt.Triggered:Connect(function(player)
	local dialogue = ProDialogue.new(player, {
		Body = {
			"Hey buddy!",
			"Welcome to the game"
		},
		canSkip = true,
		AllowMovement = false
	})
	
	dialogue:Begin("NPC")
	--dialogue._Completed.Event:Wait() -- wait until dialogue ends
	
	dialogue._Completed.Event:Connect(function(val)
		workspace.NPC:Destroy()
	end)
end)
