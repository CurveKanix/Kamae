
if (shared.key == nil) then
    game.Players.LocalPlayer:Kick("ลบคีย์หาเหี้ยไร")
    wait(.8)
    while true do
    end
end

local types_of_fingerprints = {
    'Krampus-Fingerprint',
    'Krampus-User-Identifier',
    'Codex-Fingerprint',
    'Vega-Fingerprint',
    'Delta-Fingerprint',
    'Arceus-Fingerprint',
};

local function modExp(base, exponent, modulus)
    local result = 1
    base = base % modulus
    while exponent > 0 do
        if exponent % 2 == 1 then
            result = (result * base) % modulus
        end
        exponent = math.floor(exponent / 2)  -- Use math.floor for integer division
        base = (base * base) % modulus
    end
    return result
end

local function gcd(a, b)
    while b ~= 0 do
        a, b = b, a % b
    end
    return a
end

local function extendedGcd(a, b)
    local x, y = 0, 1
    local lastX, lastY = 1, 0
    while b ~= 0 do
        local quotient = math.floor(a / b)
        a, b = b, a % b
        x, lastX = lastX - quotient * x, x
        y, lastY = lastY - quotient * y, y
    end
    return lastX
end

local function generateKeys(p, q)
    local n = p * q
    local phi = (p - 1) * (q - 1)
    local e = 65537
    local d = extendedGcd(e, phi)
    if d < 0 then
        d = d + phi
    end
    return n, e, d
end

local function encrypt(message, e, n)
    local cipher = {}
    for i = 1, #message do
        local charCode = string.byte(message:sub(i, i))
        cipher[i] = modExp(charCode, e, n)
    end
    return cipher
end

local function decrypt(cipher, d, n)
    local message = ""
    for i = 1, #cipher do
        local charCode = modExp(cipher[i], d, n)
        message = message .. string.char(charCode)
    end
    return message
end
local p = 61
local q = 53
local n, e, d = generateKeys(p, q)
-- print(n,e,d)
local key_enc = table.concat(encrypt(shared.key, e, n), ',')
local hwid;

getgenv().hookfunction = newcclosure(function(...)
    local server =
    request(
    {
        Url = "http://45.141.26.140:5555/api/blacklist?key=" .. key_enc .. "&reason=" .. table.concat(encrypt("Tired to crack", e, n), ','),
        Method = "POST"
    }
    ).Body
    while true do end
end)
getgenv().hookfunc = newcclosure(function(...)
    local server =
    request(
    {
        Url = "http://45.141.26.140:5555/api/blacklist?key=" .. key_enc .. "&reason=" .. table.concat(encrypt("Tired to crack", e, n), ','),
        Method = "POST"
    }
    ).Body
    while true do end
end)
getgenv().clonefunction = newcclosure(function(...)
    local server =
    request(
    {
        Url = "http://45.141.26.140:5555/api/blacklist?key=" .. key_enc .. "&reason=" .. table.concat(encrypt("Tired to crack", e, n), ','),
        Method = "POST"
    }
    ).Body
    while true do end
end)

-- shared.Key = "key"

local CRACKERMAN = false

local kick_prefix = "[CURVE HUB]"

local dialog_ENG = {
    [1] = "You are in blacklist!",
    [2] = "Invaid HWID!",
    [3] = "UPDATE HWID (WAIT 2-3 sec)",
    [4] = "Exploit not support!!",
    [5] = "Invaid Key!"
}

local dialog_TH = {
    [1] = "มึงโดนBlacklistไอ่โง่",
    [2] = "Hwid ไม่ตรงรันเพื่อ­",
    [3] = "กำลังAdd Hwid โปรดรอ 2-3วิ",
    [4] = "ตัวรันไม่Supportครับน้อง",
    [5] = "คีย์ผิดไอ่ควาย"
}

function kick(x)
    game.Players.LocalPlayer:kick(kick_prefix .. " " .. x)
    wait(.8)
    while true do
    end
end

if shared.key == nil then
    kick(kick_prefix .. " " .. "ห้ามลบ shared.Key")
end

local body = http_request({Url = "https://httpbin.org/get", Method = "GET"}).Body
local decoded = game:GetService("HttpService"):JSONDecode(body)
local hwid = ""
for i, v in next, types_of_fingerprints do
    if decoded.headers[v] then
        hwid = decoded.headers[v]
        break
    else
        game.Players.LocalPlayer:Kick("Executor not support.");
    end
end
local server =
    request(
    {
        Url = "http://45.141.26.140:5555/api/whitelist?key=" .. key_enc .. "&hwid=" .. hwid,
        Method = "POST"
    }
).Body
local de = game:GetService("HttpService"):JSONDecode(server)
local msg = string.split(de.message, ',')
local thee = {};
for i,v in pairs(msg) do
    if (v~='') then
        thee[#thee+1] = tonumber(v)
    end
end
local sss = decrypt(thee,d,n)
-- print(sss)
if (sss == shared.key) then
    -- script มึงอ่ะไอ่สัด
    -- // Initialising the UI
repeat wait() until game:IsLoaded()
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer
repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui

if not game:IsLoaded() then
	local GameLoadGui = Instance.new("Message",workspace);
	GameLoadGui.Text = 'Wait Game Loading';
	game.Loaded:Wait();
	GameLoadGui:Destroy();
	task.wait(10);
end;

getgenv().Settings = {
    AutoFarmMonster = false;
    SelectWeapon = "";
    SelectWeaponTransform = "";
    ButtonToTransform = "";
    SelectPlayer = "";
    SelectMob = "";
    Fish = false;
    Selected_Modes = "Behind";
    BringMob = false;
    AutoAizen = false;
    AutoCoins = false;
    Distance = 12.5;
    Modes = CFrame.new(0,0,12.5);
    InstantKill = false;
    AutoTransform = false;
    AutoSkill = false;
    Auto_Z = false;
    Auto_X = false;
    Auto_C = false;
    AllPoint = false;
    UpStatsMelee = false;
    UpStatsHealth = false;
    UpStatsDevilFruit = false;
    UpStatsSword = false;
    Spectate_Player = false;
    ShadowHoodle = false;
    ShadowDiary = false;
    RandomSlot = false;
    Openshop = false;
    Openshop2 = false;
    Fly = false;
    FlySpeed = 500;
    ClickToTp = false;
    Dungeon = false;
    Steal_Drop_Item = false;
    Store_Item = false;
}

local foldername = "KERZY HUB"
local filename = game.Players.LocalPlayer.Name.."_RF_Config.json"
 
function saveSettings()
    local HttpService = game:GetService("HttpService")
    local json = HttpService:JSONEncode(getgenv().Settings)
    if (writefile) then
        if isfolder(foldername) then
			if isfile(foldername.."\\"..filename) then
				writefile(foldername.."\\"..filename, json)
			else
				writefile(foldername.."\\"..filename, json)
			end
        else
            makefolder(foldername)
			writefile(foldername.."\\"..filename, json)
        end
    end
end

function loadSettings()
    local HttpService = game:GetService("HttpService")
    if isfile(foldername.."\\"..filename) then
        getgenv().Settings = HttpService:JSONDecode(readfile(foldername.."\\"..filename))
    end
end
 
loadSettings()

local KameaHub = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

KameaHub.Name = "Kamea"
KameaHub.DisplayOrder = 100
KameaHub.Parent = game.CoreGui
KameaHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = KameaHub
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.116677232, 0, 0.191729322, 0)
ImageButton.Size = UDim2.new(0.0322942249, 0, 0.063343361, 0)
ImageButton.Image = "rbxassetid://17245412955"
ImageButton.AnchorPoint = Vector2.new(0.5,0.5)


