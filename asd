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
    print(1)
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
