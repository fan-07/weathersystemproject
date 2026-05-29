local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")

local weatherEvent = ReplicatedStorage:WaitForChild("WeatherEvent")

-- btw fog texture is used from the default given in studio
local function clearWeather()
    -- Remove fog
    Lighting.FogEnd = 100000
    Lighting.FogStart = 0
    Lighting.FogColor = Color3.fromRGB(255, 255, 255)

    -- Remove particles from all characters
    for _, player in ipairs(Players:GetPlayers()) do
        local char = player.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, v in ipairs(hrp:GetChildren()) do
                    if v:IsA("ParticleEmitter") then
                        v:Destroy()
                    end
                end
            end
        end
    end
end

-- Weather functions
local function setRain()
    clearWeather()
    Lighting.Ambient = Color3.fromRGB(80, 80, 100)
    Lighting.Brightness = 0.5

    for _, player in ipairs(Players:GetPlayers()) do
        local char = player.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local rain = Instance.new("ParticleEmitter")
                rain.Texture = "rbxassetid://6101261905" -- rain texture (can find another one urself)
                rain.Rate = 200
                rain.Speed = NumberRange.new(50, 60)
                rain.Rotation = NumberRange.new(0, 0)
                rain.LightEmission = 0
                rain.Size = NumberSequence.new(0.05)
                rain.Color = ColorSequence.new(Color3.fromRGB(180, 200, 255))
                rain.Parent = hrp
            end
        end
    end
end

local function setFog()
    clearWeather()
    Lighting.FogEnd = 100
    Lighting.FogStart = 0
    Lighting.FogColor = Color3.fromRGB(200, 200, 200)
    Lighting.Ambient = Color3.fromRGB(120, 120, 120)
    Lighting.Brightness = 0.3
end

local function setSnow()
    clearWeather()
    Lighting.Ambient = Color3.fromRGB(180, 190, 210)
    Lighting.Brightness = 1.2

    for _, player in ipairs(Players:GetPlayers()) do
        local char = player.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local snow = Instance.new("ParticleEmitter")
                snow.Texture = "rbxassetid://6101261905" -- (you can find another asset id for the snow texture on ur own)
                snow.Rate = 80
                snow.Speed = NumberRange.new(5, 15)
                snow.Size = NumberSequence.new(0.15)
                snow.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
                snow.LightEmission = 0.5
                snow.Parent = hrp
            end
        end
    end
end

weatherEvent.OnServerEvent:Connect(function(player, weatherType)
    if weatherType == "Rain" then
        setRain()
    elseif weatherType == "Fog" then
        setFog()
    elseif weatherType == "Snow" then
        setSnow()
    end
end)
