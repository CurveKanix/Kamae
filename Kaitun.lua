function PressButton(Button)
    game:GetService("GuiService").SelectedCoreObject = Button
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.ButtonL1, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.ButtonL1, false, game)
    task.wait(.5)
    game:GetService("GuiService").SelectedCoreObject = nil
end

local VirtualUser = game:GetService('VirtualUser')
game:GetService("Players").LocalPlayer.Idled:connect(function()
    pcall(function()
        VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

MyName = "CurveKanix3"

task.spawn(function()
    while task.wait(.5) do
        pcall(function()
            if game.Players.LocalPlayer.Name == MyName then
                repeat task.wait(1) until tonumber((string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Main.Yen.Text, "[,¥]", ""))) >= tonumber((string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Main.Units["1"].UnitTemplate.Holder.Main.Price.Text, "[,¥]", "")))
                if tonumber((string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Main.Yen.Text, "[,¥]", ""))) >= tonumber((string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Main.Units["1"].UnitTemplate.Holder.Main.Price.Text, "[,¥]", ""))) then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Main.Units["1"].UnitTemplate.Holder.Main.UnitName.Text == "Quetzalcoatl" then
                        Numb = 268
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Main.Units["1"].UnitTemplate.Holder.Main.UnitName.Text == "Hei" then
                        Numb = 264
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Main.Units["1"].UnitTemplate.Holder.Main.UnitName.Text == "Newsman" then
                        Numb = 266
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Main.Units["1"].UnitTemplate.Holder.Main.UnitName.Text == "Ali" then
                        Numb = 262
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Main.Units["1"].UnitTemplate.Holder.Main.UnitName.Text == "Leo" then
                        Numb = 260
                    end

                    local args = {
                        "Render",
                        {
                            game:GetService("Players").LocalPlayer.PlayerGui.Hotbar.Main.Units["1"].UnitTemplate.Holder.Main.UnitName.Text,
                            Numb,
                            vector.create(-310.9972839355469, 14.35739517211914, -235.07791137695312),
                            0
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("UnitEvent"):FireServer(unpack(args))

                end

                
                repeat task.wait(1) 
                    s = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Map.WavesAmount.Text
                    result = (s:gsub("<.->", "")):gsub("<stroke.-></stroke>", ""):gsub("/∞", "")
                until tonumber(result) >= 10

                if tonumber(result) >= 10 then
                    local args = {
                        "Vote"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("MatchRestartSettingEvent"):FireServer(unpack(args))

                    -- for i,v in pairs(workspace.Units:GetChildren()) do
                    --     local args = {
                    --         "Sell",
                    --         v.Name
                    --     }
                    --     game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("UnitEvent"):FireServer(unpack(args))
                    -- end
                end

                repeat task.wait(1) until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SkipWave")
            end
        end)
    end
end)    


task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if game.Players.LocalPlayer.Name == MyName then
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("PopupScreen") then
                    game:GetService("Players").LocalPlayer.PlayerGui.PopupScreen:Destroy()
                end
                
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("SkipWave") then
                    game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("SkipWaveEvent"):FireServer("Skip")
                end

                if game:GetService("Players").LocalPlayer.PlayerGui.ViewFrames:FindFirstChild("ViewFrame") then
                    PressButton(game:GetService("Players").LocalPlayer.PlayerGui.ViewFrames.ViewFrame)
                end

                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Modifiers") then
                    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Modifiers.Modifiers.Main:GetChildren()) do
                        if v:IsA("Frame") then
                            local args = {
                                "Choose",
                                v.Name
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("ModifierEvent"):FireServer(unpack(args))
                        end
                    end
                end
                
                for i,v in pairs(workspace.Units:GetChildren()) do
                    local args = {
                        "Upgrade",
                        v.Name
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("UnitEvent"):FireServer(unpack(args))
                end

                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("EndScreen") then
                    local args = {
                        "Retry"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("EndScreen"):WaitForChild("VoteEvent"):FireServer(unpack(args))
                end
            end
        end)
    end
end)