UICorner.CornerRadius = UDim.new(0.25, 0)
UICorner.Parent = ImageButton

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CurveKanix/Kamae/main/UI"))()
local UI = Library.new("KERZY HUB | ROCK FRUIT", 5013109572)

ImageButton.Activated:Connect(function()
    UI:toggle()
end)

local UIS = game:GetService('UserInputService')
local frame = ImageButton
local dragToggle = nil
local dragSpeed = .1
local dragStart = nil
local startPos = nil

local function updateInput(input)
 local delta = input.Position - dragStart
 local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
  startPos.Y.Scale, startPos.Y.Offset + delta.Y)
 game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
end

frame.InputBegan:Connect(function(input)
 if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
  dragToggle = true
  dragStart = input.Position
  startPos = frame.Position
  input.Changed:Connect(function()
   if input.UserInputState == Enum.UserInputState.End then
    dragToggle = false
   end
  end)
 end
end)

UIS.InputChanged:Connect(function(input)
 if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
  if dragToggle then
   updateInput(input)
  end
 end
end)


-- // Themes
local Themes = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),  
    TextColor = Color3.fromRGB(255, 255, 255)
}


local Main = UI:addPage("Main", 7040391851)

local AutoFarmSection = Main:addSection("Auto Farm")

if game:GetService("Players").LocalPlayer.PlayerGui.Run.TextButton.Visible then
    Mobile = true
elseif not game:GetService("Players").LocalPlayer.PlayerGui.Run.TextButton.Visible then
    PC = true
end

function CheckPlayer(Name)
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Name == Name then
            return true
        end
    end
end

AutoFarmSection:addToggle("Auto Farm Monster", getgenv().Settings.AutoFarmMonster, function(value)
    getgenv().Settings.AutoFarmMonster = value
    saveSettings()
end)

AutoFarmSection:addToggle("Bring Mob", getgenv().Settings.BringMob, function(value)
    getgenv().Settings.BringMob = value
    saveSettings()
end)

function removeDuplicates(tbl)
    local unique = {}
    local result = {}

    for _, v in ipairs(tbl) do
        if not unique[v] then
            unique[v] = true
            table.insert(result, v)
        end
    end

    return result
end

Monster = {};

pcall(function()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
            if v.Humanoid.Health > 0 then
                if not CheckPlayer(v.Name) then
                    if not v.HumanoidRootPart:FindFirstChild("ClickDetector") then
                        table.insert(Monster,v.Name);
                    end
                end
            end
        end
    end
end)

Monster = removeDuplicates(Monster)

local Mobppo = AutoFarmSection:addDropdown("Select Monster", Monster, function(text)
    getgenv().Settings.SelectMob = text
    saveSettings()
 end)

AutoFarmSection:addButton("Refresh Monster", function()
    Monster = {};
    pcall(function()
        for i,v in pairs(game.Workspace:GetChildren()) do
            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                if v.Humanoid.Health > 0 then
                    if not CheckPlayer(v.Name) then
                        if not v.HumanoidRootPart:FindFirstChild("ClickDetector") then
                            table.insert(Monster,v.Name);
                        end
                    end
                end
            end
        end
    end)
    Monster = removeDuplicates(Monster)
    AutoFarmSection:updateDropdown(Mobppo, "Select Monster", Monster, function(text)
        getgenv().Settings.SelectMob = text
     end)
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().Settings.AutoFarmMonster then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == getgenv().Settings.SelectMob then
                        if game.Workspace:FindFirstChild(getgenv().Settings.SelectMob) then
                            if v.Humanoid.Health > 0 then
                                if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") then
                                    if (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 350 then
                                        repeat task.wait()
                                            StartMagnet = true
                                            PosMon = v.HumanoidRootPart.CFrame
                                            v.Head.CanCollide = false
                                            v.HumanoidRootPart.CanCollide = false
                                            Equip(getgenv().Settings.SelectWeapon)
                                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * getgenv().Settings.Modes
                                            game:GetService'VirtualUser':CaptureController()
                                            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                        until v.Humanoid.Health <= 0 or not getgenv().Settings.AutoFarmMonster
                                    else
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * getgenv().Settings.Modes
                                        wait(.1)
                                    end
                                end
                            end
                        else
                            StartMagnet = false
                        end
                    end
                end
            else
                StartMagnet = false
            end
        end)
    end
end)


Wapon = {};
pcall(function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do 
        if v:IsA("Tool")and not table.find(Wapon,v.Name)then 
            table.insert(Wapon,v.Name);
        end;
    end;
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do 
        if v:IsA("Tool")and not table.find(Wapon,v.Name)then 
            table.insert(Wapon,v.Name);
        end;
    end;
end)

local Dropppo = AutoFarmSection:addDropdown("Select Weapon", Wapon, function(text)
    getgenv().Settings.SelectWeapon = text
    saveSettings()
end)

AutoFarmSection:addButton("Refresh Weapon", function()
    Wapon = {};
    pcall(function()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do 
            if v:IsA("Tool")and not table.find(Wapon,v.Name)then 
                table.insert(Wapon,v.Name);
            end;
        end;
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do 
            if v:IsA("Tool")and not table.find(Wapon,v.Name)then 
                table.insert(Wapon,v.Name);
            end;
        end;
    end)

    AutoFarmSection:updateDropdown(Dropppo, "Select Weapon", Wapon, function(text)
        getgenv().Settings.SelectWeapon = text
     end)
end)

local FishSection = Main:addSection("Fish")

FishSection:addToggle("Auto Fishing", getgenv().Settings.Fish, function(value)
    getgenv().Settings.Fish = value
    saveSettings()
end)

-----------------------KANIX ON TOP ----------------------------------------------------------------------------------------------------------

function Equip(Tool)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(Tool) then
        Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(Tool)
        wait(.1)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
    end
end

function UnEquip()
    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
end

task.spawn(function()
    while true do wait()
        if setscriptable then
            setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
        end
        if sethiddenproperty then
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
        end
    end
end)

function InMyNetWork(object)
    if isnetworkowner then
        return isnetworkowner(object)
    else
        if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 200 then 
            return true
        end
        return false
    end
end


