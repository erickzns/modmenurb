-- Script de farm para carro correndo infinitamente em um mundo solo em New Car Development Tycoon

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

-- Função para criar uma base plana
local function criarBasePlana(posicao)
    local base = Instance.new("Part")
    base.Size = Vector3.new(1000, 1, 1000)
    base.Position = posicao - Vector3.new(0, 0.5, 0)
    base.Anchored = true
    base.Parent = Workspace
    return base
end

-- Função para teletransportar o veículo e o jogador para um mundo solo
local function teletransportarParaMundoSolo(veiculo)
    local destino = Vector3.new(1000, 50, 1000) -- Coordenadas do mundo solo
    veiculo:SetPrimaryPartCFrame(CFrame.new(destino))
    LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(destino + Vector3.new(0, 5, 0)))
    criarBasePlana(destino)
end

-- Função para fazer o veículo correr infinitamente
local function correrInfinitamente(veiculo)
    local velocidade = 50 -- Ajuste a velocidade conforme necessário
    RunService.RenderStepped:Connect(function()
        if veiculo and veiculo.PrimaryPart then
            veiculo:SetPrimaryPartCFrame(veiculo.PrimaryPart.CFrame * CFrame.new(0, 0, -velocidade * RunService.RenderStepped:Wait()))
        end
    end)
end

-- Função para iniciar o farm quando o jogador entrar em um veículo
local function iniciarFarm(veiculo)
    if veiculo then
        teletransportarParaMundoSolo(veiculo)
        correrInfinitamente(veiculo)
    else
        warn("Veículo não encontrado!")
    end
end

-- Detectar quando o jogador entra em um veículo
LocalPlayer.Character.ChildAdded:Connect(function(child)
    if child:IsA("Model") and child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") then
        wait(1) -- Aguarde um momento para garantir que o jogador esteja totalmente no veículo
        iniciarFarm(child)
    end
end)
