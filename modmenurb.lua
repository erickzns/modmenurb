-- Script ESP para desenhar nomes dos jogadores em New Car Development Tycoon

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Função para criar um BillboardGui com o nome do jogador
local function criarNome(jogador)
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
        textLabel.Text = jogador.Name
        textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        textLabel.TextScaled = true

        billboard.Parent = head
    end
end

-- Função principal para criar e atualizar nomes dos jogadores
local function espNomes()
    -- Crie nomes para todos os jogadores
    for _, jogador in pairs(Players:GetPlayers()) do
        if jogador ~= LocalPlayer then
            criarNome(jogador)
        end
    end

    -- Adicione nomes para novos jogadores que entrarem no jogo
    Players.PlayerAdded:Connect(function(jogador)
        jogador.CharacterAdded:Connect(function()
            criarNome(jogador)
        end)
    end)
end

-- Execute a função ESP de nomes
espNomes()
