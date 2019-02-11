-----------------
-- Version 0.2b --
-----------------

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
	
	Console.Print("\n=============================================\n")
	Console.Print("Script: Laugh Spam | Callback: OnScriptLoad\n")
	Console.Print("Date & Time: " .. (os.date("%Y-%m-%d %I:%M %p")))
	Console.Print("=============================================\n\n")
end

function Laugh.OnGameEnd()
	myHero = nil
	Laugh.LastLaugh = 0
	collectgarbage("collect")
	Laugh.NeedInit = true
end

function Laugh.OnUpdate()
	if Menu.IsEnabled(Laugh.OptionEnable) == false then return end

	if Laugh.NeedInit == true then
		Laugh.LastLaugh = 0
	
		if myHero == nil then
			myHero = Heroes.GetLocal()
		end
		
		Laugh.NeedInit = false
	end
	
	if myHero == nil then return end
	
	if Entity.IsAlive(myHero) == false then return end
	
	if Laugh.LastLaugh < GameRules.GetGameTime() then
		Engine.ExecuteCommand("say /laugh")
		Laugh.LastLaugh = GameRules.GetGameTime() + 15.0
	end
end

return Laugh