-- 🔹 Configurações Básicas
local uiName = "Blox Fruits AutoFarm"
local githubUrl = "https://raw.githubusercontent.com/seuusuario/Blox-Fruits-AutoFarm/main/AutoFarm.lua "

-- 🔹 Cria a Interface
local function CriarInterface()
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local AutoFarmBtn = Instance.new("TextButton")

    ScreenGui.Name = uiName
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.75, 0, 0.3, 0)
    MainFrame.Size = UDim2.new(1, 0, 0, 150)
    MainFrame.BackgroundTransparency = 0.1

    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Blox Fruits AutoFarm"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14.0

    AutoFarmBtn.Name = "AutoFarmBtn"
    AutoFarmBtn.Parent = MainFrame
    AutoFarmBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    AutoFarmBtn.BorderSizePixel = 0
    AutoFarmBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
    AutoFarmBtn.Size = UDim2.new(0.8, 0, 0, 30)
    AutoFarmBtn.Font = Enum.Font.Gotham
    AutoFarmBtn.Text = "▶️ Iniciar Auto Farm"
    AutoFarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    AutoFarmBtn.TextSize = 14.0

    return {
        Gui = ScreenGui,
        Btn = AutoFarmBtn
    }
end

-- 🔹 Função Principal de Auto Farm
local autoFarmAtivo = false

local function IniciarAutoFarm()
    spawn(function()
        while wait() do
            if not autoFarmAtivo then break end

            local jogador = game.Players.LocalPlayer
            local nivel = jogador.leaderstats.Level.Value
            local char = jogador.Character or jogador.CharacterAdded:Wait()
            local humanoidRoot = char:FindFirstChild("HumanoidRootPart")
            if not humanoidRoot then continue end

            -- 🔸 Ativar modo voo
            humanoidRoot.Anchored = true
            humanoidRoot.CFrame = humanoidRoot.CFrame + Vector3.new(0, 10, 0)

            -- 🔸 Expandir área de ataque e puxar NPCs do mesmo nível
            for _, v in pairs(workspace:GetChildren()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Name == "NPC_Level_"..nivel then
                    v.HumanoidRootPart.CFrame = humanoidRoot.CFrame * CFrame.new(0, 0, 5)
                end
            end

            -- 🔸 Simular ataque (ajuste conforme o sistema de dano do jogo)
            local args = {
                [1] = "Damage",
                [2] = 9999
            }

            game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(unpack(args))
        end
    end)
end

-- 🔹 Conectando Ação do Botão
local interface = CriarInterface()
interface.Btn.MouseButton1Click:Connect(function()
    autoFarmAtivo = not autoFarmAtivo
    interface.Btn.Text = autoFarmAtivo and "⏹️ Parar Auto Farm" or "▶️ Iniciar Auto Farm"

    if autoFarmAtivo then
        IniciarAutoFarm()
    end
end)

print("[✅] UI criada com sucesso! Script carregado do GitHub.")
