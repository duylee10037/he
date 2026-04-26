local Players     = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local Player      = Players.LocalPlayer

local API_URL = "https://web-wheat-nu-97.vercel.app/api/verify"
local CLIENT_VERSION = "1.0.0"

-- ===== GET KEY (GIỮ NGUYÊN) =====
local Key = tostring(getgenv().Key or ""):gsub("%s+", "")
if Key == "" then
    warn("Thiếu key!")
    return
end

-- ===== DEVICE ID =====
local deviceId = "unknown-device"
pcall(function()
    deviceId = game:GetService("RbxAnalyticsService"):GetClientId()
end)

-- ===== BODY =====
local body = HttpService:JSONEncode({
    key = Key,
    deviceId = deviceId,
    clientVersion = CLIENT_VERSION
})

-- ===== REQUEST (CHUẨN EXECUTOR) =====
local httpRequest = (syn and syn.request) or (http and http.request) or http_request or request

if not httpRequest then
    warn("Executor không hỗ trợ request!")
    return
end

local success, response = pcall(function()
    return httpRequest({
        Url = API_URL,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = body
    })
end)

-- ===== CHECK RESPONSE =====
if not success or not response or not response.Body then
    warn("Không kết nối được API!")
    return
end

-- ===== DECODE =====
local data
local ok = pcall(function()
    data = HttpService:JSONDecode(response.Body)
end)

if not ok or not data then
    warn("Lỗi dữ liệu từ server!")
    return
end

-- ===== CHECK KEY =====
if not data.valid then
    warn("Key không hợp lệ hoặc hết hạn! | Code:", data.code)
    return
end

print("Key hợp lệ | Code:", data.code)

-- ===== LOAD SCRIPT =====
local scriptName = tostring(getgenv().NScript or "MaruHub")

if scriptName == "MaruHub" then
    getgenv().NScript = "MaruHub"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Wraith1vs11/Rejoin/refs/heads/main/UGPhone's%20Scripts"))()
else
    Player:Kick("Script không hợp lệ!")
end
