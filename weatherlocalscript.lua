local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local weatherEvent = ReplicatedStorage:WaitForChild("WeatherEvent")

local player = Players.LocalPlayer
local gui = player.PlayerGui:WaitForChild("ScreenGui")
local frame = gui:WaitForChild("MainFrame")

--the wathers
local rainBtn = frame:WaitForChild("RainButton")
local fogBtn  = frame:WaitForChild("FogButton")
local snowBtn = frame:WaitForChild("SnowButton")
local clearBtn = frame:WaitForChild("ClearButton")

rainBtn.MouseButton1Click:Connect(function()
    weatherEvent:FireServer("Rain")
end)

fogBtn.MouseButton1Click:Connect(function()
    weatherEvent:FireServer("Fog")
end)

snowBtn.MouseButton1Click:Connect(function()
    weatherEvent:FireServer("Snow")
end)

clearBtn.MouseButton1Click:Connect(function() 
    weatherEvent:FireServer("Clear")
