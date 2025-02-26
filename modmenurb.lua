-- Script ESP para destacar jogadores em New Car Development Tycoon

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Função para criar um quadro ao redor de um objeto
local function criarQuadro()
    local quadro = Drawing.new("Square")
    quadro.Visible = false
    quadro.Color = Color3.fromRGB(255, 0, 0)
    quadro.Thickness = 2
    quadro.Transparency = 1
    quadro.Filled = false
    return quadro
end

-- Função para atualizar a posição do quadro
local function atualizarQuadro(quadro, objeto)
    local pos, visivel = Camera:WorldToViewportPoint(objeto.Position)
    if visivel then
        local tamanho = objeto.Size
        local largura = tamanho.X * 10 -- Ajuste o fator de escala conforme necessário
        local altura = tamanho.Y * 10 -- Ajuste o fator de escala conforme necessário
        quadro.Size = Vector2.new(largura, altura)
        quadro.Position = Vector2.new(pos.X - quadro.Size.X / 2, pos.Y - quadro.Size.Y / 2)
        quadro.Visible = true
    else
        quadro.Visible = false
    end
end

-- Função principal para criar e atualizar quadros ao redor de jogadores
local function esp()
    local quadros = {}

    -- Crie quadros para todos os jogadores
    for _, jogador in pairs(Players:GetPlayers()) do
        if jogador ~= LocalPlayer and jogador.Character and jogador.Character:FindFirstChild("HumanoidRootPart") then
            local quadro = criarQuadro()
            table.insert(quadros, {quadro = quadro, objeto = jogador.Character.HumanoidRootPart})
        end
    end

    -- Atualize a posição dos quadros a cada frame
    RunService.RenderStepped:Connect(function()
        for _, item in pairs(quadros) do
            atualizarQuadro(item.quadro, item.objeto)
        end
    end)
end

-- Execute a função ESP
esp()
