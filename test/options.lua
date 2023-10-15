local ProDialogue = require(game.ReplicatedStorage.ProDialogue)
local NPCTorso = workspace.NPC.Torso
local ProximityPrompt: ProximityPrompt = NPCTorso.ProximityPrompt

ProximityPrompt.Triggered:Connect(function(player)
	local dialogue = ProDialogue.new(player, {
		Body = {
			"Hey buddy!",
			"Welcome to the game",
			-- *starts dancing*
			"Do you like this?"
		},
		canSkip = false,
		chatChoice = {"yes, nah"}
	})
	
	dialogue:Begin("NPC")
	dialogue._Completed.Event:Connect(function(val)
		if val == "nah" then
			player.leaderstats.Gems -= 1
		end
	end)
end)
