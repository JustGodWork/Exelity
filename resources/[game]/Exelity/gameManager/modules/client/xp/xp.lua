--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local RockstarRanks = {800, 2100, 3800, 6100, 9500, 12500, 16000, 19800, 24000, 28500, 33400, 38700, 44200, 50200,56400, 63000, 69900, 77100, 84700, 92500, 100700, 109200, 118000, 127100, 136500, 146200, 156200,166500, 177100, 188000, 199200, 210700, 222400, 234500, 246800, 259400, 272300, 285500, 299000,312700, 326800, 341000, 355600, 370500, 385600, 401000, 416600, 432600, 448800, 465200, 482000,499000, 516300, 533800, 551600, 569600, 588000, 606500, 625400, 644500, 663800, 683400, 703300,723400, 743800, 764500, 785400, 806500, 827900, 849600, 871500, 893600, 916000, 938700, 961600,984700, 1008100, 1031800, 1055700, 1079800, 1104200, 1128800, 1153700, 1178800, 1204200, 1229800,1255600, 1281700, 1308100, 1334600, 1361400, 1388500, 1415800, 1443300, 1471100, 1499100,1527300, 1555800, 1584350}
XNL_UseRedBarWhenLosingXP = true
XNL_MaxPlayerLevel = 500
XNL_EnableZKeyForRankbar = true
XNL_CurrentPlayerXP = 0
XNL_CurrentPlayerXP2 = 0
local PalierCount = 0

Citizen.CreateThread(function()
    if not XNL_EnableZKeyForRankbar then
        return
    end
    while true do
        Wait(1)
        if IsControlJustPressed(0, 20) then
            CurLevel = XNL_GetLevelFromXP(XNL_CurrentPlayerXP)
            CreateRankBar(XNL_GetXPFloorForLevel(CurLevel), XNL_GetXPCeilingForLevel(CurLevel), XNL_CurrentPlayerXP,XNL_CurrentPlayerXP, CurLevel, false)
        end
    end
end)


exports('Exp_XNL_SetInitialXPLevels', function(EXCurrentXP, EXShowRankBar, EXShowRankBarAnimating)
    XNL_SetInitialXPLevels(EXCurrentXP, EXShowRankBar, EXShowRankBarAnimating)
end)
exports('Exp_XNL_AddPlayerXP', function(EXXPAmount)
    XNL_AddPlayerXP(EXXPAmount)
end)
exports('Exp_XNL_RemovePlayerXP', function(EXXPAmount)
    XNL_RemovePlayerXP(EXXPAmount)
end)
exports('Exp_XNL_GetCurrentPlayerXP', function()
    return tonumber(XNL_GetCurrentPlayerXP())
end)
exports('Exp_XNL_GetLevelFromXP', function(EXXPAmount)
    return XNL_GetLevelFromXP(EXXPAmount)
end)
exports('Exp_XNL_GetCurrentPlayerLevel', function()
    return tonumber(XNL_GetCurrentPlayerLevel())
end)

RegisterNetEvent("esx:playerLoaded", function(xPlayer)
    XNL_SetInitialXPLevels(xPlayer.xp, true, true)
end);

RegisterNetEvent("JustGod:ReloadPlayer", function(xPlayer)
    XNL_SetInitialXPLevels(xPlayer.xp, true, true)
end);

-- RegisterNetEvent("JustGod:CanFight", function(NetCurrentXP)
--     XNL_SetInitialXPLevels2(NetCurrentXP)
-- end)

RegisterNetEvent("JustGod:updateXP", function(xp)
    XNP_SetInitialXPLevels(xp, true, true)
end)

RegisterNetEvent("JustGod:addXP", function(NetXPAmmount)
    XNL_AddPlayerXP(NetXPAmmount)
end)

RegisterNetEvent("JustGod:removeXP", function(NetXPAmmount)
    XNL_RemovePlayerXP(NetXPAmmount)
end)