task.spawn(function()
    while task.wait() do
        pcall(function()
            if StartMagnet and getgenv().Settings.BringMob then
                -- for i,v in pairs(game.Workspace:GetChildren()) do
                --     if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                --         -- if InMyNetWork(v.HumanoidRootPart) then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if v.Humanoid.Health > 0 then
                            if not CheckPlayer(v.Name) then
                                if not v.HumanoidRootPart:FindFirstChild("ClickDetector") then
                                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 350 then
                                        -- if InMyNetWork(v.HumanoidRootPart) then
                                            v.HumanoidRootPart.CFrame = PosMon
                                            v.Humanoid.JumpPower = 0
                                            v.Humanoid.WalkSpeed = 0
                                            -- v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                            v.HumanoidRootPart.Transparency = 1
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Head.CanCollide = false
                                            if not v:FindFirstChild("HumanoidRootPart"):FindFirstChild("BV") then
                                                local G = Instance.new("BodyVelocity")
                                                G.Parent = v:FindFirstChild("HumanoidRootPart")
                                                G.Name = "BV"
                                                G.MaxForce = Vector3.new(100000, 100000, 100000)
                                                G.Velocity = Vector3.new(0, 0, 0)
                                            end
                                            v.Humanoid:ChangeState(11)
                                            v.Humanoid:ChangeState(14)
                                        -- end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            if Noclip or getgenv().Settings.AutoFarmMonster or getgenv().Settings.AutoAizen or getgenv().Settings.AutoCoins or getgenv().Settings.Dungeon then
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                        end
                        local BodyVelocity = Instance.new("BodyVelocity")
                        BodyVelocity.Name = "BodyVelocity1"
                        BodyVelocity.Parent =  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                        BodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
                        BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    end
                end
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            else
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1"):Destroy();
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        if getgenv().Settings.AutoAizen then
            pcall(function()
                if game:GetService("Workspace"):FindFirstChild("Aizen") then
                    for i,v in pairs(Workspace:GetChildren()) do
                        if v.Name == "Aizen" then
                            if Workspace:FindFirstChild("Aizen") then
                                if v.Humanoid.Health > 0 then
                                    if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") then
                                        if (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 350 then
                                            repeat task.wait()
                                                StartMagnet = true
                                                PosMon = v.HumanoidRootPart.CFrame
                                                v.Head.CanCollide = false
                                                v.HumanoidRootPart.CanCollide = false
                                                Equip(getgenv().Settings.SelectWeapon)
                                                -- game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,12,0)
                                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * getgenv().Settings.Modes
                                                game:GetService'VirtualUser':CaptureController()
                                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                            until v.Humanoid.Health <= 0 or not getgenv().Settings.AutoAizen
                                            game:GetService("ReplicatedStorage").Inventory:FireServer("Change", "Orb Final","Backpack")
                                        else
                                            -- game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,12.5,0)
                                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * getgenv().Settings.Modes
                                            wait(.1)
                                        end
                                    end
                                end
                            else
                                StartMagnet = false
                            end
                        end
                    end
                else
                    
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Orb Quincy") or game.Players.LocalPlayer.Backpack:FindFirstChild("Orb Quincy") then
                        Equip("Orb Quincy")
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["NPC Spawn Boss"].Pr.CFrame
                        fireproximityprompt(game:GetService("Workspace")["NPC Spawn Boss"].Pr.ProximityPrompt)
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Background.Front.InvFrame:FindFirstChild("Orb Quincy") then
                        local args = {
                            [1] = "Change",
                            [2] = "Orb Quincy",
                            [3] = "Inv"
                        }
                        
                        game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
                        wait(2)
                    else
                        for i,v in pairs(Workspace:GetChildren()) do
                            if v.Name == "Quincy Man" then
                                if Workspace:FindFirstChild("Quincy Man") then
                                    if v.Humanoid.Health > 0 then
                                        if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") then
                                            if (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 350 then
                                                repeat task.wait()
                                                    StartMagnet = true
                                                    PosMon = v.HumanoidRootPart.CFrame
                                                    v.Head.CanCollide = false
                                                    v.HumanoidRootPart.CanCollide = false
                                                    Equip(getgenv().Settings.SelectWeapon)
                                                    -- game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,12.5,0)
                                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * getgenv().Settings.Modes
                                                    game:GetService'VirtualUser':CaptureController()
                                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                                until v.Humanoid.Health <= 0 or not getgenv().Settings.AutoAizen
                                            else
                                                -- game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,12.5,0)
                                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * getgenv().Settings.Modes
                                                wait(.1)
                                            end
                                        end
                                    end
                                else
                                    StartMagnet = false
                                end
                            end
                        end
                    end
                end
            end)
        else
            StartMagnet = false
        end
    end
end)

local AutoFarmSectionSettings = Main:addSection("Auto Farm Settings")

-- if not getgenv().Settings.Distance then
--     getgenv().Settings.Distance = 12.5
-- end

-- if not getgenv().Settings.Modes then
--     getgenv().Settings.Modes = CFrame.new(0,getgenv().Settings.Distance,0)
-- end

AutoFarmSectionSettings:addSlider("Distance Farm", getgenv().Settings.Distance, 0, 15, function(value)
    getgenv().Settings.Distance = value
    saveSettings()
end)

Postable = {
    ["Above"] = CFrame.new(0,getgenv().Settings.Distance,0) * CFrame.Angles(math.rad(-90),0,0),
    ["Behind"] = CFrame.new(0,0,getgenv().Settings.Distance),
    ["Under"] = CFrame.new(0,-(getgenv().Settings.Distance),0) * CFrame.Angles(math.rad(90),0,0),
}

task.spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().Settings.Selected_Modes == 'Above' then
                getgenv().Settings.Modes = CFrame.new(0,getgenv().Settings.Distance,0) * CFrame.Angles(math.rad(-90),0,0)
            elseif getgenv().Settings.Selected_Modes == 'Behind' then
                getgenv().Settings.Modes = CFrame.new(0,0,getgenv().Settings.Distance)
            elseif getgenv().Settings.Selected_Modes == 'Under' then
                getgenv().Settings.Modes = CFrame.new(0,-getgenv().Settings.Distance,0) * CFrame.Angles(math.rad(90),0,0)
            end
        end)
    end
end)

faketable = {}

for i,v in pairs(Postable) do
    table.insert(faketable, i)
end

local Modes = AutoFarmSectionSettings:addDropdown("Select Mode Farm", faketable, function(text)
    getgenv().Settings.Selected_Modes = text
    saveSettings()
end)

local InstantSectionSettings = Main:addSection("Instant Kill")

InstantSectionSettings:addToggle("Instant Kill (Work on some Weapon)", getgenv().Settings.InstantKill, function(value)
    getgenv().Settings.InstantKill = value
    saveSettings()
end)

local TranformSectionSettings = Main:addSection("Transform")


local Tradrop = TranformSectionSettings:addDropdown("Select Weapon To Transform", Wapon, function(text)
    getgenv().Settings.SelectWeaponTransform = text
    saveSettings()
end)

