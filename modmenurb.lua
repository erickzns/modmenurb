-- Script ESP para destacar jogadores e objetos em New Car Development Tycoon

-- Função para criar um quadro ao redor de um objeto
local function criarQuadro(objeto)
    local quadro = Drawing.new("Square")
    quadro.Visible = true
    quadro.Color = Color3.fromRGB(255, 0, 0)
    quadro.Thickness = 2
    quadro.Transparency = 1
    quadro.Filled = false
    quadro.Size = Vector2.new(50, 50)
    quadro.Position = Vector2.new(0, 0)
    return quadro
end

-- Função para atualizar a posição do quadro
local function atualizarQuadro(quadro, objeto)
    local pos, visivel = workspace.CurrentCamera:WorldToViewportPoint(objeto.Position)
    if visivel then
        quadro.Position = Vector2.new(pos.X - quadro.Size.X / 2, pos.Y - quadro.Size.Y / 2)
        quadro.Visible = true
    else
        quadro.Visible = false
    end
end

-- Função principal para criar e atualizar quadros ao redor de jogadores e objetos
local function esp()
    local quadros = {}

    -- Crie quadros para todos os jogadores
    for _, jogador in pairs(game.Players:GetPlayers()) do
        if jogador ~= game.Players.LocalPlayer and jogador.Character and jogador.Character:FindFirstChild("HumanoidRootPart") then
            local quadro = criarQuadro(jogador.Character.HumanoidRootPart)
            table.insert(quadros, {quadro = quadro, objeto = jogador.Character.HumanoidRootPart})
        end
    end

    -- Crie quadros para todos os objetos de interesse (ajuste conforme necessário)
    for _, objeto in pairs(workspace:GetChildren()) do
        if objeto:IsA("Part") then
            local quadro = criarQuadro(objeto)
            table.insert(quadros, {quadro = quadro, objeto = objeto})
        end
    end

    -- Atualize a posição dos quadros a cada frame
    game:GetService("RunService").RenderStepped:Connect(function()
        for _, item in pairs(quadros) do
            atualizarQuadro(item.quadro, item.objeto)
        end
    end)
end

-- Execute a função ESP
esp()
