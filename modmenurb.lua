-- Script para criar um Mod Menu flutuante em New Car Development Tycoon

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

-- Função para criar um checkbox
local function criarCheckbox(parent, text, posicao, callback)
    local checkboxFrame = Instance.new("Frame")
    checkboxFrame.Size = UDim2.new(0, 200, 0, 30)
    checkboxFrame.Position = posicao
    checkboxFrame.BackgroundTransparency = 1
    checkboxFrame.Parent = parent

    local checkbox = Instance.new("TextButton")
    checkbox.Size = UDim2.new(0, 20, 0, 20)
    checkbox.Position = UDim2.new(0, 0, 0, 5)
    checkbox.Text = ""
    checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    checkbox.Parent = checkboxFrame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 160, 0, 30)
    label.Position = UDim2.new(0, 30, 0, 0)
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.Parent = checkboxFrame

    local checked = false
    checkbox.MouseButton1Click:Connect(function()
        checked = not checked
        checkbox.BackgroundColor3 = checked and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
        callback(checked)
    end)
end

-- Função para criar o Mod Menu
local function criarModMenu()
    -- Criar ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ModMenu"
    screenGui.Parent = PlayerGui

    -- Criar Frame do Menu
    local menuFrame = Instance.new("Frame")
    menuFrame.Size = UDim2.new(0, 250, 0, 400)
    menuFrame.Position = UDim2.new(0, 50, 0, 50)
    menuFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    menuFrame.BackgroundTransparency = 0.5
    menuFrame.Visible = false
    menuFrame.Parent = screenGui

    -- Adicionar funcionalidade de rolagem
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
    scrollingFrame.ScrollBarThickness = 10
    scrollingFrame.Parent = menuFrame

    -- Criar Botão de Abrir Menu
    local abrirButton = Instance.new("TextButton")
    abrirButton.Size = UDim2.new(0, 50, 0, 50)
    abrirButton.Position = UDim2.new(0, 10, 0, 10)
    abrirButton.Text = "+"
    abrirButton.TextScaled = true
    abrirButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    abrirButton.Parent = screenGui

    -- Criar Botão de Minimizar Menu
    local minimizarButton = Instance.new("TextButton")
    minimizarButton.Size = UDim2.new(0, 50, 0, 50)
    minimizarButton.Position = UDim2.new(0, 10, 0, 10)
    minimizarButton.Text = "-"
    minimizarButton.TextScaled = true
    minimizarButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    minimizarButton.Visible = false
    minimizarButton.Parent = screenGui

    -- Função para abrir o menu
    abrirButton.MouseButton1Click:Connect(function()
        menuFrame.Visible = true
        abrirButton.Visible = false
        minimizarButton.Visible = true
    end)

    -- Função para minimizar o menu
    minimizarButton.MouseButton1Click:Connect(function()
        menuFrame.Visible = false
        abrirButton.Visible = true
        minimizarButton.Visible = false
    end)

    -- Adicionar títulos e checkboxes
    local posY = 10

    -- Título Geral
    local tituloGeral = Instance.new("TextLabel")
    tituloGeral.Size = UDim2.new(0, 200, 0, 30)
    tituloGeral.Position = UDim2.new(0, 25, 0, posY)
    tituloGeral.Text = "Geral"
    tituloGeral.TextColor3 = Color3.fromRGB(255, 255, 255)
    tituloGeral.BackgroundTransparency = 1
    tituloGeral.Parent = scrollingFrame
    posY = posY + 40

    -- Checkbox Aumentar Velocidade do Carro
    criarCheckbox(scrollingFrame, "Aumentar Velocidade do Carro", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para aumentar a velocidade do carro
            print("Aumentar Velocidade do Carro ativado")
            -- Código do arquivo AUMENTAR A VELOCIDADE DO CARRO.LUA
            -- (adicione aqui o código específico para aumentar a velocidade do carro)
        else
            -- Código para desativar o aumento de velocidade do carro
            print("Aumentar Velocidade do Carro desativado")
            -- (adicione aqui o código específico para desativar o aumento de velocidade do carro)
        end
    end)
    posY = posY + 40

    -- Título Farme
    local tituloFarme = Instance.new("TextLabel")
    tituloFarme.Size = UDim2.new(0, 200, 0, 30)
    tituloFarme.Position = UDim2.new(0, 25, 0, posY)
    tituloFarme.Text = "Farme"
    tituloFarme.TextColor3 = Color3.fromRGB(255, 255, 255)
    tituloFarme.BackgroundTransparency = 1
    tituloFarme.Parent = scrollingFrame
    posY = posY + 40

    -- Checkbox Farme Solo
    criarCheckbox(scrollingFrame, "Farme Solo", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para iniciar o farme solo
            print("Farme Solo ativado")
            -- Código do arquivo FARME SOLO.LUA
            -- (adicione aqui o código específico para iniciar o farme solo)
        else
            -- Código para parar o farme solo
            print("Farme Solo desativado")
            -- (adicione aqui o código específico para parar o farme solo)
        end
    end)
    posY = posY + 40

    -- Título ESP
    local tituloESP = Instance.new("TextLabel")
    tituloESP.Size = UDim2.new(0, 200, 0, 30)
    tituloESP.Position = UDim2.new(0, 25, 0, posY)
    tituloESP.Text = "ESP"
    tituloESP.TextColor3 = Color3.fromRGB(255, 255, 255)
    tituloESP.BackgroundTransparency = 1
    tituloESP.Parent = scrollingFrame
    posY = posY + 40

    -- Variáveis para armazenar os quadros e linhas
    local quadros = {}
    local linhas = {}

    -- Função para criar um quadro
    local function criarQuadro()
        local quadro = Drawing.new("Square")
        quadro.Visible = false
        quadro.Color = Color3.fromRGB(255, 0, 0)
        quadro.Thickness = 2
        quadro.Transparency = 1
        quadro.Filled = false
        return quadro
    end

    -- Função para atualizar um quadro
    local function atualizarQuadro(quadro, objeto)
        local pos, visivel = Camera:WorldToViewportPoint(objeto.Position)
        if visivel then
            local humanoid = objeto.Parent:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local altura = humanoid.HipHeight * 2 + humanoid.HumanoidRootPart.Size.Y
                local largura = altura / 2
                quadro.Size = Vector2.new(largura, altura)
                quadro.Position = Vector2.new(pos.X - quadro.Size.X / 2, pos.Y - quadro.Size.Y / 2)
                quadro.Visible = true
            end
        else
            quadro.Visible = false
        end
    end

    -- Função para ativar ESP Caixa
    local function ativarESPCaixa()
        for _, jogador in pairs(Players:GetPlayers()) do
            if jogador ~= LocalPlayer and jogador.Character and jogador.Character:FindFirstChild("HumanoidRootPart") then
                local quadro = criarQuadro()
                table.insert(quadros, {quadro = quadro, objeto = jogador.Character.HumanoidRootPart})
            end
        end
        RunService.RenderStepped:Connect(function()
            for _, item in pairs(quadros) do
                atualizarQuadro(item.quadro, item.objeto)
            end
        end)
    end

    -- Função para desativar ESP Caixa
    local function desativarESPCaixa()
        for _, item in pairs(quadros) do
            item.quadro.Visible = false
        end
        quadros = {}
    end

    -- Função para criar uma linha
    local function criarLinha()
        local linha = Drawing.new("Line")
        linha.Visible = false
        linha.Color = Color3.fromRGB(255, 0, 0)
        linha.Thickness = 2
        linha.Transparency = 1
        return linha
    end

    -- Função para atualizar uma linha
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

    -- Função para ativar ESP Linhas
    local function ativarESPLinhas()
        for _, jogador in pairs(Players:GetPlayers()) do
            if jogador ~= LocalPlayer and jogador.Character and jogador.Character:FindFirstChild("HumanoidRootPart") then
                local linha = criarLinha()
                table.insert(linhas, {linha = linha, objeto = jogador.Character.HumanoidRootPart})
            end
        end
        RunService.RenderStepped:Connect(function()
            for _, item in pairs(linhas) do
                atualizarLinha(item.linha, item.objeto)
            end
        end)
    end

    -- Função para desativar ESP Linhas
    local function desativarESPLinhas()
        for _, item in pairs(linhas) do
            item.linha.Visible = false
        end
        linhas = {}
    end

    -- Checkbox ESP Caixa
    criarCheckbox(scrollingFrame, "ESP Caixa", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            ativarESPCaixa()
            print("ESP Caixa ativado")
        else
            desativarESPCaixa()
            print("ESP Caixa desativado")
        end
    end)
    posY = posY + 40

    -- Checkbox ESP Linhas
    criarCheckbox(scrollingFrame, "ESP Linhas", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            ativarESPLinhas()
            print("ESP Linhas ativado")
        else
            desativarESPLinhas()
            print("ESP Linhas desativado")
        end
    end)

    -- Manter as outras funções ESP
    -- Checkbox ESP Distância
    criarCheckbox(scrollingFrame, "ESP Distância", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para ativar ESP Distância
            print("ESP Distância ativado")
            -- (adicione aqui o código específico para ativar ESP Distância)
        else
            -- Código para desativar ESP Distância
            print("ESP Distância desativado")
            -- (adicione aqui o código específico para desativar ESP Distância)
        end
    end)
    posY = posY + 40

    -- Checkbox ESP Nome
    criarCheckbox(scrollingFrame, "ESP Nome", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para ativar ESP Nome
            print("ESP Nome ativado")
            -- (adicione aqui o código específico para ativar ESP Nome)
        else
            -- Código para desativar ESP Nome
            print("ESP Nome desativado")
            -- (adicione aqui o código específico para desativar ESP Nome)
        end
    end)
    posY = posY + 40

    -- Checkbox ESP Esqueleto
    criarCheckbox(scrollingFrame, "ESP Esqueleto", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para ativar ESP Esqueleto
            print("ESP Esqueleto ativado")
            -- (adicione aqui o código específico para ativar ESP Esqueleto)
        else
            -- Código para desativar ESP Esqueleto
            print("ESP Esqueleto desativado")
            -- (adicione aqui o código específico para desativar ESP Esqueleto)
        end
    end)
    posY = posY + 40
end

-- Criar o Mod Menu
criarModMenu()
