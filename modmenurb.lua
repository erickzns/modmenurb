-- Função para criar um ESP para um jogador
local function createESP(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        -- Criar a caixa ao redor do jogador
        local box = Instance.new("BoxHandleAdornment")
        box.Size = player.Character:GetExtentsSize()
        box.Adornee = player.Character
        box.Color3 = Color3.fromRGB(255, 255, 255)
        box.Transparency = 0.5
        box.AlwaysOnTop = true
        box.ZIndex = 10
        box.Parent = player.Character

        -- Criar a linha que conecta o jogador à câmera
        local attachment0 = Instance.new("Attachment")
        attachment0.Position = Vector3.new(0, player.Character:GetExtentsSize().Y / 2, 0)
        attachment0.Parent = player.Character.HumanoidRootPart

        local attachment1 = Instance.new("Attachment")
        attachment1.Parent = workspace.CurrentCamera

        local beam = Instance.new("Beam")
        beam.Attachment0 = attachment0
        beam.Attachment1 = attachment1
        beam.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
        beam.Width0 = 0.1
        beam.Width1 = 0.1
        beam.Transparency = NumberSequence.new(0.5)
        beam.Parent = player.Character.HumanoidRootPart
    end
end

-- Função para remover o ESP de um jogador
local function removeESP(player)
    if player.Character then
        local box = player.Character:FindFirstChildOfClass("BoxHandleAdornment")
        if box then
            box:Destroy()
        end

        local beam = player.Character:FindFirstChildOfClass("Beam")
        if beam then
            beam:Destroy()
        end

        local attachment0 = player.Character:FindFirstChildOfClass("Attachment")
        if attachment0 then
            attachment0:Destroy()
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
