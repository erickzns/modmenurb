-- Script ESP para desenhar a distância até os jogadores em New Car Development Tycoon

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Função para criar um BillboardGui com a distância até o jogador
local function criarDistancia(jogador)
    local char = jogador.Character
    if char and char:FindFirstChild("Head") then
        local head = char.Head
        local billboard = Instance.new("BillboardGui")
        billboard.Adornee = head
        billboard.Size = UDim2.new(0, 100, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 2, 0)
        billboard.AlwaysOnTop = true

        local textLabel = Instance.new("TextLabel")
        textLabel.Parent = billboard
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.SourceSans
        textLabel.TextSize = 14

        billboard.Parent = head

        -- Atualizar a distância a cada frame
        RunService.RenderStepped:Connect(function()
            if char and char:FindFirstChild("HumanoidRootPart") then
                local distancia = (LocalPlayer.Character.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
                textLabel.Text = string.format("Distância: %.2f", distancia)
            end
        end)
    end
end

-- Função principal para criar e atualizar a distância até os jogadores
local function espDistancia()
    -- Crie a distância para todos os jogadores
    for _, jogador in pairs(Players:GetPlayers()) do
        if jogador ~= LocalPlayer then
            criarDistancia(jogador)
        end
    end

    -- Adicione a distância para novos jogadores que entrarem no jogo
    Players.PlayerAdded:Connect(function(jogador)
        jogador.CharacterAdded:Connect(function()
            criarDistancia(jogador)
        end)
    end)
end

-- Execute a função ESP de distância
espDistancia()
