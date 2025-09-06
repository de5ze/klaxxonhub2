-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local TeleportService = game:GetService("TeleportService")

-- Şifre
local requiredKey = "De5zePasa39"

-- Mevcut UI'yi temizle
pcall(function() player.PlayerGui:FindFirstChild("KlaxxonHub"):Destroy() end)

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KlaxxonHub"
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- ---------- Drag Fonksiyonu ----------
local function makeDraggable(frame)
	local dragging=false
	local dragInput,mousePos,framePos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 then
			dragging=true
			mousePos=input.Position
			framePos=frame.Position
			input.Changed:Connect(function()
				if input.UserInputState==Enum.UserInputState.End then dragging=false end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseMovement then
			dragInput=input
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input==dragInput and dragging then
			local delta=input.Position-mousePos
			frame.Position=framePos + UDim2.new(0,delta.X,0,delta.Y)
		end
	end)
end

-- ---------- Webhook Log Fonksiyonu ----------
local webhookUrl = "https://discord.com/api/webhooks/1390251918529527858/w94VLymF49Z7r0DqznflPOZLWNcrQEaGmuOIc7yTWb1a-Z7jdkcU4cR9PEY1MX9uGwdp" -- Buraya kendi Discord webhook URL'nizi koyun
local function sendWebhookLog(scriptName)
	local username = player.Name
	local placeId = game.PlaceId
	local mapName = "Bilinmeyen Oyun"
	pcall(function()
		mapName = MarketplaceService:GetProductInfo(placeId).Name
	end)
	local data = {
		["content"] = "**Exploit Triggered**",
		["embeds"] = {{
			["title"] = "Script Çalıştırıldı: "..scriptName,
			["color"] = 16753920,
			["fields"] = {
				{["name"]="Kullanıcı",["value"]=username},
				{["name"]="Oyun",["value"]=mapName.." (PlaceId: "..tostring(placeId)..")"}
			}
		}}
	}
	pcall(function()
		local json=HttpService:JSONEncode(data)
		if syn and syn.request then
			syn.request({Url=webhookUrl,Method="POST",Headers={["Content-Type"]="application/json"},Body=json})
		elseif request then
			request({Url=webhookUrl,Method="POST",Headers={["Content-Type"]="application/json"},Body=json})
		elseif http and http.request then
			http.request({Url=webhookUrl,Method="POST",Headers={["Content-Type"]="application/json"},Body=json})
		end
	end)
end

-- ---------- Giriş Paneli ----------
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0,400,0,200)
keyFrame.Position = UDim2.new(0.5,-200,0.5,-100)
keyFrame.BackgroundColor3 = Color3.fromRGB(28,28,28)
keyFrame.Parent = screenGui
makeDraggable(keyFrame)

local keyTitle = Instance.new("TextLabel", keyFrame)
keyTitle.Size = UDim2.new(1,0,0,50)
keyTitle.Position = UDim2.new(0,0,0,10)
keyTitle.Text = "Klaxxon Hub"
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextScaled = true
keyTitle.TextColor3 = Color3.fromRGB(230,230,230)
keyTitle.BackgroundTransparency = 1

local keyBox = Instance.new("TextBox", keyFrame)
keyBox.Size = UDim2.new(0.85,0,0,45)
keyBox.Position = UDim2.new(0.075,0,0.5,-25)
keyBox.PlaceholderText = "Anahtarınızı girin..."
keyBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
keyBox.TextColor3 = Color3.fromRGB(230,230,230)

local submit = Instance.new("TextButton", keyFrame)
submit.Size = UDim2.new(0.5,0,0,40)
submit.Position = UDim2.new(0.25,0,1,-55)
submit.Text = "Giriş Yap"
submit.BackgroundColor3 = Color3.fromRGB(60,120,60)
submit.TextColor3 = Color3.fromRGB(230,230,230)
submit.MouseEnter:Connect(function() submit.BackgroundColor3 = Color3.fromRGB(80,150,80) end)
submit.MouseLeave:Connect(function() submit.BackgroundColor3 = Color3.fromRGB(60,120,60) end)

-- ---------- Ana Panel ----------
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0,520,0,350)
mainFrame.Position = UDim2.new(0.5,-260,0.5,-175)
mainFrame.BackgroundColor3 = Color3.fromRGB(28,28,28)
mainFrame.Parent = screenGui
mainFrame.Visible = false
makeDraggable(mainFrame)

-- Üst bar
local topBar = Instance.new("Frame", mainFrame)
topBar.Size = UDim2.new(1,0,0,50)
topBar.BackgroundTransparency = 1

local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(0.8,0,1,0)
title.Position = UDim2.new(0,10,0,0)
title.Text = "Klaxxon Hub"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(230,230,230)
title.BackgroundTransparency = 1

