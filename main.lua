local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/SaveManager.luau"))()
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/InterfaceManager.luau"))()
-- 🏠 Creation
local Window = Library:CreateWindow{
    Title = "Private Script | SETH BNS",
    SubTitle = "SETH X VOID SQUAD",
    TabWidth = 125,
    Size = UDim2.fromOffset(600, 325),
    Resize = false,
    Acrylic = true,
    Theme = "Amethyst Dark",
    MinimizeKey = Enum.KeyCode.RightControl
}local Tabs = {
	Main = Window:CreateTab{
		Title = "Home | Packs",
		Icon = "phosphor-house-bold"
	},
	AutoFarm = Window:CreateTab{
		Title = "Auto Farm Tools",
		Icon = "phosphor-robot-bold"
	},
   	IslandFarm = Window:CreateTab{
		Title = "Island Rock Punch",
		Icon = "phosphor-map-pin-bold"
    	},
	Rebirth = Window:CreateTab{
		Title = "Rebirth",
		Icon = "phosphor-arrows-clockwise-bold"
	},
	Stats = Window:CreateTab{
		Title = "Stats",
		Icon = "phosphor-sparkle-bold"
	},
	Misc = Window:CreateTab{
		Title = "Misc",
		Icon = "phosphor-map-pin-bold"
	},
	Settings = Window:CreateTab{
		Title = "Settings",
		Icon = "phosphor-sliders-bold"
	}
}

