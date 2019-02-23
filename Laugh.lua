----------------------------
-- Laugh.lua Version 0.2c --
----------------------------

local Laugh = {
	OptionEnable = Menu.AddOption({"mlambers", "Laugh Spam"}, "1. Enable", "Enable/Disable this script."),
	LastLaugh = 0,
	NeedInit = true
}

local myHero = nil

function Laugh.OnScriptLoad()
	myHero = nil
	Laugh.LastLaugh = 0
	Laugh.NeedInit = true
	
	Console.Print("[" .. os.date("%I:%M:%S %p") .. "] - - [ Laugh.lua ] [ Version 0.2c ] Script load.")
end

function Laugh.OnGameEnd()
	myHero = nil
	Laugh.LastLaugh = 0
	Laugh.NeedInit = true
	collectgarbage("collect")
	
	Console.Print("[" .. os.date("%I:%M:%S %p") .. "] - - [ Laugh.lua ] [ Version 0.2c ] Game end. Reset all variable.")
end

function Laugh.OnUpdate()
	if Menu.IsEnabled(Laugh.OptionEnable) == false then return end

	if Laugh.NeedInit == true then
		Laugh.LastLaugh = 0
	
		if myHero == nil then
			myHero = Heroes.GetLocal()
		end
		
		Laugh.NeedInit = false
		
		Console.Print("[" .. os.date("%I:%M:%S %p") .. "] - - [ Laugh.lua ] [ Version 0.2c ] Game started, init script done.")
	end
	
	if myHero == nil then return end
	
	if Entity.IsAlive(myHero) == false then return end
	
	if Laugh.LastLaugh < GameRules.GetGameTime() then
		Engine.ExecuteCommand("say /laugh")
		Laugh.LastLaugh = GameRules.GetGameTime() + 15.0
	end
end

return Laugh