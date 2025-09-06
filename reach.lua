--// SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "ReachScriptV3"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui") -- PlayerGui yerine CoreGui daha sağlam

--// GLOBALS
local reachEnabled = false
local reachSize = 10
local mainUI
local hidden = false
local password = "De5zePasa39" -- 🔑 Şifre

--// INTRO LOADING BAR
local function showIntro()
	local introFrame = Instance.new("Frame", gui)
	introFrame.Size = UDim2.new(0, 300, 0, 150)
	introFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
	introFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

	local title = Instance.new("TextLabel", introFrame)
	title.Size = UDim2.new(1, 0, 0, 40)
	title.Position = UDim2.new(0, 0, 0, 10)
	title.Text = "⚔️ REACH SCRIPT V3 ⚔️"
	title.TextScaled = true
	title.Font = Enum.Font.GothamBold
	title.TextColor3 = Color3.fromRGB(255, 255, 0)
	title.BackgroundTransparency = 1

	local loadingBarBG = Instance.new("Frame", introFrame)
	loadingBarBG.Size = UDim2.new(0.8, 0, 0, 20)
	loadingBarBG.Position = UDim2.new(0.1, 0, 0.6, 0)
	loadingBarBG.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

	local loadingBar = Instance.new("Frame", loadingBarBG)
	loadingBar.Size = UDim2.new(0, 0, 1, 0)
	loadingBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

	local tween = TweenService:Create(loadingBar, TweenInfo.new(2), {Size = UDim2.new(1, 0, 1, 0)})
	tween:Play()
	tween.Completed:Wait()

	introFrame:Destroy()
end

--// EXTEND HANDLE FORWARD
local function extendSwordHitbox()
	RunService.RenderStepped:Connect(function()
		if not reachEnabled then return end
		local char = player.Character or player.CharacterAdded:Wait()

		for _, tool in pairs(char:GetChildren()) do
			if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
				local handle = tool.Handle

				local oldSize = handle.Size
				local newSize = Vector3.new(oldSize.X, oldSize.Y, reachSize)

				-- Boyut + kaydırma
				handle.Size = newSize
				handle.Massless = true
				handle.CanCollide = false
				local offset = (newSize.Z - oldSize.Z) / 2
				handle.CFrame = handle.CFrame * CFrame.new(0, 0, -offset)

				-- Mesh varsa onu da uzat
				local mesh = handle:FindFirstChildOfClass("SpecialMesh")
				if mesh then
					mesh.Scale = Vector3.new(mesh.Scale.X, mesh.Scale.Y, reachSize / oldSize.Z)
				end

				-- Görsel kutu
				if not handle:FindFirstChild("Box") then
					local box = Instance.new("SelectionBox", handle)
					box.Name = "Box"
					box.Adornee = handle
					box.LineThickness = 0.05
					box.Color3 = Color3.new(1, 0, 0)
					box.Visible = not hidden
				else
					handle.Box.Visible = not hidden
				end
			end
		end
	end)
end

