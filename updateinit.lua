local Players      = game:GetService("Players")
local HttpService  = game:GetService("HttpService")
local Player       = Players.LocalPlayer

local API_URL        = "https://web-wheat-nu-97.vercel.app/api/verify"
local CLIENT_VERSION = "1.0.0"

local Key = tostring(getgenv().Key or ""):gsub("%s+", "")

if Key == "" then
    warn("❌ Thiếu key!")
    return
end

-- Lấy deviceId
local deviceId = "unknown-device"
pcall(function()
    deviceId = game:GetService("RbxAnalyticsService"):GetClientId()
end)

-- Tạo body JSON
local body = HttpService:JSONEncode({
    key           = Key,
    deviceId      = deviceId,
    clientVersion = CLIENT_VERSION
})

-- Gửi POST request
local success, response = pcall(function()
    return request({
        Url     = API_URL,
        Method  = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = body
    })
end)

-- fallback nếu không có request
if not success or not response then
    success, response = pcall(function()
        return game:HttpPost(
            API_URL,
            body,
            Enum.HttpContentType.ApplicationJson
        )
    end)

    if success then
        response = { Body = response }
    end
end

-- Check response
if not success or not response or not response.Body then
    warn("⚠️ Không kết nối được API!")
    return
end

-- Decode JSON
local data
local ok = pcall(function()
    data = HttpService:JSONDecode(response.Body)
end)

if not ok or not data then
    warn("⚠️ Lỗi decode dữ liệu từ server!")
    return
end

-- Check key
if not data.valid then
    warn("❌ Key không hợp lệ hoặc hết hạn! | Code:", data.code)
    return
end

print("✅ Key hợp lệ | Code:", data.code)

-- Load script
local scriptName = tostring(getgenv().NScript or "MaruHub")

if scriptName == "MaruHub" then
    getgenv().NScript = "MaruHub"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Wraith1vs11/Rejoin/refs/heads/main/UGPhone's%20Scripts"))()
else
    Player:Kick("Script không hợp lệ!")
end
