local Roact = require(script.Parent.Roact)

return {
	["dialog_1"] = function(str: string)
		local FontId = "rbxasset://fonts/families/"..str..".json"
		local Interface = Roact.createElement("ScreenGui", {
			IgnoreGuiInset = true;
			Name = "DialogTableau";
		},{
			Main = Roact.createElement("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundTransparency = 0.5;
				BorderSizePixel = 0;
				Position = UDim2.new(0.5, 0, 0.85, 0);
				Size = UDim2.new(0.4, 0, 0.25, 0);
			}, {
				UIGradient = Roact.createElement("UIGradient", {
					Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(117, 117, 117));
					Rotation = 90;
				});
				UIStroke = Roact.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					Color = Color3.fromRGB(255, 255, 255);
					Thickness = 1.5;
					Transparency = 0.5;
				});
				Title = Roact.createElement("TextLabel", {
					AnchorPoint = Vector2.new(0, 0.5);
					BackgroundColor3 = Color3.fromRGB(0, 0, 0);
					BackgroundTransparency = 0.5;
					BorderSizePixel = 0;
					Position = UDim2.new(0, 0, -0.18, 0);
					Size = UDim2.new(0.3, 0, 0.25, 0);
					TextColor3 = Color3.fromRGB(255, 255, 255);
					Text = "";
					TextSize = 25;
					FontFace = Font.new(FontId, Enum.FontWeight.Regular);
				}, {
					UIStroke = Roact.createElement("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
						Color = Color3.fromRGB(255, 255, 255);
						Thickness = 1.5;
						Transparency = 0.5;
					});
				});
				Dialog = Roact.createElement("Frame", {
					AnchorPoint = Vector2.new(0.5, 0.5);
					BackgroundTransparency = 1;
					BorderSizePixel = 0;
					Position = UDim2.new(0.5, 0, 0.5, 0);
					Size = UDim2.new(0.9, 0, 0.8, 0);
					ClipsDescendants = true;
				}, {
					UIListLayout = Roact.createElement("UIListLayout", {
						Padding = UDim.new(0, 0);
						FillDirection = Enum.FillDirection.Horizontal;
						Wraps = true;
					})
				});
				skip = Roact.createElement("TextButton", {
					AnchorPoint = Vector2.new(0, 0);
					BackgroundColor3 = Color3.fromRGB(0, 0, 0);
					BackgroundTransparency = 0.5;
					BorderSizePixel = 0;
					Position = UDim2.new(1.01, 0, 0.8, 0);
					Size = UDim2.new(0.06, 0, 0.2, 0);
					TextColor3 = Color3.fromRGB(255, 255, 255);
					TextSize = 16;
					Text = ">>";
					Visible = false;
					TextWrapped = true;
					FontFace = Font.new(FontId, Enum.FontWeight.Bold);
				}, {
					UIStroke = Roact.createElement("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
						Color = Color3.fromRGB(255, 255, 255);
						Thickness = 1.5;
						Transparency = 0.5;
					});
				})
			})
		})
		
		return Interface
	end;
	
	["dialog_2"] = function(str: string)
		local FontId = "rbxasset://fonts/families/"..str..".json"
		local Interface = Roact.createElement("ScreenGui", {
			IgnoreGuiInset = true;
			Name = "DialogTableau";
		},{
			Main = Roact.createElement("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5);
				BackgroundTransparency = 0.5;
				BorderSizePixel = 0;
				Position = UDim2.new(0.5, 0, 0.85, 0);
				Size = UDim2.new(0.4, 0, 0.25, 0);
			}, {
				UIGradient = Roact.createElement("UIGradient", {
					Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(117, 117, 117));
					Rotation = 90;
				});
				UIStroke = Roact.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					Color = Color3.fromRGB(255, 255, 255);
					Thickness = 1.5;
					Transparency = 0.5;
				});
				Title = Roact.createElement("TextLabel", {
					AnchorPoint = Vector2.new(0, 0.5);
					BackgroundColor3 = Color3.fromRGB(0, 0, 0);
					BackgroundTransparency = 0.5;
					BorderSizePixel = 0;
					Position = UDim2.new(0, 0, -0.18, 0);
					Size = UDim2.new(0.3, 0, 0.25, 0);
					TextColor3 = Color3.fromRGB(255, 255, 255);
					Text = "";
					TextSize = 25;
					FontFace = Font.new(FontId, Enum.FontWeight.Regular);
				}, {
					UIStroke = Roact.createElement("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
						Color = Color3.fromRGB(255, 255, 255);
						Thickness = 1.5;
						Transparency = 0.5;
					});
				});
				Dialog = Roact.createElement("Frame", {
					AnchorPoint = Vector2.new(0.5, 0.5);
					BackgroundTransparency = 1;
					BorderSizePixel = 0;
					Position = UDim2.new(0.5, 0, 0.5, 0);
					Size = UDim2.new(0.9, 0, 0.8, 0);
					ClipsDescendants = true;
				}, {
					UIListLayout = Roact.createElement("UIListLayout", {
						Padding = UDim.new(0, 0);
						FillDirection = Enum.FillDirection.Horizontal;
						Wraps = true;
					})
				});
				Options = Roact.createElement("Frame", {
					AnchorPoint = Vector2.new(0.5, 0.5);
					BackgroundTransparency = 1;
					BorderSizePixel = 0;
					Position = UDim2.new(0.5, 0, 1.16);
					Size = UDim2.new(1, 0, 0.2, 0);
				}, {
					UIListLayout = Roact.createElement("UIListLayout", {
						Padding = UDim.new(0.01, 0);
						FillDirection = Enum.FillDirection.Horizontal;
						HorizontalAlignment = Enum.HorizontalAlignment.Center;
					});
					Template = Roact.createElement("TextButton", {
						AutomaticSize = Enum.AutomaticSize.XY;
						BackgroundColor3 = Color3.fromRGB(0, 0, 0);
						BackgroundTransparency = 0.5;
						BorderSizePixel = 0;
						Size = UDim2.new(0.3, 0, 1, 0);
						TextColor3 = Color3.fromRGB(255, 255, 255);
						Visible = false;
						TextWrapped = true;
						TextSize = 25;
						FontFace = Font.new(FontId, Enum.FontWeight.Regular);
					}, {
						UIStroke = Roact.createElement("UIStroke", {
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
							Color = Color3.fromRGB(255, 255, 255);
							Thickness = 1.5;
							Transparency = 0.5;
						});
					})
				})
			})
		})
		
		return Interface
	end;
	
	["dialog_1_headshot"] = function(str: string, img: number)
		local FontId = "rbxasset://fonts/families/"..str..".json"
		local Interface = Roact.createElement("ScreenGui", {
			IgnoreGuiInset = true;
			Name = "DialogTableau";
		},{
			Main = Roact.createElement("Frame", {
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundTransparency = 0.5;
				BorderSizePixel = 0;
				Position = UDim2.new(0.43, 0, 0.85, 0);
				Size = UDim2.new(0.27, 0, 0.25, 0);
			}, {
				UIGradient = Roact.createElement("UIGradient", {
					Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(117, 117, 117));
					Rotation = 90;
				});
				UIStroke = Roact.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					Color = Color3.fromRGB(255, 255, 255);
					Thickness = 1.5;
					Transparency = 0.5;
				});
				Title = Roact.createElement("TextLabel", {
					AnchorPoint = Vector2.new(0, 0.5);
					BackgroundColor3 = Color3.fromRGB(0, 0, 0);
					BackgroundTransparency = 0.5;
					BorderSizePixel = 0;
					Position = UDim2.new(-0.48, 0, -0.18, 0);
					Size = UDim2.new(0.45, 0, 0.25, 0);
					TextColor3 = Color3.fromRGB(255, 255, 255);
					Text = "";
					TextSize = 25;
					FontFace = Font.new(FontId, Enum.FontWeight.Regular);
				}, {
					UIStroke = Roact.createElement("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
						Color = Color3.fromRGB(255, 255, 255);
						Thickness = 1.5;
						Transparency = 0.5;
					});
				});
				Dialog = Roact.createElement("Frame", {
					AnchorPoint = Vector2.new(0.5, 0.5);
					BackgroundTransparency = 1;
					BorderSizePixel = 0;
					Position = UDim2.new(0.5, 0, 0.5, 0);
					Size = UDim2.new(0.9, 0, 0.8, 0);
					ClipsDescendants = true;
				}, {
					UIListLayout = Roact.createElement("UIListLayout", {
						Padding = UDim.new(0, 0);
						FillDirection = Enum.FillDirection.Horizontal;
						Wraps = true;
					})
				});
				skip = Roact.createElement("TextButton", {
					AnchorPoint = Vector2.new(0, 0);
					BackgroundColor3 = Color3.fromRGB(0, 0, 0);
					BackgroundTransparency = 0.5;
					BorderSizePixel = 0;
					Position = UDim2.new(1.01, 0, 0.8, 0);
					Size = UDim2.new(0.06, 0, 0.2, 0);
					TextColor3 = Color3.fromRGB(255, 255, 255);
					TextSize = 16;
					Text = ">>";
					Visible = false;
					TextWrapped = true;
					FontFace = Font.new(FontId, Enum.FontWeight.Bold);
				}, {
					UIStroke = Roact.createElement("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
						Color = Color3.fromRGB(255, 255, 255);
						Thickness = 1.5;
						Transparency = 0.5;
					});
				});
				imgShot = Roact.createElement("ImageLabel", {
					AnchorPoint = Vector2.new(0.5, 0.5);
					BackgroundColor3 = Color3.fromRGB(0, 0, 0);
					BackgroundTransparency = 0.5;
					BorderSizePixel = 0;
					Position = UDim2.new(-0.25, 0, 0.5, 0);
					Size = UDim2.new(0.45, 0, 1, 0);
					Image = "rbxassetid://"..img
				}, {
					UIStroke = Roact.createElement("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
						Color = Color3.fromRGB(255, 255, 255);
						Thickness = 1.5;
						Transparency = 0.5;
					});
				});
			})
		})
		
		return Interface
	end;
	
	["dialog_2_headshot"] = function(str: string, img: number)
		local FontId = "rbxasset://fonts/families/"..str..".json"
		local Interface = Roact.createElement("ScreenGui", {
			IgnoreGuiInset = true;
			Name = "DialogTableau";
		},{
			Main = Roact.createElement("Frame", {
				AnchorPoint = Vector2.new(0, 0.5);
				BackgroundTransparency = 0.5;
				BorderSizePixel = 0;
				Position = UDim2.new(0.43, 0, 0.85, 0);
				Size = UDim2.new(0.27, 0, 0.25, 0);
			}, {
				UIGradient = Roact.createElement("UIGradient", {
					Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(117, 117, 117));
					Rotation = 90;
				});
				UIStroke = Roact.createElement("UIStroke", {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					Color = Color3.fromRGB(255, 255, 255);
					Thickness = 1.5;
					Transparency = 0.5;
				});
				Title = Roact.createElement("TextLabel", {
					AnchorPoint = Vector2.new(0, 0.5);
					BackgroundColor3 = Color3.fromRGB(0, 0, 0);
					BackgroundTransparency = 0.5;
					BorderSizePixel = 0;
					Position = UDim2.new(-0.48, 0, -0.18, 0);
					Size = UDim2.new(0.45, 0, 0.25, 0);
					TextColor3 = Color3.fromRGB(255, 255, 255);
					Text = "";
					TextSize = 25;
					FontFace = Font.new(FontId, Enum.FontWeight.Regular);
				}, {
					UIStroke = Roact.createElement("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
						Color = Color3.fromRGB(255, 255, 255);
						Thickness = 1.5;
						Transparency = 0.5;
					});
				});
				Dialog = Roact.createElement("Frame", {
					AnchorPoint = Vector2.new(0.5, 0.5);
					BackgroundTransparency = 1;
					BorderSizePixel = 0;
					Position = UDim2.new(0.5, 0, 0.5, 0);
					Size = UDim2.new(0.9, 0, 0.8, 0);
					ClipsDescendants = true;
				}, {
					UIListLayout = Roact.createElement("UIListLayout", {
						Padding = UDim.new(0, 0);
						FillDirection = Enum.FillDirection.Horizontal;
						Wraps = true;
					})
				});
				imgShot = Roact.createElement("ImageLabel", {
					AnchorPoint = Vector2.new(0.5, 0.5);
					BackgroundColor3 = Color3.fromRGB(0, 0, 0);
					BackgroundTransparency = 0.5;
					BorderSizePixel = 0;
					Position = UDim2.new(-0.25, 0, 0.5, 0);
					Size = UDim2.new(0.45, 0, 1, 0);
					Image = "rbxassetid://"..img
				}, {
					UIStroke = Roact.createElement("UIStroke", {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
						Color = Color3.fromRGB(255, 255, 255);
						Thickness = 1.5;
						Transparency = 0.5;
					});
				});
				Options = Roact.createElement("Frame", {
					AnchorPoint = Vector2.new(0.5, 0.5);
					BackgroundTransparency = 1;
					BorderSizePixel = 0;
					Position = UDim2.new(0.25, 0, 1.16);
					Size = UDim2.new(1, 0, 0.2, 0);
				}, {
					UIListLayout = Roact.createElement("UIListLayout", {
						Padding = UDim.new(0.01, 0);
						FillDirection = Enum.FillDirection.Horizontal;
						HorizontalAlignment = Enum.HorizontalAlignment.Center;
					});
					Template = Roact.createElement("TextButton", {
						AutomaticSize = Enum.AutomaticSize.XY;
						BackgroundColor3 = Color3.fromRGB(0, 0, 0);
						BackgroundTransparency = 0.5;
						BorderSizePixel = 0;
						Size = UDim2.new(0.3, 0, 1, 0);
						TextColor3 = Color3.fromRGB(255, 255, 255);
						Visible = false;
						TextWrapped = true;
						TextSize = 25;
						FontFace = Font.new(FontId, Enum.FontWeight.Regular);
					}, {
						UIStroke = Roact.createElement("UIStroke", {
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
							Color = Color3.fromRGB(255, 255, 255);
							Thickness = 1.5;
							Transparency = 0.5;
						});
					})
				})
			})
		})
		
		return Interface
	end;
}
