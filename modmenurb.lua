-- Script de farm para qualquer carro correndo infinitamente em New Car Development Tycoon

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Função para encontrar o carro do jogador
local function encontrarCarro()
    for _, objeto in pairs(workspace:GetChildren()) do
        if objeto:IsA("Model") and objeto:FindFirstChild("Humanoid") and objeto:FindFirstChild("HumanoidRootPart") then
            if objeto:FindFirstChild("Owner") and objeto.Owner.Value == LocalPlayer then
                return objeto
            end
        end
    end
    return nil
end

-- Função para teletransportar o carro para um mundo diferente
local function teletransportarCarro(carro)
    local destino = Vector3.new(1000, 0, 1000) -- Coordenadas do mundo diferente
    carro:SetPrimaryPartCFrame(CFrame.new(destino))
end

-- Função para fazer o carro correr infinitamente
local function correrInfinitamente(carro)
    local velocidade = 50 -- Ajuste a velocidade conforme necessário
    RunService.RenderStepped:Connect(function()
        if carro and carro.PrimaryPart then
            carro:SetPrimaryPartCFrame(carro.PrimaryPart.CFrame * CFrame.new(0, 0, -velocidade * RunService.RenderStepped:Wait()))
        end
    end)
end

-- Função principal para iniciar o farm
local function iniciarFarm()
    local carro = encontrarCarro()
    if carro then
        teletransportarCarro(carro)
        correrInfinitamente(carro)
    else
        warn("Carro não encontrado!")
    end
end

-- Iniciar o farm
iniciarFarm()
