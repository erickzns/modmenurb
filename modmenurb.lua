-- Carrega o menu flutuante
loadstring(game:HttpGet("https://raw.githubusercontent.com/erickzns/modmenurb/refs/heads/main/modmenurb.lua "))()

-- Função: Speed
function speed()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
end

-- Função: Inf Jump
function infjump()
    game:GetService("UserInputService").JumpRequest:connect(function()
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end)
end

-- Função: Fly (pressione E para voar)
function fly()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character.Humanoid
    humanoid.PlatformStand = true

    local bgf = Instance.new("BodyGyro")
    local bvf = Instance.new("BodyVelocity")

    bgf.P = 9e4
    bgf.D = 1e3
    bgf.MaxTorque = Vector3.new(4,4,4)

    bvf.Velocity = Vector3.new()
    bvf.MaxForce = Vector3.new(4000,4000,4000)

    spawn(function()
        while true do
            if flying then
                bvf.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * (50)
            end
            wait()
        end
    end)

    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.E then
            flying = not flying
            if flying then
                bgf.Parent = character.HumanoidRootPart
                bvf.Parent = character.HumanoidRootPart
            else
                bgf:Destroy()
                bvf:Destroy()
            end
        end
    end)
end

-- Função: NoClip
function noclip()
    game.Players.LocalPlayer:GetPropertyChangedSignal("Character"):Wait()
    local char = game.Players.LocalPlayer.Character
    while true do
        for _, v in next, char:GetDescendants() do
            if v:IsA("BasePart") and v.CanCollide == true then
                v.CanCollide = false
            end
        end
        wait()
    end
end

-- Função: Reset Character
function resetchar()
    game.Players.LocalPlayer.Character:BreakJoints()
end

-- Função: Give Knife
function giveknife()
    local A_1 = "Kitchen Knife"
    local Event = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer
    Event(A_1)
end

-- Função: Give Random Sword
function givesword()
    local A_1 = "Random Sword"
    local Event = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer
    Event(A_1)
end

-- Função: Give Devil Fruit
function givefruit()
    local A_1 = "Devil Fruit"
    local Event = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer
    Event(A_1)
end

-- Função: Teleport to Map Center
function teleportcenter()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6687.44, 37.61, -12159.4)
end

-- Função: God Mode (sem quebrar juntas)
function godmode()
    repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
    local plr = game.Players.LocalPlayer
    local chr = plr.Character
    local old = chr.Humanoid.Health
    chr.Humanoid.Changed:Connect(function()
        if chr.Humanoid.Health < old then
            chr.Humanoid.Health = old
        end
    end)
end

-- Botões do menu (conectados às funções acima)
_G.Menu.Buttons.Speed.Callback = speed
_G.Menu.Buttons.InfJump.Callback = infjump
_G.Menu.Buttons.Fly.Callback = fly
_G.Menu.Buttons.NoClip.Callback = noclip
_G.Menu.Buttons.ResetChar.Callback = resetchar
_G.Menu.Buttons.Knife.Callback = giveknife
_G.Menu.Buttons.Sword.Callback = givesword
_G.Menu.Buttons.DevilFruit.Callback = givefruit
_G.Menu.Buttons.Teleport.Callback = teleportcenter
_G.Menu.Buttons.GodMode.Callback = godmode