local Options = Library.Options  
local MainSection = Tabs.Main:CreateSection("PACKS ONLY")
local selectedSize = "2"


	Tabs.Main:AddButton({
        Title = "Packs Farm Rebirth",
        Description = "230K+ A DAY",
        Callback = function()
            Window:Dialog({
                Title = "Fast Rebirth",
                Content = "DO **NOT** EXECUTE IF YOU DONT WANNA REBIRTH",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            local a=game:GetService("ReplicatedStorage")local b=game:GetService("Players")local c=b.LocalPlayer;local d=function(e)local f=c.petsFolder;for g,h in pairs(f:GetChildren())do if h:IsA("Folder")then for i,j in pairs(h:GetChildren())do a.rEvents.equipPetEvent:FireServer("unequipPet",j)end end end;task.wait(.1)end;local k=function(l)d()task.wait(.01)for m,n in pairs(c.petsFolder.Unique:GetChildren())do if n.Name==l then a.rEvents.equipPetEvent:FireServer("equipPet",n)end end end;local o=function(p)local q=workspace.machinesFolder:FindFirstChild(p)if not q then for r,s in pairs(workspace:GetChildren())do if s:IsA("Folder")and s.Name:find("machines")then q=s:FindFirstChild(p)if q then break end end end end;return q end;local t=function()local u=game:GetService("VirtualInputManager")u:SendKeyEvent(true,"E",false,game)task.wait(.1)u:SendKeyEvent(false,"E",false,game)end;task.spawn(function()while true do local v=c.leaderstats.Rebirths.Value;local w=10000+(5000*v)if c.ultimatesFolder:FindFirstChild("Golden Rebirth")then local x=c.ultimatesFolder["Golden Rebirth"].Value;w=math.floor(w*(1-(x*0.1)))end;d()task.wait(.1)k("Swift Samurai")while c.leaderstats.Strength.Value<w do for y=1,10 do c.muscleEvent:FireServer("rep")end;task.wait()end;d()task.wait(.1)k("Tribal Overlord")local z=o("Jungle Bar Lift")if z and z:FindFirstChild("interactSeat")then c.Character.HumanoidRootPart.CFrame=z.interactSeat.CFrame*CFrame.new(0,3,0)repeat task.wait(.1)t()until c.Character.Humanoid.Sit end;local A=c.leaderstats.Rebirths.Value;repeat a.rEvents.rebirthRemote:InvokeServer("rebirthRequest")task.wait(.1)until c.leaderstats.Rebirths.Value>A;task.wait()end end)
                    end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })


Tabs.Main:AddButton({
        Title = "Fast Grind",
        Description = "Super Speed (With Swifts)",
        Callback = function()
            Window:Dialog({
                Title = "Super Speed",
                Content = "Speed Grind",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                          local a = game:GetService("ReplicatedStorage")
local b = game:GetService("Players")
local c = b.LocalPlayer
 
-- Fun??o para equipar apenas o "Swift Samurai" (sem desequipar nada antes)
local function k()
    for m, n in pairs(c.petsFolder.Unique:GetChildren()) do
        if n.Name == "Swift Samurai" then
            a.rEvents.equipPetEvent:FireServer("equipPet", n)
        end
    end
end
 
-- Loop principal focado apenas em ganhar Strength rapidamente
task.spawn(function()
    k() -- Equipa o Swift Samurai no come?o e n?o troca mais
 
    while true do
        -- Farm de Strength (agora com 0.001s de delay)
        for y = 1, 10 do
            c.muscleEvent:FireServer("rep")
        end
        task.wait(0.001) -- Super rápido
    end
end)
                    end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })


local Toggle = Tabs.AutoFarm:CreateToggle("Weight", {
	Title = "Auto Weight",
	Description = "Auto Lift Weight",
	Default = false,
	Callback = function(Value)
		_G.AutoWeight = Value
		if Value then
			local weightTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight")
			if weightTool then
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(weightTool)
			end
		else
			local character = game.Players.LocalPlayer.Character
			local equipped = character:FindFirstChild("Weight")
			if equipped then
				equipped.Parent = game.Players.LocalPlayer.Backpack
			end
		end
		while _G.AutoWeight do
			game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
			task.wait(0)
		end
	end
})

local Toggle = Tabs.AutoFarm:CreateToggle("Pushups", {
	Title = "Auto Pushups",
	Description = "Auto Lift Pushups",
	Default = false,
	Callback = function(Value)
		_G.AutoPushups = Value
		if Value then
			local pushupsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Pushups")
			if pushupsTool then
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(pushupsTool)
			end
		else
			local character = game.Players.LocalPlayer.Character
			local equipped = character:FindFirstChild("Pushups")
			if equipped then
				equipped.Parent = game.Players.LocalPlayer.Backpack
			end
		end
		while _G.AutoPushups do
			game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
			task.wait(0)
		end
	end
})

local Toggle = Tabs.AutoFarm:CreateToggle("Handstands", {
	Title = "Auto Handstands",
	Description = "Auto Lift Handstands",
	Default = false,
	Callback = function(Value)
		_G.AutoHandstands = Value
		if Value then
			local handstandsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Handstands")
			if handstandsTool then
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(handstandsTool)
			end
		else
			local character = game.Players.LocalPlayer.Character
			local equipped = character:FindFirstChild("Handstands")
			if equipped then
				equipped.Parent = game.Players.LocalPlayer.Backpack
			end
		end
		while _G.AutoHandstands do
			game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
			task.wait(0)
		end
	end
})

local Toggle = Tabs.AutoFarm:CreateToggle("Situps", {
	Title = "Auto Situps",
	Description = "Auto Lift Situps",
	Default = false,
	Callback = function(Value)
		_G.AutoSitups = Value
		if Value then
			local situpsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Situps")
			if situpsTool then
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(situpsTool)
			end
		else
			local character = game.Players.LocalPlayer.Character
			local equipped = character:FindFirstChild("Situps")
			if equipped then
				equipped.Parent = game.Players.LocalPlayer.Backpack
			end
		end
		while _G.AutoSitups do
			game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
			task.wait(0)
		end
	end
})

local Toggle = Tabs.AutoFarm:CreateToggle("Punch", {
	Title = "Auto Punch",
	Description = "Auto Punch",
	Default = false,
	Callback = function(Value)
		_G.fastHitActive = Value
		if Value then
			local function equipAndModifyPunch()
				while _G.fastHitActive do
					local player = game.Players.LocalPlayer
					local punch = player.Backpack:FindFirstChild("Punch")
					if punch then
						punch.Parent = player.Character
						if punch:FindFirstChild("attackTime") then
							punch.attackTime.Value = 0
						end
					end
					wait(0)
				end
			end
			local function rapidPunch()
				while _G.fastHitActive do
					local player = game.Players.LocalPlayer
					player.muscleEvent:FireServer("punch", "rightHand")
					player.muscleEvent:FireServer("punch", "leftHand")
					local character = player.Character
					if character then
						local punchTool = character:FindFirstChild("Punch")
						if punchTool then
							punchTool:Activate()
						end
					end
					wait(0)
				end
			end
			coroutine.wrap(equipAndModifyPunch)()
			coroutine.wrap(rapidPunch)()
		else
			local character = game.Players.LocalPlayer.Character
			local equipped = character:FindFirstChild("Punch")
			if equipped then
				equipped.Parent = game.Players.LocalPlayer.Backpack
			end
		end
	end
})
local Toggle = Tabs.AutoFarm:CreateToggle("ToolSpeed", {
	Title = "Fast Tools",
	Description = "Fast Tools",
	Default = false,
	Callback = function(Value)
		_G.FastTools = Value
		local defaultSpeeds = {
			{
				"Punch",
				"attackTime",
				Value and 0 or 0.35
			},
			{
				"Pushups",
				"repTime",
				Value and 0 or 1
			},
			{
				"Weight",
				"repTime",
				Value and 0 or 1
			}
		}
		local player = game.Players.LocalPlayer
		local backpack = player:WaitForChild("Backpack")
		for _, toolInfo in ipairs(defaultSpeeds) do
			local tool = backpack:FindFirstChild(toolInfo[1])
			if tool and tool:FindFirstChild(toolInfo[2]) then
				tool[toolInfo[2]].Value = toolInfo[3]
			end
			local equippedTool = player.Character and player.Character:FindFirstChild(toolInfo[1])
			if equippedTool and equippedTool:FindFirstChild(toolInfo[2]) then
				equippedTool[toolInfo[2]].Value = toolInfo[3]
			end
		end
	end
})

local RockSection = Tabs.IslandFarm:CreateSection("Rock Farm")
local selectrock = ""
local Toggle = Tabs.IslandFarm:CreateToggle("LegendGymRock", {
	Title = "Farm Legend Gym Rock",
	Description = "Farm rocks at Legend Gym",
	Default = false,
	Callback = function(Value)
		selectrock = "Legend Gym Rock"
		getgenv().autoFarm = Value
		while getgenv().autoFarm do
			task.wait()
			if game:GetService("Players").LocalPlayer.Durability.Value >= 1000000 then
				for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
					if v.Name == "neededDurability" and v.Value == 1000000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
						gettool()
					end
				end
			end
		end
	end
})

function gettool()
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
		end
	end
	game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
	game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end

local Toggle = Tabs.IslandFarm:CreateToggle("MuscleKingGymRock", {
	Title = "Farm Muscle King Gym Rock",
	Description = "Farm rocks at Muscle King Gym",
	Default = false,
	Callback = function(Value)
		selectrock = "Muscle King Gym Rock"
		getgenv().autoFarm = Value
		while getgenv().autoFarm do
			task.wait()
			if game:GetService("Players").LocalPlayer.Durability.Value >= 5000000 then
				for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
					if v.Name == "neededDurability" and v.Value == 5000000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
						gettool()
					end
				end
			end
		end
	end
})

local Toggle = Tabs.IslandFarm:CreateToggle("AncientJungleRock", {
	Title = "Farm Ancient Jungle Rock",
	Description = "Farm rocks at Ancient Jungle",
	Default = false,
	Callback = function(Value)
		selectrock = "Ancient Jungle Rock"
		getgenv().autoFarm = Value
		while getgenv().autoFarm do
			task.wait()
			if game:GetService("Players").LocalPlayer.Durability.Value >= 10000000 then
				for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
					if v.Name == "neededDurability" and v.Value == 10000000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
						gettool()
					end
				end
			end
		end
	end
})

local Section = Tabs.Rebirth:CreateSection("AutoRebirth")

local targetRebirthValue = 1
local initialRebirths = game.Players.LocalPlayer.leaderstats.Rebirths.Value

local Paragraph = Tabs.Rebirth:CreateParagraph("RebirthStats", {
	Title = "Rebirth Stats",
	Content = "Loading Stats",
	TitleAlignment = "Left",
	ContentAlignment = Enum.TextXAlignment.Left
})

local function updateStats()
	local currentRebirths = game.Players.LocalPlayer.leaderstats.Rebirths.Value
	local gained = currentRebirths - initialRebirths
	Paragraph:SetContent(string.format("Target Rebirth: %d\nCurrent Rebirths: %d\nRebirths Gained: %d", targetRebirthValue, currentRebirths, gained))
end

game.Players.LocalPlayer.leaderstats.Rebirths.Changed:Connect(updateStats)
updateStats()

local targetInput = Tabs.Rebirth:CreateInput("TargetRebirth", {
	Title = "Target Rebirth",
	Description = "Enter target rebirth",
	Default = "",
	Placeholder = "Enter amount",
	Numeric = true,
	Finished = true,
	Callback = function(Value)
		targetRebirthValue = tonumber(Value) or 1
		updateStats()
	end
})

local Toggle = Tabs.Misc:AddToggle("AutoWheel", {
	Title = "Auto Spin Wheel",
	Default = false,
	Callback = function(v)
		while v do
			game:GetService("ReplicatedStorage").rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel", game:GetService("ReplicatedStorage").fortuneWheelChances["Fortune Wheel"])
			task.wait(1)
		end
	end
})

Tabs.Misc:CreateButton{
	Title = "Low Graphics / Anti-Crashed",
	Description = "Optimize Performance",
	Callback = function()
		for _, v in pairs(game:GetDescendants()) do
			if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
				v.Enabled = false
			end
		end
		local lighting = game:GetService("Lighting")
		lighting.GlobalShadows = false
		lighting.FogEnd = 9e9
		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
				v.Material = Enum.Material.SmoothPlastic
				if v:IsA("Texture") then
					v:Destroy()
				end
			end
		end
		settings().Rendering.QualityLevel = 1
	end
}

local Toggle = Tabs.Misc:CreateToggle("FrameToggle", {
	Title = "Hide All Frames",
	Description = "Hide all game frames",
	Default = false,
	Callback = function(Value)
		local rSto = game:GetService("ReplicatedStorage")
		for _, obj in pairs(rSto:GetChildren()) do
			if obj.Name:match("Frame$") then
				obj.Visible = not Value
			end
		end
	end
})

Tabs.Misc:AddButton({
        Title = "Protein Egg",
        Description = "Auto Eat Egg",
        Callback = function()
            Window:Dialog({
                Title = "Protein Egg",
                Content = "DO **NOT** EXECUTE IF YOU DONT WANNA EAT",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
				local LocalPlayer = game:GetService("Players").LocalPlayer local muscleEvent = LocalPlayer:WaitForChild("muscleEvent") while true do wait(1800) muscleEvent:FireServer("proteinEgg", LocalPlayer.Backpack:FindFirstChild("Protein Egg")) end				
                    end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Misc:AddButton({
        Title = "Tropical Shake",
        Description = "Auto Drink Shake",
        Callback = function()
            Window:Dialog({
                Title = "Tropical Shake",
                Content = "DO **NOT** EXECUTE IF YOU DONT WANNA DRINK",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
				local LocalPlayer = game:GetService("Players").LocalPlayer local muscleEvent = LocalPlayer:WaitForChild("muscleEvent") while true do wait(7) muscleEvent:FireServer("tropicalShake", LocalPlayer.Backpack:FindFirstChild("Tropical Shake")) end				
                    end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

local targetRebirthLoop = nil
local targetToggle = Tabs.Rebirth:CreateToggle("AutoRebirthTarget", {
	Title = "Auto Rebirth [Target]",
	Description = "Automatically rebirth until target is reached",
	Default = false,
	Callback = function(Value)
		if Value then
			targetRebirthLoop = task.spawn(function()
				while task.wait(0.1) do
					if game.Players.LocalPlayer.leaderstats.Rebirths.Value >= targetRebirthValue then
						targetToggle:SetValue(false)
						break
					end
					game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
				end
			end)
		else
			if targetRebirthLoop then
				task.cancel(targetRebirthLoop)
				targetRebirthLoop = nil
			end
		end
	end
})

local infiniteRebirthLoop = nil
local infiniteToggle = Tabs.Rebirth:CreateToggle("AutoRebirthInfinite", {
	Title = "Auto Rebirth [Infinite]",
	Description = "Continuously rebirth without stopping",
	Default = false,
	Callback = function(Value)
		if Value then
			infiniteRebirthLoop = task.spawn(function()
				while task.wait(0.1) do
					game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
				end
			end)
		else
			if infiniteRebirthLoop then
				task.cancel(infiniteRebirthLoop)
				infiniteRebirthLoop = nil
			end
		end
	end
})

local teleportLoop = nil
local kingTeleportToggle = Tabs.IslandFarm:CreateToggle("MuscleKingTeleport", {
	Title = "Auto Teleport (MuscleKing)",
	Description = "Continuously",
	Default = false,
	Callback = function(Value)
		if Value then
			teleportLoop = task.spawn(function()
				while task.wait(0) do
					if game.Players.LocalPlayer.Character then
						game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-8646, 17, -5738))
					end
				end
			end)
		else
			if teleportLoop then
				task.cancel(teleportLoop)
				teleportLoop = nil
			end
		end
	end
})

local IntSection = Tabs.Stats:CreateSection("Player Stats")
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer

local startTime = 0
local sessionStartTime = os.time()
local timerRunning = false

local strengthGained = 0
local lastStrengthValue = nil
local rebirthsGained = 0
local lastRebirthsValue = nil
local killsGained = 0
local lastKillsValue = nil
local brawlsGained = 0
local lastBrawlsValue = nil
local goodKarmaGained = 0
local lastGoodKarmaValue = nil
local evilKarmaGained = 0
local lastEvilKarmaValue = nil
local durabilityGained = 0
local lastDurabilityValue = nil
local agilityGained = 0
local lastAgilityValue = nil
local muscleKingTimeGained = 0
local lastMuscleKingTimeValue = nil

local TimerParagraph = Tabs.Stats:CreateParagraph("SessionTimer", {
	Title = "Elapsed Time",
	Content = "0 Day, 0 Hours, 0 Minutes, 0 Seconds",
	TitleAlignment = "Left",
	ContentAlignment = Enum.TextXAlignment.Left
})

local LeaderParagraph = Tabs.Stats:CreateParagraph("LeaderStats", {
	Title = "Current Stats             |             Gained Stats",
	Content = "Loading Stats",
	TitleAlignment = "Left",
	ContentAlignment = Enum.TextXAlignment.Left
})

local IntParagraph = Tabs.Stats:CreateParagraph("IntStats", {
	Title = "Kill & Brawl Stats",
	Content = "Loading Stats",
	TitleAlignment = "Left",
	ContentAlignment = Enum.TextXAlignment.Left
})


local function formatNumber(number)
	local formatted = tostring(math.floor(number))
	local k
	while true do
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		if k == 0 then
			break
		end
	end
	return formatted
end

local function formatTime(seconds)
	local days = math.floor(seconds / 86400)
	local hours = math.floor((seconds % 86400) / 3600)
	local minutes = math.floor((seconds % 3600) / 60)
	local secs = seconds % 60
	return string.format("%dd %dh %dm %ds", days, hours, minutes, secs)
end

local function debugPrint(message, value)
	print(string.format("[DEBUG] %s: %s", message, tostring(value)))
end

repeat
	task.wait()
until game:IsLoaded()
debugPrint("")

if not player.Character then
	player.CharacterAdded:Wait()
end
debugPrint("Character Loaded", "Success")

repeat
	task.wait()
until player:FindFirstChild("leaderstats") and player:FindFirstChild("goodKarma")
debugPrint("")

RunService.RenderStepped:Connect(function()
	local sessionTime = os.time() - sessionStartTime
	TimerParagraph:SetContent(formatTime(sessionTime))
	if timerRunning then
		local elapsed = os.time() - startTime
		CustomTimerParagraph:SetContent(formatTime(elapsed))
	end
	local currentStrength = player.leaderstats.Strength.Value
	local currentRebirths = player.leaderstats.Rebirths.Value
	local currentKills = player.leaderstats.Kills.Value
	local currentBrawls = player.leaderstats.Brawls.Value
	local currentDurability = player.Durability.Value
	local currentAgility = player.Agility.Value
	if lastStrengthValue == nil then
		lastStrengthValue = currentStrength
	elseif currentStrength > lastStrengthValue then
		strengthGained = strengthGained + (currentStrength - lastStrengthValue)
	end
	lastStrengthValue = currentStrength
	if lastRebirthsValue == nil then
		lastRebirthsValue = currentRebirths
	elseif currentRebirths > lastRebirthsValue then
		rebirthsGained = rebirthsGained + (currentRebirths - lastRebirthsValue)
	end
	lastRebirthsValue = currentRebirths
	if lastKillsValue == nil then
		lastKillsValue = currentKills
	elseif currentKills > lastKillsValue then
		killsGained = killsGained + (currentKills - lastKillsValue)
	end
	lastKillsValue = currentKills
	if lastBrawlsValue == nil then
		lastBrawlsValue = currentBrawls
	elseif currentBrawls > lastBrawlsValue then
		brawlsGained = brawlsGained + (currentBrawls - lastBrawlsValue)
	end
	lastBrawlsValue = currentBrawls
	if lastDurabilityValue == nil then
		lastDurabilityValue = currentDurability
	elseif currentDurability > lastDurabilityValue then
		durabilityGained = durabilityGained + (currentDurability - lastDurabilityValue)
	end
	lastDurabilityValue = currentDurability
	if lastAgilityValue == nil then
		lastAgilityValue = currentAgility
	elseif currentAgility > lastAgilityValue then
		agilityGained = agilityGained + (currentAgility - lastAgilityValue)
	end
	lastAgilityValue = currentAgility
	LeaderParagraph:SetContent(string.format("Strength: %s     Strength Gained: %s\nRebirths: %s     Rebirths Gained: %s\nDurability: %s     Durability Gained: %s\nAgility: %s     Agility Gained: %s", formatNumber(currentStrength), formatNumber(strengthGained), formatNumber(currentRebirths), formatNumber(rebirthsGained), formatNumber(currentDurability), formatNumber(durabilityGained), formatNumber(currentAgility), formatNumber(agilityGained)))
	IntParagraph:SetContent(string.format("Kills: %s     Kills Gained: %s\nBrawls: %s      Brawls Gained: %s", formatNumber(currentKills), formatNumber(killsGained), formatNumber(currentBrawls), formatNumber(brawlsGained)))
end)

local leaderStats = {
	"Strength",
	"Rebirths",
	"Durability",
    "Agility"
}

local intStats = {
	"Kills",
	"Brawls"
}


Tabs.Settings:AddButton({
        Title = "Anti-AFK",
        Description = "Touch some grass",
        Callback = function()
            Window:Dialog({
                Title = "Anti-AFK",
                Content = "EXECUTE IF YOU DONT WANNA KICKED",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
        local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local player = Players.LocalPlayer
 
local gui = Instance.new("ScreenGui", player:FindFirstChildOfClass("PlayerGui"))
 
local textLabel = Instance.new("TextLabel", gui)
textLabel.Size = UDim2.new(0, 200, 0, 50)
textLabel.Position = UDim2.new(0.5, -100, 0, -50)
textLabel.TextColor3 = Color3.fromRGB(50, 255, 50)
textLabel.Font = Enum.Font.GothamBold
textLabel.TextSize = 20
textLabel.BackgroundTransparency = 1
textLabel.TextTransparency = 1
 
local timerLabel = Instance.new("TextLabel", gui)
timerLabel.Size = UDim2.new(0, 200, 0, 30)
timerLabel.Position = UDim2.new(0.5, -100, 0, -20)
timerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
timerLabel.Font = Enum.Font.GothamBold
timerLabel.TextSize = 18
timerLabel.BackgroundTransparency = 1
timerLabel.TextTransparency = 1
timerLabel.Text = "00:00:00"
 
local startTime = tick()
 
task.spawn(function()
    while true do
        local elapsed = tick() - startTime
        local hours = math.floor(elapsed / 3600)
        local minutes = math.floor((elapsed % 3600) / 60)
        local seconds = math.floor(elapsed % 60)
        timerLabel.Text = string.format("%02d:%02d:%02d", hours, minutes, seconds)
        task.wait(1)
    end
end)
 
task.spawn(function()
    while true do
        for i = 0, 1, 0.01 do
            textLabel.TextTransparency = 1 - i
            timerLabel.TextTransparency = 1 - i
            task.wait(0.015)
        end
        task.wait(1.5)
        for i = 0, 1, 0.01 do
            textLabel.TextTransparency = i
            timerLabel.TextTransparency = i
            task.wait(0.015)
        end
        task.wait(0.8)
    end
end)
 
player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    print("AFK prevention completed!")
end)
 
textLabel.Text = "ANTI AFK"
		end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })
    

Window:SelectTab(1)

Library:Notify{
	Title = "Muscle Legends Script",
	Content = "KYY Hub",
	Duration = 5
}

SaveManager:LoadAutoloadConfig()

local TrackingParagraph = Tabs.Stats:CreateParagraph("TrackingStats", {
	Title = "Track Player",
	Content = "No player selected",
	TitleAlignment = "Left",
	ContentAlignment = Enum.TextXAlignment.Left
})

local PlayerInput = Tabs.Stats:CreateInput("PlayerTracker", {
	Title = "Track Player Stats",
	Description = "Enter username",
	Default = "",
	Placeholder = "Enter player name",
	Numeric = false,
	Finished = true,
	Callback = function(Value)
		targetPlayer = Value
	end
})

Tabs.Stats:CreateButton{
	Title = "Track Player",
	Description = "Player's stats",
	Callback = function()
		local foundPlayer = nil
		for _, player in pairs(game.Players:GetPlayers()) do
			local nameLower = player.Name:lower()
			local displayLower = player.DisplayName:lower()
			local searchLower = targetPlayer:lower()
			if nameLower:find(searchLower) or displayLower:find(searchLower) then
				foundPlayer = player
				break
			end
		end
		if foundPlayer then
			local content = string.format("Strength: %s\nRebirths: %s\nKills: %s\nBrawls: %s\nGood Karma: %s\nEvil Karma: %s\nDurability: %s\nAgility: %s", formatNumber(foundPlayer.leaderstats.Strength.Value), formatNumber(foundPlayer.leaderstats.Rebirths.Value), formatNumber(foundPlayer.leaderstats.Kills.Value), formatNumber(foundPlayer.leaderstats.Brawls.Value), formatNumber(foundPlayer.goodKarma.Value), formatNumber(foundPlayer.evilKarma.Value), formatNumber(foundPlayer.Durability.Value), formatNumber(foundPlayer.Agility.Value))
			TrackingParagraph:SetContent(content)
			TrackingParagraph:SetTitle("Track Player" .. foundPlayer.Name)
		end
	end
}

local Toggle = Tabs.Settings:CreateToggle("ToggleName", {
	Title = "Lock Pos",
	Description = "The Man Who Can't Be Moved",
	Default = false,
	Callback = function(Value)
		if Value then
			local currentPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			getgenv().posLock = game:GetService("RunService").Heartbeat:Connect(function()
				if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentPos
				end
			end)
		else
			if getgenv().posLock then
				getgenv().posLock:Disconnect()
			end
		end
	end
})

local Dropdown = Tabs.Settings:CreateDropdown("TimeControl", {
	Title = "Time Changer",
	Description = "Change Day",
	Values = {
		"Morning",
		"Afternoon",
		"Night"
	},
	Multi = false,
	Default = "Default",
	Callback = function(Value)
		local times = {
			["Morning"] = 2.9,
			["Afternoon"] = 17.9,
			["Night"] = 0
		}
		game:GetService("Lighting").ClockTime = times[Value]
	end
})


local a = game.Lighting
a.Ambient = Color3.fromRGB(33, 33, 33)
a.Brightness = 1
a.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
a.ColorShift_Top = Color3.fromRGB(255, 247, 237)
a.EnvironmentDiffuseScale = 0.105
a.EnvironmentSpecularScale = 0.522
a.GlobalShadows = true
a.OutdoorAmbient = Color3.fromRGB(51, 54, 67)
a.ShadowSoftness = 0.04
a.GeographicLatitude = -15.525
a.ExposureCompensation = 0.75
local b = Instance.new("BloomEffect", a)
b.Enabled = true
b.Intensity = 0.04
b.Size = 1900
b.Threshold = 0.915
local c = Instance.new("ColorCorrectionEffect", a)
c.Brightness = 0.176
c.Contrast = 0.39
c.Enabled = true
c.Saturation = 0.2
c.TintColor = Color3.fromRGB(217, 145, 57)


Tabs.Settings:CreateButton{
	Title = "Rejoin",
	Description = "Instantly rejoin the same server",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end
}
