-- Script para aumentar a velocidade do veículo em New Car Development Tycoon

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- Função para encontrar o veículo do jogador
local function encontrarVeiculo()
    for _, objeto in pairs(Workspace:GetChildren()) do
        if objeto:IsA("Model") and objeto:FindFirstChild("VehicleSeat") then
            if objeto:FindFirstChild("Owner") and objeto.Owner.Value == LocalPlayer then
                return objeto
            end
        end
    end
    return nil
end

-- Função para aumentar a velocidade do veículo
local function aumentarVelocidade(veiculo, novaVelocidade)
    if veiculo and veiculo:FindFirstChild("VehicleSeat") then
        veiculo.VehicleSeat.MaxSpeed = novaVelocidade
    else
        warn("Veículo não encontrado ou não possui VehicleSeat!")
    end
end

-- Detectar quando o jogador entra em um veículo
LocalPlayer.Character.ChildAdded:Connect(function(child)
    if child:IsA("Model") and child:FindFirstChild("VehicleSeat") then
        wait(1) -- Aguarde um momento para garantir que o jogador esteja totalmente no veículo
        aumentarVelocidade(child, 100) -- Ajuste a velocidade conforme necessário
    end
end)

-- Aumentar a velocidade do veículo atual, se houver
local veiculoAtual = encontrarVeiculo()
if veiculoAtual then
    aumentarVelocidade(veiculoAtual, 100) -- Ajuste a velocidade conforme necessário
end
