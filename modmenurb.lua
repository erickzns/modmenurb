-- Script para automatizar a coleta de recursos em New Car Development Tycoon

-- Função para coletar recursos
local function coletarRecursos()
    -- Obtenha o jogador local
    local jogador = game.Players.LocalPlayer

    -- Verifique se o jogador está no jogo
    if jogador then
        -- Obtenha a pasta de recursos do jogador
        local recursos = jogador:FindFirstChild("Recursos")

        -- Verifique se a pasta de recursos existe
        if recursos then
            -- Itere sobre todos os recursos e colete-os
            for _, recurso in pairs(recursos:GetChildren()) do
                if recurso:IsA("Part") then
                    -- Simule a coleta do recurso
                    recurso.CFrame = jogador.Character.HumanoidRootPart.CFrame
                end
            end
        end
    end
end

-- Execute a função de coleta de recursos a cada 5 segundos
while true do
    coletarRecursos()
    wait(5)
end
