--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil
local ILALEPERMISMEK = false
local ILALEPPAMEK = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.Get.ESX, function(obj)
            ESX = obj
        end)
        ESX.PlayerData = ESX.GetPlayerData()
        Citizen.Wait(10)
    end
    while ESX.PlayerData.job == nil do
        Citizen.Wait(100)
    end

    WeaponData = ESX.GetWeaponList()

    for i = 1, #WeaponData, 1 do
        if WeaponData[i].name == 'WEAPON_UNARMED' then
            WeaponData[i] = nil
        else
            WeaponData[i].hash = GetHashKey(WeaponData[i].name)
        end
    end
end)

RegisterNetEvent('send:me')
AddEventHandler('send:me', function(message)
    ExecuteCommand("me "..message.."")
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
    RefreshMoney()
end)

RegisterNetEvent('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
    RefreshMoney2()
end)


function RefreshMoney()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
        ESX.TriggerServerCallback('pSociety:getSocietyMoney', function(money)
            societymoney = ESX.Math.GroupDigits(money)
        end, ESX.PlayerData.job.name)
    end
end

function RefreshMoney2()
    if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' then
        ESX.TriggerServerCallback('pSociety:getSocietyMoney', function(money)
            societymoney2 = ESX.Math.GroupDigits(money)
        end, ESX.PlayerData.job2.name)
    end
end

Player = {
	isDead = false,
	inAnim = false,
	ragdoll = false,
	crouched = false,
	handsup = false,
	pointing = false,
	minimap = true,
	ui = true,
	noclip = false,
	godmode = false,
	ghostmode = false,
	showCoords = false,
	showName = false,
	gamerTags = {}
}