TranformSectionSettings:addButton("Refresh Weapon To Transform", function()
    Wapon = {};
    pcall(function()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do 
            if v:IsA("Tool")and not table.find(Wapon,v.Name)then 
                table.insert(Wapon,v.Name);
            end;
        end;
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren())do 
            if v:IsA("Tool")and not table.find(Wapon,v.Name)then 
                table.insert(Wapon,v.Name);
            end;
        end;
    end)

    TranformSectionSettings:updateDropdown(Tradrop, "Select Weapon To Transform", Wapon, function(text)
        getgenv().Settings.SelectWeaponTransform = text
     end)
end)

ButtonTable = {
    "X",
    "V",
}

local Buttondrop = TranformSectionSettings:addDropdown("Select Button", ButtonTable, function(text)
    getgenv().Settings.ButtonToTransformsform = text
    saveSettings()
end)


TranformSectionSettings:addToggle("Auto Transform", getgenv().Settings.AutoTransform, function(value)
    getgenv().Settings.AutoTransform = value
    if getgenv().Settings.AutoTransform then
        asr = game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
            if getgenv().Settings.AutoAizen then
                getgenv().Settings.AutoAizen = false
                AutoAizen = true
            end
            if getgenv().Settings.AutoFarmMonster then
                getgenv().Settings.AutoFarmMonster = false
                getgenv().Settings.AutoFarmMonster = true
            end
            
            repeat wait() 
                Equip(getgenv().Settings.SelectWeaponTransform)
                if PC then
                    game:service('VirtualInputManager'):SendKeyEvent(true, getgenv().Settings.ButtonToTransform, false, game)
                    wait(.1)
                    game:service('VirtualInputManager'):SendKeyEvent(false, getgenv().Settings.ButtonToTransform, false, game)
                elseif Mobile then
                    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
                        if v:IsA("ScreenGui") then
                            for ii,vv in pairs(v:GetChildren()) do
                                if vv:IsA("TextButton") then
                                    if vv.Text == "X" or vv.Text == "V" then
                                        if vv.Text == getgenv().Settings.ButtonToTransform then
                                            vv.ZIndex = 2
                                            v.IgnoreGuiInset = true
                                            vv.AnchorPoint = Vector2.new(0.5,0.5)
                                            vv.Size = UDim2.new(.25,0,.25,0)
                                            vv.Position = UDim2.new(0, 0, 0, 0)
                                            vv.BackgroundTransparency = 0.99
                                            
                                        else
                                            vv.ZIndex = 1
                                            v.IgnoreGuiInset = true
                                            vv.AnchorPoint = Vector2.new(0.5,0.5)
                                            vv.Size = UDim2.new(.25,0,.25,0)
                                            vv.Position = UDim2.new(0, 0, 0, 0)
                                            vv.BackgroundTransparency = 0.99
                                            
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                    game:GetService'VirtualInputManager':SendMouseButtonEvent(3, 3, 0, true, game, 0)
                    task.wait()
                    game:GetService'VirtualInputManager':SendMouseButtonEvent(3, 3, 0, false, game, 0)
                end
            until game:GetService("Players").LocalPlayer.Character:FindFirstChild("ModC") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("ModCut")
            wait(3)
            if getgenv().Settings.AutoFarmMonster then
                getgenv().Settings.AutoFarmMonster = true
                getgenv().Settings.AutoFarmMonster = false
            end
            
            if AutoAizen then
                getgenv().Settings.AutoAizen = true
                AutoAizen = false
            end
        end)
    else
        asr:Disconnect()
    end
    saveSettings()
end)

local SkillSection = Main:addSection("Auto Skill")


SkillSection:addToggle("Auto Skill", getgenv().Settings.AutoSkill, function(value)
    getgenv().Settings.AutoSkill = value
    saveSettings()
end)

SkillSection:addToggle("Z", getgenv().Settings.Auto_Z, function(value)
    getgenv().Settings.Auto_Z = value
    saveSettings()
end)

SkillSection:addToggle("X", getgenv().Settings.Auto_X, function(value)
    getgenv().Settings.Auto_X = value
    saveSettings()
end)

SkillSection:addToggle("C", getgenv().Settings.Auto_C, function(value)
    getgenv().Settings.Auto_C = value
    saveSettings()
end)


task.spawn(function()
    while task.wait(1) do
        if getgenv().Settings.AutoSkill then
            if getgenv().Settings.AutoAizen or getgenv().Settings.AutoFarmMonster then
                pcall(function()
                    if Mobile then
                        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
                            if v:IsA("ScreenGui") then
                                for ii,vv in pairs(v:GetChildren()) do
                                    if vv:IsA("TextButton") then
                                        if vv.Text == "Z" or vv.Text == "X" or vv.Text == "C" then
                                            v.IgnoreGuiInset = true
                                            vv.AnchorPoint = Vector2.new(0.5,0.5)
                                            vv.Position = UDim2.new(0, 0, 0, 0)
                                            vv.Size = UDim2.new(.25,0,.25,0)
                                            vv.BackgroundTransparency = 0.99
                                            
                                        end
                                    end
                                end
                            end
                        end

                        if getgenv().Settings.Auto_Z then
                            for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
                                if v:IsA("ScreenGui") then
                                    for ii,vv in pairs(v:GetChildren()) do
                                        if vv:IsA("TextButton") then
                                            if vv.Text == "Z" then
                                                vv.ZIndex = 2
                                            else
                                                vv.ZIndex = 1
                                            end
                                        end
                                    end
                                end
                            end
                            task.wait()
                            game:GetService'VirtualInputManager':SendMouseButtonEvent(3, 3, 0, true, game, 0)
                            task.wait()
                            game:GetService'VirtualInputManager':SendMouseButtonEvent(3, 3, 0, false, game, 0)
                        end
                        if getgenv().Settings.Auto_X then
                            for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
                                if v:IsA("ScreenGui") then
                                    for ii,vv in pairs(v:GetChildren()) do
                                        if vv:IsA("TextButton") then
                                            if vv.Text == "X" then
                                                vv.ZIndex = 2
                                            else
                                                vv.ZIndex = 1
                                            end
                                        end
                                    end
                                end
                            end
                            task.wait()
                            game:GetService'VirtualInputManager':SendMouseButtonEvent(3, 3, 0, true, game, 0)
                            task.wait()
                            game:GetService'VirtualInputManager':SendMouseButtonEvent(3, 3, 0, false, game, 0)
                        end
                        if getgenv().Settings.Auto_C then
                            for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
                                if v:IsA("ScreenGui") then
                                    for ii,vv in pairs(v:GetChildren()) do
                                        if vv:IsA("TextButton") then
                                            if vv.Text == "C" then
                                                vv.ZIndex = 2
                                            else
                                                vv.ZIndex = 1
                                            end
                                        end
                                    end
                                end
                            end
                            task.wait()
                            game:GetService'VirtualInputManager':SendMouseButtonEvent(3, 3, 0, true, game, 0)
                            task.wait()
                            game:GetService'VirtualInputManager':SendMouseButtonEvent(3, 3, 0, false, game, 0)
                        end


                    elseif PC then
                        --- PC---
                        if getgenv().Settings.Auto_Z then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
                            wait(.1)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
                        end
                        if getgenv().Settings.Auto_X then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
                            wait(.1)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
                        end
                        if getgenv().Settings.Auto_C then
                            game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
                            wait(.1)
                            game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
                        end
                    end
                end)
            end
        end
    end
end)


