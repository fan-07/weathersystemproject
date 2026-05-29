--needs to be a local script btw
--put this under your clearweather button

local clearBtn = frame:WaitForChild("ClearButton")

clearBtn.MouseButton1Click:Connect(function()
    weatherEvent:FireServer("Clear")
end)
