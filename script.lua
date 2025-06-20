local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Hide built-in UI
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

-- GUI setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RestartScreen"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.Active = true
bg.ZIndex = 1
bg.Parent = screenGui

-- Plug Image
local image = Instance.new("ImageLabel")
image.Size = UDim2.new(0, 200, 0, 200)
image.Position = UDim2.new(0.5, -100, 0.35, -100)
image.BackgroundTransparency = 1
image.Image = "rbxassetid://73366367355295" -- 🔁 Replace with real decal asset ID
image.ZIndex = 2
image.Parent = bg

-- Title Text
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Position = UDim2.new(0, 0, 0.65, 0)
title.BackgroundTransparency = 1
title.Text = "We're restarting Grow A Garden!"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.ZIndex = 2
title.Parent = bg

-- Subtitle Text
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 40)
subtitle.Position = UDim2.new(0, 0, 0.72, 0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Please wait while we redirect you..."
subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.ZIndex = 2
subtitle.Parent = bg

-- OPTIONAL: Spinner
local spinner = Instance.new("ImageLabel", bg)
spinner.Size = UDim2.new(0, 40, 0, 40)
spinner.Position = UDim2.new(0.5, -20, 0.85, 0)
spinner.BackgroundTransparency = 1
spinner.Image = "rbxassetid://1095708" -- Roblox default spinner image
spinner.ZIndex = 3

-- Spinner rotation logic
local angle = 0
RunService.RenderStepped:Connect(function()
    angle = (angle + 3) % 360
    spinner.Rotation = angle
end)

-- OPTIONAL: Auto kick after 10 seconds
task.delay(10000000, function()
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
    player:Kick("Servers are restarting... Please rejoin later.")
end)