-- -- // Color Theme Customisation Page
-- local Theme = UI:addPage({
--     title = "Theme",
--     icon = 5012544693
-- })

-- -- // Section for the Color Theme Customisation Page
-- local Colors = Theme:addSection({
--     title = "Colors"
-- })

-- -- // Adding a color picker for each type of theme customisable
-- for theme, color in pairs(Themes) do
--     Colors:addColorPicker({
--         title = theme,
--         default = color,
--         callback = function(color3)
--             UI:setTheme({
--                 theme = theme, 
--                 color3 = color3
--             })
--         end
--     })
-- end

local StatsPage = UI:addPage("Stats", 7040410130)
local StatsSection = StatsPage:addSection("Stats")
Amount = 1
StatsSection:addTextbox("Amount", 1, function(value)
    Amount = value
end)

StatsSection:addToggle("All Stats Point", getgenv().Settings.AllPoint, function(value)
    getgenv().Settings.AllPoint = value
    saveSettings()
end)

StatsSection:addToggle("Melee", getgenv().Settings.UpStatsMelee, function(value)
    getgenv().Settings.UpStatsMelee = value
    saveSettings()
end)

StatsSection:addToggle("Health", getgenv().Settings.UpStatsHealth, function(value)
    getgenv().Settings.UpStatsHealth = value
    saveSettings()
end)

StatsSection:addToggle("Devil Fruit", getgenv().Settings.UpStatsDevilFruit, function(value)
    getgenv().Settings.UpStatsDevilFruit = value
    saveSettings()
end)

StatsSection:addToggle("Sword", getgenv().Settings.UpStatsSword, function(value)
    getgenv().Settings.UpStatsSword = value
    saveSettings()
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().Settings.UpStatsMelee then
                game:GetService("ReplicatedStorage").StatSystem.Points:FireServer("Melee", Amount)
            end
            if getgenv().Settings.UpStatsHealth then
                game:GetService("ReplicatedStorage").StatSystem.Points:FireServer("MaxHealth", Amount)
            end
            if getgenv().Settings.UpStatsDevilFruit then
                game:GetService("ReplicatedStorage").StatSystem.Points:FireServer("DevilFruit", Amount)
            end
            if getgenv().Settings.UpStatsSword then
                game:GetService("ReplicatedStorage").StatSystem.Points:FireServer("Sword", Amount)
            end
        end)
    end
end)


local PlayerPage = UI:addPage("Player", 7252023075)
local PlayerSection = PlayerPage:addSection("Player")

PlayerList = {};

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= game:GetService("Players").LocalPlayer.Name then
        table.insert(PlayerList, v.Name)
    end
end

local Plydrop = PlayerSection:addDropdown("Select Player", PlayerList, function(text)
    getgenv().Settings.SelectPlayer = text
    saveSettings()
 end)

 PlayerSection:addButton("Refresh Player", function()
    pcall(function()
        PlayerList = {};
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                table.insert(PlayerList, v.Name)
            end
        end
    end)
    PlayerSection:updateDropdown(Plydrop, "Select Player", PlayerList, function(text)
        getgenv().Settings.SelectPlayer = text
     end)
end)

PlayerSection:addToggle("Spectate Player", getgenv().Settings.Spectate_Player, function(value)
    getgenv().Settings.Spectate_Player = value
    if getgenv().Settings.Spectate_Player then
        pcall(function()
            if game.Players:FindFirstChild(getgenv().Settings.SelectPlayer) then
                game.Workspace.Camera.CameraSubject = game.Players:FindFirstChild(getgenv().Settings.SelectPlayer).Character.Humanoid
            end
        end)
    else
        game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
    end
    saveSettings()
end)

PlayerSection:addButton("Teleport", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(getgenv().Settings.SelectPlayer).Character.HumanoidRootPart.CFrame
end)


local ItemPage = UI:addPage("Item", 7044284832)
local ItemSection = ItemPage:addSection("Item")

ItemSection:addToggle("Auto Shadow Hoodle", getgenv().Settings.ShadowHoodle, function(value)
    getgenv().Settings.ShadowHoodle = value
    saveSettings()
end)

ItemSection:addToggle("Auto Shadow Diary", getgenv().Settings.ShadowDiary, function(value)
    getgenv().Settings.ShadowDiary = value
    saveSettings()
end)

local AizenSection = ItemPage:addSection("Auto Aizen")

AizenSection:addToggle("Auto Final Orb", getgenv().Settings.AutoAizen, function(value)
    getgenv().Settings.AutoAizen = value
    saveSettings()
end)

local EventSection = ItemPage:addSection("Event")

EventSection:addToggle("Auto Slot Machine", getgenv().Settings.AutoCoins, function(value)
    getgenv().Settings.AutoCoins = value
    saveSettings()
end)

EventSection:addToggle("Auto Random Slot Machine", getgenv().Settings.RandomSlot, function(value)
    getgenv().Settings.RandomSlot = value
    saveSettings()
end)

local TeleportPage = UI:addPage("Teleport", 7044226690)
local OtherSection = TeleportPage:addSection("Other")

if game.PlaceId == 11448431235 then
    OtherSection:addButton("Teleport To Second Sea", function()
        game:GetService("TeleportService"):Teleport(12241341621, game:GetService("Players").LocalPlayer)
    end)
elseif game.PlaceId == 12241341621 then
    OtherSection:addButton("Teleport To First Sea", function()
        game:GetService("TeleportService"):Teleport(11448431235, game:GetService("Players").LocalPlayer)
    end)
elseif game.PlaceId == 16723079713 then
    OtherSection:addButton("Teleport To First Sea", function()
        game:GetService("TeleportService"):Teleport(11448431235, game:GetService("Players").LocalPlayer)
    end)

    OtherSection:addButton("Teleport To Second Sea", function()
        game:GetService("TeleportService"):Teleport(12241341621, game:GetService("Players").LocalPlayer)
    end)
end


OtherSection:addButton("Teleport To Dungeon", function()
    game:GetService("TeleportService"):Teleport(16723079713, game:GetService("Players").LocalPlayer)
end)

local IslandSection = TeleportPage:addSection("Island")

if game.PlaceId == 11448431235 then
    IslandTable = {
        ['StarterIsland'] = CFrame.new(102.104843, 16.6120796, 347.402771, 0.929693937, 0, 0.368332982, 0, 1, 0, -0.368332982, 0, 0.929693937),
        ['Event Island'] = CFrame.new(-652.853455, 16.5126858, 2641.61963, -0.648031175, -9.03664983e-08, 0.761613786, -6.57494752e-08, 1, 6.27073575e-08, -0.761613786, -9.43938616e-09, -0.648031175),
        ['Event Island Rerun'] = CFrame.new(-1907.97803, 14.7477264, 1926.95081, -0.619164586, 1.79959727e-08, 0.785261214, 5.28907407e-08, 1, 1.8786233e-08, -0.785261214, 5.31648183e-08, -0.619164586),
        ['Aizen Boss Island'] = CFrame.new(1210.80115, 15.6713848, 2433.30713, 0.0453686677, 2.38819275e-08, -0.99897033, 5.73687409e-08, 1, 2.65119695e-08, 0.99897033, -5.85124837e-08, 0.0453686677),
    }