function XNL_SetInitialXPLevels(CurrentXP, ShowRankBar, ShowRankBarAnimating)
    XNL_CurrentPlayerXP = CurrentXP
    if ShowRankBar then
        CurLevel = XNL_GetLevelFromXP(CurrentXP)
        AnimateFrom = CurrentXP
        if ShowRankBarAnimating then
            AnimateFrom = XNL_GetXPFloorForLevel(CurLevel)
        end
        CreateRankBar(XNL_GetXPFloorForLevel(CurLevel), XNL_GetXPCeilingForLevel(CurLevel), AnimateFrom,
            XNL_CurrentPlayerXP, CurLevel, false)
    end
end

function XNL_SetInitialXPLevels2(CurrentXP)
    XNL_CurrentPlayerXP2 = CurrentXP
end
function XNL_GetCurrentPlayerXP()
    return XNL_CurrentPlayerXP
end
function XNL_GetCurrentPlayerLevel()
    return XNL_GetLevelFromXP(XNL_CurrentPlayerXP)
end
function XNL_OnPlayerLevelUp()
end
function XNL_OnPlayerLevelsLost()
end
function XNL_AddPlayerXP(XPAmount)
    if not is_int(XPAmount) then
        return
    end
    if XPAmount < 0 then
        return
    end
    local CurrentLevel = XNL_GetLevelFromXP(XNL_CurrentPlayerXP)
    local CurrentXPWithAddedXP = XNL_CurrentPlayerXP + XPAmount
    local NewLevel = XNL_GetLevelFromXP(CurrentXPWithAddedXP)
    local LevelDifference = 0
    if NewLevel > XNL_MaxPlayerLevel - 1 then
        NewLevel = XNL_MaxPlayerLevel - 1
        CurrentXPWithAddedXP = XNL_GetXPCeilingForLevel(XNL_MaxPlayerLevel - 1)
    end
    if NewLevel > CurrentLevel then
        LevelDifference = NewLevel - CurrentLevel
    end
    if LevelDifference > 0 then
        StartAtLevel = CurrentLevel
        CreateRankBar(XNL_GetXPFloorForLevel(StartAtLevel), XNL_GetXPCeilingForLevel(StartAtLevel), XNL_CurrentPlayerXP,
            XNL_GetXPCeilingForLevel(StartAtLevel), StartAtLevel, false)
        for i = 1, LevelDifference, 1 do
            StartAtLevel = StartAtLevel + 1
            if i == LevelDifference then
                CreateRankBar(XNL_GetXPFloorForLevel(StartAtLevel), XNL_GetXPCeilingForLevel(StartAtLevel),
                    XNL_GetXPFloorForLevel(StartAtLevel), CurrentXPWithAddedXP, StartAtLevel, false)
            else
                CreateRankBar(XNL_GetXPFloorForLevel(StartAtLevel), XNL_GetXPCeilingForLevel(StartAtLevel),
                    XNL_GetXPFloorForLevel(StartAtLevel), XNL_GetXPCeilingForLevel(StartAtLevel), StartAtLevel, false)
            end
        end
    else
        CreateRankBar(XNL_GetXPFloorForLevel(NewLevel), XNL_GetXPCeilingForLevel(NewLevel), XNL_CurrentPlayerXP,
            CurrentXPWithAddedXP, NewLevel, false)
    end
    XNL_CurrentPlayerXP = CurrentXPWithAddedXP
    if LevelDifference > 0 then
        XNL_OnPlayerLevelUp()
    end
