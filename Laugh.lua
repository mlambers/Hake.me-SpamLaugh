---------------------------
-- Laugh.lua Version 0.4 --
---------------------------

local Laugh = {
	OptionEnable = Menu.AddOption({"mlambers", "Laugh Spam"}, "1. Enable", "Enable/Disable this script."),
	LastLaugh = 0
}

local myHero = nil

function Laugh.OnScriptLoad()
	myHero = nil
	Laugh.LastLaugh = 0
	
	Console.Print("[" .. os.date("%I:%M:%S %p") .. "] - - [ Laugh.lua ] [ Version 0.4 ] Script load.")
end

function Laugh.OnGameEnd()
	myHero = nil
	Laugh.LastLaugh = 0
	collectgarbage("collect")
	
	Console.Print("[" .. os.date("%I:%M:%S %p") .. "] - - [ Laugh.lua ] [ Version 0.4 ] Game end. Reset all variable.")
end

function Laugh.OnUpdate()
	if Menu.IsEnabled(Laugh.OptionEnable) == false then return end

	if myHero == nil or myHero ~= Heroes.GetLocal() then 
		myHero = Heroes.GetLocal()
		Laugh.LastLaugh = 0
		
        Console.Print("[" .. os.date("%I:%M:%S %p") .. "] - - [ Laugh.lua ] [ Version 0.4 ] Game started, init script done.")
        
        return
	end
	
	if Entity.IsAlive(myHero) == false then return end
	
	if Laugh.LastLaugh < GameRules.GetGameTime() then
		Engine.ExecuteCommand("say /laugh")
		Laugh.LastLaugh = GameRules.GetGameTime() + 15.0
	end
end

return Laugh