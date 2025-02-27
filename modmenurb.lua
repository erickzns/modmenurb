-- Script ESP para desenhar linhas até jogadores em New Car Development Tycoon

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Função para criar uma linha
local function criarLinha()
    local linha = Drawing.new("Line")
    linha.Visible = false
    linha.Color = Color3.fromRGB(255, 0, 0)
    linha.Thickness = 2
    linha.Transparency = 1
    return linha
end

-- Função para atualizar a posição da linha
local function atualizarLinha(linha, objeto)
    local pos, visivel = Camera:WorldToViewportPoint(objeto.Position)
    if visivel then
        linha.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        linha.To = Vector2.new(pos.X, pos.Y)
        linha.Visible = true
    else
        linha.Visible = false
    end
end

-- Função principal para criar e atualizar linhas até jogadores
local function espLinhas()
    local linhas = {}

    -- Crie linhas para todos os jogadores
    for _, jogador in pairs(Players:GetPlayers()) do
        if jogador ~= LocalPlayer and jogador.Character and jogador.Character:FindFirstChild("HumanoidRootPart") then
            local linha = criarLinha()
            table.insert(linhas, {linha = linha, objeto = jogador.Character.HumanoidRootPart})
        end
    end

    -- Atualize a posição das linhas a cada frame
    RunService.RenderStepped:Connect(function()
        for _, item in pairs(linhas) do
            atualizarLinha(item.linha, item.objeto)
        end
    end)
end

-- Execute a função ESP de linhas
espLinhas()