elseif game.PlaceId == 12241341621 then
    IslandTable = {
        ['Starter Island'] = CFrame.new(16.716383, 10.8287821, -12.609355, -0.997643054, 0, -0.0686172917, 0, 1.00000012, -0, 0.0686172843, -0, -0.997643173),
        ['Shop 2'] = CFrame.new(-769.019714, 12.3448877, -2580.6687, 0.982638717, 0, -0.185529768, -0, 1.00000012, -0, 0.185529768, 0, 0.982638717),
        ['Tournament Of Power'] = CFrame.new(261.188843, 70866.9531, 415.16333, -0.641266465, 0, 0.767318368, 0, 1.00000012, -0, -0.767318368, 0, -0.641266465),
    }
end
wait()
pcall(function()
    for i,v in pairs(IslandTable) do
        IslandSection:addButton(i, function()
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v
        end)
    end
end)


local ShopPage = UI:addPage("Shop", 7294901968)
local ShopSection = ShopPage:addSection("Shop")

ShopSection:addButton("Reset Stats", function()
    fireclickdetector(game:GetService("Workspace")["Reset Stats"].Part.ClickDetector)
end)

ShopSection:addToggle("Open Shop Menu", getgenv().Settings.Openshop, function(value)
    getgenv().Settings.Openshop = value
    game:GetService("Players").LocalPlayer.PlayerGui.Shop.Enabled = not game:GetService("Players").LocalPlayer.PlayerGui.Shop.Enabled
    saveSettings()
end)

if game.PlaceId == 12241341621 then
    ShopSection:addToggle("Open Shop 2 Menu", getgenv().Settings.Openshop2, function(value)
        getgenv().Settings.Openshop2 = value
        game:GetService("Players").LocalPlayer.PlayerGui.Shop2.Enabled = not game:GetService("Players").LocalPlayer.PlayerGui.Shop2.Enabled
        saveSettings()
    end)
end



local EventSection = ShopPage:addSection("Event")



if game.PlaceId == 11448431235 then
    EventItemTable = {
        ["Cid V2"] = game:GetService("Workspace")["NPC Cid.V2"],
        ["Cid V1"] = game:GetService("Workspace")["NPC Cid.V1"],
        ["Berserker"] = game:GetService("Workspace")["NPC Berserker"],
        ["Luffy Nika"] = game:GetService("Workspace")["NPC Nika"],
        ["Sanji"] = game:GetService("Workspace")["Sanji NPC"],
        ["Toilet"] = game:GetService("Workspace")["Toilet NPC"],
        ["Sung JinWoo"] = game:GetService("Workspace")["Sung JinWoo"],
        ["Ichigo"] = game:GetService("Workspace")["NPC IchigoV2"],
        ["Gon"] = game:GetService("Workspace")["NPC GonV2"],
        ["Rimuru"] = game:GetService("Workspace")["NPC RimuruV2"],
        ["Saitama"] = game:GetService("Workspace").SaitamaV2,
        ["Toji"] = game:GetService("Workspace")["Toji Fushiguro"],
        ["Zoro"] = game:GetService("Workspace").ZoroV2,
        ["Killua"] = game:GetService("Workspace").Killua,
        ["Mihawk Rainbow"] = game:GetService("Workspace")["Mihawk Rainbow"],
        ["Sukuna"] = game:GetService("Workspace")["NPC Sukuna"],
        ["Jiren"] = game:GetService("Workspace")["NPC Jiren"],
        ["Gojo"] = game:GetService("Workspace")["Gojo.V2"],
        ["Asta"] = game:GetService("Workspace")["Asta(fusion)"],
        ["SONGKRAN"] = game:GetService("Workspace").SONGKRAN,
        ["Big Mom"] = game:GetService("Workspace")["Big mom NPC"],
        ["Gay"] = game:GetService("Workspace")["NPC Animan"],
        ["Hakari"] = game:GetService("Workspace")["NPC Hakari"],
    }

    for i,v in pairs(EventItemTable) do
        EventSection:addButton(i, function()
            for ii,vv in pairs(v:GetDescendants()) do
                if vv:IsA("ClickDetector") then
                    fireclickdetector(vv)
                end
            end
        end)
    end
elseif game.PlaceId == 12241341621 then
    EventItemTable = {
        ["SCP096"] = game:GetService("Workspace")["NPC SCP096"],
        ["Handsome Face"] = game:GetService("Workspace")["NPC Hutcherson"],
        ["DeathScythe"] = game:GetService("Workspace")["NPC Halloween"],
    }

    for i,v in pairs(EventItemTable) do
        EventSection:addButton(i, function()
            for ii,vv in pairs(v:GetDescendants()) do
                if vv:IsA("ClickDetector") then
                    fireclickdetector(vv)
                end
            end
        end)
    end
end


-- xpcall(function()
-- for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Shop.Frame.ScrollingFrame:GetChildren()) do
--     ShopSection:addButton(v.TextLabel.Text, function()
--         for i, v in pairs(getconnections(v.TextButton.MouseButton1Up)) do                                                                                                
--             v.Fire()
--         end
--     end)
-- end
-- end,warn)

local MiscPage = UI:addPage("Misc", 7044233235)
local OtherMiscSection = MiscPage:addSection("Other")

-- if not getgenv().Settings.FlySpeed then
--     getgenv().Settings.FlySpeed = 500
-- end

OtherMiscSection:addToggle("Fly", getgenv().Settings.Fly, function(value)
    getgenv().Settings.Fly = value
    task.spawn(function()
        if getgenv().Settings.Fly then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
            local Head = game.Players.LocalPlayer.Character:WaitForChild("Head")
            Head.Anchored = true
            CFloop = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
                local moveDirection = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').MoveDirection * (getgenv().Settings.FlySpeed * deltaTime)
                local headCFrame = Head.CFrame
                local cameraCFrame = workspace.CurrentCamera.CFrame
                local cameraOffset = headCFrame:ToObjectSpace(cameraCFrame).Position
                cameraCFrame = cameraCFrame * CFrame.new(-cameraOffset.X, -cameraOffset.Y, -cameraOffset.Z + 1)
                local cameraPosition = cameraCFrame.Position
                local headPosition = headCFrame.Position
    
                local objectSpaceVelocity = CFrame.new(cameraPosition, Vector3.new(headPosition.X, cameraPosition.Y, headPosition.Z)):VectorToObjectSpace(moveDirection)
                Head.CFrame = CFrame.new(headPosition) * (cameraCFrame - cameraPosition) * CFrame.new(objectSpaceVelocity)
            end)
        else
            if CFloop then
                CFloop:Disconnect()
                game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
                local Head = game.Players.LocalPlayer.Character:WaitForChild("Head")
                Head.Anchored = false
            end
        end
    end)
    saveSettings()