end
function XNL_RemovePlayerXP(XPAmount)
    if not is_int(XPAmount) then
        return
    end
    if XPAmount < 0 then
        return
    end
    local CurrentLevel = XNL_GetLevelFromXP(XNL_CurrentPlayerXP)
    local CurrentXPWithRemovedXP = XNL_CurrentPlayerXP - XPAmount
    local NewLevel = XNL_GetLevelFromXP(CurrentXPWithRemovedXP)
    local LevelDifference = 0
    if NewLevel < 1 then
        NewLevel = 1
    end
    if CurrentXPWithRemovedXP < 0 then
        CurrentXPWithRemovedXP = 0
    end
    if NewLevel < CurrentLevel then
        LevelDifference = math.abs(NewLevel - CurrentLevel)
    end
    if LevelDifference > 0 then
        StartAtLevel = CurrentLevel
        CreateRankBar(XNL_GetXPFloorForLevel(StartAtLevel), XNL_GetXPCeilingForLevel(StartAtLevel), XNL_CurrentPlayerXP,
            XNL_GetXPFloorForLevel(StartAtLevel), StartAtLevel, true)
        for i = 1, LevelDifference, 1 do
            StartAtLevel = StartAtLevel - 1
            if i == LevelDifference then
                CreateRankBar(XNL_GetXPFloorForLevel(StartAtLevel), XNL_GetXPCeilingForLevel(StartAtLevel),
                    XNL_GetXPCeilingForLevel(StartAtLevel), CurrentXPWithRemovedXP, StartAtLevel, true)
            else
                CreateRankBar(XNL_GetXPFloorForLevel(StartAtLevel), XNL_GetXPCeilingForLevel(StartAtLevel),
                    XNL_GetXPCeilingForLevel(StartAtLevel), XNL_GetXPFloorForLevel(StartAtLevel), StartAtLevel, true)
            end
        end
    else
        CreateRankBar(XNL_GetXPFloorForLevel(NewLevel), XNL_GetXPCeilingForLevel(NewLevel), XNL_CurrentPlayerXP,
            CurrentXPWithRemovedXP, NewLevel, true)
    end
    XNL_CurrentPlayerXP = CurrentXPWithRemovedXP
    if LevelDifference > 0 then
        XNL_OnPlayerLevelsLost()
    end
end
function XNL_GetXPFloorForLevel(intLevelNr)
    if is_int(intLevelNr) then
        if intLevelNr > 7999 then
            intLevelNr = 7999
        end
        if intLevelNr < 2 then
            return 0
        end
        if intLevelNr > 100 then
            BaseXP = RockstarRanks[99]
            ExtraAddPerLevel = 50
            MainAddPerLevel = 28550
            BaseLevel = intLevelNr - 100
            CurXPNeeded = 0
            for i = 1, BaseLevel, 1 do
                MainAddPerLevel = MainAddPerLevel + 50
                CurXPNeeded = CurXPNeeded + MainAddPerLevel
            end
            return BaseXP + CurXPNeeded
        end
        return RockstarRanks[intLevelNr - 1]
    else
        return 0
    end
end
function XNL_GetXPCeilingForLevel(intLevelNr)
    if is_int(intLevelNr) then
        if intLevelNr > 7999 then
            intLevelNr = 7999
        end
        if intLevelNr < 1 then
            return 800
        end
        if intLevelNr > 99 then
            BaseXP = RockstarRanks[99]
            ExtraAddPerLevel = 50
            MainAddPerLevel = 28550
            BaseLevel = intLevelNr - 99
            CurXPNeeded = 0
            for i = 1, BaseLevel, 1 do
                MainAddPerLevel = MainAddPerLevel + 50
                CurXPNeeded = CurXPNeeded + MainAddPerLevel
            end
            return BaseXP + CurXPNeeded
        end
        return RockstarRanks[intLevelNr]
    else
        return 0
    end
end
function XNL_GetLevelFromXP(intXPAmount)
    if is_int(intXPAmount) then
        local SearchingFor = intXPAmount
        if SearchingFor < 0 then
            return 1
        end
        if SearchingFor < RockstarRanks[99] then
            local CurLevelFound = -1
            local CurrentLevelScan = 0
            for k, v in pairs(RockstarRanks) do
                CurrentLevelScan = CurrentLevelScan + 1
                if SearchingFor < v then
                    break
                end
            end
            return CurrentLevelScan
        else
            BaseXP = RockstarRanks[99]
            ExtraAddPerLevel = 50
            MainAddPerLevel = 28550
            CurXPNeeded = 0
            local CurLevelFound = -1
            for i = 1, XNL_MaxPlayerLevel - 99, 1 do
                MainAddPerLevel = MainAddPerLevel + 50
                CurXPNeeded = CurXPNeeded + MainAddPerLevel
                CurLevelFound = i
                if SearchingFor < (BaseXP + CurXPNeeded) then
                    break
                end
            end
            return CurLevelFound + 99
        end
    else
        return 1
    end
