-- Script para criar um Mod Menu flutuante em New Car Development Tycoon

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

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
    tituloGeral.Parent = menuFrame
    posY = posY + 40

    -- Checkbox Aumentar Velocidade do Carro
    criarCheckbox(menuFrame, "Aumentar Velocidade do Carro", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para aumentar a velocidade do carro
            print("Aumentar Velocidade do Carro ativado")
        else
            -- Código para desativar o aumento de velocidade do carro
            print("Aumentar Velocidade do Carro desativado")
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
    tituloFarme.Parent = menuFrame
    posY = posY + 40

    -- Checkbox Farme Solo
    criarCheckbox(menuFrame, "Farme Solo", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para iniciar o farme solo
            print("Farme Solo ativado")
        else
            -- Código para parar o farme solo
            print("Farme Solo desativado")
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
    tituloESP.Parent = menuFrame
    posY = posY + 40

    -- Checkbox ESP Caixa
    criarCheckbox(menuFrame, "ESP Caixa", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para ativar ESP Caixa
            print("ESP Caixa ativado")
        else
            -- Código para desativar ESP Caixa
            print("ESP Caixa desativado")
        end
    end)
    posY = posY + 40

    -- Checkbox ESP Distância
    criarCheckbox(menuFrame, "ESP Distância", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para ativar ESP Distância
            print("ESP Distância ativado")
        else
            -- Código para desativar ESP Distância
            print("ESP Distância desativado")
        end
    end)
    posY = posY + 40

    -- Checkbox ESP Nome
    criarCheckbox(menuFrame, "ESP Nome", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para ativar ESP Nome
            print("ESP Nome ativado")
        else
            -- Código para desativar ESP Nome
            print("ESP Nome desativado")
        end
    end)
    posY = posY + 40

    -- Checkbox ESP Esqueleto
    criarCheckbox(menuFrame, "ESP Esqueleto", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para ativar ESP Esqueleto
            print("ESP Esqueleto ativado")
        else
            -- Código para desativar ESP Esqueleto
            print("ESP Esqueleto desativado")
        end
    end)
    posY = posY + 40

    -- Checkbox ESP Linhas
    criarCheckbox(menuFrame, "ESP Linhas", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para ativar ESP Linhas
            print("ESP Linhas ativado")
        else
            -- Código para desativar ESP Linhas
            print("ESP Linhas desativado")
        end
    end)
end

-- Criar o Mod Menu
criarModMenu()