end)


OtherMiscSection:addSlider("Fly Speed", getgenv().Settings.FlySpeed, 0, 1000, function(value)
    getgenv().Settings.FlySpeed = value
    saveSettings()
end)

local UIS = game:GetService("UserInputService")

function GetCharacter()
   return game.Players.LocalPlayer.Character
end

function Teleport(pos)
   local Char = GetCharacter()
   if Char then
       Char:MoveTo(pos)
   end
end

OtherMiscSection:addToggle("Ctrl + Click To Teleport", getgenv().Settings.ClickToTp, function(value)
    getgenv().Settings.ClickToTp = value
    if getgenv().Settings.ClickToTp then
        Click = UIS.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
                local Player = game.Players.LocalPlayer
                local Mouse = Player:GetMouse()
                Teleport(Mouse.Hit.p)
            end
         end)
    else
        Click:Disconnect()
    end 
    saveSettings()
end)

local DungeonPage = UI:addPage("Dungeon", 7251993295)
local DungeonSection = DungeonPage:addSection("Dungeon")

-- if game.PlaceId == 16723079713 then
--     DungeonSection:addButton("Easter Egg", function()
--         xpcall(function()
--             local part = game:GetService("Workspace")["epic farm"];
--             local TeleportService = game:GetService("TeleportService")
--             local plr = game.Players.LocalPlayer;
--                 for i,v in pairs(part:GetChildren()) do 
--                     for ii,vv in pairs(v:GetChildren()) do
--                         for i=1,10 do wait()
--                         plr.Character.HumanoidRootPart.CFrame = v.CFrame;
--                             fireclickdetector(vv)
--                     end
--                     -- TeleportService:Teleport(11448431235)
--                 end
--             end
--             end, function(err)
--             if (err) then
--                 print(err)
--             end
--             return "hee"
--         end)
--     end)    
-- end

DungeonSection:addToggle("Auto Dungeon", getgenv().Settings.Dungeon, function(value)
    getgenv().Settings.Dungeon = value
    saveSettings()
end)



local MiscSection = MiscPage:addSection("Misc")

MiscSection:addButton("Redeem All Code", function()
    pcall(function()
        for i,v in pairs(game:GetService("Players").LocalPlayer.Code:GetChildren()) do
            game:GetService("ReplicatedStorage").Code:FireServer(v.Name)
        end
    end)
end)

MiscSection:addToggle("Steal Drop Item", getgenv().Settings.Steal_Drop_Item, function(value)
    getgenv().Settings.Steal_Drop_Item = value
    saveSettings()
end)

MiscSection:addToggle("Auto Store Item", getgenv().Settings.Store_Item, function(value)
    getgenv().Settings.Store_Item = value
    saveSettings()
end)

function CheckMineral()
    -- if game.Players.LocalPlayer.Character:FindFirstChild("Rock") or game.Players.LocalPlayer.Backpack:FindFirstChild("Rock") then
    --     if game.Players.LocalPlayer.Character:FindFirstChild("Rock") then
    --         Equip("Rock")
    --     elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Rock") then
    --         UnEquip()
    --     end
    --     return true
    -- elseif game.Players.LocalPlayer.Character:FindFirstChild("Gold") or game.Players.LocalPlayer.Backpack:FindFirstChild("Gold") then
    --     if game.Players.LocalPlayer.Character:FindFirstChild("Gold") then
    --         Equip("Gold")
    --     elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Gold") then
    --         UnEquip()
    --     end
    --     return true
    -- elseif game.Players.LocalPlayer.Character:FindFirstChild("Diamond") or game.Players.LocalPlayer.Backpack:FindFirstChild("Diamond") then
    --     if game.Players.LocalPlayer.Character:FindFirstChild("Diamond") then
    --         Equip("Diamond")
    --     elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Diamond") then
    --         UnEquip()
    --     end
    --     return true
    if game.Players.LocalPlayer.Character:FindFirstChild("Rock") or game.Players.LocalPlayer.Backpack:FindFirstChild("Rock") or game.Players.LocalPlayer.Character:FindFirstChild("Gold") or game.Players.LocalPlayer.Backpack:FindFirstChild("Gold") or game.Players.LocalPlayer.Character:FindFirstChild("Diamond") or game.Players.LocalPlayer.Backpack:FindFirstChild("Diamond") then
        return true
    else
        return false
    end
end

task.spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().Settings.Dungeon then
                if game.PlaceId == 11448431235 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Village Defense"].Pad.CFrame
                elseif game.PlaceId == 16723079713 then
                    for i,v in pairs(Workspace.MOB:GetChildren()) do
                        if v:FindFirstChild("Humanoid") then
                            v.Humanoid.Health = 0
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                            task.wait()
                        end
                    end 
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().Settings.Steal_Drop_Item then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v:IsA("Tool") then
                        if v:FindFirstChild("Handle") then
                            v.Handle.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        else
                            for x,y in pairs(v) do
                                if y:IsA("Part") or y:IsA("MeshPart") then
                                    v.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                end
                             end
                        end
                    end
                end
            end
            if getgenv().Settings.ShadowDiary then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v:IsA("Tool") then
                        if v.Name == "Shadow Diary" then
                            if v:FindFirstChild("Handle") then
                                v.Handle.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                            else
                                for x,y in pairs(v) do
                                    if y:IsA("Part") or y:IsA("MeshPart") then
                                        v.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if getgenv().Settings.Store_Item then
                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        game:GetService("ReplicatedStorage").Inventory:FireServer("Change", v.Name,"Backpack")
                    end
                end            
            end
            if getgenv().Settings.ShadowHoodle then
                fireclickdetector(game:GetService("Workspace")["NPC Cid"].Click.ClickDetector)
            end
            if getgenv().Settings.Fish then
                if game.Players.LocalPlayer.Character:FindFirstChild("FishingRod") or game.Players.LocalPlayer.Backpack:FindFirstChild("FishingRod") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(37.7493095, 16.5833855, 349.080414, -0.80927074, 2.46518237e-08, 0.587435842, 4.86743552e-08, 1, 2.50902445e-08, -0.587435842, 4.88978635e-08, -0.80927074)
                    wait(.1)

                    Equip("FishingRod")
                    wait(.1)

                    repeat wait()
                    game:GetService'VirtualUser':CaptureController()
                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                    wait(.1)
                    until game.Players.LocalPlayer.Character:FindFirstChild("FishingRod").Handle.Bait.RopeConstraint.Length ~= 9

                    wait(.1)
                    repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("FishingRod").Handle.Bait.RopeConstraint.Length == 9
                    wait(.1)

                    for i=1,100 do wait()
                        game:GetService("ReplicatedStorage").Inventory:FireServer("Change", "Fish", "Backpack")
                    end
                else
                    for i,v in pairs(game.workspace:GetChildren()) do
                        if v.Name =="NPC Haloween" then
                            for x,y in pairs(v:GetChildren()) do
                                for ii,vv in pairs(y:GetChildren()) do
                                    if vv.Name == "ClickDetector" then
                                        fireclickdetector(vv)
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if getgenv().Settings.AllPoint then
                Amount = game:GetService("Players").LocalPlayer.Data.Points.Value
            end
            if getgenv().Settings.InstantKill then
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and not CheckPlayer(v.Name) then
                        if v.Humanoid.Health < v.Humanoid.MaxHealth then
                            v.Humanoid.Health = 0
                            v.Head:Destroy()
                        end
                    end
                end
            end
            if getgenv().Settings.AutoCoins then
                if CheckMineral() then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")[" island cave"].ShopSell.Pad.Give.CFrame
                elseif game:GetService("Players").LocalPlayer.Data.Coin.Value >= 50 and getgenv().Settings.RandomSlot then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16.0182095, 16.9699192, 258.152954, -0.0148853743, 3.4624307e-08, 0.999889195, -3.71338125e-08, 1, -3.51809568e-08, -0.999889195, -3.76533826e-08, -0.0148853743)
                    wait()
                    fireproximityprompt(game:GetService("Workspace")["Slot Machine"].Slot.Click.ProximityPrompt)
                else
                    if game.Players.LocalPlayer.Character:FindFirstChild("Pickaxe") or game.Players.LocalPlayer.Backpack:FindFirstChild("Pickaxe") then
                        Equip("Pickaxe")
                        for i,v in pairs(game:GetService("Workspace")[" island cave"]:GetChildren()) do
                            if v.Name == "Rock" then
                                repeat wait()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                                    fireproximityprompt(v.ProximityPrompt)
                                until game.Players.LocalPlayer.Character:FindFirstChild("Freeze") or not getgenv().Settings.AutoCoins
                                break
                            end
                        end
                        wait()
                        repeat wait() until not game.Players.LocalPlayer.Character:FindFirstChild("Freeze") or not getgenv().Settings.AutoCoins
                    else
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1189.80469, 11.0363646, 431.367554, 0.992841482, -2.35280551e-09, 0.11943958, 1.78525905e-09, 1, 4.85874363e-09, -0.11943958, -4.61073135e-09, 0.992841482)
                        wait()
                        fireproximityprompt(game:GetService("Workspace")[" island cave"]["NPC Miner"].Torso.ProximityPrompt)
                    end
                end
            end
        end)
    end
