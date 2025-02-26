local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Função para criar um ESP (Extra Sensory Perception) para um jogador
local function createESP(player)
    if player.Character then
        local highlight = Instance.new("Highlight")
        highlight.Parent = player.Character
        highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Cor vermelha
        highlight.FillTransparency = 0.5
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- Cor branca
        highlight.OutlineTransparency = 0
    end
end

-- Adiciona ESP para todos os jogadores atuais, exceto o jogador local
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createESP(player)
        player.CharacterAdded:Connect(function()
            createESP(player)
        end)
    end
end

-- Adiciona ESP para novos jogadores que entrarem no jogo, exceto o jogador local
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        player.CharacterAdded:Connect(function()
            createESP(player)
        end)
    end
end)