loadAnimDict = function(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(0)
    end
end

object = {}
local inventaire = false
local status = true
local canChange = true

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

local PersonalMenu = {
    billing = {},
    engineActionList = {
        "Allumer",
        "Éteindre",
    },
    maxSpeedList = {
        "50",
        "80",
        "120",
        "130",
        "Retirer",
    },
    maxSpeedListIndex = 1,
    engineActionIndex = 1,
}

local ItemSelected = {}
local engineCoolDown = false
local bank = nil
local sale = nil
local extraList = {"n°1","n°2","n°3","n°4","n°5","n°6","n°7","n°8","n°9","n°10","n°11","n°12","n°13","n°14","n°15"}
local extraIndex = 1
local extraCooldown = false
local extraStateIndex = 1
local doorActionIndex = 1

function GetCurrentWeight()
	local currentWeight = 0

	for i = 1, #ESX.PlayerData.inventory, 1 do
		if ESX.PlayerData.inventory[i].count > 0 then
			currentWeight = currentWeight + (ESX.PlayerData.inventory[i].weight * ESX.PlayerData.inventory[i].count)
		end
	end

	return currentWeight
end

function getvehicleskey()
    getplayerkeys = {}
    ESX.TriggerServerCallback('esx_vehiclelock:allkey', function(mykey)
        for i = 1, #mykey, 1 do
			if mykey[i].NB == 1 then
				table.insert(getplayerkeys, {label = 'Clés : '.. ' [' .. mykey[i].plate .. ']', value = mykey[i].plate})
			elseif mykey[i].NB == 2 then
				table.insert(getplayerkeys, {label = '[DOUBLE] Véhicule : '.. ' [' .. mykey[i].plate .. ']', value = nil})
			end
		end
    end)
end

function OpenRzInteract()
    RefreshMoney()
    RefreshMoney2()
    if PersonalMenu.Menu then 
        PersonalMenu.Menu = false 
        RageUIv1.Visible(RMenuv1:Get('personalmenu', 'main'), false)
        return
    else
        RMenuv1.Add('personalmenu', 'main', RageUIv1.CreateMenu("", "Test"))
        RMenuv1.Add('personalmenu', 'inventory', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "main"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'inventory_use', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "inventory"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'wallet', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "main"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'weapon', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "main"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'gestion', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "main"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'keys', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "gestion"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'keysmanagement', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "keys"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'gestionveh', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "main"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'clothes', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "main"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'boss', RageUIv1.CreateSubMenu(RMenuv1:Get('personalmenu', 'gestion'),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'boss2', RageUIv1.CreateSubMenu(RMenuv1:Get('personalmenu', 'gestion'),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'touches', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "main"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'portefeuille_money', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "wallet"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'portefeuille_blackmoney', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "wallet"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'portefeuille_work', RageUIv1.CreateSubMenu(RMenuv1:Get('personalmenu', 'wallet'), "", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'papers', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "wallet"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'billing', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "wallet"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'autres', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "main"),"", "Menu d'intéraction"))
        RMenuv1.Add('personalmenu', 'visual', RageUIv1.CreateSubMenu(RMenuv1:Get("personalmenu", "main"),"", "Menu d'intéraction"))
        RMenuv1:Get('personalmenu', 'main'):SetSubtitle("Menu d'intéraction")
        RMenuv1:Get('personalmenu', 'main').EnableMouse = false
        RMenuv1:Get('personalmenu', 'main').Closed = function()
            PersonalMenu.Menu = false
            refresh()
        end
        PersonalMenu.Menu = true 
        RageUIv1.Visible(RMenuv1:Get('personalmenu', 'main'), true)
        Citizen.CreateThread(function()
			while PersonalMenu.Menu do
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'main'), true, true, true, function()
                    ESX.PlayerData = ESX.GetPlayerData()
                    pGrade = ESX.PlayerData.job.grade_name
                    pGrade2 = ESX.PlayerData.job2.grade_name
                    RageUIv1.Separator("[  Joueur : ~p~".. GetPlayerName(PlayerId()) .."~s~ | ID : ~p~"..GetPlayerServerId(PlayerId()).."~s~  ]")
                    RageUIv1.ButtonWithStyle("Mes poches", nil, { RightLabel = "→→" },true, function()
                    end, RMenuv1:Get('personalmenu', 'inventory'))
                    RageUIv1.ButtonWithStyle("Vêtement", nil, { RightLabel = "→→" },true, function()
                    end, RMenuv1:Get('personalmenu', 'clothes'))
                    RageUIv1.ButtonWithStyle("Informations", nil, { RightLabel = "→→" },true, function()
                    end, RMenuv1:Get('personalmenu', 'wallet'))
                    RageUIv1.ButtonWithStyle("Touches", nil, { RightLabel = "→→" },true, function()
                    end, RMenuv1:Get('personalmenu', 'touches'))
                    RageUIv1.ButtonWithStyle("Armes", nil, { RightLabel = "→→" },true, function(h,a,s)
                    end, RMenuv1:Get('personalmenu', 'weapon'))
                    RageUIv1.ButtonWithStyle("Gestions", nil, { RightLabel = "→→" },true, function(h,a,s)
                    end, RMenuv1:Get('personalmenu', 'gestion'))
                    if IsPedSittingInAnyVehicle(PlayerPedId()) then
						RageUIv1.ButtonWithStyle("Véhicule", nil, {RightLabel = "→→"},true, function()
						end, RMenuv1:Get('personalmenu', 'gestionveh'))
					end
                    RageUIv1.ButtonWithStyle("Ouvrir le ExelityPass", nil,{ RightLabel = "→→" }, true, function(_,_,s)
                        if s then 
                            ExecuteCommand("ExelityPass")
                            RageUIv1.CloseAll()
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Autres", nil, { RightLabel = "→→" },true, function(h,a,s)
                    end, RMenuv1:Get('personalmenu', 'autres')) 
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'weapon'), true, true, true, function()
                    for i = 1, #WeaponData, 1 do
                        if HasPedGotWeapon(PlayerPedId(), WeaponData[i].hash, false) then
                            local ammo = GetAmmoInPedWeapon(Ped, WeaponData[i].hash)
            
                            RageUIv1.ButtonWithStyle(""..WeaponData[i].label, "Munition(s) : ~c~x"..ammo, {RightLabel = "~p~Donner~s~ →"}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local isPermanent = ESX.IsWeaponPermanent(WeaponData[i].name)
                                    if isPermanent then
                                        ESX.ShowNotification("Vous ne pouvez pas donner cette arme !")
                                        return
                                    else
                                        local playerdst, distance = ESX.Game.GetClosestPlayer()
                                        if playerdst ~= -1 and distance <= 2.0 then
                                            local closestPed = GetPlayerPed(playerdst)
                                            if IsPedOnFoot(closestPed) then
                                                local ammo = GetAmmoInPedWeapon(PlayerPedId(), WeaponData[i].hash)
                                                TriggerServerEvent('interact:sendLogsGiveWeapon', WeaponData[i].label, GetPlayerServerId(playerdst))
                                                TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(playerdst), "item_weapon", WeaponData[i].name, ammo)
                                                RageUIv1.CloseAll()
                                                PersonalMenu.Menu = false
                                            else
                                             RageUIv1.Popup({message = "~r~Impossible~s~ de donner une arme dans un véhicule."})
                                            end
                                        else
                                             ESX.ShowNotification("~r~Personne autour de vous !")
                                        end             
                                    end
                                end
                            end)
                        end
                    end
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'gestion'), true, true, true, function()
                    --[[
                    RageUIv1.ButtonWithStyle("Gestion des clés", nil, { RightLabel = "→→" },true, function(h,a,s)
                        if s then
                            getvehicleskey()
                        end
                    end, RMenuv1:Get('personalmenu', 'keys'))
                    ]]
                    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'bossassistantboss' then

                        RageUIv1.ButtonWithStyle("Gestion d'entreprise", nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                        end
                    end, RMenuv1:Get('personalmenu', 'boss'))
                else
                    RageUIv1.ButtonWithStyle("Gestion d'entreprise", "Vous devez être patron pour y accéder.", {RightBadge = RageUIv1.BadgeStyle.Lock}, false, function(Hovered, Active, Selected)
                        if Selected then
                            end
                        end)
                    end 
                    if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' then

                        RageUIv1.ButtonWithStyle("Gestion Organisation", nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                            if Selected then
                        end
                    end, RMenuv1:Get('personalmenu', 'boss2'))
                else
                    RageUIv1.ButtonWithStyle("Gestion Organisation", "Vous devez être jefe pour y accéder.", {RightBadge = RageUIv1.BadgeStyle.Lock}, false, function(Hovered, Active, Selected)
                        if Selected then
                            end
                        end)
                    end 
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'keys'), true, true, true, function()
                    for k,v in pairs(getplayerkeys) do
                        RageUIv1.ButtonWithStyle(""..v.label, nil, {RightLabel = ""}, true, function(h,a,s)  
                            if s then
                                v.value = actualvalue
                            end
                        end,RMenuv1:Get("personalmenu","keysmanagement"))
                    end
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'clothes'), true, true, true, function()

                    RageUIv1.ButtonWithStyle("Haut", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "haut")
                        end
                    end)                    
                    RageUIv1.ButtonWithStyle("Chapeau/Casque", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "casque")
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Bas", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "bas")
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Chaussures", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "chaussures")
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Sac", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "sac")
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Gilet par Balles", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "gilet")
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Masque", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "masque")
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Lunette", nil, { RightBadge = RageUIv1.BadgeStyle.Clothes }, true,function(h,a,s)
                        if s then
                            TriggerEvent("requestClothes", "lunette")
                        end
                    end)

                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'touches'), true, true, true, function()
                    RageUIv1.ButtonWithStyle("Téléphone ", nil, {RightLabel = "G"},true, function(h,a,s)  
                        if s then   

                        end
                    end) 

                    RageUIv1.ButtonWithStyle("Menu Emotes ", nil, {RightLabel = "K"},true, function(h,a,s)  
                    if s then   
        
                        end
                    end)

                    RageUIv1.ButtonWithStyle("Menu Personnel ", nil, {RightLabel = "F5"},true, function(h,a,s)  
                        if s then   
            
                        end
                    end)

                    RageUIv1.ButtonWithStyle("Menu Métiers ", nil, {RightLabel = "F6"},true, function(h,a,s)  
                        if s then   
                
                        end
                    end)

                    RageUIv1.ButtonWithStyle("Menu Radio", nil, {RightLabel = "F3"},true, function(h,a,s)  
                        if s then   
                    
                        end
                    end)

                    RageUIv1.ButtonWithStyle("Vérouiller/ Déverouiller son véhicule ", nil, {RightLabel = "U"},true, function(h,a,s)  
                        if s then   
        
                        end
                    end) 

                    RageUIv1.ButtonWithStyle("Mode de Voix", nil, {RightLabel = "F11"},true, function(h,a,s)  
                        if s then   
            
                        end
                    end)

                    RageUIv1.ButtonWithStyle("Coffre de Vehicule ", nil, {RightLabel = "L"},true, function(h,a,s)  
                        if s then   
            
                        end
                    end)
            
                    RageUIv1.ButtonWithStyle("Annuler Annimation ", nil, {RightLabel = "X"},true, function(h,a,s)  
                        if s then   
            
                        end
                    end)

                    RageUIv1.ButtonWithStyle("Lever les Mains", nil, {RightLabel = "H"},true, function(h,a,s)  
                        if s then   
            
                        end
                    end)

                    RageUIv1.ButtonWithStyle("Montrer du Doigt ", nil, {RightLabel = "B"},true, function(h,a,s)  
                        if s then   
            
                        end
                    end)
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'keysmanagement'), true, true, true, function()
                    local player, distance = ESX.Game.GetClosestPlayer()
					local playerPed = PlayerPedId()
					local plyCoords = GetEntityCoords(playerPed, false)
					local vehicle = GetClosestVehicle(plyCoords, 7.0, 0, 71)
					local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
					local vehPlate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
                    RageUIv1.ButtonWithStyle("Donner le véhicule/clés", nil, {RightLabel = ""}, true, function(h,a,s)  
                        if s then
							if distance ~= -1 and distance <= 3.0 then
								TriggerServerEvent('esx_vehiclelock:changeowner', GetPlayerServerId(player), vehPlate, vehicleProps)
							else
								ESX.ShowNotification("Aucun joueur à proximité")
							end
                        end
                    end)
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'visual'), true, true, true, function()
                    RageUIv1.Checkbox('Vue & lumières améliorées', nil, Player.VISUAL1, {}, function(h,a,s)
                        if s then
                            Player.VISUAL1 = not Player.VISUAL1
                            if Player.VISUAL1 == true then
                                SetTimecycleModifier('tunnel')
                            else
                                SetTimecycleModifier('')
                            end
                        end
                    end)

                    RageUIv1.Checkbox('Vue & lumières améliorées x2', nil, Player.VISUAL2, {}, function(h,a,s)
                        if s then
                            Player.VISUAL2 = not Player.VISUAL2
                            if Player.VISUAL2 == true then
                                SetTimecycleModifier('CS3_rail_tunnel')
                            else
                                SetTimecycleModifier('')
                            end
                        end
                    end)

                    RageUIv1.Checkbox('Vue & lumières améliorées x3', nil, Player.VISUAL3, {}, function(h,a,s)
                        if s then
                            Player.VISUAL3 = not Player.VISUAL3
                            if Player.VISUAL3 == true then
                                SetTimecycleModifier('MP_lowgarage')
                            else
                                SetTimecycleModifier('')
                            end
                        end
                    end)

                    RageUIv1.Checkbox('Vue lumineux', nil, Player.VISUAL4, {}, function(h,a,s)
                        if s then
                            Player.VISUAL4 = not Player.VISUAL4
                            if Player.VISUAL4 == true then
                                SetTimecycleModifier('rply_vignette_neg')
                            else
                                SetTimecycleModifier('')
                            end
                        end
                    end)

                    RageUIv1.Checkbox('Vue lumineux x2', nil, Player.VISUAL5, {}, function(h,a,s)
                        if s then
                            Player.VISUAL5 = not Player.VISUAL5
                            if Player.VISUAL5 == true then
                                SetTimecycleModifier('rply_saturation_neg')
                            else
                                SetTimecycleModifier('')
                            end
                        end
                    end)

                    RageUIv1.Checkbox('Couleurs amplifiées', nil, Player.VISUAL6, {}, function(h,a,s)
                        if s then
                            Player.VISUAL6 = not Player.VISUAL6
                            if Player.VISUAL6 == true then
                                SetTimecycleModifier('rply_saturation')
                            else
                                SetTimecycleModifier('')
                            end
                        end
                    end)

                    RageUIv1.Checkbox('Noir & blancs', nil, Player.VISUAL7, {}, function(h,a,s)
                        if s then
                            Player.VISUAL7 = not Player.VISUAL7
                            if Player.VISUAL7 == true then
                                SetTimecycleModifier('rply_saturation_neg')
                            else
                                SetTimecycleModifier('')
                            end
                        end
                    end)

                    RageUIv1.Checkbox('Visual 1', nil, Player.VISUAL8, {}, function(h,a,s)
                        if s then
                            Player.VISUAL8 = not Player.VISUAL8
                            if Player.VISUAL8 == true then
                                SetTimecycleModifier('yell_tunnel_nodirect')
                            else
                                SetTimecycleModifier('')
                            end
                        end
                    end)

                    RageUIv1.Checkbox('Blanc', nil, Player.VISUAL9, {}, function(h,a,s)
                        if s then
                            Player.VISUAL9 = not Player.VISUAL9
                            if Player.VISUAL9 == true then
                                SetTimecycleModifier('rply_contrast_neg')
                            else
                                SetTimecycleModifier('')
                            end
                        end
                    end)

                    RageUIv1.Checkbox('Dégats', nil, Player.VISUAL10, {}, function(h,a,s)
                        if s then
                            Player.VISUAL10 = not Player.VISUAL10
                            if Player.VISUAL10 == true then
                                SetTimecycleModifier('rply_vignette')
                            else
                                SetTimecycleModifier('')
                            end
                        end
                    end)
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'autres'), true, true, true, function()
                    RageUIv1.ButtonWithStyle('Personnage ID :', nil, {RightLabel = GetPlayerServerId(PlayerId())}, true, function() end)
                    RageUIv1.ButtonWithStyle('Numéro de Compte :', nil, {RightLabel = ESX.PlayerData.character_id}, true, function() end)
                    RageUIv1.Checkbox('Interface GPS', nil, Player.minimap, {}, function(h,a,s)
                        if s then
                            Player.minimap = not Player.minimap
                            DisplayRadar(Player.minimap)
                        end
                    end)
                    RageUIv1.Checkbox('Masquer l\'interface', nil, Player.hud, {}, function(h,a,s)
                        if s then
                            Player.hud = not Player.hud
                            if Player.hud == true then
                                TriggerEvent('Hud:hide', false)
                            else
                                TriggerEvent('Hud:hide', true)
                            end
                        end
                    end)
                    RageUIv1.Checkbox('Désactiver Casque de moto', nil, Player.casque, {}, function(h,a,s)
                        if s then
                            Player.casque = not Player.casque
                            if Player.casque == true then
                                SetPedHelmet(PlayerPedId(), false)
                            else
                                SetPedHelmet(PlayerPedId(), true)
                            end
                        end
                    end)
                    RageUIv1.Checkbox('Activé la vente de drogue', nil, Player.drogue, {}, function(h,a,s)
                        if s then
                            Player.drogue = not Player.drogue
                            if Player.drogue == false then
                                ExecuteCommand("ventedrogue")
                            else
                                ExecuteCommand("ventedrogue")
                            end
                        end
                    end)            
                    RageUIv1.ButtonWithStyle("Ouvrir le menu VIP", nil,{ RightLabel = "→" }, true, function(_,_,s)
                        if s then 
                            ExecuteCommand("vip")
                            RageUIv1.CloseAll()
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Visual", nil, { RightLabel = "→→" },true, function(h,a,s)
                    end, RMenuv1:Get('personalmenu', 'visual'))
                    --[[RageUIv1.ButtonWithStyle("Ouvrir le menu voiturier", nil,{ RightLabel = "~r~Indisponible~s~" }, false, function(_,_,s)
                        if s then 
                            ExecuteCommand("voiture");
                            RageUIv1.CloseAll();
                        end
                    end)]]
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'gestionveh'), true, true, true, function()
                    if IsPedSittingInAnyVehicle(PlayerPedId()) then
                        RageUIv1.List("Action moteur", PersonalMenu.engineActionList, PersonalMenu.engineActionIndex, nil, {}, not engineCoolDown, function(h,a,s, Index)
                            if s then        
                                if Index == 1 then
                                    SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(),false),true,true,false)
                                else
                                    SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(),false),false,true,true)
                                end
                                engineCoolDown = true
                                Citizen.SetTimeout(1000, function()
                                    engineCoolDown = false
                                end)
                            end
                
                            PersonalMenu.engineActionIndex = Index
                        end)
                        RageUIv1.List("Limiteur de vitesse", PersonalMenu.maxSpeedList, PersonalMenu.maxSpeedListIndex, nil, {}, true, function(h,a,s, Index)
                            if s then        
                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                if Index == 1 then
                                    SetVehicleMaxSpeed(vehicle, 13.7)
                                elseif Index == 2 then
                                    SetVehicleMaxSpeed(vehicle, 22.0)
                                elseif Index == 3 then
                                    SetVehicleMaxSpeed(vehicle, 33.0)
                                elseif Index == 4 then
                                    SetVehicleMaxSpeed(vehicle, 36.0)
                                elseif Index == 5 then
                                    SetVehicleMaxSpeed(vehicle, 0.0)
                                end
                            end
                
                            PersonalMenu.maxSpeedListIndex = Index
                        end)
                        if ESX.PlayerData.job.label == "Police" or ESX.PlayerData.job.label == "B.C.S.O" then
                            RageUIv1.List("Extra du véhicule", extraList, extraIndex, nil, {}, true, function(h,a,s, Index)
                                if s then
                                    if isAllowedToManageVehicle() then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
                                        if not vehicleIsDamaged() then
                                            if Index == 1 then
                                                SetVehicleExtra(vehicle,1)
                                                ESX.Game.SetVehicleProperties(vehicle, {
                                                    modFender = 0
                                                })
                                            elseif Index == 2 then
                                                SetVehicleExtra(vehicle,2)
                                            elseif Index == 3 then
                                                SetVehicleExtra(vehicle,3)
                                            elseif Index == 4 then
                                                SetVehicleExtra(vehicle,4)
                                            elseif Index == 5 then
                                                SetVehicleExtra(vehicle,5)
                                            elseif Index == 6 then
                                                SetVehicleExtra(vehicle,6)
                                            elseif Index == 7 then
                                                SetVehicleExtra(vehicle,7)
                                            elseif Index == 8 then
                                                SetVehicleExtra(vehicle,8)
                                            elseif Index == 9 then
                                                SetVehicleExtra(vehicle,9)
                                            elseif Index == 10 then
                                                SetVehicleExtra(vehicle,10)
                                            elseif Index == 11 then
                                                SetVehicleExtra(vehicle,11)
                                            elseif Index == 12 then
                                                SetVehicleExtra(vehicle,12)
                                            elseif Index == 13 then
                                                SetVehicleExtra(vehicle,13)
                                            elseif Index == 14 then
                                                SetVehicleExtra(vehicle,14)
                                            elseif Index == 15 then
                                                SetVehicleExtra(vehicle,15)
                                            end
                                        end
                                    end
                                end
                                extraIndex = Index
                            end)
                            RageUIv1.ButtonWithStyle("Extra ~g~ON", nil, {}, not extraCooldown, function(_,_,s)
                                if s then
                                    if isAllowedToManageVehicle() then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
                                        if not vehicleIsDamaged() then
                                            SetVehicleExtra(vehicle,extraIndex,0)
                                            ESX.Game.SetVehicleProperties(vehicle, {
                                                modFender = 0
                                            })
                                            extraCooldown = true
                                            Citizen.SetTimeout(150, function()
                                                extraCooldown = false
                                            end)
                                        else
                                            ESX.ShowNotification("Ton véhicule est trop endommagé pour pouvoir y apporter des modificiations.")
                                        end
                                    end  
                                end
                            end)
            
                            RageUIv1.ButtonWithStyle("Extra ~r~OFF", nil, {}, not extraCooldown, function(_,_,s)
                                if s then
                                    if isAllowedToManageVehicle() then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
                                        if not vehicleIsDamaged() then
                                            SetVehicleExtra(vehicle,extraIndex,1)
                                            ESX.Game.SetVehicleProperties(vehicle, {
                                                modFender = 1
                                            })
                                            extraCooldown = true
                                            Citizen.SetTimeout(150, function()
                                                extraCooldown = false
                                            end)
                                        else
                                            ESX.ShowNotification("Ton véhicule est trop endommagé pour pouvoir y apporter des modificiations.")
                                        end
                                    end  
                                end
                            end)
                            RageUIv1.List("Tous les extras", {"Activer","Désactiver"}, extraStateIndex, nil, {}, not extraCooldown, function(h,a,s, Index)
                                if s then
                                    if isAllowedToManageVehicle() then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
                                        if not vehicleIsDamaged() then
                                            if Index == 1 then
                                                for index,_ in pairs(extraList) do
                                                    SetVehicleExtra(vehicle,index,0)
                                                end
                                            else
                                                for index,_ in pairs(extraList) do
                                                    SetVehicleExtra(vehicle,index,1)
                                                end
                                            end
                                            extraCooldown = true
                                            Citizen.SetTimeout(150, function()
                                                extraCooldown = false
                                            end)
                                        else
                                            ESX.ShowNotification("Ton véhicule est trop endommagé pour pouvoir y apporter des modificiations.")
                                        end
                                    end
                                end
                                extraStateIndex = Index
                            end)
                            
                        end
                        RageUIv1.List("Action portes", {"Ouvrir","Fermer"}, doorActionIndex, nil, {}, true, function(h,a,s, Index)
                            doorActionIndex = Index
                        end)
        
                        RageUIv1.ButtonWithStyle("Tout le véhicule", nil, {}, not doorCoolDown, function(_,_,s)
                            if s then
                                if isAllowedToManageVehicle() then doorAction(-1) end
                            end
                        end)
        
                        RageUIv1.ButtonWithStyle("Porte avant-gauche", nil, {}, not doorCoolDown, function(_,_,s)
                            if s then
                                if isAllowedToManageVehicle() then doorAction(0) end 
                            end
                        end)
        
                        RageUIv1.ButtonWithStyle("Porte avant-droite", nil, {}, not doorCoolDown, function(_,_,s)
                            if s then
                                if isAllowedToManageVehicle() then doorAction(1) end 
                            end
                        end)
        
                        RageUIv1.ButtonWithStyle("Porte arrière-gauche", nil, {}, not doorCoolDown, function(_,_,s)
                            if s then
                                if isAllowedToManageVehicle() then doorAction(2) end 
                            end
                        end)
        
                        RageUIv1.ButtonWithStyle("Porte arrière-droite", nil, {}, not doorCoolDown, function(_,_,s)
                            if s then
                                if isAllowedToManageVehicle() then doorAction(3) end 
                            end
                        end)
        
                        RageUIv1.ButtonWithStyle("Capot", nil, {}, not doorCoolDown, function(_,_,s)
                            if s then
                                if isAllowedToManageVehicle() then doorAction(4) end 
                            end
                        end)
        
                        RageUIv1.ButtonWithStyle("Coffre", nil, {}, not doorCoolDown, function(_,_,s)
                            if s then
                                if isAllowedToManageVehicle() then doorAction(5) end
                            end
                        end)
                    else
                        RageUIv1.GoBack()
                    end
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'inventory'), true, true, true, function()
                    ESX.PlayerData = ESX.GetPlayerData()
                    RageUIv1.Separator("~p~Inventaire~s~ ".. GetCurrentWeight().." / 45.0")
                    for i = 1, #ESX.PlayerData.inventory, 1 do
                        if ESX.PlayerData.inventory[i].count > 0 then
                            local invCount = {}

                            for i = 1, ESX.PlayerData.inventory[i].count, 1 do
                                table.insert(invCount, i)
                            end

                            RageUIv1.ButtonWithStyle(""..ESX.PlayerData.inventory[i].label .. ' ~p~(' .. ESX.PlayerData.inventory[i].count .. ')~s~', nil, {}, true, function(h, a, s)
                                if s then
                                    ItemSelected = ESX.PlayerData.inventory[i]
                                end
                            end, RMenuv1:Get('personalmenu', 'inventory_use'))
                        end
                    end
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'inventory_use'), true, true, true, function()
                    RageUIv1.Separator(ItemSelected.label.." ~p~("..ItemSelected.count..")")
                    RageUIv1.ButtonWithStyle("Utiliser", nil, {}, true, function(h, a, s)
                        if s then
                            TriggerServerEvent('esx:useItem', ItemSelected.name)
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Donner", nil, {}, true, function(h, a, s)
                        if a then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            if closestPlayer ~= -1 and closestDistance <= 3 then
                                playerMarker(closestPlayer)
                            end
                        end
                        if s then
                            local sonner,quantity = CheckQuantity(CustomAmount())
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            local pPed = PlayerPedId()
                            local coords = GetEntityCoords(pPed)
                            local x,y,z = table.unpack(coords)
                            if sonner then
                                if closestDistance ~= -1 and closestDistance <= 3 then
                                    local closestPed = GetPlayerPed(closestPlayer)

                                    if IsPedOnFoot(closestPed) then
                                        TriggerServerEvent('interact:sendLogsGive', ItemSelected.name, quantity, GetPlayerServerId(closestPlayer))
                                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_standard', ItemSelected.name, quantity)
                                    else
                                        ESX.ShowNotification("~p~Menu personnel~s~\nvous ne pouvez pas donner d'item en étant dans une voiture")
                                    end
                                else
                                    ESX.ShowNotification("Aucun joueur à proximité !")
                                end
                            end
                        end
                    end) 
                    RageUIv1.ButtonWithStyle("Jeter", nil, {}, true, function(h,a,s)
                        if s then
                            local sonner,quantity = CheckQuantity(CustomAmount())
                            if sonner then
                                if IsPedInAnyVehicle(PlayerPedId(), true) then
                                    ESX.ShowNotification("vous ne pouvez pas jeter d'item en étant dans une voiture")
                                else
                                    ExecuteCommand("me jete "..quantity.." "..ItemSelected.label.." par terre")
                                    TriggerServerEvent('esx:dropInventoryItem', 'item_standard', ItemSelected.name, quantity)
                                    RageUIv1.GoBack()
                                end
                            else
                                ESX.ShowNotification("Valeur incorrect")
                            end
                        end
                    end) 
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'wallet'), true, true, true, function()
                    RageUIv1.Separator("Emploi ~c~→ ~p~" .. ESX.PlayerData.job.label .. "~s~ - ~p~" .. ESX.PlayerData.job.grade_label)
                    RageUIv1.Separator("Gang/Orga ~c~→ ~p~" .. ESX.PlayerData.job2.label .. "~s~ - ~p~" .. ESX.PlayerData.job2.grade_label)
                    ESX.PlayerData = ESX.GetPlayerData()
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'cash'  then
                            cash = RageUIv1.ButtonWithStyle('Argent en Liquide :', description, {RightLabel = "~g~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.." ~g~$")}, true, function(h, a, s) 
                            end, RMenuv1:Get('personalmenu', 'portefeuille_money'))
                        end
                    end
            
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'bank'  then
                            bank = RageUIv1.ButtonWithStyle('Argent en Banque :', description, {RightLabel = "~p~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.." ~p~$")}, true, function(h, a, s) 
                        if s then
                            ESX.ShowNotification("~p~Menu personnel~s~\nMerci de vous rendre dans une banque")
                        end 
                    end)
            
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'dirtycash'  then
                            sale = RageUIv1.ButtonWithStyle('Source inconnue :', description, {RightLabel = "~c~"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.." ~c~$")}, true, function() 
                            end, RMenuv1:Get('personalmenu', 'portefeuille_blackmoney'))
                        end
                    end
                        end
                    end
                    RageUIv1.ButtonWithStyle("Papiers", nil, { RightLabel = "→→" },true, function()
                    end, RMenuv1:Get('personalmenu', 'papers'))
                    RageUIv1.ButtonWithStyle("Factures", nil, { RightLabel = "→→" },true, function(h,a,s)
                        if s then
                            RefreshBilling()
                        end
                    end, RMenuv1:Get('personalmenu', 'billing'))
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'billing'), true, true, true, function()
                    if #PersonalMenu.billing == 0 then
                        RageUIv1.Separator("")
                        RageUIv1.Separator("~r~Vous n'avez aucune facture")
                        RageUIv1.Separator("")
                    end
                    for i = 1, #PersonalMenu.billing, 1 do
						RageUIv1.ButtonWithStyle(""..PersonalMenu.billing[i].label, nil, {RightLabel = ESX.Math.GroupDigits(PersonalMenu.billing[i].amount.."~g~$")}, true, function(h,a,s)
							if s then
								ESX.TriggerServerCallback('esx_billing:payBill', function()
								end, PersonalMenu.billing[i].id)
                                ESX.SetTimeout(100, function()
                                    RefreshBilling()
                                    RageUIv1.GoBack()
                                end)
							end
						end)
					end
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'papers'), true, true, true, function()
                    RageUIv1.ButtonWithStyle("Regarder sa carte d'identité", nil, { RightLabel = "→→" },true, function(h,a,s)
                        if s then
                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Montrer sa carte d'identité", nil, { RightLabel = "→→" },true, function(h,a,s)
                        if s then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                            if closestDistance ~= -1 and closestDistance <= 3.0 then
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
                            else
                                ESX.ShowNotification("Personne autour")
                            end
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Regarder son permis de conduire", nil, { RightLabel = "→→" },true, function(h,a,s)
                        if s then
                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Montrer son permis de conduire", nil, { RightLabel = "→→" },true, function(h,a,s)
                        if s then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                            if closestDistance ~= -1 and closestDistance <= 3.0 then
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
                            else
                                ESX.ShowNotification("Personne autour")
                            end
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Regarder son PPA", nil, { RightLabel = "→→" },true, function(h,a,s)
                        if s then
                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
                        end
                    end)
                    RageUIv1.ButtonWithStyle("Montrer son PPA", nil, { RightLabel = "→→" },true, function(h,a,s)
                        if s then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
                            if closestDistance ~= -1 and closestDistance <= 3.0 then
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
                            else
                                ESX.ShowNotification("Personne autour")
                            end
                        end
                    end)
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'boss'), true, true, true, function()
                    RageUIv1.Separator("Votre Métier : ~p~"..ESX.PlayerData.job.label.."")
                    RageUIv1.Separator("Votre Grade : ~p~"..ESX.PlayerData.job.grade_label.."")
                    if societymoney ~= nil then
                        RageUIv1.Separator("Argent dans la société : ~p~"..societymoney.."$")
                    end

                    RageUIv1.Separator("")
                RageUIv1.ButtonWithStyle('Recruter une personne', nil, {RightLabel = "→"}, canChange, function(Hovered, Active, Selected)
                    if (Selected) then
                        canChange = false
                        Citizen.SetTimeout(2000, function()
                            canChange = true
                        end)
                        if ESX.PlayerData.job.grade_name == 'boss' then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                            if closestPlayer == -1 or closestDistance > 3.0 then
                                ESX.ShowNotification('~r~Aucun joueur proche.')
                            else
                                exports["JustGod"]:RecruitPlayer("job", GetPlayerServerId(closestPlayer));
                                --TriggerServerEvent('recrutejoueur', GetPlayerServerId(closestPlayer), ESX.PlayerData.job.name, 0)
                            end
                        else
                            ESX.ShowNotification('Vous n\'avez pas les ~r~droits')
                        end
                    end
                end)
        
                -- RageUIv1.ButtonWithStyle('Virer une personne', nil, {RightLabel = "→"}, canChange, function(Hovered, Active, Selected)
                --     if (Selected) then
                --         canChange = false
                --         Citizen.SetTimeout(2000, function()
                --             canChange = true
                --         end)
                --         if ESX.PlayerData.job.grade_name == 'boss' then
                --             local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                --             if closestPlayer == -1 or closestDistance > 3.0 then
                --                 ESX.ShowNotification('~r~Aucun joueur proche.')
                --             else
                --                 TriggerServerEvent('virerjoueur', GetPlayerServerId(closestPlayer))
                --             end
                --         else
                --             ESX.ShowNotification('Vous n\'avez pas les ~r~droits')
                --         end
                --     end
                -- end)
        
                -- RageUIv1.ButtonWithStyle('Promouvoir une personne', nil, {RightLabel = "→"}, canChange, function(Hovered, Active, Selected)
                --     if (Selected) then
                --         canChange = false
                --         Citizen.SetTimeout(2000, function()
                --             canChange = true
                --         end)
                --         if ESX.PlayerData.job.grade_name == 'boss' then
                --             local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                --             if closestPlayer == -1 or closestDistance > 3.0 then
                --                 ESX.ShowNotification('~r~Aucun joueur proche.')
                --             else
                --                 TriggerServerEvent('c26bgdtoklmtbr:{-pp}', GetPlayerServerId(closestPlayer))
                --             end
                --         else
                --             ESX.ShowNotification('Vous n\'avez pas les ~r~droits')
                --         end
                --     end
                -- end)
        
                -- RageUIv1.ButtonWithStyle('Destituer une personne', nil, {RightLabel = "→"}, canChange, function(Hovered, Active, Selected)
                --     if (Selected) then
                --         canChange = false
                --         Citizen.SetTimeout(2000, function()
                --             canChange = true
                --         end)
                --         if ESX.PlayerData.job.grade_name == 'boss' then
                --             local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
                --             if closestPlayer == -1 or closestDistance > 3.0 then
                --                     ESX.ShowNotification('~r~Aucun joueur proche.')
                --                 else
                --                 TriggerServerEvent('f45bgdtj78ql:[tl-yu]', GetPlayerServerId(closestPlayer))
                --                     end
                --                 else
                --                     ESX.ShowNotification('Vous n\'avez pas les ~r~droits')
                --                 end
                --             end
                --         end)
                    end, function()
                end)

                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'boss2'), true, true, true, function()

                    RageUIv1.Separator("Organisation : ~r~"..ESX.PlayerData.job2.label.."")
                    RageUIv1.Separator("Votre Grade : ~r~"..ESX.PlayerData.job2.grade_label.."")
                    if societymoney ~= nil then
                        RageUIv1.Separator("Argent dans le coffre~s~ : ~r~"..societymoney2.."$")
                    end

                    RageUIv1.Separator("")
                    RageUIv1.ButtonWithStyle('Recruter une personne', nil, {RightLabel = "→"}, canChange, function(Hovered, Active, Selected)
                        if (Selected) then
                            canChange = false
                            Citizen.SetTimeout(2000, function()
                                canChange = true
                            end)
                            if ESX.PlayerData.job2.grade_name == 'boss' then
                                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
                                if closestPlayer == -1 or closestDistance > 3.0 then
                                    ESX.ShowNotification('~r~Aucun joueur proche.');
                                else
                                    exports["JustGod"]:RecruitPlayer("job2", GetPlayerServerId(closestPlayer));
                                    --TriggerServerEvent('recrutejoueur2', GetPlayerServerId(closestPlayer), ESX.PlayerData.job2.name, 0)
                                end
                            else
                                ESX.ShowNotification('Vous n\'avez pas les ~r~droits')
                            end
                        end
                    end)
            
                    -- RageUIv1.ButtonWithStyle('Virer une personne', nil, {RightLabel = "→"}, canChange, function(Hovered, Active, Selected)
                    --     if (Selected) then
                    --         canChange = false
                    --         Citizen.SetTimeout(2000, function()
                    --             canChange = true
                    --         end)
                    --         if ESX.PlayerData.job2.grade_name == 'boss' then
                    --             local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
                    --             if closestPlayer == -1 or closestDistance > 3.0 then
                    --                 ESX.ShowNotification('~r~Aucun joueur proche.')
                    --             else
                    --                 TriggerServerEvent('virerjoueur2', GetPlayerServerId(closestPlayer))
                    --             end
                    --         else
                    --             ESX.ShowNotification('Vous n\'avez pas les ~r~droits')
                    --         end
                    --     end
                    -- end)
            
                    -- RageUIv1.ButtonWithStyle('Promouvoir une personne', nil, {RightLabel = "→"}, canChange, function(Hovered, Active, Selected)
                    --     if (Selected) then
                    --         canChange = false
                    --         Citizen.SetTimeout(2000, function()
                    --             canChange = true
                    --         end)
                    --         if ESX.PlayerData.job2.grade_name == 'boss' then
                    --             local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
                    --             if closestPlayer == -1 or closestDistance > 3.0 then
                    --                 ESX.ShowNotification('~r~Aucun joueur proche.')
                    --             else
                    --                 TriggerServerEvent('promouvoirjoueur2', GetPlayerServerId(closestPlayer))
                    --             end
                    --         else
                    --             ESX.ShowNotification('Vous n\'avez pas les ~r~droits')
                    --         end
                    --     end
                    -- end)
            
                    -- RageUIv1.ButtonWithStyle('Destituer une personne', nil, {RightLabel = "→"}, canChange, function(Hovered, Active, Selected)
                    --     if (Selected) then
                    --         canChange = false
                    --         Citizen.SetTimeout(2000, function()
                    --             canChange = true
                    --         end)
                    --         if ESX.PlayerData.job2.grade_name == 'boss' then
                    --             local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            
                    --             if closestPlayer == -1 or closestDistance > 3.0 then
                    --                     ESX.ShowNotification('~r~Aucun joueur proche.')
                    --                 else
                    --                 TriggerServerEvent('destituerjoueur2', GetPlayerServerId(closestPlayer))
                    --                     end
                    --                 else
                    --                     ESX.ShowNotification('Vous n\'avez pas les ~r~droits')
                    --                 end
                    --             end
                    --         end)
                        end, function()
                    end)
            
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'portefeuille_money'), true, true, true, function()
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'cash'  then
                            cash = RageUIv1.Separator('Argent liquide :~g~ '..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.." ~g~$")) 
                            RageUIv1.ButtonWithStyle("Donner", nil, {}, true, function(h,a,s)
                                if a then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer ~= -1 and closestDistance <= 3 then
                                        playerMarker(closestPlayer)
                                    end
                                end
                                if s then
                                    local black, quantity = CheckQuantity(CustomAmount())
                                        if black then
                                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                                if closestDistance ~= -1 and closestDistance <= 3 then
                                                    local closestPed = GetPlayerPed(closestPlayer)
                                                    if not IsPedSittingInAnyVehicle(closestPed) then
                                                        ExecuteCommand("me donne "..quantity.."$ à la personne")
                                                        TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                                    else
                                                        ESX.ShowNotification('Vous ne pouvez pas donner ', 'de l\'argent dans un véhicles')
                                                    end
                                                else
                                                    ESX.ShowNotification('Aucune personne à proximité.')
                                                end
                                        else
                                            ESX.ShowNotification('Somme invalide')
                                        end
                                end
                            end)
                            RageUIv1.ButtonWithStyle("Jeter", nil, {}, true, function(h,a,s)
                                if s then
                                    local black, quantity = CheckQuantity(CustomAmount())
                                    if black then
                                        if not IsPedSittingInAnyVehicle(PlayerPed) then
                                            ExecuteCommand("me jete "..quantity.."$ par terre")
                                            TriggerServerEvent('esx:dropInventoryItem', 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                        else
                                            ESX.ShowNotification('Vous pouvez pas jeter', 'de l\'argent')
                                        end
                                    else
                                        ESX.ShowNotification('Somme invalide')
                                    end
                                end
                            end)
                        end
                    end
                end)
                RageUIv1.IsVisible(RMenuv1:Get('personalmenu', 'portefeuille_blackmoney'), true, true, true, function()
                    for i = 1, #ESX.PlayerData.accounts, 1 do
                        if ESX.PlayerData.accounts[i].name == 'dirtycash' then
                            RageUIv1.Separator("Source inconnue :~c~ "..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.."$"), nil, {}, true, function(h,a,s)
                            end)
                            RageUIv1.ButtonWithStyle("Donner", nil, {}, true, function(h,a,s)
                                if a then
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer ~= -1 and closestDistance <= 3 then
                                        playerMarker(closestPlayer)
                                    end
                                end
                                if s then
                                    local black, quantity = CheckQuantity(CustomAmount())
                                    if black then
                                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                        if closestDistance ~= -1 and closestDistance <= 3 then
                                            local closestPed = GetPlayerPed(closestPlayer)
            
                                            if not IsPedSittingInAnyVehicle(closestPed) then
                                                ExecuteCommand("me donne "..quantity.."$ à la personne")
                                                TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                            else
                                                ESX.ShowNotification('Vous ne pouvez pas donner ', 'de l\'argent dans un véhicles')
                                            end
                                        else
                                            ESX.ShowNotification('Aucune personne à proximité.')
                                        end
                                    else
                                        ESX.ShowNotification('Somme invalide')
                                    end
                                end
                            end)
                            RageUIv1.ButtonWithStyle("Jeter", nil, {}, true, function(h,a,s)
                                if s then
                                    local black, quantity = CheckQuantity(CustomAmount())
                                    if black then
                                        if not IsPedSittingInAnyVehicle(PlayerPed) then
                                            ExecuteCommand("me jete "..quantity.."$ par terre")
                                            TriggerServerEvent('esx:dropInventoryItem', 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                                        else
                                            ESX.ShowNotification('nVous ne pouvez pas jeter de l\'argent dans un véhicule')
                                        end
                                    else
                                        ESX.ShowNotification('Somme invalide')
                                    end
                                end
                            end)
                        end
                    end
                end)
				Wait(0)
			end
		end)
	end