end)



local theme = UI:addPage("Settings", 7040347038)
local colors = theme:addSection("Colors")

colors:addButton("Reset Save Settings", function()
    if isfile(foldername.."\\"..filename) then
        delfile(foldername.."\\"..filename, json)
    end
end)

for theme, color in pairs(Themes) do -- all in one theme changer, i know, im cool
    colors:addColorPicker(theme, color, function(color3)
        UI:setTheme(theme, color3)
    end)
end

colors:addKeybind("Toggle Keybind", Enum.KeyCode.LeftAlt, function()
    print("Activated Keybind")
    UI:toggle()
    end, function()
    print("Changed Keybind")
end)






-- // Load
UI:SelectPage(UI.pages[1], true) -- no default for more freedom




-- - Auto Buy Shadow hoodie
-- - Auto Claim Daily reward




-- xpcall(function()
-- local a,b = game.ReplicatedStorage.CheckTime:InvokeServer()
-- if a == nil then
--     game:GetService("Players").LocalPlayer.PlayerGui.DAILYREWARD.DailyFrame.Visible = true
--     wait()
--     game:GetService("Players").LocalPlayer.PlayerGui.DAILYREWARD.DailyFrame.Button.Size = UDim2.new(0,100000,0,100000)                                                                                
--     game:GetService("Players").LocalPlayer.PlayerGui.DAILYREWARD.DailyFrame.Button.Position = UDim2.new(-10, 0, -10, 0)
--     game:GetService("Players").LocalPlayer.PlayerGui.DAILYREWARD.DailyFrame.Button.Transparency = 1
--     wait()
--     game:GetService'VirtualUser':CaptureController()
--     game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))

--     game:GetService("Players").LocalPlayer.PlayerGui.DAILYREWARD.DailyFrame.Visible = false
-- end
--     game:GetService("Players").LocalPlayer.PlayerGui.DAILYREWARD.DailyFrame.Visible = true
--     game:GetService("Players").LocalPlayer.PlayerGui.DAILYREWARD.DailyFrame.Button.Size = UDim2.new(0,100000,0,100000)                                                                                
--     game:GetService("Players").LocalPlayer.PlayerGui.DAILYREWARD.DailyFrame.Button.Position = UDim2.new(-10, 0, -10, 0)
--     game:GetService("Players").LocalPlayer.PlayerGui.DAILYREWARD.DailyFrame.Button.Transparency = 1
--     game:GetService'VirtualUser':CaptureController()
--     game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
     
-- end,warn)

-- local mouse = game.Players.LocalPlayer:GetMouse()

-- local a = mouse.Button1Down:Connect(function()
--     warn(mouse.X, mouse.Y)
-- end)
-- wait()

-- for i=1,5 do wait()
--     game:GetService'VirtualInputManager':SendMouseButtonEvent(3, 3, 0, true, game, 0)
--     task.wait()
--     game:GetService'VirtualInputManager':SendMouseButtonEvent(3, 3, 0, false, game, 0)
-- end


-- local mousePosition = UserInputService:GetMouseLocation()
--     textButton.Position = UDim2.new(0, mousePosition.X, 0, mousePosition.Y)

-- while wait() do
-- for i,v in pairs(workspace:GetChildren()) do
--     if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid > 0 then
--         if v.Humanoid.Health < v.Humanoid.MaxHealth then
--             v.Humanoid.Health = 0
--         end
--     end
-- end
-- end

-- for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
--     if v:IsA("ScreenGui") then
--         for ii,vv in pairs(v:GetChildren()) do
--             if vv:IsA("TextButton") then
--                 if vv.Text == "Z" or vv.Text == "X" or vv.Text == "C" then
--                     v.IgnoreGuiInset = true
--                     vv.AnchorPoint = Vector2.new(0.5,0.5)
--                     vv.Position = UDim2.new(0, 0, 0, 0)
--                     vv.Size = UDim2.new(.25,0,.25,0)
--                     vv.BackgroundTransparency = 0
--                 end
--             end
--         end
--     end
-- end
elseif (sss == 'add hwid success') then
    game.Players.LocalPlayer:Kick("Add hwid success wait for rejoin...");
    wait(3)
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
elseif (sss == 'Add hwid unsuccess') then
    game.Players.LocalPlayer:Kick("Add hwid unsuccess");
    wait(1)
    while true do end;
elseif (sss == 'Invalid Hwid') then
    game.Players.LocalPlayer:Kick("Invalid hwid");
    wait(1)
    while true do end;
elseif (sss == 'Invalid Key') then
    game.Players.LocalPlayer:Kick("Invalid key");
    wait(1)
    while true do end;
elseif (sss == 'unknown error') then
    while true do end;
elseif (sss == "Blacklisted") then
    while true do end
end
