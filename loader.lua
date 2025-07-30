-- Eski GUI'yi temizle
pcall(function() game.Players.LocalPlayer.PlayerGui:FindFirstChild("KlaxxonHub"):Destroy() end)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Key
local requiredKey = "KlaxxonHUB39X39"

-- Ana GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KlaxxonHub"
screenGui.Parent = player.PlayerGui
screenGui.ResetOnSpawn = false

-- Key Giriş Frame
local keyFrame = Instance.new("Frame", screenGui)
keyFrame.Size = UDim2.new(0, 420, 0, 220)
keyFrame.Position = UDim2.new(0.5, -210, 0.5, -110)
keyFrame.BackgroundColor3 = Color3.fromRGB(32, 34, 44)
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 12)

local keyTitle = Instance.new("TextLabel", keyFrame)
keyTitle.Size = UDim2.new(1, 0, 0, 45)
keyTitle.Text = "Klaxxon Hub - Key Girişi"
keyTitle.TextScaled = true
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextColor3 = Color3.fromRGB(230, 230, 230)
keyTitle.BackgroundTransparency = 1
keyTitle.Position = UDim2.new(0, 0, 0, 10)

local keyBox = Instance.new("TextBox", keyFrame)
keyBox.Size = UDim2.new(0.85, 0, 0, 45)
keyBox.Position = UDim2.new(0.075, 0, 0.5, -25)
keyBox.PlaceholderText = "Anahtarınızı girin..."
keyBox.Font = Enum.Font.Gotham
keyBox.TextScaled = true
keyBox.TextColor3 = Color3.fromRGB(240, 240, 240)
keyBox.BackgroundColor3 = Color3.fromRGB(52, 56, 73)
keyBox.ClearTextOnFocus = false
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 8)

local submit = Instance.new("TextButton", keyFrame)
submit.Size = UDim2.new(0.5, 0, 0, 40)
submit.Position = UDim2.new(0.25, 0, 1, -55)
submit.Text = "Giriş Yap"
submit.Font = Enum.Font.GothamBold
submit.TextScaled = true
submit.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
submit.TextColor3 = Color3.fromRGB(240, 240, 240)
submit.AutoButtonColor = false
Instance.new("UICorner", submit).CornerRadius = UDim.new(0, 8)

submit.MouseEnter:Connect(function()
	submit.BackgroundColor3 = Color3.fromRGB(100, 170, 100)
end)
submit.MouseLeave:Connect(function()
	submit.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
end)

-- Ana Frame (başlangıçta gizli)
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 520, 0, 320)
mainFrame.Position = UDim2.new(0.5, -260, 0.5, -160)
mainFrame.BackgroundColor3 = Color3.fromRGB(32, 34, 44)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "Klaxxon's Hub"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(240, 240, 240)
title.Position = UDim2.new(0, 0, 0, 10)

local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Text = "X"
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -42, 0, 12)
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextScaled = true
closeBtn.AutoButtonColor = false
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1, 0)

closeBtn.MouseEnter:Connect(function()
	closeBtn.BackgroundColor3 = Color3.fromRGB(220, 70, 70)
end)
closeBtn.MouseLeave:Connect(function()
	closeBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
end)

closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

local scroll = Instance.new("ScrollingFrame", mainFrame)
scroll.Size = UDim2.new(0, 160, 1, -60)
scroll.Position = UDim2.new(0, 15, 0, 55)
scroll.CanvasSize = UDim2.new(0, 0, 0, 600)
scroll.ScrollBarThickness = 8
scroll.BackgroundColor3 = Color3.fromRGB(42, 45, 60)
scroll.BorderSizePixel = 0
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 10)

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 8)
layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 24)
end)

local credit = Instance.new("TextLabel", mainFrame)
credit.Text = "- credit Klaxx_onn1"
credit.Size = UDim2.new(1, -30, 0, 22)
credit.Position = UDim2.new(0, 15, 1, -30)
credit.BackgroundTransparency = 1
credit.TextColor3 = Color3.fromRGB(170, 170, 170)
credit.Font = Enum.Font.Code
credit.TextScaled = true
credit.TextXAlignment = Enum.TextXAlignment.Right

