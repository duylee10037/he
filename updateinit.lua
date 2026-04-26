local Players     = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local Player      = Players.LocalPlayer

local API_URL = "https://web-wheat-nu-97.vercel.app/api/verify"
local CLIENT_VERSION = "1.0.0"

local Key = tostring(getgenv().Key or ""):gsub("%s+", "")
if Key == "" then
    warn("Thiếu key!")
    return
end


local deviceId = "unknown-device"
pcall(function()
    deviceId = game:GetService("RbxAnalyticsService"):GetClientId()
end)


local body = HttpService:JSONEncode({
    key = Key,
    deviceId = deviceId,
    clientVersion = CLIENT_VERSION
})

-- Gửi POST request
local success, response = pcall(function()
    return request({
        Url = API_URL,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = body
    })
end)


if not success or not response then
    success, response = pcall(function()
        return game:HttpPost(API_URL, body, Enum.HttpContentType.ApplicationJson)
    end)

    if success then
        response = {
            Body = response
        }
    end
end

if not success or not response or not response.Body then
    warn(" Không kết nối được API!")
    return
end

local data
pcall(function()
    data = HttpService:JSONDecode(response.Body)
end)

if not data or not data.valid then
    warn("Key không hợp lệ hoặc hết hạn! | Code:", data and data.code)
    return
end

print("Key hợp lệ | Code:", data.code)

local scriptName = tostring(getgenv().NScript or "MaruHub")

if scriptName == "MaruHub" then
    getgenv().NScript = "MaruHub"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Wraith1vs11/Rejoin/refs/heads/main/UGPhone's%20Scripts"))()
else
    Player:Kick("Script không hợp lệ!")
end
