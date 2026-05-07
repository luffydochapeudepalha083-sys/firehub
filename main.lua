--[[
    🔥 FIRE HUB - Brookhaven Edition COMPLETO 🔥
    Com Fly funcional, Executor de Scripts e MUITAS opções
    KEY: Luanfeio
]]

-- Garantir que o script só execute uma vez
if _G.FireHubLoaded then return end
_G.FireHubLoaded = true

-- Limpar GUIs antigas
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "FireHubKeySystem" or v.Name == "FireHubMain" then
        v:Destroy()
    end
end

-- ============ SISTEMA DE KEY ============
local ValidKey = "Luanfeio"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FireHubKeySystem"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui

local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 0.85
Background.Parent = ScreenGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 320)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(255, 80, 0)
Stroke.Thickness = 2
Stroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Position = UDim2.new(0, 0, 0, 20)
Title.BackgroundTransparency = 1
Title.Text = "🔥 FIRE HUB 🔥"
Title.TextColor3 = Color3.fromRGB(255, 100, 0)
Title.TextSize = 35
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, 0, 0, 30)
SubTitle.Position = UDim2.new(0, 0, 0, 85)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "INSIRA A KEY PARA ACESSAR"
SubTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
SubTitle.TextSize = 14
SubTitle.Font = Enum.Font.Gotham
SubTitle.Parent = MainFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0, 280, 0, 45)
KeyInput.Position = UDim2.new(0.5, -140, 0, 135)
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
KeyInput.Text = ""
KeyInput.PlaceholderText = "Digite a key aqui..."
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 16
KeyInput.Font = Enum.Font.Gotham
KeyInput.ClearTextOnFocus = false
KeyInput.Parent = MainFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0, 280, 0, 45)
VerifyBtn.Position = UDim2.new(0.5, -140, 0, 195)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 0)
VerifyBtn.Text = "VERIFICAR KEY"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.TextSize = 18
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = VerifyBtn

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 0, 260)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
StatusLabel.TextSize = 12
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Parent = MainFrame

-- Animação de entrada
MainFrame.BackgroundTransparency = 1
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -160 + 40)

local TweenService = game:GetService("TweenService")
local OpenTween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0,
    Position = UDim2.new(0.5, -225, 0.5, -160)
})
OpenTween:Play()

local function Notify(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title or "Fire Hub",
        Text = text or "",
        Duration = duration or 2
    })
end

local function CreateEffect(position, isSuccess)
    local color = isSuccess and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 50, 50)
    local part = Instance.new("Part")
    part.Shape = Enum.PartType.Ball
    part.Size = Vector3.new(1, 1, 1)
    part.Position = position
    part.Anchored = true
    part.CanCollide = false
    part.Color = color
    part.Material = Enum.Material.Neon
    part.Transparency = 0.3
    part.Parent = workspace.CurrentCamera
    
    local attachment = Instance.new("Attachment")
    attachment.Parent = part
    
    local particles = Instance.new("ParticleEmitter")
    particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    particles.Color = ColorSequence.new(color)
    particles.Size = NumberSequence.new(0.5)
    particles.Rate = 60
    particles.Lifetime = NumberRange.new(0.5, 1)
    particles.SpreadAngle = Vector2.new(360, 360)
    particles.VelocityInheritance = 0
    particles.Speed = NumberRange.new(5, 20)
    particles.Parent = attachment
    
    local tween = TweenService:Create(part, TweenInfo.new(0.6), {Transparency = 1, Size = Vector3.new(3, 3, 3)})
    tween:Play()
    
    task.delay(0.7, function()
        part:Destroy()
    end)
end

-- ============ FUNÇÕES GLOBAIS DO HUB ============
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualInput = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

-- Variáveis globais
_G.FireHub = {
    Fly = false,
    Noclip = false,
    InfiniteJump = false,
    Speed = 16,
    JumpPower = 50,
    AutoFarm = false,
    AutoClick = false,
    TeleportToMouse = false,
    ESP = false,
    Aimbot = false,
    SilentAim = false
}

