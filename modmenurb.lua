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

    -- Checkbox ESP Caixa
    criarCheckbox(scrollingFrame, "ESP Caixa", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para ativar ESP Caixa
            print("ESP Caixa ativado")
            -- Código do ESP Caixa
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local Camera = workspace.CurrentCamera

            local function criarQuadro()
                local quadro = Drawing.new("Square")
                quadro.Visible = false
                quadro.Color = Color3.fromRGB(255, 0, 0)
                quadro.Thickness = 2
                quadro.Transparency = 1
                quadro.Filled = false
                return quadro
            end

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

            local function esp()
                local quadros = {}
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

            esp()
        else
            print("ESP Caixa desativado")
        end
    end)
    posY = posY + 40

    -- Checkbox ESP Distância
    criarCheckbox(scrollingFrame, "ESP Distância", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para ativar ESP Distância
            print("ESP Distância ativado")
            -- Código do ESP Distância
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer

            local function criarDistancia(jogador)
                local char = jogador.Character
                if char and char:FindFirstChild("Head") then
                    local head = char.Head
                    local billboard = Instance.new("BillboardGui")
                    billboard.Adornee = head
                    billboard.Size = UDim2.new(0, 100, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true

                    local textLabel = Instance.new("TextLabel")
                    textLabel.Parent = billboard
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                    textLabel.TextScaled = true
                    textLabel.Font = Enum.Font.SourceSans
                    textLabel.TextSize = 14

                    billboard.Parent = head

                    RunService.RenderStepped:Connect(function()
                        if char and char:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local distancia = (LocalPlayer.Character.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
                            textLabel.Text = string.format("Distância: %.2f", distancia)
                        end
                    end)
                end
            end

            local function espDistancia()
                for _, jogador in pairs(Players:GetPlayers()) do
                    if jogador ~= LocalPlayer then
                        jogador.CharacterAdded:Connect(function()
                            criarDistancia(jogador)
                        end)
                        if jogador.Character then
                            criarDistancia(jogador)
                        end
                    end
                end

                Players.PlayerAdded:Connect(function(jogador)
                    jogador.CharacterAdded:Connect(function()
                        criarDistancia(jogador)
                    end)
                end)
            end

            espDistancia()
        else
            print("ESP Distância desativado")
        end
    end)
    posY = posY + 40

    -- Checkbox ESP Nome
    criarCheckbox(scrollingFrame, "ESP Nome", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para ativar ESP Nome
            print("ESP Nome ativado")
            -- Código do ESP Nome
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer

            local function criarNome(jogador)
                local char = jogador.Character
                if char and char:FindFirstChild("Head") then
                    local head = char.Head
                    local billboard = Instance.new("BillboardGui")
                    billboard.Adornee = head
                    billboard.Size = UDim2.new(0, 100, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true

                    local textLabel = Instance.new("TextLabel")
                    textLabel.Parent = billboard
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.Text = jogador.Name
                    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                    textLabel.TextScaled = true

                    billboard.Parent = head
                end
            end

            local function espNomes()
                for _, jogador in pairs(Players:GetPlayers()) do
                    if jogador ~= LocalPlayer then
                        criarNome(jogador)
                    end
                end

                Players.PlayerAdded:Connect(function(jogador)
                    jogador.CharacterAdded:Connect(function()
                        criarNome(jogador)
                    end)
                end)
            end

            espNomes()
        else
            print("ESP Nome desativado")
        end
    end)
    posY = posY + 40

    -- Checkbox ESP Esqueleto
    criarCheckbox(scrollingFrame, "ESP Esqueleto", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para ativar ESP Esqueleto
            print("ESP Esqueleto ativado")
            -- Código do ESP Esqueleto
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer

            local function createESP(player)
                if player.Character then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.FillTransparency = 0.5
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.OutlineTransparency = 0
                end
            end

            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    createESP(player)
                    player.CharacterAdded:Connect(function()
                        createESP(player)
                    end)
                end
            end

            Players.PlayerAdded:Connect(function(player)
                if player ~= LocalPlayer then
                    player.CharacterAdded:Connect(function()
                        createESP(player)
                    end)
                end
            end)
        else
            print("ESP Esqueleto desativado")
        end
    end)
    posY = posY + 40

    -- Checkbox ESP Linhas
    criarCheckbox(scrollingFrame, "ESP Linhas", UDim2.new(0, 25, 0, posY), function(checked)
        if checked then
            -- Código para ativar ESP Linhas
            print("ESP Linhas ativado")
            -- Código do ESP Linhas
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local Camera = workspace.CurrentCamera

            local function criarLinha()
                local linha = Drawing.new("Line")
                linha.Visible = false
                linha.Color = Color3.fromRGB(255, 0, 0)
                linha.Thickness = 2
                linha.Transparency = 1
                return linha
            end

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

            local function espLinhas()
                local linhas = {}
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

            espLinhas()
        else
            print("ESP Linhas desativado")
        end
    end)
end

-- Criar o Mod Menu
criarModMenu()
