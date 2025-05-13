-- // Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- // Variáveis Globais
local autoFarmEnabled = false
local autoSocoEnabled = false
local selectedTool = nil
local targetEnemy = nil

-- // Criando a Interface
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BloxScript"
screenGui.ResetOnSpawn = false
screenGui.Parent = player.PlayerGui

-- // Botão Toggle (fixo na tela)
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 30)
toggleButton.Position = UDim2.new(0.85, 0, 0.05, 0)
toggleButton.Text = "Abrir Script"
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 14
toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BorderSizePixel = 0
toggleButton.Modal = true
toggleButton.Parent = screenGui

-- // Frame Principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 500)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Draggable = true
mainFrame.Active = true
mainFrame.Parent = screenGui

-- // Fazendo o frame ser arrastável com clique direito
local dragging = false
local dragInput, mousePos, framePos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        mousePos = input.Position
        framePos = mainFrame.Position
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

RunService.RenderStepped:Connect(function()
    if dragging and dragInput then
        local delta = dragInput.Position - mousePos
        mainFrame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
    end
end)

-- // Logo (Formas Geométricas)
local logoFrame = Instance.new("Frame")
logoFrame.Size = UDim2.new(1, 0, 0, 80)
logoFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
logoFrame.BorderSizePixel = 0
logoFrame.Parent = mainFrame

-- Triângulo com UIStroke
local triangle = Instance.new("Frame")
triangle.Size = UDim2.new(0, 0, 0, 0)
triangle.AnchorPoint = Vector2.new(0.5, 0.5)
triangle.Position = UDim2.new(0.5, 0, 0.5, -10)
triangle.Rotation = 45
triangle.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
triangle.BorderSizePixel = 0
triangle.Parent = logoFrame

-- Texto do Nome
local nameText = Instance.new("TextLabel")
nameText.Text = "BloxScript"
nameText.Font = Enum.Font.GothamBold
nameText.TextSize = 20
nameText.TextColor3 = Color3.fromRGB(255, 255, 255)
nameText.BackgroundTransparency = 1
nameText.Position = UDim2.new(0, 10, 0, 50)
nameText.Size = UDim2.new(0, 150, 0, 20)
nameText.Parent = logoFrame

-- Botão Fechar
local closeButton = Instance.new("TextButton")
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 20
closeButton.TextColor3 = Color3.fromRGB(255, 50, 50)
closeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.Parent = mainFrame

-- // Barra Vertical (Menu Lateral)
local menuBar = Instance.new("Frame")
menuBar.Size = UDim2.new(0, 120, 1, -90)
menuBar.Position = UDim2.new(0, 0, 0, 90)
menuBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
menuBar.BorderSizePixel = 0
menuBar.Parent = mainFrame

-- Botões Laterais
local function createMenuButton(name, y)
    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, y)
    btn.Parent = menuBar
    return btn
end

local autoFarmBtn = createMenuButton("Auto Farm", 5)
local autoItensBtn = createMenuButton("Auto Itens", 50)
local lojaBtn = createMenuButton("Loja", 95)

-- // Conteúdo Dinâmico
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -130, 1, -90)
contentFrame.Position = UDim2.new(0, 130, 0, 90)
contentFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

-- Limpa conteúdo
function clearContent()
    for _, child in pairs(contentFrame:GetChildren()) do
        if child:IsA("GuiObject") then
            child:Destroy()
        end
    end
end

-- // Função para criar botão no conteúdo
local function createContentButton(text, y)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, y)
    btn.Parent = contentFrame
    return btn
end

-- // Auto Farm Menu
autoFarmBtn.MouseButton1Click:Connect(function()
    clearContent()
    local farmBtn = createContentButton("Ativar Auto Farm", 10)
    local socoBtn = createContentButton("Ativar Auto Soco", 60)
    local armaBtn = createContentButton("Escolher Arma", 110)

    -- Ativar Auto Farm
    farmBtn.MouseButton1Click:Connect(function()
        autoFarmEnabled = not autoFarmEnabled
        farmBtn.Text = autoFarmEnabled and "Desativar Auto Farm" or "Ativar Auto Farm"
    end)

    -- Ativar Auto Soco
    socoBtn.MouseButton1Click:Connect(function()
        autoSocoEnabled = not autoSocoEnabled
        socoBtn.Text = autoSocoEnabled and "Desativar Auto Soco" or "Ativar Auto Soco"
    end)

    -- Escolher Arma
    armaBtn.MouseButton1Click:Connect(function()
        clearContent()
        local tools = player.Backpack:GetChildren()
        local equipped = player.Character and player.Character:FindFirstChildWhichIsA("Tool")
        if equipped then table.insert(tools, 1, equipped) end

        local y = 10
        for _, tool in ipairs(tools) do
            if tool:IsA("Tool") then
                local btn = createContentButton(tool.Name, y)
                btn.MouseButton1Click:Connect(function()
                    selectedTool = tool
                    print("Arma selecionada:", tool.Name)
                end)
                y += 50
            end
        end
    end)
end)

-- // Loop de Auto Farm
spawn(function()
    while wait() do
        if autoFarmEnabled and targetEnemy then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local root = character.HumanoidRootPart
                local enemy = targetEnemy.PrimaryPart or targetEnemy:FindFirstChild("Torso") or targetEnemy:FindFirstChild("UpperTorso")
                if enemy then
                    root.CFrame = CFrame.lookAt(root.Position, enemy.Position) * CFrame.Angles(0, math.rad(180), 0)
                    root.Anchored = false
                    root.Velocity = (enemy.Position - root.Position).unit * 50
                    wait(0.1)
                    root.Anchored = false
                end
            end
        end
    end
end)

-- // Loop de Auto Soco
spawn(function()
    while wait() do
        if autoSocoEnabled and selectedTool and targetEnemy then
            selectedTool:Activate()
            local handle = selectedTool:FindFirstChild("Handle")
            if handle then
                for _, part in pairs(handle:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.Massless = true
                        part.Anchored = false
                        part:GetPropertyChangedSignal("Anchored"):Wait()
                    end
                end
            end
        end
    end
end)

-- // Botão Toggle
toggleButton.MouseButton1Click:Connect(function()
    open = not open
    mainFrame.Visible = open
    toggleButton.Text = open and "Fechar Script" or "Abrir Script"
end)

-- // Botão Fechar
closeButton.MouseButton1Click:Connect(function()
    open = false
    mainFrame.Visible = false
    toggleButton.Text = "Abrir Script"
end)
