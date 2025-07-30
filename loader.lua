-- 🔒 Şifre: KlaxxonHUB39X39
-- ⚙️ Ana GUI, Giriş Paneli, Komutlar, Kamp Scriptleri, ESP, AIMBOT, Fly/Noclip

pcall(function() game.Players.LocalPlayer.PlayerGui:FindFirstChild("KlaxxonHub"):Destroy() end)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local requiredKey = "KlaxxonHUB39X39"

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KlaxxonHub"
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Login Panel
local keyFrame = Instance.new("Frame", screenGui)
keyFrame.Size = UDim2.new(0, 420, 0, 220)
keyFrame.Position = UDim2.new(0.5, -210, 0.5, -110)
keyFrame.BackgroundColor3 = Color3.fromRGB(32, 34, 44)
keyFrame.Active = true
keyFrame.Draggable = true
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

-- Ana Frame
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
scroll.Size = UDim2.new(0, 180, 1, -60)
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

local function createCollapsible(titleText, buttons)
	local state = false
	local mainBtn = createButton(titleText, function()
		state = not state
		for _, btn in pairs(buttons) do
			btn.Visible = state
		end
	end)
	for _, btn in pairs(buttons) do
		btn.Visible = false
	end
	return mainBtn
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

-- Movement (Fly / Noclip)
local flying, noclip = false, false
local flyConnection, noclipConnection

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
		if UIS:IsKeyDown(Enum.KeyCode.W) then moveDir += workspace.CurrentCamera.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.S) then moveDir -= workspace.CurrentCamera.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.A) then moveDir -= workspace.CurrentCamera.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.D) then moveDir += workspace.CurrentCamera.CFrame.RightVector end
		bv.velocity = moveDir.Magnitude > 0 and moveDir.Unit * 50 or Vector3.zero
		bg.cframe = workspace.CurrentCamera.CFrame
	end)
	humanoid.PlatformStand = true
end

local function stopFly()
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	flying = false
	local bg = hrp:FindFirstChildOfClass("BodyGyro")
	if bg then bg:Destroy() end
	local bv = hrp:FindFirstChildOfClass("BodyVelocity")
	if bv then bv:Destroy() end
	if flyConnection then flyConnection:Disconnect() flyConnection = nil end
	if humanoid then humanoid.PlatformStand = false end
end

local function toggleFly()
	if flying then
		stopFly()
	else
		startFly()
	end
end

local function startNoclip()
	if noclip then return end
	noclip = true
	noclipConnection = RunService.Stepped:Connect(function()
		local char = player.Character
		if char then
			for _, part in pairs(char:GetChildren()) do
				if part:IsA("BasePart") then
					part.CanCollide = false
				end
			end
		end
	end)
end

local function stopNoclip()
	if not noclip then return end
	noclip = false
	if noclipConnection then
		noclipConnection:Disconnect()
		noclipConnection = nil
	end
	local char = player.Character
	if char then
		for _, part in pairs(char:GetChildren()) do
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

-- ESP (Basit örnek)
local espEnabled = false
local espConnections = {}

local function createESP()
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local box = Instance.new("BoxHandleAdornment")
			box.Adornee = plr.Character.HumanoidRootPart
			box.AlwaysOnTop = true
			box.ZIndex = 10
			box.Size = Vector3.new(3, 6, 3)
			box.Color3 = Color3.new(1, 0, 0)
			box.Transparency = 0.5
			box.Parent = player.PlayerGui
			espConnections[plr.Name] = box
		end
	end
end

local function removeESP()
	for _, box in pairs(espConnections) do
		box:Destroy()
	end
	espConnections = {}
end

local function toggleESP()
	espEnabled = not espEnabled
	if espEnabled then
		createESP()
	else
		removeESP()
	end
end

Players.PlayerAdded:Connect(function(plr)
	if espEnabled then
		task.wait(1)
		if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local box = Instance.new("BoxHandleAdornment")
			box.Adornee = plr.Character.HumanoidRootPart
			box.AlwaysOnTop = true
			box.ZIndex = 10
			box.Size = Vector3.new(3, 6, 3)
			box.Color3 = Color3.new(1, 0, 0)
			box.Transparency = 0.5
			box.Parent = player.PlayerGui
			espConnections[plr.Name] = box
		end
	end
end)

Players.PlayerRemoving:Connect(function(plr)
	if espConnections[plr.Name] then
		espConnections[plr.Name]:Destroy()
		espConnections[plr.Name] = nil
	end
end)

-- Aimbot
local aimbotEnabled = false
local aimbotFov = 50
local aimbotTarget = nil
local aiming = false

local function getClosestTarget()
	local closestDist = math.huge
	local target = nil
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
			local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
			if onScreen then
				local mousePos = UIS:GetMouseLocation()
				local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mousePos.X, mousePos.Y)).Magnitude
				if dist < closestDist and dist <= aimbotFov then
					closestDist = dist
					target = plr
				end
			end
		end
	end
	return target
end

UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.E then
		aiming = true
		aimbotTarget = getClosestTarget()
	end
end)

UIS.InputEnded:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.E then
		aiming = false
		aimbotTarget = nil
	end
end)

RunService.RenderStepped:Connect(function()
	if aimbotEnabled and aiming and aimbotTarget and aimbotTarget.Character and aimbotTarget.Character:FindFirstChild("HumanoidRootPart") then
		local hrp = aimbotTarget.Character.HumanoidRootPart
		local camera = workspace.CurrentCamera
		local camPos = camera.CFrame.Position
		local targetPos = hrp.Position
		local direction = (targetPos - camPos).Unit
		local newCFrame = CFrame.new(camPos, camPos + direction)
		camera.CFrame = camera.CFrame:Lerp(newCFrame, 0.2)
	end
end)

-- Kategori Butonları ve İçindekiler

local kampButtons = {
	createButton("THO Kamp Scripti", THOScript),
	createButton("TAF Kamp Scripti", TAFScript),
	createButton("TTA Kamp Scripti", TTAScript),
}

local movementButtons = {
	createButton("Fly Aç/Kapat", toggleFly),
	createButton("Noclip Aç/Kapat", toggleNoclip),
}

local espButtons = {
	createButton("ESP Aç/Kapat", toggleESP),
}

local aimbotButtons = {
	createButton("Aimbot Aç/Kapat", function()
		aimbotEnabled = not aimbotEnabled
		if aimbotEnabled then
			print("Aimbot aktifleştirildi. E tuşu ile hedefe kilitlenebilirsiniz.")
		else
			aiming = false
			aimbotTarget = nil
			print("Aimbot devre dışı bırakıldı.")
		end
	end),
}

createCollapsible("Kamp", kampButtons)
createCollapsible("Movement", movementButtons)
createCollapsible("ESP", espButtons)
createCollapsible("Aimbot", aimbotButtons)

-- Giriş Butonu
submit.MouseButton1Click:Connect(function()
	if keyBox.Text == requiredKey then
		keyFrame.Visible = false
		mainFrame.Visible = true
	else
		keyBox.Text = ""
		keyBox.PlaceholderText = "Yanlış anahtar, tekrar deneyin."
	end
end)
