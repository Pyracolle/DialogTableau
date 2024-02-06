local Roact = require(script.Parent.Roact)
local Id = "rbxasset://fonts/families/RobotoMono.json"

return {
	["dialogue_1"] = function()
		local Interface = Roact.createElement("ScreenGui", {
			IgnoreGuiInset = true;
			Name = "ProDialogue";
		},{
			Main = Roact.createElement("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				BackgroundTransparency = 0.3;
				Position = UDim2.new(0.229, 0, 0.672, 0);
				Size = UDim2.new(0, 738, 0, 188);
			}, {
				UICorner = Roact.createElement("UICorner", {
					CornerRadius = UDim.new(0, 12)
				});
				UIStroke = Roact.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					Color = Color3.fromRGB(162, 162, 162);
					Thickness = 2
				});
				Title = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 196, 0, 36);
					Position = UDim2.new(0.043, 0, 0.059, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					Text = "",
					TextSize = 25,
					TextXAlignment = Enum.TextXAlignment.Left,
					FontFace = Font.new(Id, Enum.FontWeight.Regular)
				});
				Description = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 675, 0, 109);
					Position = UDim2.new(0.043, 0, 0.287, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(150, 150, 150),
					Text = "",
					TextSize = 25,
					TextWrapped = true,
					FontFace = Font.new(Id, Enum.FontWeight.ExtraLight)
				});
				skip = Roact.createElement("TextButton", {
					Size = UDim2.new(0, 76, 0, 19);
					Position = UDim2.new(0.885, 0, 0.867, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 14,
					Text = "skip >",
					FontFace = Font.new(Id, Enum.FontWeight.Bold)
				})
			})
		})
		
		return Interface
	end;
	
	["dialogue_1_icon"] = function()
		local Interface = Roact.createElement("ScreenGui", {
			IgnoreGuiInset = true;
			Name = "ProDialogue";
		},{
			Main = Roact.createElement("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				BackgroundTransparency = 0.3;
				Position = UDim2.new(0.229, 0, 0.672, 0);
				Size = UDim2.new(0, 738, 0, 188);
			}, {
				UICorner = Roact.createElement("UICorner", {
					CornerRadius = UDim.new(0, 12)
				});
				UIStroke = Roact.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					Color = Color3.fromRGB(162, 162, 162);
					Thickness = 2
				});
				Title = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 183, 0, 36);
					Position = UDim2.new(0.031, 0, 0.064, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					Text = "",
					TextSize = 25,
					TextXAlignment = Enum.TextXAlignment.Left,
					FontFace = Font.new(Id, Enum.FontWeight.Regular)
				});
				Description = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 54, 0, 109);
					Position = UDim2.new(0.225, 0, 0.287, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(150, 150, 150),
					Text = "",
					TextSize = 25,
					TextWrapped = true,
					FontFace = Font.new(Id, Enum.FontWeight.ExtraLight)
				});
				skip = Roact.createElement("TextButton", {
					Size = UDim2.new(0, 76, 0, 19);
					Position = UDim2.new(0.885, 0, 0.867, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 14,
					Text = "skip >",
					Visible = false,
					FontFace = Font.new(Id, Enum.FontWeight.Bold)
				});
				Icon = Roact.createElement("ImageLabel", {
					Size = UDim2.new(0, 100, 0, 100);
					Position = UDim2.new(0.053, 0, 0.309, 0);
					BackgroundTransparency = 1,
					Image = "";
				}, {
					UICorner = Roact.createElement("UICorner", {
						CornerRadius = UDim.new(0, 12)
					});
					UIStroke = Roact.createElement("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
						Color = Color3.fromRGB(88, 88, 88);
						Thickness = 2
					});
				});
			})
		})
		
		return Interface
	end;
	
	["dialogue_2"] = function()
		local Interface = Roact.createElement("ScreenGui", {
			IgnoreGuiInset = true;
			Name = "ProDialogue";
		},{
			Main = Roact.createElement("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				BackgroundTransparency = 0.3;
				Position = UDim2.new(0.229, 0, 0.672, 0);
				Size = UDim2.new(0, 514, 0, 188);
			}, {
				UICorner = Roact.createElement("UICorner", {
					CornerRadius = UDim.new(0, 12)
				});
				UIStroke = Roact.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					Color = Color3.fromRGB(162, 162, 162);
					Thickness = 2
				});
				Title = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 196, 0, 36);
					Position = UDim2.new(0.043, 0, 0.059, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					Text = "",
					TextSize = 25,
					TextXAlignment = Enum.TextXAlignment.Left,
					FontFace = Font.new(Id, Enum.FontWeight.Regular)
				});
				Description = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 469, 0, 109);
					Position = UDim2.new(0.043, 0, 0.287, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(150, 150, 150),
					Text = "",
					TextSize = 25,
					TextWrapped = true,
					FontFace = Font.new(Id, Enum.FontWeight.ExtraLight)
				});
				Options = Roact.createElement("Frame", {
					Size = UDim2.new(0, 215, 0, 188);
					Position = UDim2.new(1.016, 0, 0, 0);
					BackgroundTransparency = 0.3,
					BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				}, {
					UICorner = Roact.createElement("UICorner", {
						CornerRadius = UDim.new(0, 12)
					});
					UIStroke = Roact.createElement("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
						Color = Color3.fromRGB(162, 162, 162);
						Thickness = 2
					});
					Opt1 = Roact.createElement("TextButton", {
						Size = UDim2.new(0, 188, 0, 40);
						Position = UDim2.new(0.06, 0, 0.128, 0);
						BackgroundTransparency = 0.5,
						BackgroundColor3 = Color3.fromRGB(29, 29, 29);
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 17,
						Text = "Answer 1",
						TextWrapped = true,
						Visible = false,
						FontFace = Font.new(Id, Enum.FontWeight.Bold)
					}, {
						UICorner = Roact.createElement("UICorner", {
							CornerRadius = UDim.new(0, 12)
						});
					});
					Opt2 = Roact.createElement("TextButton", {
						Size = UDim2.new(0, 188, 0, 40);
						Position = UDim2.new(0.06, 0, 0.394, 0);
						BackgroundTransparency = 0.5,
						BackgroundColor3 = Color3.fromRGB(29, 29, 29);
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 17,
						Text = "Answer 2",
						TextWrapped = true,
						Visible = false,
						FontFace = Font.new(Id, Enum.FontWeight.Bold)
					}, {
						UICorner = Roact.createElement("UICorner", {
							CornerRadius = UDim.new(0, 12)
						});
					});
					Opt3 = Roact.createElement("TextButton", {
						Size = UDim2.new(0, 188, 0, 40);
						Position = UDim2.new(0.06, 0, 0.654, 0);
						BackgroundTransparency = 0.5,
						BackgroundColor3 = Color3.fromRGB(29, 29, 29);
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 17,
						Text = "Answer 3",
						TextWrapped = true,
						Visible = false,
						FontFace = Font.new(Id, Enum.FontWeight.Bold)
					}, {
						UICorner = Roact.createElement("UICorner", {
							CornerRadius = UDim.new(0, 12)
						});
					})
				})
			})
		})
		
		return Interface
	end;
	
	["dialogue_2_icon"] = function()
		local Interface = Roact.createElement("ScreenGui", {
			IgnoreGuiInset = true;
			Name = "ProDialogue";
		},{
			Main = Roact.createElement("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				BackgroundTransparency = 0.3;
				Position = UDim2.new(0.229, 0, 0.672, 0);
				Size = UDim2.new(0, 514, 0, 188);
			}, {
				UICorner = Roact.createElement("UICorner", {
					CornerRadius = UDim.new(0, 12)
				});
				UIStroke = Roact.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					Color = Color3.fromRGB(162, 162, 162);
					Thickness = 2
				});
				Title = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 196, 0, 36);
					Position = UDim2.new(0.043, 0, 0.059, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					Text = "",
					TextSize = 25,
					TextXAlignment = Enum.TextXAlignment.Left,
					FontFace = Font.new(Id, Enum.FontWeight.Regular)
				});
				Description = Roact.createElement("TextLabel", {
					Size = UDim2.new(0, 346, 0, 109);
					Position = UDim2.new(0.283, 0, 0.287, 0);
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(150, 150, 150),
					Text = "",
					TextSize = 25,
					TextWrapped = true,
					FontFace = Font.new(Id, Enum.FontWeight.ExtraLight)
				});
				Icon = Roact.createElement("ImageLabel", {
					Size = UDim2.new(0, 100, 0, 100);
					Position = UDim2.new(0.053, 0, 0.309, 0);
					BackgroundTransparency = 1,
					Image = "";
				}, {
					UICorner = Roact.createElement("UICorner", {
						CornerRadius = UDim.new(0, 12)
					});
					UIStroke = Roact.createElement("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
						Color = Color3.fromRGB(88, 88, 88);
						Thickness = 2
					});
				});
				Options = Roact.createElement("Frame", {
					Size = UDim2.new(0, 215, 0, 188);
					Position = UDim2.new(1.016, 0, 0, 0);
					BackgroundTransparency = 0.3,
					BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				}, {
					UICorner = Roact.createElement("UICorner", {
						CornerRadius = UDim.new(0, 12)
					});
					UIStroke = Roact.createElement("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
						Color = Color3.fromRGB(162, 162, 162);
						Thickness = 2
					});
					Opt1 = Roact.createElement("TextButton", {
						Size = UDim2.new(0, 188, 0, 40);
						Position = UDim2.new(0.06, 0, 0.128, 0);
						BackgroundTransparency = 0.5,
						BackgroundColor3 = Color3.fromRGB(29, 29, 29);
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 17,
						Text = "Answer 1",
						TextWrapped = true,
						Visible = false,
						FontFace = Font.new(Id, Enum.FontWeight.Bold)
					}, {
						UICorner = Roact.createElement("UICorner", {
							CornerRadius = UDim.new(0, 12)
						});
					});
					Opt2 = Roact.createElement("TextButton", {
						Size = UDim2.new(0, 188, 0, 40);
						Position = UDim2.new(0.06, 0, 0.394, 0);
						BackgroundTransparency = 0.5,
						BackgroundColor3 = Color3.fromRGB(29, 29, 29);
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 17,
						Text = "Answer 2",
						TextWrapped = true,
						Visible = false,
						FontFace = Font.new(Id, Enum.FontWeight.Bold)
					}, {
						UICorner = Roact.createElement("UICorner", {
							CornerRadius = UDim.new(0, 12)
						});
					});
					Opt3 = Roact.createElement("TextButton", {
						Size = UDim2.new(0, 188, 0, 40);
						Position = UDim2.new(0.06, 0, 0.654, 0);
						BackgroundTransparency = 0.5,
						BackgroundColor3 = Color3.fromRGB(29, 29, 29);
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 17,
						Text = "Answer 3",
						TextWrapped = true,
						Visible = false,
						FontFace = Font.new(Id, Enum.FontWeight.Bold)
					}, {
						UICorner = Roact.createElement("UICorner", {
							CornerRadius = UDim.new(0, 12)
						});
					})
				})
			})
		})
		
		return Interface
	end;
}
