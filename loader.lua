-- GUI'yi tamamen sıfırdan kurar, modernleştirir, hover efektleri ve kategorili yapıyı içerir

-- Eski GUI'yi sil
pcall(function() game.CoreGui:FindFirstChild("KlaxxonHub"):Destroy() end)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")

-- Ana GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KlaxxonHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui

-- Ana Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 300)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

-- Başlık
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Klaxxon's Hub"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Kapatma Butonu
local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Text = "X"
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextScaled = true
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1, 0)
closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Sol Scroll Panel
local scroll = Instance.new("ScrollingFrame", mainFrame)
scroll.Size = UDim2.new(0, 150, 1, -50)
scroll.Position = UDim2.new(0, 10, 0, 45)
scroll.CanvasSize = UDim2.new(0, 0, 0, 600)
scroll.ScrollBarThickness = 6
scroll.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
scroll.BorderSizePixel = 0
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 6)

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 6)
layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
end)

-- Kredi
local credit = Instance.new("TextLabel", mainFrame)
credit.Text = "-credit Klaxx_onn1"
credit.Size = UDim2.new(1, -20, 0, 20)
credit.Position = UDim2.new(0, 10, 1, -25)
credit.BackgroundTransparency = 1
credit.TextColor3 = Color3.fromRGB(140, 140, 140)
credit.Font = Enum.Font.Code
credit.TextScaled = true
credit.TextXAlignment = Enum.TextXAlignment.Right

-- Buton Oluşturucu
local function createButton(name, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -10, 0, 35)
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.GothamMedium
	btn.TextScaled = true
	btn.Parent = scroll
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

	btn.MouseEnter:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(70, 70, 90)
	end)
	btn.MouseLeave:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
	end)

	btn.MouseButton1Click:Connect(callback)
	return btn
end

-- Kategori Başlığı
local function createCategory(titleText)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -10, 0, 30)
	label.Text = titleText
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamMedium
	label.TextScaled = true
	label.TextColor3 = Color3.fromRGB(180, 180, 180)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = scroll
end

-- ALT MENÜ
local function createCollapsible(title, subButtons)
	local state = false
	local mainBtn = createButton(title, function()
		state = not state
		for _, v in pairs(subButtons) do
			v.Visible = state
		end
	end)
	for _, b in pairs(subButtons) do
		b.Visible = false
	end
end

-- Kamp Butonları
local function THOScript()
	local remoteEvent = ReplicatedStorage:WaitForChild("RewardEvent")
	for i = 1, 30 do
		remoteEvent:FireServer()
		task.wait(0.1)
	end
end

local function TAFScript()
	local remoteEvent = ReplicatedStorage:WaitForChild("RewardEvent")
	for i = 1, 30 do
		remoteEvent:FireServer()
		task.wait(0.1)
	end
end

local function TTAScript()
	local remoteEvent = ReplicatedStorage:WaitForChild("Cark")
	for i = 1, 30 do
		remoteEvent:FireServer()
		task.wait(0.1)
	end
end

local function FlyScript()
	local flying = false
	local humanoid = player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")
	if not humanoid then return end

	flying = not flying
	if flying then
		local bodyVel = Instance.new("BodyVelocity", player.Character.PrimaryPart)
		bodyVel.Name = "FlyVelocity"
		bodyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)
		bodyVel.Velocity = Vector3.new(0, 50, 0)
	else
		local fly = player.Character.PrimaryPart:FindFirstChild("FlyVelocity")
		if fly then fly:Destroy() end
	end
end

-- Kamp Kategorisi
local thoBtn = createButton("THO", THOScript)
local tafBtn = createButton("TAF", TAFScript)
local ttaBtn = createButton("TTA", TTAScript)
createCollapsible("KAMPLAR", {thoBtn, tafBtn, ttaBtn})

-- Command Kategorisi
local flyBtn = createButton("FLY", FlyScript)
createCollapsible("CLASSIK COMMAND", {flyBtn})