--// MAIN GUI
local function buildGUI()
	mainUI = Instance.new("Frame", gui)
	mainUI.Size = UDim2.new(0, 260, 0, 190)
	mainUI.Position = UDim2.new(0, 20, 0.6, 0)
	mainUI.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	mainUI.BorderSizePixel = 0
	mainUI.Active = true
	mainUI.Draggable = true
	mainUI.Visible = true

	local title = Instance.new("TextLabel", mainUI)
	title.Text = "REACH SCRIPT V3"
	title.Size = UDim2.new(1, 0, 0, 30)
	title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	title.TextColor3 = Color3.new(1, 1, 1)
	title.Font = Enum.Font.GothamBold
	title.TextScaled = true

	local toggleBtn = Instance.new("TextButton", mainUI)
	toggleBtn.Text = "Enable Reach"
	toggleBtn.Size = UDim2.new(0.9, 0, 0, 35)
	toggleBtn.Position = UDim2.new(0.05, 0, 0, 40)
	toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	toggleBtn.TextColor3 = Color3.new(1, 1, 1)
	toggleBtn.Font = Enum.Font.Gotham
	toggleBtn.TextScaled = true

	local reachLabel = Instance.new("TextLabel", mainUI)
	reachLabel.Text = "Reach Size: " .. reachSize
	reachLabel.Size = UDim2.new(1, 0, 0, 30)
	reachLabel.Position = UDim2.new(0, 0, 0, 85)
	reachLabel.TextColor3 = Color3.new(1, 1, 1)
	reachLabel.Font = Enum.Font.Gotham
	reachLabel.BackgroundTransparency = 1
	reachLabel.TextScaled = true

	local inputBox = Instance.new("TextBox", mainUI)
	inputBox.PlaceholderText = "Enter Reach Size"
	inputBox.Text = tostring(reachSize)
	inputBox.Size = UDim2.new(0.9, 0, 0, 35)
	inputBox.Position = UDim2.new(0.05, 0, 0, 125)
	inputBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	inputBox.TextColor3 = Color3.new(1, 1, 1)
	inputBox.Font = Enum.Font.Gotham
	inputBox.TextScaled = true
	inputBox.ClearTextOnFocus = false

	inputBox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			local value = tonumber(inputBox.Text)
			if value and value > 0 and value <= 100 then
				reachSize = value
				reachLabel.Text = "Reach Size: " .. reachSize
			else
				inputBox.Text = tostring(reachSize)
			end
		end
	end)

	local credits = Instance.new("TextLabel", mainUI)
	credits.Text = "Made by KLAXXON"
	credits.Size = UDim2.new(1, 0, 0, 25)
	credits.Position = UDim2.new(0, 0, 1, -25)
	credits.TextColor3 = Color3.fromRGB(180, 180, 180)
	credits.BackgroundTransparency = 1
	credits.Font = Enum.Font.Gotham
	credits.TextScaled = true

	toggleBtn.MouseButton1Click:Connect(function()
		reachEnabled = not reachEnabled
		toggleBtn.Text = reachEnabled and "Disable Reach" or "Enable Reach"
		toggleBtn.BackgroundColor3 = reachEnabled and Color3.fromRGB(30, 120, 30) or Color3.fromRGB(60, 60, 60)
	end)
end

--// LOGIN GUI
local function buildLogin(callback)
	local loginFrame = Instance.new("Frame", gui)
	loginFrame.Size = UDim2.new(0, 300, 0, 160)
	loginFrame.Position = UDim2.new(0.5, -150, 0.5, -80)
	loginFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	loginFrame.Active = true
	loginFrame.Draggable = true

	local title = Instance.new("TextLabel", loginFrame)
	title.Size = UDim2.new(1, 0, 0, 40)
	title.Text = "🔐 LOGIN REQUIRED"
	title.TextScaled = true
	title.Font = Enum.Font.GothamBold
	title.TextColor3 = Color3.new(1, 1, 1)
	title.BackgroundTransparency = 1

	local input = Instance.new("TextBox", loginFrame)
	input.Size = UDim2.new(0.8, 0, 0, 35)
	input.Position = UDim2.new(0.1, 0, 0, 60)
	input.PlaceholderText = "Enter Password"
	input.Text = ""
	input.TextScaled = true
	input.Font = Enum.Font.Gotham
	input.TextColor3 = Color3.new(1, 1, 1)
	input.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

	local loginBtn = Instance.new("TextButton", loginFrame)
	loginBtn.Size = UDim2.new(0.6, 0, 0, 35)
	loginBtn.Position = UDim2.new(0.2, 0, 0, 110)
	loginBtn.Text = "Login"
	loginBtn.TextScaled = true
	loginBtn.Font = Enum.Font.GothamBold
	loginBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	loginBtn.TextColor3 = Color3.new(1, 1, 1)

	loginBtn.MouseButton1Click:Connect(function()
		if input.Text == password then
			loginFrame:Destroy()
			callback(true)
		else
			input.Text = ""
			input.PlaceholderText = "❌ Wrong Password!"
		end
	end)
end

--// Z KEY TOGGLE
UserInputService.InputBegan:Connect(function(input, gpe)
	if not gpe and input.KeyCode == Enum.KeyCode.Z then
		hidden = not hidden
		if mainUI then
			mainUI.Visible = not hidden
		end
		local char = player.Character
		if char then
			for _, tool in pairs(char:GetChildren()) do
				if tool:IsA("Tool") and tool:FindFirstChild("Handle") and tool.Handle:FindFirstChild("Box") then
					tool.Handle.Box.Visible = not hidden
				end
			end
		end
	end
end)

--// EXECUTE
buildLogin(function(success)
	if success then
		showIntro()
		buildGUI()
		extendSwordHitbox()
	end
end)