-- Buton oluşturucu
local function createButton(name, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -14, 0, 38)
	btn.BackgroundColor3 = Color3.fromRGB(65, 65, 90)
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(240, 240, 240)
	btn.Font = Enum.Font.GothamMedium
	btn.TextScaled = true
	btn.Parent = scroll
	btn.AutoButtonColor = false
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

	btn.MouseEnter:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(85, 85, 115)
	end)
	btn.MouseLeave:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(65, 65, 90)
	end)

	btn.MouseButton1Click:Connect(callback)
	return btn
end

-- Kategori başlığı
local function createCategory(titleText)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -14, 0, 34)
	label.Text = titleText
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamMedium
	label.TextScaled = true
	label.TextColor3 = Color3.fromRGB(190, 190, 190)
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = scroll
end

-- Alt Menü (collapsible)
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

-- Kamp Scriptleri
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

-- Fly & Noclip - Toggle ile aç/kapa
local flying = false
local noclip = false

local flyConnection
local noclipConnection

local function startFly()
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if not hrp or not humanoid then return end

	flying = true

	local bg = Instance.new("BodyGyro", hrp)
	bg.P = 9e4
	bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
	bg.cframe = hrp.CFrame

	local bv = Instance.new("BodyVelocity", hrp)
	bv.velocity = Vector3.new(0, 0.1, 0)
	bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

	flyConnection = RunService.Heartbeat:Connect(function()
		local moveDir = Vector3.new()
		if UIS:IsKeyDown(Enum.KeyCode.W) then
			moveDir = moveDir + workspace.CurrentCamera.CFrame.LookVector
		end
		if UIS:IsKeyDown(Enum.KeyCode.S) then
			moveDir = moveDir - workspace.CurrentCamera.CFrame.LookVector
		end
		if UIS:IsKeyDown(Enum.KeyCode.A) then
			moveDir = moveDir - workspace.CurrentCamera.CFrame.RightVector
		end
		if UIS:IsKeyDown(Enum.KeyCode.D) then
			moveDir = moveDir + workspace.CurrentCamera.CFrame.RightVector
		end
		if moveDir.Magnitude > 0 then
			bv.velocity = moveDir.Unit * 50
		else
			bv.velocity = Vector3.new(0, 0, 0)
		end
		bg.cframe = workspace.CurrentCamera.CFrame
	end)

	humanoid.PlatformStand = true
end

local function stopFly()
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if not hrp or not humanoid then return end

	flying = false

	local bg = hrp:FindFirstChildOfClass("BodyGyro")
	if bg then bg:Destroy() end
	local bv = hrp:FindFirstChildOfClass("BodyVelocity")
	if bv then bv:Destroy() end

	if flyConnection then
		flyConnection:Disconnect()
		flyConnection = nil
	end

	humanoid.PlatformStand = false
end

local function toggleFly()
	if flying then
		stopFly()
	else
		startFly()
	end
end

local function startNoclip()
	noclip = true
	noclipConnection = RunService.Stepped:Connect(function()
		if player.Character then
			for _, part in pairs(player.Character:GetDescendants()) do
				if part:IsA("BasePart") and part.CanCollide then
					part.CanCollide = false
				end
			end
		end
	end)
end

local function stopNoclip()
	noclip = false
	if noclipConnection then
		noclipConnection:Disconnect()
		noclipConnection = nil
	end
	if player.Character then
		for _, part in pairs(player.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = true
			end
		end
	end
end

local function toggleNoclip()
	if noclip then
		stopNoclip()
	else
		startNoclip()
	end
end

-- Kamp kategorisi
local thoBtn = createButton("THO", THOScript)
local tafBtn = createButton("TAF", TAFScript)
local ttaBtn = createButton("TTA", TTAScript)
createCollapsible("KAMPLAR", {thoBtn, tafBtn, ttaBtn})

-- Command kategorisi
local flyBtn = createButton("FLY (Toggle)", toggleFly)
local noclipBtn = createButton("NOCLIP (Toggle)", toggleNoclip)
createCollapsible("CLASSIK COMMAND", {flyBtn, noclipBtn})

-- Key kontrol fonksiyonu
local function checkKey()
	if keyBox.Text == requiredKey then
		keyFrame.Visible = false
		mainFrame.Visible = true
	else
		keyBox.Text = ""
		keyBox.PlaceholderText = "Yanlış Anahtar, tekrar deneyin"
	end
end

submit.MouseButton1Click:Connect(checkKey)
keyBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		checkKey()
	end
end)
