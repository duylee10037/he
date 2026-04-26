local Players     = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local Player      = Players.LocalPlayer

local API_URL = "https://web-wheat-nu-97.vercel.app/api/verify"
local CLIENT_VERSION = "1.0.0"

local Key = tostring(getgenv().Key or ""):gsub("%s+", "")
if Key == "" then
    return Player:Kick("Thiếu key!")
end

-- Lấy deviceId
local deviceId = "unknown-device"
pcall(function()
    deviceId = game:GetService("RbxAnalyticsService"):GetClientId()
end)

-- Tạo body JSON đúng chuẩn API
local body = HttpService:JSONEncode({
    key = Key,
    deviceId = deviceId,
    clientVersion = CLIENT_VERSION
})

-- Gửi POST request (đúng chuẩn API của bạn)
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

-- fallback nếu executor không có request
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
    return ("Không kết nối được API!")
end

local data
pcall(function()
    data = HttpService:JSONDecode(response.Body)
end)

if not data or not data.valid then
    return Player:Kick("Key không hợp lệ hoặc hết hạn! | Code: " .. tostring(data and data.code))
end

print("✅ Key hợp lệ | Code:", data.code)

-- ===== TỪ ĐÂY GIỮ NGUYÊN CODE CỦA BẠN =====
