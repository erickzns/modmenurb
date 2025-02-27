local ImGui = require("ImGui")

-- Variável para armazenar o texto do script
local scriptText = ""

-- Função para criar a interface gráfica
local function createGUI()
    ImGui.Begin("Executador de Scripts")

    -- Caixa de texto para inserir o script
    scriptText = ImGui.InputTextMultiline("Script", scriptText, 500, 300)

    -- Botão para executar o script
    if ImGui.Button("Executar Script") then
        -- Executar o script inserido
        local success, err = pcall(function()
            loadstring(game:HttpGet(scriptText))()
        end)
        if not success then
            print("Erro ao executar o script: " .. err)
        end
    end

    ImGui.End()
end

-- Loop principal para renderizar a interface gráfica
while true do
    ImGui.NewFrame()
    createGUI()
    ImGui.Render()
end