end
function CreateRankBar(XP_StartLimit_RankBar, XP_EndLimit_RankBar, playersPreviousXP, playersCurrentXP,
    CurrentPlayerLevel, TakingAwayXP)
    RankBarColor = 116
    if TakingAwayXP and XNL_UseRedBarWhenLosingXP then
        RankBarColor = 6
    end
    if not HasHudScaleformLoaded(19) then
        RequestHudScaleform(19)
        while not HasHudScaleformLoaded(19) do
            Wait(1)
        end
    end
    BeginScaleformMovieMethodHudComponent(19, "SET_COLOUR")
    PushScaleformMovieFunctionParameterInt(RankBarColor)
    EndScaleformMovieMethodReturn()
    BeginScaleformMovieMethodHudComponent(19, "SET_RANK_SCORES")
    PushScaleformMovieFunctionParameterInt(XP_StartLimit_RankBar)
    PushScaleformMovieFunctionParameterInt(XP_EndLimit_RankBar)
    PushScaleformMovieFunctionParameterInt(playersPreviousXP)
    PushScaleformMovieFunctionParameterInt(playersCurrentXP)
    PushScaleformMovieFunctionParameterInt(CurrentPlayerLevel)
    PushScaleformMovieFunctionParameterInt(100)
    EndScaleformMovieMethodReturn()
end
function is_int(n)
    if type(n) == "number" then
        if math.floor(n) == n then
            return true
        end
    end
    return false
end

local disabledSafeZonesKeys = {
	{
    	group = 2,
    	key = 37,
    	message = 'Vous n\'avez pas le niveau nécéssaire.'
    },
 	{
    	group = 0,
    	key = 24,
    	message = 'Vous n\'avez pas le niveau nécéssaire.'
	}, 
	{
    	group = 0,
    	key = 69,
    	message = 'Vous n\'avez pas le niveau nécéssaire.'
	}, 
	{
    	group = 0,
    	key = 92,
    	message = 'Vous n\'avez pas le niveau nécéssaire.'
	}, 
	{
    	group = 0,
    	key = 160,
    	message = 'Vous n\'avez pas le niveau nécéssaire.'
	}, 
	{
    	group = 0,
    	key = 45,
    	message = 'Vous n\'avez pas le niveau nécéssaire.'
	}, 
	{
    	group = 0,
    	key = 80,
    	message = 'Vous n\'avez pas le niveau nécéssaire.'
	},
	{
    	group = 0,
    	key = 140,
    	message = 'Vous n\'avez pas le niveau nécéssaire.'
	},
	{
    	group = 0,
    	key = 250,
    	message = 'Vous n\'avez pas le niveau nécéssaire.'
	},
	{
    	group = 0,
    	key = 263,
    	message = 'Vous n\'avez pas le niveau nécéssaire.'
	},
	{
    	group = 0,
    	key = 363,
    	message = 'Vous n\'avez pas le niveau nécéssaire.'
	}
}
Citizen.CreateThread(function()
    while (true) do
        if XNL_CurrentPlayerXP2 >= 0 then
            Citizen.Wait(0)
        else
            Wait(5000)
        end
		if XNL_CurrentPlayerXP2 < 0 then
			N_0x4757f00bc6323cfe(-1553120962, 0.0)
			for i = 1, #disabledSafeZonesKeys, 1 do
				DisableControlAction(disabledSafeZonesKeys[i].group, disabledSafeZonesKeys[i].key, true)

				if IsDisabledControlJustPressed(disabledSafeZonesKeys[i].group, disabledSafeZonesKeys[i].key) then
					SetCurrentPedWeapon(player, WEAPON_UNARMED, true)

					if disabledSafeZonesKeys[i].message then
						ESX.ShowAdvancedNotification("Notification", "Exelity", disabledSafeZonesKeys[i].message,"CHAR_KIRINSPECTEUR", 7)
					end
				end
			end
		end
    end
end)