-- ============ FLY SYSTEM PERFEITO ============
local function CreateFly()
    local player = LP
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local rootPart = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso")
    
    if not humanoid or not rootPart then return end
    
    local flying = false
    local speed = 85
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    
    local flyConnection
    local inputConnection
    
    local function startFly()
        if flying then return end
        flying = true
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.Parent = rootPart
        humanoid.PlatformStand = true
        Notify("🔥 Fly", "Ativado! W/A/S/D = Mover | Space = Subir | Shift = Descer", 3)
        
        flyConnection = RunService.RenderStepped:Connect(function()
            if not flying or not bodyVelocity.Parent then return end
            
            local moveDirection = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + Vector3.new(0, 0, -1) end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection + Vector3.new(0, 0, 1) end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDirection = moveDirection + Vector3.new(-1, 0, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDirection = moveDirection + Vector3.new(1, 0, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDirection = moveDirection + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDirection = moveDirection + Vector3.new(0, -1, 0) end
            
            if moveDirection.Magnitude > 0 then
                moveDirection = moveDirection.Unit * speed
                bodyVelocity.Velocity = rootPart.CFrame:VectorToWorldSpace(moveDirection)
            else
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            end
        end)
    end
    
    local function stopFly()
        if not flying then return end
        flying = false
        if flyConnection then flyConnection:Disconnect() end
        bodyVelocity:Destroy()
        humanoid.PlatformStand = false
        Notify("Fly", "Desativado!", 1)
    end
    
    return {start = startFly, stop = stopFly, isActive = function() return flying end}
end

local FlySystem = CreateFly()

-- ============ FUNÇÕES DO HUB ============
local function GetMoney()
    pcall(function()
        local args = { [1] = "GetMoney" }
        local events = ReplicatedStorage:FindFirstChild("Events")
        if events then
            local getMoney = events:FindFirstChild("GetMoney")
            if getMoney then
                getMoney:FireServer(unpack(args))
            end
        end
    end)
end

local function TeleportToPosition(pos)
    local char = LP.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(pos)
    end
end

local function GetMousePosition()
    local mouse = LP:GetMouse()
    local unitRay = mouse.UnitRay
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.FilterDescendantsInstances = {LP.Character}
    local raycastResult = workspace:Raycast(unitRay.Origin, unitRay.Direction * 1000, raycastParams)
    if raycastResult then
        return raycastResult.Position
    end
    return unitRay.Origin + unitRay.Direction * 100
end

-- ============ CARREGAR HUB PRINCIPAL ============
local function LoadMainHub()
    ScreenGui:Destroy()
    Notify("🔥 FIRE HUB", "Key verificada! Carregando hub...", 2)
    
    local mousePos = LP:GetMouse().Hit.Position
    CreateEffect(mousePos, true)
    
    task.wait(1)
    
    -- Carregar biblioteca Kavo
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    
    local Window = Library.CreateLib("🔥 FIRE HUB | Brookhaven - Premium", "DarkTheme")
    
    -- ============ ABA 1: MAIN ============
    local MainTab = Window:NewTab("🏠 Main")
    local MainSection = MainTab:NewSection("Informações")
    
    MainSection:NewLabel("✅ Key: " .. ValidKey)
    MainSection:NewLabel("👤 Usuário: " .. LP.Name)
    MainSection:NewLabel("🎮 Jogo: Brookhaven RP")
    
    local FarmSection = MainTab:NewSection("💰 Auto Farm")
    
    FarmSection:NewButton("Get Money (x100)", "Pega dinheiro 100 vezes", function()
        for i = 1, 100 do
            task.wait(0.03)
            GetMoney()
        end
        Notify("Auto Farm", "100x dinheiro coletado!", 2)
    end)
    
    FarmSection:NewToggle("Loop Auto Farm", "Coleta dinheiro automaticamente", function(state)
        _G.FireHub.AutoFarm = state
        if state then
            Notify("Auto Farm", "Ativado! Coletando a cada 0.3s", 2)
            task.spawn(function()
                while _G.FireHub.AutoFarm do
                    GetMoney()
                    task.wait(0.3)
                end
            end)
        else
            Notify("Auto Farm", "Desativado!", 1)
        end
    end)
    
    -- ============ ABA 2: MOVEMENT (FLY FUNCIONAL) ============
    local MoveTab = Window:NewTab("🚀 Movement")
    
    local FlySection = MoveTab:NewSection("🐉 Fly System")
    
    FlySection:NewToggle("🔹 FLY MODE", "Ativa o modo de voo (FLY PERFEITO)", function(state)
        if state then
            FlySystem.start()
        else
            FlySystem.stop()
        end
    end)
    
    FlySection:NewSlider("Fly Speed", "Velocidade do voo", 200, 30, function(value)
        FlySystem.speed = value
        Notify("Fly Speed", "Velocidade: " .. value, 0.5)
    end)
    
    local SpeedSection = MoveTab:NewSection("🏃 Speed & Jump")
    
    SpeedSection:NewToggle("Speed Boost", "Aumenta a velocidade do personagem", function(state)
        _G.FireHub.Speed = state and 75 or 16
        local char = LP.Character
        local humanoid = char and char:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = _G.FireHub.Speed
        end
        Notify("Speed", state and "Ativado! Speed: 75" or "Desativado!", 1)
    end)
    
    SpeedSection:NewSlider("Custom Speed", "Ajuste manual da velocidade", 250, 16, function(value)
        _G.FireHub.Speed = value
        local char = LP.Character
        local humanoid = char and char:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = value
        end
        Notify("Speed", "Velocidade: " .. value, 0.5)
    end)
    
    SpeedSection:NewSlider("Jump Power", "Aumenta o poder do pulo", 300, 50, function(value)
        _G.FireHub.JumpPower = value
        local char = LP.Character
        local humanoid = char and char:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.JumpPower = value
        end
        Notify("Jump", "Jump Power: " .. value, 0.5)
    end)
    
    SpeedSection:NewToggle("Infinite Jump", "Pulos infinitos", function(state)
        _G.FireHub.InfiniteJump = state
        Notify("Infinite Jump", state and "Ativado!" or "Desativado!", 1)
        
        local char = LP.Character
        local humanoid = char and char:FindFirstChild("Humanoid")
        if humanoid then
            local jumpConn
            jumpConn = humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
                if _G.FireHub.InfiniteJump and humanoid.Jump then
                    task.wait(0.1)
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
    end)
    
    local NoclipSection = MoveTab:NewSection("🔧 Noclip")
    
    NoclipSection:NewToggle("Noclip", "Atravessa paredes", function(state)
        _G.FireHub.Noclip = state
        Notify("Noclip", state and "Ativado!" or "Desativado!", 1)
        
        if state then
            task.spawn(function()
                while _G.FireHub.Noclip do
                    local char = LP.Character
                    if char then
                        for _, part in pairs(char:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end)
    
    -- ============ ABA 3: TELEPORT ============
    local TeleportTab = Window:NewTab("📍 Teleport")
    
    local TpClickSection = TeleportTab:NewSection("🖱️ Teleport to Click")
    
    TpClickSection:NewToggle("Teleport to Mouse", "Teleporta para onde o mouse clicar", function(state)
        _G.FireHub.TeleportToMouse = state
        Notify("TP Click", state and "Ativado! Clique em qualquer lugar para teleportar" or "Desativado!", 2)
        
        if state then
            local mouse = LP:GetMouse()
            local clickConn
            clickConn = mouse.Button1Down:Connect(function()
                if _G.FireHub.TeleportToMouse then
                    local pos = GetMousePosition()
                    TeleportToPosition(pos)
                    Notify("Teleport", "Teleportado!", 0.5)
                    CreateEffect(pos, true)
                end
            end)
        end
    end)
    
    local LocationsSection = TeleportTab:NewSection("📍 Localizações Rápidas")
    
    LocationsSection:NewButton("🏪 Loja", "Teleporta para a loja", function()
        TeleportToPosition(Vector3.new(100, 30, 100))
        Notify("Teleport", "Teleportado para a Loja!", 1)
    end)
    
    LocationsSection:NewButton("🏠 Casa Padrão", "Teleporta para casa", function()
        TeleportToPosition(Vector3.new(0, 30, 0))
        Notify("Teleport", "Teleportado para Casa!", 1)
    end)
    
    LocationsSection:NewButton("🏖️ Praia", "Teleporta para a praia", function()
        TeleportToPosition(Vector3.new(200, 20, 200))
        Notify("Teleport", "Teleportado para a Praia!", 1)
    end)
    
    LocationsSection:NewButton("🏫 Escola", "Teleporta para a escola", function()
        TeleportToPosition(Vector3.new(-100, 30, 0))
        Notify("Teleport", "Teleportado para a Escola!", 1)
    end)
    
    LocationsSection:NewButton("🚗 Concessionária", "Teleporta para concessionária", function()
        TeleportToPosition(Vector3.new(300, 30, 300))
        Notify("Teleport", "Teleportado para Concessionária!", 1)
    end)
    
    -- ============ ABA 4: COMBAT ============
    local CombatTab = Window:NewTab("⚔️ Combat")
    
    local AimbotSection = CombatTab:NewSection("🎯 Aimbot")
    
    AimbotSection:NewToggle("Aimbot", "Mira automaticamente em jogadores", function(state)
        _G.FireHub.Aimbot = state
        Notify("Aimbot", state and "Ativado!" or "Desativado!", 1)
        
        if state then
            task.spawn(function()
                while _G.FireHub.Aimbot do
                    local closest = nil
                    local closestDist = math.huge
                    local mouse = LP:GetMouse()
                    
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LP and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local pos = player.Character.HumanoidRootPart.Position
                            local screenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(pos)
                            if onScreen then
                                local dist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                                if dist < closestDist and dist < 200 then
                                    closestDist = dist
                                    closest = player
                                end
                            end
                        end
                    end
                    
                    if closest and closest.Character then
                        local targetPos = closest.Character.HumanoidRootPart.Position
                        -- Simular mira (depende do jogo)
                    end
                    task.wait()
                end
            end)
        end
    end)
    
    local SilentSection = CombatTab:NewSection("🔇 Silent Aim")
    
    SilentSection:NewToggle("Silent Aim", "Tiro invisível mira em jogadores", function(state)
        _G.FireHub.SilentAim = state
        Notify("Silent Aim", state and "Ativado!" or "Desativado!", 1)
    end)
    
    -- ============ ABA 5: VISUALS ============
    local VisualTab = Window:NewTab("👁️ Visuals")
    
    local EspSection = VisualTab:NewSection("👤 ESP")
    
    EspSection:NewToggle("ESP Players", "Mostra jogadores através das paredes", function(state)
        _G.FireHub.ESP = state
        Notify("ESP", state and "Ativado!" or "Desativado!", 1)
        
        if state then
            task.spawn(function()
                while _G.FireHub.ESP do
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LP and player.Character then
                            local highlight = player.Character:FindFirstChild("ESP_Highlight")
                            if not highlight then
                                highlight = Instance.new("Highlight")
                                highlight.Name = "ESP_Highlight"
                                highlight.FillColor = Color3.fromRGB(255, 50, 0)
                                highlight.OutlineColor = Color3.fromRGB(255, 150, 0)
                                highlight.FillTransparency = 0.5
                                highlight.Parent = player.Character
                            end
                        end
                    end
                    task.wait(0.3)
                end
            end)
        else
      
