GUI = game:GetService("CoreGui")
Http = game:GetService("HttpService")

plr = game.Players.LocalPlayer

local function CreateUI()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local ScrollingFrame = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")

    -- Configurações do GUI
    ScreenGui.Name = "RobloxModMenu"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = GUI

    Frame.Name = "MainFrame"
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.75, 0, 0.2, 0)
    Frame.Size = UDim2.new(0, 250, 0, 300)
    Frame.Active = true
    Frame.Draggable = true

    TextLabel.Name = "Title"
    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1
    TextLabel.BorderSizePixel = 0
    TextLabel.Size = UDim2.new(1, 0, 0, 30)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = "🎯 Roblox Mod Menu"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 18

    ScrollingFrame.Name = "Buttons"
    ScrollingFrame.Parent = Frame
    ScrollingFrame.Active = true
    ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.Position = UDim2.new(0, 0, 0, 40)
    ScrollingFrame.Size = UDim2.new(1, 0, 1, -40)
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollingFrame.ScrollBarThickness = 6
    ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

    UIListLayout.Parent = ScrollingFrame
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    UIPadding.Parent = ScrollingFrame
    UIPadding.PaddingLeft = UDim.new(0, 5)
    UIPadding.PaddingRight = UDim.new(0, 5)
    UIPadding.PaddingTop = UDim.new(0, 5)
    UIPadding.PaddingBottom = UDim.new(0, 5)

    local htmlContent = [[
<!DOCTYPE html>
<html><head><meta charset="UTF-8"/><title>Mod Menu</title><style>*{margin:0;padding:0;box-sizing:border-box;}body{font-family:'Segoe UI',sans-serif;background-color:#121212;color:white;display:flex;justify-content:center;align-items:center;height:100vh;}.menu{width:250px;background-color:#1e1e1e;border:2px solid #007BFF;border-radius:10px;padding:20px;color:white;}.header{display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;}.header h2{font-size:18px;}#closeBtn{background:none;border:none;color:white;font-size:20px;cursor:pointer;}.buttons button{width:100%;padding:10px;margin:6px 0;background-color:#2a2a2a;color:white;border:none;border-radius:5px;cursor:pointer;transition:background 0.2s;}.buttons button:hover{background-color:#3a3a3a;}</style></head><body><div class="menu"><div class="header"><h2>🎯 Roblox Mod Menu</h2><button id="closeBtn">✖</button></div><div class="buttons"><button onclick="executeScript('fly')">🕊 Fly Mode</button><button onclick="executeScript('noclip')">👻 NoClip</button><button onclick="executeScript('infJump')">↥ Inf Jump</button><button onclick="executeScript('speed')">⚡ Speed</button><button onclick="executeScript('god')">🛡 God Mode</button><button onclick="executeScript('reset')">🔁 Reset</button></div></div><script>function executeScript(command){switch(command){case'fly':syn.request({Url:'http://localhost:64619/v1/eval',Method:'POST',Headers:{['Content-Type']: 'application/json'},Body:JSON.stringify({type:'set_clipboard',value:[[[[Fly Script]]]])});break;case'infJump':game:GetService("UserInputService").JumpRequest:connect(function()game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")end);break;case'speed':game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=50;break;case'reset':game.Players.LocalPlayer.Character:BreakJoints();break;default:alert("Comando desconhecido.");}}document.getElementById("closeBtn").onclick=function(){document.body.style.display="none";};</script></body></html>
    ]]

    local html = Instance.new("TextBox")
    html.Size = UDim2.new(1, 0, 0, 200)
    html.ClearTextOnFocus = false
    html.Text = ""
    html.TextEditable = false
    html.TextWrapped = true
    html.TextXAlignment = Enum.TextXAlignment.Left
    html.TextYAlignment = Enum.TextYAlignment.Top
    html.MultiLine = true
    html.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    html.TextColor3 = Color3.fromRGB(255, 255, 255)
    html.Font = Enum.Font.Code
    html.TextSize = 14
    html.Parent = ScrollingFrame

    local iframe = Instance.new("ImageLabel")
    iframe.Name = "Iframe"
    iframe.Size = UDim2.new(1, 0, 1, 0)
    iframe.Image = "rbxassetid://4706736599"
    iframe.ImageColor3 = Color3.fromRGB(255, 255, 255)
    iframe.ImageTransparency = 1
    iframe.Visible = false
    iframe.Parent = html

    local ui = Instance.new("BillboardGui")
    ui.Adornee = plr.Character.Head
    ui.AlwaysOnTop = true
    ui.Size = UDim2.new(0, 250, 0, 300)
    ui.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
    ui.Parent = plr.PlayerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.Parent = ui

    local web = Instance.new("ImageButton")
    web.Size = UDim2.new(1, 0, 1, 0)
    web.BackgroundTransparency = 1
    web.Image = "http://www.roblox.com/asset/?id=4412381565"
    web.ImageColor3 = Color3.fromRGB(255, 255, 255)
    web.ImageTransparency = 0.7
    web.Parent = frame

    syn.protect_gui(web)
    syn.protect_gui(ScreenGui)
end

spawn(CreateUI)
