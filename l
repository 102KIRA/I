-- Load Wind UI Library
local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()

-- Create Window
local Window = WindUI:CreateWindow({
    Title = "LexusHub",
    Icon = "zap", -- Lightning icon for speed
    Author = "LexusHub",
    Folder = "LexusHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
})

-- Create Tabs
local Tabs = {
    FarmTab = Window:Tab({ Title = "Auto Farm", Icon = "zap", Desc = "Auto Collect Orbs" }),
}

-- Toggle Variables
local autoSpeed = false
local autoGem = false

-- Auto Speed Toggle (Collect 1000 Yellow Orbs)
Tabs.FarmTab:Toggle({
    Title = "Auto Speed x1000 (Collect Yellow Orbs)",
    Icon = "zap",
    Default = false,
    Callback = function(state)
        autoSpeed = state -- Update toggle state
        if autoSpeed then
            task.spawn(function()
                while autoSpeed do
                    for i = 1, 1000 do
                        local args = {
                            [1] = "collectOrb",
                            [2] = "Red Orb",
                            [3] = "City"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
                    end
                    wait() -- Prevents crashes & excessive execution speed
                end
            end)
        end
    end
})

-- Auto Gem Toggle (Collect 1000 Gems)
Tabs.FarmTab:Toggle({
    Title = "Auto Gem x1000 (Collect Gems)",
    Icon = "gem",
    Default = false,
    Callback = function(state)
        autoGem = state -- Update toggle state
        if autoGem then
            task.spawn(function()
                while autoGem do
                    for i = 1, 10000 do
                        local args = {
                            [1] = "collectOrb",
                            [2] = "Gem",
                            [3] = "City"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
                    end
                    wait(10) -- Prevents crashes & excessive execution speed
                end
            end)
        end
    end
})
-- Auto Rebirth Toggle (Collect Rebirth)
Tabs.FarmTab:Toggle({
    Title = "Auto Rebirth (Collect Rebirth)",
    Icon = "repeat", -- Use a valid icon
    Default = false,
    Callback = function(state)
        autoRebirth = state -- Update toggle state
        if autoRebirth then
            task.spawn(function()
                while autoRebirth do
                    local args = {
                        [1] = "rebirthRequest"
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("rebirthEvent"):FireServer(unpack(args))
                    wait() -- Prevents excessive execution
                end
            end)
        end
    end
})

local autoFarm = false

-- Master Auto Farm Toggle (Does Everything)
Tabs.FarmTab:Toggle({
    Title = "Auto Farm (do all) (pressing all buttons/toggles recommended) (it will make the autofarm 3x faster)",
    Icon = "all",
    Default = false,
    Callback = function(state)
        autoFarm = state -- Update toggle state

        if autoFarm then
            task.spawn(function()
                while autoFarm do
                    -- Collect Speed (Yellow Orbs)
                    local args1 = { "collectOrb", "Yellow Orb", "City" }
                    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args1))

                    -- Collect Gems
                    local args2 = { "collectOrb", "Gem", "City" }
                    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args2))

                    -- Rebirth
                    local args3 = { "rebirthRequest" }
                    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("rebirthEvent"):FireServer(unpack(args3))

                    wait() -- Prevents excessive execution
                end
            end)
        end
    end
})

