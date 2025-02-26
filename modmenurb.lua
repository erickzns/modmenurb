-- Script para criar um Mod Menu flutuante em New Car Development Tycoon

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Função para criar o Mod Menu
local function criarModMenu()
    -- Criar ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ModMenu"
    screenGui.Parent = PlayerGui

    -- Criar Frame do Menu
    local menuFrame = Instance.new("Frame")
    menuFrame.Size = UDim2.new(0, 200, 0, 300)
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
end

-- Criar o Mod Menu
criarModMenu()