local closeBtn = Instance.new("TextButton", topBar)
closeBtn.Text = "✕"
closeBtn.Size = UDim2.new(0,40,0,40)
closeBtn.Position = UDim2.new(1,-50,0,5)
closeBtn.BackgroundColor3 = Color3.fromRGB(150,50,50)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.MouseEnter:Connect(function() closeBtn.BackgroundColor3 = Color3.fromRGB(200,70,70) end)
closeBtn.MouseLeave:Connect(function() closeBtn.BackgroundColor3 = Color3.fromRGB(150,50,50) end)
closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)

-- Sol tab bar
local tabBar = Instance.new("ScrollingFrame", mainFrame)
tabBar.Size = UDim2.new(0,120,1,-50)
tabBar.Position = UDim2.new(0,10,0,50)
tabBar.BackgroundTransparency = 1
tabBar.ScrollBarThickness = 6

local tabLayout = Instance.new("UIListLayout", tabBar)
tabLayout.Padding = UDim.new(0,5)
tabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	tabBar.CanvasSize = UDim2.new(0,0,0,tabLayout.AbsoluteContentSize.Y)
end)

-- Sağ içerik alanı
local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Size = UDim2.new(1,-140,1,-60)
contentFrame.Position = UDim2.new(0,130,0,50)
contentFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)

-- Tween animasyonlu geçiş
local function animateContent(newFrame)
	for _,v in pairs(contentFrame:GetChildren()) do
		TweenService:Create(v,TweenInfo.new(0.25),{Position=UDim2.new(1,0,0,v.Position.Y.Scale,v.Position.Y.Offset)}):Play()
		task.delay(0.25,function() v:Destroy() end)
	end
	task.wait(0.25)
	newFrame.Parent = contentFrame
	newFrame.Position = UDim2.new(0,0,0,0)
end

-- Buton oluşturma
local function createContentButton(parent,name,callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1,-20,0,40)
	btn.Position = UDim2.new(0,10,0,#parent:GetChildren()*45)
	btn.BackgroundColor3 = Color3.fromRGB(60,60,90)
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(230,230,230)
	btn.Font = Enum.Font.GothamMedium
	btn.TextScaled = true
	btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(80,80,110) end)
	btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(60,60,90) end)
	btn.MouseButton1Click:Connect(function()
		callback()
		sendWebhookLog(name) -- Webhook tetikleme
	end)
	btn.Parent = parent
end

-- Tab oluşturma
local function createTab(name,callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1,0,0,45)
	btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
	btn.TextColor3 = Color3.fromRGB(230,230,230)
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.Text = name
	btn.MouseEnter:Connect(function() btn.BackgroundColor3=Color3.fromRGB(70,70,70) end)
	btn.MouseLeave:Connect(function() btn.BackgroundColor3=Color3.fromRGB(50,50,50) end)
	btn.MouseButton1Click:Connect(function()
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(1,0,1,0)
		frame.BackgroundTransparency = 1
		callback(frame)
		animateContent(frame)
	end)
	btn.Parent = tabBar
end

-- ---------- Script Fonksiyonları ----------
-- Kamp
local function THOScript() local remote=ReplicatedStorage:WaitForChild("RewardEvent"); for i=1,30 do remote:FireServer(); task.wait(0.1) end end
local function TAFScript() local remote=ReplicatedStorage:WaitForChild("RewardEvent"); for i=1,30 do remote:FireServer(); task.wait(0.1) end end
local function TTAScript() local remote=ReplicatedStorage:WaitForChild("Cark"); for i=1,30 do remote:FireServer(); task.wait(0.1) end end

-- Movement
local flying,noclip=false,false
local flyConnection,noclipConnection
local function startFly()
	local hrp=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local humanoid=player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if not hrp or not humanoid then return end
	flying=true
	local bg=Instance.new("BodyGyro",hrp)
	bg.P=9e4 bg.maxTorque=Vector3.new(9e9,9e9,9e9) bg.CFrame=hrp.CFrame
	local bv=Instance.new("BodyVelocity",hrp)
	bv.velocity=Vector3.new(0,0.1,0)
	bv.maxForce=Vector3.new(9e9,9e9,9e9)
	flyConnection=RunService.Heartbeat:Connect(function()
		local dir=Vector3.new()
		if UIS:IsKeyDown(Enum.KeyCode.W) then dir+=workspace.CurrentCamera.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.S) then dir-=workspace.CurrentCamera.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.A) then dir-=workspace.CurrentCamera.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.D) then dir+=workspace.CurrentCamera.CFrame.RightVector end
		bv.velocity = dir.Magnitude>0 and dir.Unit*50 or Vector3.zero
		bg.CFrame = workspace.CurrentCamera.CFrame
	end)
	humanoid.PlatformStand=true
