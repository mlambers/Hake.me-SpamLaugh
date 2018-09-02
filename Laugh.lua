-----------------
-- Version 0.1 --
-----------------

local Laugh = {}

Laugh.optionEnable = Menu.AddOption({ "mlambers", "Laugh Spam" }, "1. Enable Laugh", "Enable/Disable this script.")

Laugh.lastlaugh = 0
Laugh.NeedInit = true
local myHero = nil

function Laugh.OnScriptLoad()
	myHero = nil
	Laugh.lastlaugh = 0
	Laugh.NeedInit = true
end

function Laugh.OnGameEnd()
	myHero = nil
	Laugh.lastlaugh = 0
	Laugh.NeedInit = true
end

function Laugh.OnGameStart()
	if myHero == nil then
		myHero = Heroes.GetLocal()
	end
	
	Laugh.lastlaugh = 0
	Laugh.NeedInit = true
end

function Laugh.OnUpdate()
	if Engine.IsInGame() == false then return end
	if Menu.IsEnabled(Laugh.optionEnable) == false then return end
	if GameRules.GetGameState() < 4 then return end
	if GameRules.GetGameState() > 5 then return end
	
	if Laugh.NeedInit == true then
		if myHero == nil then
			myHero = Heroes.GetLocal()
		end
		
		Laugh.NeedInit = false
	end
	
	if myHero == nil then return end
	if Entity.IsAlive(myHero) == false then return end
	
	if Laugh.lastlaugh < GameRules.GetGameTime() then
		Engine.ExecuteCommand("say /laugh")
		Laugh.lastlaugh = GameRules.GetGameTime() + 15.0
	end
end

return Laugh