-- Função para criar um ESP para um jogador
local function createESP(player)
    if player.Character then
        local highlight = Instance.new("Highlight")
        highlight.Parent = player.Character
        highlight.Adornee = player.Character
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.FillTransparency = 0.5
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
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

-- Função para adicionar ESP a todos os jogadores
local function addESPToAllPlayers()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            createESP(player)
        end
    end
end

-- Conectar eventos para adicionar/remover ESP quando os jogadores entram/saem do jogo
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createESP(player)
    end)
end)

game.Players.PlayerRemoving:Connect(function(player)
    removeESP(player)
end)

-- Adicionar ESP a todos os jogadores existentes
addESPToAllPlayers()

-- Atualizar ESP quando o personagem do jogador é adicionado
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    addESPToAllPlayers()
end)

-- Atualizar ESP para o personagem atual do jogador local
if game.Players.LocalPlayer.Character then
    addESPToAllPlayers()
end
