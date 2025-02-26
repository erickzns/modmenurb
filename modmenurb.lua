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

-- Função para remover o ESP de um jogador
local function removeESP(player)
    if player.Character then
        local highlight = player.Character:FindFirstChildOfClass("Highlight")
        if highlight then
            highlight:Destroy()
        end
    end
end

-- Adiciona ESP para todos os jogadores atuais
for _, player in pairs(game.Players:GetPlayers()) do
    createESP(player)
    player.CharacterAdded:Connect(function()
        createESP(player)
    end)
end

-- Adiciona ESP para novos jogadores que entrarem no jogo
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createESP(player)
    end)
end)

-- Remove ESP quando um jogador sair do jogo
game.Players.PlayerRemoving:Connect(function(player)
    removeESP(player)
end)
