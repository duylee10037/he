local Players     = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local Player      = Players.LocalPlayer

local API_URL = "https://web-wheat-nu-97.vercel.app/api/verify" -- link mày

local Key = tostring(getgenv().Key or ""):gsub("%s+", "")



local success, response = pcall(function()
    return HttpService:GetAsync(API_URL .. HttpService:UrlEncode(Key))
end)
if not success then
    success, response = pcall(function() return game:HttpGet(API_URL .. HttpService:UrlEncode(Key)) end)
end
if not success then return Player:Kick("Lỗi mạng") end

local data = HttpService:JSONDecode(response)
if data.valid then
    local scriptName = tostring(getgenv().NScript or "MaruHub")  -- Thêm phần chọn script ở đây

    if scriptName == "MaruHub" then
        getgenv().NScript = "MaruHub"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Wraith1vs11/Rejoin/refs/heads/main/UGPhone's%20Scripts"))()
    
    elseif scriptName == "KaitunMaruDefault" then
        getgenv().NScript = "MaruHub"
        getgenv().Script_Mode = "Kaitun_Script"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Wraith1vs11/Rejoin/refs/heads/main/UGPhone's%20Scripts"))()
    
    elseif scriptName == "MaruKaitunFisch" then
        getgenv().NScript = "MaruHub"
        local Second_Sea = game.PlaceId == 72907489978215
        local Second_Sea_Loc = CFrame.new(1532.36096, 83.9225464, 2335.48999, -0.407974303, 3.71246642e-08, 0.912993431,
            5.38818279e-09, 1, -3.825485e-08, -0.912993431, -1.06876197e-08, -0.407974303)
        local First_Sea_Loc = CFrame.new(-13887.3965, -11048.6885, 350.285706, 0.948456287, 1.08180259e-07, 0.316907942,
            -1.06977055e-07, 1, -2.11960565e-08, -0.316907942, -1.37983438e-08, 0.948456287)
    
        _G.Settings = _G.Settings or {
            ["DefaultPosition"] = (Second_Sea and Second_Sea_Loc) or First_Sea_Loc,
            ["AfkCheckTime"] = 30, -- Seconds
            ["AfkFix"] = "Reset", -- Rejoin, Reset
            ["EquipRod"] = "Auto", -- Trident Rod, Destiny Rod,... Rod
            ["InstantFishing"] = true,
            ["Return to Sea1"] = {
                ["Obtained All Rods"] = true
            },
            ["SellFish"] = {
                ["SellDelay"] = 120, -- Seconds
                ["Enable"] = true,
                ["Method"] = {
                    ["Event"] = true,
                    ["Enchant"] = false,
                    ["Mythical"] = true,
                    ["Legendary"] = true,
                    ["Exotic"] = true -- recommend to enable it
                }
            },
            ['Rod'] = {
                -- Necessary Rods: Rods that are required or essential for the gameplay
                Necessary_Rods = {"Steady Rod", -- First Sea Rod
                "Reinforced Rod", "Depthseeker Rod", "Kraken Rod", "Zeus Rod", "Ethereal Prism Rod", "Free Spirit Rod"},
    
                -- Custom Rods: Special rods that can be customized after obtained all necessary rods.
                Custom_Rods = {"Aurora Rod", "Tempest Rod", "Abyssal Specter Rod", "Destiny Rod", "Challenger's Rod",
                               "Rod Of The Zenith", "Challenger's Rod", "Nocturnal Rod", "Kings Rod", "Trident Rod",
                               "Poseidon Rod", "Champions Rod", "Volcanic Rod", "Summit Rod", "Training Rod", "Plastic Rod",
                               "Carbon Rod", "Long Rod", "Lucky Rod", "Fortune Rod", "Rapid Rod", "Magnet Rod",
                               "Mythical Rod", "Midas Rod", "Scurvy Rod", "Stone Rod", "Phoenix Rod", "Arctic Rod",
                               "Crystalized Rod", "Ice Warpers Rod", "Avalanche Rod", "Stone Rod", "Wildflower Rod",
                               "Firefly Rod", "Frog Rod", "Azure Of Lagoon", "Free Spirit Rod", -- need bestinary 70%
                "Verdant Shear Rod", "Great Dreamer Rod"},
    
                -- Puzzle Rods: Rods that will be available in the future (currently unavailable)
                Puzzle_Rods = {
                    -- ["Heaven's Rod"] = 400, -- ( name, required level )
                }
            },
            ["Enchant"] = {
                ["Enabled"] = true, -- Enable or disable the enchantment system
                ["Rod"] = { -- Specific enchantments for each rod
                    ["Depthseeker Rod"] = {
                        LevelFarm = {"Clever"}
                    },
                    ["Zeus Rod"] = {
                        LevelFarm = {"Clever"}
                    },
                    ["Kraken Rod"] = {
                        LevelFarm = {"Clever"}
                    },
                    ["Ethereal Prism Rod"] = {
                        LevelFarm = {"Hasty"},
                        CashFarm = {"Abyssal"}
                    },
                    ["Free Spirit Rod"] = {
                        LevelFarm = {"Clever"}
                    }
                }
            },
            ["Totems"] = {
                ["Enabled"] = true, -- Enable or disable the totem system
                ["ActivationLevel"] = 300, -- Level required to activate totems
    
                ["DayTotem"] = "Sundial Totem", -- Totem used during the day
                ["NightTotem"] = "Aurora Totem", -- Totem used during the night
    
                ["AutoPurchase"] = true, -- Enable automatic totem purchasing
                ["PurchaseLimit"] = { -- Maximum allowed purchases per type
                    ["DayTotem"] = 1,
                    ["NightTotem"] = 1
                }
            },
            ['EnabledFishingZones'] = true,
            ["CastZone"] = {
                ['OnLevel'] = 300,
                ['Ignored_Aurora'] = true, -- skip farming level when aurora is active
                ['Zones'] = {"Forsaken Veil - Scylla", "Lovestorm Eel", "Orcas Pool", "The Kraken Pool",
                             "Megalodon Default", "The Depths - Serpent", "Great White Shark", "Great Hammerhead Shark",
                             "Whale Shark", "Animal Pool"}
            },
            ["RAM_Config"] = {
                ['Port'] = 7963,
                ['Password'] = "",
                ['Update Interval'] = 5,
                ['Subfix'] = " - ",
                ['Rod Displayed'] = 10
            },
            ['ShakeMode'] = "Fast", -- Fast, Fix bug
            ["FpsBoost"] = false,
            ["Black_Screen"] = true
        }
        getgenv().Script_Mode = "Kaitun_Script"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Wraith1vs11/Rejoin/refs/heads/main/UGPhone's%20Scripts"))()
    
    elseif scriptName == "MaruKaitunGrowAGarden" then
        getgenv().NScript = "MaruHub"
        _G.Settings = {
            SelectSeeds = {"Cherry Blossom", "Coconut", "Mint", "Easter Egg", "Lemon", "Succulent", "Raspberry",
                           "Passionfruit", "Cranberry", "Candy Blossom", "Watermelon", "Red Lollipop", "Pineapple",
                           "Blood Banana", "Peach", "Candy Sunflower", "Crimson Vine", "Mushroom", "Pear",
                           "Chocolate Carrot", "Starfruit", "Pumpkin", "Pepper", "Cacao", "Glowshroom", "Eggplant",
                           "Durian", "Avocado", "Venus Fly Trap", "Lotus", "Banana", "Dragon Fruit", "Cursed Fruit",
                           "Mango", "Cactus", "Papaya", "Beanstalk", "Grape", "Bamboo", "Soul Fruit", "Carrot",
                           "Orange Tulip", "Daffodil", "Celestiberry"},
            StartBuyEggWhen = 150000,
            SelectEggs = {"Legendary Egg", "Mythical Egg", "Bug Egg"},
            SelectHoneyStocks = {"Bee Egg"},
            UpgradePetSlots = 2,
            RemoveTrashFruits = true
        }
        getgenv().Script_Mode = "Kaitun_Script"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Wraith1vs11/Rejoin/refs/heads/main/UGPhone's%20Scripts"))()
    
    elseif scriptName == "MaruKaitunBF" then
        getgenv().NScript = "MaruHub"
        repeat
            task.wait()
        until game.Players
        repeat
            task.wait()
        until game.Players.LocalPlayer
        repeat
            task.wait()
        until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
        _G.Team = "Pirate" -- Marine / Pirate
        getgenv().Script_Mode = "Kaitun_Script"
        _G.MainSettings = {
            ["EnabledHOP"] = true,
            ['FPSBOOST'] = true,
            ["FPSLOCKAMOUNT"] = 60,
            ['WhiteScreen'] = true,
            ['CloseUI'] = false,
            ["NotifycationExPRemove"] = true,
            ['AFKCheck'] = 150,
            ["LockFragments"] = 20000,
            ["LockFruitsRaid"] = {
                [1] = "Dough-Dough",
                [2] = "Dragon-Dragon"
            }
        }
        _G.SharkAnchor_Settings = {
            ["Enabled_Farm"] = true,
            ['FarmAfterMoney'] = 2500000
        }
        _G.Quests_Settings = {
            ['Rainbow_Haki'] = true,
            ["MusketeerHat"] = true,
            ["PullLever"] = true,
            ['DoughQuests_Mirror'] = {
                ['Enabled'] = true,
                ['UseFruits'] = true
            }
        }
        _G.Races_Settings = {
            ['Race'] = {
                ['EnabledEvo'] = true,
                ["v2"] = true,
                ["v3"] = true,
                ["Races_Lock"] = {
                    ["Races"] = {
                        ["Mink"] = true,
                        ["Human"] = true,
                        ["Fishman"] = true
                    },
                    ["RerollsWhenFragments"] = 20000
                }
            }
        }
        _G.Fruits_Settings = {
            ['Main_Fruits'] = {'Dough-Dough'},
            ['Select_Fruits'] = {"Flame-Flame", "Ice-Ice", "Quake-Quake", "Light-Light", "Dark-Dark", "Spider-Spider",
                                 "Rumble-Rumble", "Magma-Magma", "Buddha-Buddha"}
        }
        _G.Settings_Melee = {
            ['Superhuman'] = true,
            ['DeathStep'] = true,
            ['SharkmanKarate'] = true,
            ['ElectricClaw'] = true,
            ['DragonTalon'] = true,
            ['Godhuman'] = true
        }
        _G.SwordSettings = {
            ['Saber'] = true,
            ["Pole"] = false,
            ['MidnightBlade'] = false,
            ['Shisui'] = true,
            ['Saddi'] = true,
            ['Wando'] = false,
            ['Yama'] = true,
            ['Rengoku'] = false,
            ['Canvander'] = false,
            ['BuddySword'] = false,
            ['TwinHooks'] = false,
            ['HallowScryte'] = false,
            ['TrueTripleKatana'] = false,
            ['CursedDualKatana'] = true
        }
        _G.GunSettings = {
            ['Kabucha'] = false,
            ['SerpentBow'] = false,
            ['SoulGuitar'] = false
        }
        _G.FarmMastery_Settings = {
            ['Melee'] = true,
            ['Sword'] = true,
            ['DevilFruits'] = true,
            ['Select_Swords'] = {
                ["AutoSettings"] = true,
                ["ManualSettings"] = {"Saber", "Buddy Sword"}
            }
        }
        _G.Hop_Settings = {
            ["Find Tushita"] = false
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Wraith1vs11/Rejoin/refs/heads/main/UGPhone's%20Scripts"))()
        -- // HoHoHub
    elseif scriptName == "HohoHub" then
        getgenv().NScript = "HohoHub"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Wraith1vs11/Rejoin/refs/heads/main/UGPhone's%20Scripts"))()
    elseif scriptName == "BananaHub" then
        repeat wait() until game:IsLoaded() and game.Players.LocalPlayer 
        getgenv().Key = "836c609ec9d1f2d3b36bd0bc" 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
    elseif scriptName == "BananaKaitun" then
        repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
        getgenv().Key = "836c609ec9d1f2d3b36bd0bc"
            getgenv().SettingFarm ={
                ["Hide UI"] = false,
                ["Reset Teleport"] = {
                    ["Enabled"] = false,
                    ["Delay Reset"] = 3,
                    ["Item Dont Reset"] = {
                        ["Fruit"] = {
                            ["Enabled"] = true,
                            ["All Fruit"] = true, 
                            ["Select Fruit"] = {
                                ["Enabled"] = false,
                                ["Fruit"] = {},
                            },
                        },
                    },
                },
                ["White Screen"] = false,
                ["Lock Fps"] = {
                    ["Enabled"] = false,
                    ["FPS"] = 20,
                },
                ["Get Items"] = {
                    ["Saber"] = true,
                    ["Godhuman"] =  true,
                    ["Skull Guitar"] = true,
                    ["Mirror Fractal"] = true,
                    ["Cursed Dual Katana"] = true,
                    ["Upgrade Race V2-V3"] = true,
                    ["Auto Pull Lever"] = true,
                    ["Shark Anchor"] = true, --- if have cdk,sg,godhuman
                },
                ["Get Rare Items"] = {
                    ["Rengoku"] = false,
                    ["Dragon Trident"] = false, 
                    ["Pole (1st Form)"] = false,
                    ["Gravity Blade"]  = false,
                },
                ["Farm Fragments"] = {
                    ["Enabled"]  = false,
                    ["Fragment"] = 50000,
                },
                ["Auto Chat"] = {
                    ["Enabled"] = false,
                    ["Text"] = "",
                },
                ["Auto Summon Rip Indra"] = true, --- auto buy haki and craft haki legendary 
                ["Select Hop"] = { -- 70% will have it
                    ["Hop Server If Have Player Near"] = false, 
                    ["Hop Find Rip Indra Get Valkyrie Helm or Get Tushita"] = true, 
                    ["Hop Find Dough King Get Mirror Fractal"] = false,
                    ["Hop Find Raids Castle [CDK]"] = true,
                    ["Hop Find Cake Queen [CDK]"] = true,
                    ["Hop Find Soul Reaper [CDK]"] = true,
                    ["Hop Find Darkbeard [SG]"] = true,
                    ["Hop Find Mirage [ Pull Lever ]"] = false,
                },
                ["Farm Mastery"] = {
                    ["Melee"] = false,
                    ["Sword"] = false,
                },
                ["Buy Haki"] = {
                    ["Enhancement"] = false,
                    ["Skyjump"] = true,
                    ["Flash Step"] = true,
                    ["Observation"] = true,
                },
                ["Sniper Fruit Shop"] = {
                    ["Enabled"] = true, -- Auto Buy Fruit in Shop Mirage and Normal
                    ["Fruit"] = {"Leopard-Leopard","Kitsune-Kitsune","Dragon-Dragon","Yeti-Yeti","Gas-Gas"},
                },
                ["Lock Fruit"] = {},
                ["Webhook"] = {
                    ["Enabled"] = false,
                    ["WebhookUrl"] = "",
                }
            }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaCat-kaitunBF.lua"))()
        elseif scriptName == "BananaHubKaitunLevi" then
            repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
            getgenv().Key = "836c609ec9d1f2d3b36bd0bc"
            loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/BananaCat-KaitunLevi.lua"))()
        elseif scriptName == "BananaHubKaitunV4" then
            repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
            getgenv().Key = "836c609ec9d1f2d3b36bd0bc"
            loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/BananaCat-KaitunV4"))()
        elseif scriptName == "BananaHubSAB" then
            repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
            getgenv().Key = "836c609ec9d1f2d3b36bd0bc"
            getgenv().Config = {
                ["Private Server"] = false, -- it will auto lock base if false
                ["Buy Lucky Block"] = {
                    "Admin Lucky Block",
                    "Secret Lucky Block",
                    "Taco Lucky Block",
                    "Los Lucky Block",
                },
            }
            loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/Kaitun-Sab.lua"))()
    else
        Player:Kick("Script không tồn tại: " .. scriptName)
    end
else
    Player:Kick("Key hết hạn hoặc bị revoke!")
end