function GetLevel()
    return XNL_GetLevelFromXP(XNL_CurrentPlayerXP)
end

--- todo refaire le Pass de combat avec un code + beau

RegisterNetEvent('Exelity:AccessPalier')
AddEventHandler('Exelity:AccessPalier', function(access)
    if access then
        Config.AccessPalier = true
    else
        Config.AccessPalier = false
    end
end)

RefreshPalierCount = function()
    ESX.TriggerServerCallback("Exelity:getPalier", function(palier)
        PalierCount = palier
        Citizen.Wait(1000)
    end)
end

openBattlePass = function()
    local mainMenu2 = RageUI.CreateMenu("", "ExelityPass")

    local kdo5 = true
    local kdo10 = true
    local kdo15 = true
    local kdo20 = true
    local kdo25 = true
    local kdo30 = true
    local kdo35 = true
    local kdo40 = true
    local kdo45 = true
    local kdo50 = true
    local kdo55 = true
    local kdo60 = true
    local kdo65 = true
    local kdo70 = true
    local kdo75 = true
    local kdo80 = true
    local kdo85 = true
    
    
    local Niveau5 = false
    local Niveau10 = false
    local Niveau15 = false
    local Niveau20 = false
    local Niveau25 = false
    local Niveau30 = false
    local Niveau35 = false
    local Niveau40 = false
    local Niveau45 = false
    local Niveau50 = false
    local Niveau55 = false
    local Niveau60 = false
    local Niveau65 = false
    local Niveau70 = false
    local Niveau75 = false
    local Niveau80 = false
    local Niveau85 = false

    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 5 then
        Niveau5 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 10 then
        Niveau10 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 15 then
        Niveau15 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 20 then
        Niveau20 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 25 then
        Niveau25 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 30 then
        Niveau30 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 35 then
        Niveau35 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 40 then
        Niveau40 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 45 then
        Niveau45 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 50 then
        Niveau50 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 55 then
        Niveau55 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 60 then
        Niveau60 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 65 then
        Niveau65 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 70 then
        Niveau70 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 75 then
        Niveau75 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 80 then
        Niveau80 = true
    end
    if XNL_GetLevelFromXP(XNL_CurrentPlayerXP) >= 85 then
        Niveau85 = true
    end

    RageUI.Visible(mainMenu2, not RageUI.Visible(mainMenu2))

    while mainMenu2 do
        RageUI.IsVisible(mainMenu2, function()
            RageUI.Separator("Votre Niveau : ~p~"..XNL_GetLevelFromXP(XNL_CurrentPlayerXP).."~w~")
            RageUI.Separator("Début : 1 ~p~Juin~w~ - Fin : 1 ~p~Août~w~")
            RageUI.Separator("")

            RageUI.Button("~p~Niveau 5~w~ - 15x Burger", "Vous avez besoin d'être au niveau ~p~5~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau5 , {
                onSelected = function()
                    if kdo5 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 0 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 5 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 5);
                                RageUI.CloseAll()
                                kdo5 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 10~w~ - 15x Fanta", "Vous avez besoin d'être au niveau ~p~10~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau10 , {
                onSelected = function()
                    if kdo10 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 5 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 10 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 10);
                                RageUI.CloseAll()
                                kdo10 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 15~w~ - 10.000$", "Vous avez besoin d'être au niveau ~p~15~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau15 , {
                onSelected = function()
                    if kdo15 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 10 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 15 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 15);
                                RageUI.CloseAll()
                                kdo15 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 20~w~ - Prairie (Voiture)", "Vous avez besoin d'être au niveau ~p~20~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau20 , {
                onSelected = function()
                    if kdo20 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 15 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 20 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 20);
                                RageUI.CloseAll()
                                kdo5 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 25~w~ - 5x Bandage", "Vous avez besoin d'être au niveau ~p~25~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau25 , {
                onSelected = function()
                    if kdo25 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 20 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 25 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 25);
                                RageUI.CloseAll()
                                kdo25 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 30~w~ - Freecrawler (Voiture)", "Vous avez besoin d'être au niveau ~p~30~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau30 , {
                onSelected = function()
                    if kdo30 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 25 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 30 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 30);
                                RageUI.CloseAll()
                                kdo30 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 35~w~ - 50.000$", "Vous avez besoin d'être au niveau ~p~35~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau35 , {
                onSelected = function()
                    if kdo35 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 30 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 35 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 35);
                                RageUI.CloseAll()
                                kdo35 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 40~w~ - 250 ExelityCoins", "Vous avez besoin d'être au niveau ~p~40~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau40 , {
                onSelected = function()
                    if kdo40 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 35 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 40 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 40);
                                RageUI.CloseAll()
                                kdo40 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 45~w~ - Toros (Voiture)", "Vous avez besoin d'être au niveau ~p~45~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau45 , {
                onSelected = function()
                    if kdo45 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 40 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 45 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 45);
                                RageUI.CloseAll()
                                kdo45 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 50~w~ - 30.000$", "Vous avez besoin d'être au niveau ~p~50~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau50 , {
                onSelected = function()
                    if kdo50 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 45 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 50 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 50);
                                RageUI.CloseAll()
                                kdo50 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 55~w~ - 250 ExelityCoins", "Vous avez besoin d'être au niveau ~p~55~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau55 , {
                onSelected = function()
                    if kdo55 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 50 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 55 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 55);
                                RageUI.CloseAll()
                                kdo55 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 60~w~ - 10x Chargeur", "Vous avez besoin d'être au niveau ~p~60~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau60 , {
                onSelected = function()
                    if kdo60 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 55 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 60 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 60);
                                RageUI.CloseAll()
                                kdo60 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 65~w~ - 250 ExelityCoins", "Vous avez besoin d'être au niveau ~p~65~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau65 , {
                onSelected = function()
                    if kdo65 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 60 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 65 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 65);
                                RageUI.CloseAll()
                                kdo65 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 70~w~ - Locust (Voiture)", "Vous avez besoin d'être au niveau ~p~70~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau70 , {
                onSelected = function()
                    if kdo70 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 65 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 70 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 70);
                                RageUI.CloseAll()
                                kdo70 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 75~w~ - 500 ExelityCoins", "Vous avez besoin d'être au niveau ~p~75~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau75 , {
                onSelected = function()
                    if kdo75 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 70 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 75 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 75);
                                RageUI.CloseAll()
                                kdo75 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 80~w~ - 2x Medikit", "Vous avez besoin d'être au niveau ~p~80~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau80 , {
                onSelected = function()
                    if kdo80 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 75 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 80 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 80);
                                RageUI.CloseAll()
                                kdo80 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })

            RageUI.Button("~p~Niveau 85~w~ - Voiture Mystère", "Vous avez besoin d'être au niveau ~p~85~s~ pour déverrouiller ce palier", {RightLabel = "→→"}, Niveau85 , {
                onSelected = function()
                    if kdo85 then
                        if (type(PalierCount) == "number") then
                            if tonumber(PalierCount) < 80 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous devez récupérer les récompenses d'avant !","CHAR_KIRINSPECTEUR", 7)
                                return
                            end
                            if tonumber(PalierCount) >= 85 then
                                ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                            else
                                
                                TriggerServerEvent('Exelity:gift', 85);
                                RageUI.CloseAll()
                                kdo85 = false
                            end
                        end
                    else
                        ESX.ShowAdvancedNotification("Notification", "Exelity", "Vous avez déjà récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7)
                    end
                end
            })
        end)
        if not RageUI.Visible(mainMenu2) then
            mainMenu2 = RMenu:DeleteType(mainMenu2, true)
        end
        Citizen.Wait(0)
    end
end

RegisterCommand('ExelityPass', function()
    ESX.TriggerServerCallback("Exelity:getPalier", function(palier)
        print(palier)
        PalierCount = palier
        Citizen.Wait(500)
        openBattlePass()
    end)
end)