end

local IsInPVP = false;

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register('F5','F5', 'Menu Personnel ', function()

	if not (IsInPVP) then
		PlaySoundFrontend(-1, 'ATM_WINDOW', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
		refresh()
		OpenRzInteract();
	end
end)

function refresh()
    Citizen.CreateThread(function()
        ESX.PlayerData = ESX.GetPlayerData() ------ ca sert a rien de le laisser dans ton button il tourner en boucle et surtout te faire monter en ms
    end)
end

function RefreshBilling()
    ESX.TriggerServerCallback('esx_billing:getBills', function(bills)
        PersonalMenu.billing = bills
        print(PersonalMenu.billing)
        print(bills)
    end)
end

function doorAction(door)
    if not IsPedInAnyVehicle(PlayerPedId(),false) then return end
    local veh = GetVehiclePedIsIn(PlayerPedId(),false)
    if door == -1 then
        if doorActionIndex == 1 then
            for i = 0, 7 do
                SetVehicleDoorOpen(veh,i,false,false)
            end
        else
            for i = 0, 7 do
                SetVehicleDoorShut(veh,i,false)
            end
        end
        doorCoolDown = true
        Citizen.SetTimeout(500, function()
            doorCoolDown = false
        end)
        return
    end
    if doorActionIndex == 1 then
        SetVehicleDoorOpen(veh,door,false,false)
        doorCoolDown = true
        Citizen.SetTimeout(500, function()
            doorCoolDown = false
        end)
    else
        SetVehicleDoorShut(veh,door,false)
        doorCoolDown = true
        Citizen.SetTimeout(500, function()
            doorCoolDown = false
        end)
    end
end

function vehicleIsDamaged()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
    return GetVehicleEngineHealth(vehicle) < 1000
end

function isAllowedToManageVehicle()
    if IsPedInAnyVehicle(PlayerPedId(),false) then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
        if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
            return true
        end
        return false
    end
    return false
end

function CheckQuantity(number)
    number = tonumber(number)
  
    if type(number) == 'number' then
      number = ESX.Math.Round(number)
  
      if number > 0 then
        return true, number
      end
    end
  
    return false, number
end

RegisterNetEvent('CloseMenu')
AddEventHandler('CloseMenu', function()
	RageUIv1.Visible(RMenuv1:Get('personalmenu', 'main'), false)
end)

function playerMarker(player)
    local ped = GetPlayerPed(player)
    local pos = GetEntityCoords(ped)
    DrawMarker(2, pos.x, pos.y, pos.z+1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 170, 0, 1, 2, 0, nil, nil, 0)
end

RegisterNetEvent('esx_addonaccount:setMoney')
AddEventHandler('esx_addonaccount:setMoney', function(society, money)
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' and 'society_' .. ESX.PlayerData.job.name == society then
		societymoney = ESX.Math.GroupDigits(money)
	end
    if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.grade_name == 'boss' and 'society_' .. ESX.PlayerData.job2.name == society then
		societymoney2 = ESX.Math.GroupDigits(money)
    end
end)


