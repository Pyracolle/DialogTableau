local Roact = require(script.Parent.Roact)
local Id = "rbxasset://fonts/families/ComicNeueAngular.json"

return {
	["dialogue_Model1"] = function()
		local Interface = Roact.createElement("ScreenGui", {
			Name = "ProDialogue";
		},{
			Main = Roact.createElement("Frame", {
				BackgroundColor3 = Color3.fromRGB(47, 47, 47);
				BackgroundTransparency = 0.5;
				Position = UDim2.new(0.26, 0, 0.72, 0);
				Size = UDim2.new(0, 656, 0, 150);
			}, {
				UIGradient = Roact.createElement("UIGradient", {
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(
							0, 
							Color3.new(0, 0, 0)
						),
						ColorSequenceKeypoint.new(
							1,
							Color3.new(1, 1, 1)
						)
					});
					Rotation = 90
				});
				Title = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 194, 0, 24);
					Position = UDim2.new(0.024, 0, 0.087, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					Text = "",
					TextSize = 24,
					TextWrapped = true,
					FontFace = Font.new(Id, Enum.FontWeight.Bold)
				});
				Description = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 625, 0, 93);
					Position = UDim2.new(0.024, 0, 0.287, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					Text = "",
					TextSize = 24,
					TextWrapped = true,
					FontFace = Font.new(Id, Enum.FontWeight.Regular)
				})
			})
		})
		
		return Interface
	end;
	
	["dialogue_Model2"] = function()
		local Interface = Roact.createElement("ScreenGui", {
			Name = "ProDialogue";
		},{
			Main = Roact.createElement("Frame", {
				BackgroundColor3 = Color3.fromRGB(47, 47, 47);
				BackgroundTransparency = 0.5;
				Position = UDim2.new(0.26, 0, 0.72, 0);
				Size = UDim2.new(0, 656, 0, 150);
			}, {
				UIGradient = Roact.createElement("UIGradient", {
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(
							0, 
							Color3.new(0, 0, 0)
						),
						ColorSequenceKeypoint.new(
							1,
							Color3.new(1, 1, 1)
						)
					});
					Rotation = 90
				});
				Icon = Roact.createElement("ImageLabel", {
					BackgroundTransparency = 1;
					Position = UDim2.new(0.037, 0, 0.08, 0);
					Size = UDim2.new(0, 100, 0, 100);
					Image = ""
				});
				Title = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 124, 0, 24);
					Position = UDim2.new(0.018, 0, 0.794, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					Text = "",
					TextSize = 24,
					TextWrapped = true,
					FontFace = Font.new(Id, Enum.FontWeight.Bold)
				});
				Description = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 484, 0, 74);
					Position = UDim2.new(0.219, 0, 0.28, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					Text = "",
					TextSize = 24,
					TextWrapped = true,
					FontFace = Font.new(Id, Enum.FontWeight.Regular)
				})
			})
		})

		return Interface
	end;
	
	["dialogue_Model3"] = function()
		local Interface = Roact.createElement("ScreenGui",{
			Name = "ProDialogue";
		},{
			Main = Roact.createElement("Frame", {
				BackgroundColor3 = Color3.fromRGB(47, 47, 47);
				BackgroundTransparency = 0.5;
				Position = UDim2.new(0.26, 0, 0.72, 0);
				Size = UDim2.new(0, 457, 0, 150);
			}, {
				UIGradient = Roact.createElement("UIGradient", {
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(
							0, 
							Color3.new(0, 0, 0)
						),
						ColorSequenceKeypoint.new(
							1,
							Color3.new(1, 1, 1)
						)
					});
					Rotation = 90
				});
				Title = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 194, 0, 24);
					Position = UDim2.new(0.024, 0, 0.087, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					Text = "",
					TextSize = 24,
					TextWrapped = true,
					FontFace = Font.new(Id, Enum.FontWeight.Bold)
				});
				Description = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 432, 0, 93);
					Position = UDim2.new(0.024, 0, 0.287, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					Text = "",
					TextSize = 24,
					TextWrapped = true,
					FontFace = Font.new(Id, Enum.FontWeight.Regular)
				})
			});
			Options = Roact.createElement("Frame", {
				Size = UDim2.new(0, 189, 0, 150);
				Position = UDim2.new(0.603, 0, 0.74, 0);
				Transparency = 1
			}, {
				UIListLayout = Roact.createElement("UIListLayout", {
					Padding = UDim.new(0, 8)
				});
			})
		})
		return Interface
	end;
}