end
local function stopFly()
	local hrp=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local humanoid=player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if hrp then for _,v in pairs(hrp:GetChildren()) do if v:IsA("BodyGyro") or v:IsA("BodyVelocity") then v:Destroy() end end end
	if flyConnection then flyConnection:Disconnect() flyConnection=nil end
	if humanoid then humanoid.PlatformStand=false end
	flying=false
end
local function toggleFly() if flying then stopFly() else startFly() end end

local function startNoclip()
	if noclip then return end
	noclip=true
	noclipConnection=RunService.Stepped:Connect(function()
		local char=player.Character
		if char then for _,v in pairs(char:GetChildren()) do if v:IsA("BasePart") then v.CanCollide=false end end end
	end)
end
local function stopNoclip()
	if not noclip then return end
	noclip=false
	if noclipConnection then noclipConnection:Disconnect() noclipConnection=nil end
	local char=player.Character
	if char then for _,v in pairs(char:GetChildren()) do if v:IsA("BasePart") then v.CanCollide=true end end end
end
local function toggleNoclip() if noclip then stopNoclip() else startNoclip() end end

-- ESP
local espEnabled=false
local espConnections={}
local function toggleESP()
	espEnabled=not espEnabled
	if espEnabled then
		for _,plr in pairs(Players:GetPlayers()) do
			if plr~=player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
				local box=Instance.new("BoxHandleAdornment")
				box.Adornee=plr.Character.HumanoidRootPart
				box.AlwaysOnTop=true box.Size=Vector3.new(3,6,3) box.Color3=Color3.new(1,0,0)
				box.Transparency=0.5
				box.Parent=player.PlayerGui
				espConnections[plr.Name]=box
			end
		end
	else
		for _,box in pairs(espConnections) do box:Destroy() end
		espConnections={}
	end
end

-- Aimbot
local aimbotEnabled=false
local aiming=false
local aimbotTarget=nil
local aimbotFov=50
local function getClosestTarget()
	local closest=math.huge
	local target=nil
	for _,plr in pairs(Players:GetPlayers()) do
		if plr~=player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health>0 then
			local screenPos,onScreen=workspace.CurrentCamera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
			if onScreen then
				local mousePos=UIS:GetMouseLocation()
				local dist=(Vector2.new(screenPos.X,screenPos.Y)-Vector2.new(mousePos.X,mousePos.Y)).Magnitude
				if dist<closest and dist<=aimbotFov then closest=dist target=plr end
			end
		end
	end
	return target
end
UIS.InputBegan:Connect(function(input,gp)
	if gp then return end
	if input.KeyCode==Enum.KeyCode.E then aiming=true aimbotTarget=getClosestTarget() end
end)
UIS.InputEnded:Connect(function(input,gp)
	if gp then return end
	if input.KeyCode==Enum.KeyCode.E then aiming=false aimbotTarget=nil end
end)
RunService.RenderStepped:Connect(function()
	if aimbotEnabled and aiming and aimbotTarget and aimbotTarget.Character and aimbotTarget.Character:FindFirstChild("HumanoidRootPart") then
		local hrp=aimbotTarget.Character.HumanoidRootPart
		local cam=workspace.CurrentCamera
		local dir=(hrp.Position-cam.CFrame.Position).Unit
		cam.CFrame=cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position,cam.CFrame.Position+dir),0.2)
	end
end)

-- Geçiş Scripti
local function teleportExample()
	local places={12345678,87654321} -- Örnek placeId
	local nextPlace=places[math.random(1,#places)]
	TeleportService:Teleport(nextPlace,player)
end

-- ---------- Sekmeler ----------
createTab("Kamp",function(frame)
	createContentButton(frame,"THO Scripti",THOScript)
	createContentButton(frame,"TAF Scripti",TAFScript)
	createContentButton(frame,"TTA Scripti",TTAScript)
end)
createTab("Movement",function(frame)
	createContentButton(frame,"Fly Aç/Kapat",toggleFly)
	createContentButton(frame,"Noclip Aç/Kapat",toggleNoclip)
end)
createTab("ESP",function(frame)
	createContentButton(frame,"ESP Aç/Kapat",toggleESP)
end)
createTab("Aimbot",function(frame)
	createContentButton(frame,"Aimbot Aç/Kapat",function() aimbotEnabled=not aimbotEnabled if not aimbotEnabled then aiming=false aimbotTarget=nil end end)
end)
createTab("Geçiş Scripti",function(frame)
	createContentButton(frame,"Rastgele Teleport",teleportExample)
end)

-- Giriş butonu
submit.MouseButton1Click:Connect(function()
	if keyBox.Text==requiredKey then
		keyFrame.Visible=false
		mainFrame.Visible=true
	else
		keyBox.Text=""
		keyBox.PlaceholderText="Yanlış anahtar"
	end
end)
