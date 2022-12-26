-- Get Globalised Enviroment Variables
getgenv().autoTapEnabled = false;
getgenv().eggShopsTable = game:GetService("Workspace").Shops:GetChildren()


-- Commonly-Used Variables
local playerList = game:GetService("Players")
local user = playerList.LocalPlayer


-- Instance Spoofer, credits to Newmat on V3RM
loadstring(game:HttpGet("https://pastebin.com/raw/tUUGAeaH", true))()


-- User Interface Library Initilization / Configurations
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/cypherdh/VanisUILIB/main/.gitignore"))()
local ui = lib:CreateWindow(string.format("Welcome, %s. Enjoy Tapping Simulator  ", game:GetService("Players").LocalPlayer.Name), "  v1")
local tab = ui:CreateTab("Available Scripts")
local movementPage = tab:CreateFrame("Movement")
local farmingPage = tab:CreateFrame("Farming")
local teleportsPage = tab:CreateFrame("Teleports")
local settingsPage = tab:CreateFrame("Settings")


-- Local Player Movement Page
local walkSpeedSlider = movementPage:CreateSlider("Change Local-Player Walking Speed", 16, 500, function(val)
    spoof(game.Players.LocalPlayer.Character.Humanoid, "WalkSpeed", val)
end)

local jumpPowerSlider = movementPage:CreateSlider("Change Local-Player Jump Power", 50, 500, function(val)
    spoof(game.Players.LocalPlayer.Character.Humanoid, "JumpPower", val)
end)


-- Tapping Simulator Farming Page  ==>  ( farmingPage )
local autoTapperToggle = farmingPage:CreateToggle("Automatic Tapping", "Automattically taps, so you don't have to!", function(val)
	autoTapEnabled = val
	autoTapper()
end)

function autoTapper()
    spawn(function()
        while autoTapEnabled == true do
            game:GetService("ReplicatedStorage").Events.Tap:FireServer("Main")
            wait()
        end
    end)
end
