ESX = nil

local ArgentSale = {}
local Items = {}
local Armes = {}
local infosvehicle = {}
DragStatus = {}
DragStatus.IsDragged          = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.ESX, function(obj) ESX = obj end)
        Citizen.Wait(500)
    end
    while ESX.GetPlayerData().job2 == nil do
		Citizen.Wait(500)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job)
    ESX.PlayerData.job2 = job
end)

openF7 = function()
    local mainMenu = RageUI.CreateMenu("", "Faites vos actions")
    local interaction = RageUI.CreateSubMenu(mainMenu, "", "Interactions avec le kidnappé")
    local interactveh = RageUI.CreateSubMenu(mainMenu, "", "Interactions avec un véhicule")
    local fouiller = RageUI.CreateSubMenu(interaction, "", "Faites vos actions")
    local lesinfosduvehicle = RageUI.CreateSubMenu(interactveh, "", "Faites vos actions")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while mainMenu do

        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Interaction avec le kidnappé", nil, {}, true, {
            }, interaction)
            RageUI.Button("Interaction véhicule", nil, {}, true, {
            }, interactveh)
        end)

        RageUI.IsVisible(interaction, function()
            RageUI.Button("Prendre la carte d'identité", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local player, distance = ESX.Game.GetClosestPlayer()
                    local getPlayerSearch = GetPlayerPed(player)
                    if IsEntityPlayingAnim(getPlayerSearch, 'random@mugging3', 'handsup_standing_base', 3) then
                        if distance ~= -1 and distance <= 3.0 then
                            RageUI.CloseAll()
                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
                        else
                            ESX.ShowNotification('~r~Personne autour de vous')
                        end
                    else
                        ESX.ShowNotification("La personne en face ne lève pas les mains")
                    end
                end
            })
            RageUI.Button("Dérober", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local player, distance = ESX.Game.GetClosestPlayer()
                    local getPlayerSearch = GetPlayerPed(player)
                    if IsEntityPlayingAnim(getPlayerSearch, 'random@mugging3', 'handsup_standing_base', 3) then
                        if player ~= -1 and distance <= 3.0 then
                            TriggerServerEvent('message', GetPlayerServerId(player))
                            getPlayerInv(player)
                        else
                            ESX.ShowNotification('~r~Personne autour de vous')
                        end
                    else
                        ESX.ShowNotification("La personne en face ne lève pas les mains")
                    end
                end
            }, fouiller)
    
           --[[ RageUI.Button("Menotter/Démenotter", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('~r~Personne autour de vous')
                    else
                        TriggerServerEvent('menotter', GetPlayerServerId(closestPlayer))
                    end
                end
            })
    
            RageUI.Button("Escorter", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    playerheading = GetEntityHeading(PlayerPedId())
                    playerlocation = GetEntityForwardVector(PlayerPedId())
                    playerCoords = GetEntityCoords(PlayerPedId())
                    local target_id = GetPlayerServerId(target)
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('~r~Personne autour de vous')
                    else
                        TriggerServerEvent('escorter', GetPlayerServerId(closestPlayer))
                    end
                end
            })
    
            RageUI.Button("Jeter dans le véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('~r~Personne autour de vous')
                    else
                        TriggerServerEvent('jeter', GetPlayerServerId(closestPlayer))
                    end
                end
            })

            RageUI.Button("Sortir du véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('~r~Personne autour de vous')
                    else
                        TriggerServerEvent('sortir', GetPlayerServerId(closestPlayer))
                    end
                end
            })]]
        end)

        RageUI.IsVisible(interactveh, function()
            RageUI.Button("Informations du véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local coords  = GetEntityCoords(PlayerPedId())
                    local vehicle = ESX.Game.GetVehicleInDirection()
                    local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
                    if DoesEntityExist(vehicle) then
                        getInfosVehicle(vehicleData)
                    else
                        ESX.ShowNotification("~r~Aucun véhicule à proximité")
                    end
                end
            }, lesinfosduvehicle)
            RageUI.Button("Crocheter le véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local coords  = GetEntityCoords(PlayerPedId())
                    local vehicle = ESX.Game.GetVehicleInDirection()
                    if DoesEntityExist(vehicle) then
                        local plyPed = PlayerPedId()
    
                        TaskStartScenarioInPlace(plyPed, 'WORLD_HUMAN_WELDING', 0, true)
                        Citizen.Wait(20000)
                        ClearPedTasksImmediately(plyPed)
    
                        SetVehicleDoorsLocked(vehicle, 1)
                        SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                        ESX.ShowNotification("~g~Véhicule dévérouillé")
                    else
                        ESX.ShowNotification("~r~Aucun véhicule à proximité")
                    end
                end
            })
        end)

        RageUI.IsVisible(fouiller, function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            local getPlayerSearch = GetPlayerPed(closestPlayer)
            if not IsEntityPlayingAnim(getPlayerSearch, 'random@mugging3', 'handsup_standing_base', 3) then
                RageUI.GoBack()
                ESX.ShowNotification("La personne en face lève pas les mains en l'air")
                return
            end

            if closestPlayer == -1 or closestDistance > 3.0 then
                RageUI.GoBack()
                return
            end
    
            RageUI.Separator("Vous Fouillez : " ..GetPlayerName(closestPlayer))

            RageUI.Separator("↓ ~r~Argent non déclaré ~s~↓")

            for k,v in pairs(ArgentSale) do
                RageUI.Button("Argent non déclaré :", nil, {RightLabel = "~g~"..v.label.."$"}, true , {
                    onSelected = function()
                        local combien = KeyboardInputOrga("Combien ?", 'Indiquez un nombre', '', 4)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification('~r~Montant invalide')
                        else
                            TriggerServerEvent('confiscatePlayerItemF7', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            RageUI.GoBack()
                        end
                    end
                })
            end

            RageUI.Separator("↓ ~r~Items du joueur ~s~↓")

            for k,v in pairs(Items) do
                RageUI.Button("Nom: "..v.label, nil, {RightLabel = "~g~"..v.right.." exemplaires"}, true , {
                    onSelected = function()
                        local combien = KeyboardInputOrga("Combien ", 'Indiquez un nombre', '', 10)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification('~r~Montant invalide')
                        else
                            TriggerServerEvent('confiscatePlayerItemF7', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            RageUI.GoBack()
                        end
                    end
                })
            end
            
            RageUI.Separator("↓ ~r~Armes du joueur ~s~↓")
            for k,v in pairs(Armes) do
                local isPermanent = ESX.IsWeaponPermanent(v.value)
                if not isPermanent then
                    RageUI.Button("Arme: "..v.label, nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            local combien = KeyboardInputOrga("Nombre de munitions", 'Indiquez un nombre', '', 4)
                            if tonumber(combien) > 1 then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('confiscatePlayerItemF7', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                                RageUI.GoBack()
                            end
                        end
                    })
                end
            end

        end)

        RageUI.IsVisible(lesinfosduvehicle, function()
            local vehicle = ESX.Game.GetVehicleInDirection()
            if not DoesEntityExist(vehicle) then
                RageUI.GoBack()
                return
            end
            for k,v in pairs(infosvehicle) do
                RageUI.Button("Propriétaire: "..v.label, nil, {RightLabel = "→"}, isInService , {
                })
                RageUI.Button("Plaque: "..v.plaque, nil, {RightLabel = "→"}, isInService , {
                })
            end
        end)

        if not RageUI.Visible(mainMenu) and not RageUI.Visible(lesinfosduvehicle) and not RageUI.Visible(fouiller) and not RageUI.Visible(interaction) and not RageUI.Visible(interactveh) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
        end

        if not RageUI.Visible(lesinfosduvehicle) then
            table.remove(infosvehicle, k)
        end

        if not RageUI.Visible(fouiller) then
            table.remove(ArgentSale, k)
            table.remove(Items, k)
            table.remove(Armes, k)
        end

        Citizen.Wait(0)
    end
end

RegisterNetEvent('putInVehicle')
AddEventHandler('putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if not IsHandcuffed then
		return
	end

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				dragStatus.isDragged = false
			end
		end
	end
end)

RegisterNetEvent('outofVehicle')
AddEventHandler('outofVehicle', function()
    local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)

RegisterNetEvent('actionescorter')
AddEventHandler('actionescorter', function(ganggg)
  IsDragged = not IsDragged
  GangPed = tonumber(ganggg)
end)

function getInfosVehicle(vehicleData)
    ESX.TriggerServerCallback('getVehicleInfos', function(retrivedInfo)
        if retrivedInfo.owner == nil then
            table.insert(infosvehicle, {
                label = "inconnu",
                plaque = vehicleData.plate
            })
        else
            table.insert(infosvehicle, {
                label = retrivedInfo.owner,
                plaque = retrivedInfo.plate
            })
        end
    end)
end

function getPlayerInv(player)
    
    ESX.TriggerServerCallback('getOtherPlayerData', function(data)
        for i=1, #data.accounts, 1 do
            if data.accounts[i].name == 'dirtycash' and data.accounts[i].money > 0 then
                table.insert(ArgentSale, {
                    label    = ESX.Math.Round(data.accounts[i].money),
                    value    = 'dirtycash',
                    itemType = 'item_account',
                    amount   = data.accounts[i].money
                })
    
            end
        end
    
        for i=1, #data.inventory, 1 do
            if data.inventory[i].count > 0 then
                table.insert(Items, {
                    label    = data.inventory[i].label,
                    right    = data.inventory[i].count,
                    value    = data.inventory[i].name,
                    itemType = 'item_standard',
                    amount   = data.inventory[i].count
                })
            end
        end

        for i=1, #data.weapons, 1 do
           -- if data.weapons[i].count > 0 then
                table.insert(Armes, {
                    label    = ESX.GetWeaponLabel(data.weapons[i].name),
                    right    = data.weapons[i].ammo,
                    value    = data.weapons[i].name,
                    itemType = 'item_weapon',
                    amount   = data.weapons[i].ammo
                })   
           -- end
        end

    end, GetPlayerServerId(player))
end

Citizen.CreateThread(function()
    while true do
      Wait(0)
      if IsHandcuffed then
        if IsDragged then
          local ped = GetPlayerPed(GetPlayerFromServerId(GangPed))
          local myped = PlayerPedId()
          AttachEntityToEntity(myped, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        else
          DetachEntity(PlayerPedId(), true, false)
        end
      end
    end
end)

function KeyboardInputOrga(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
  
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
      Citizen.Wait(0)
    end
  
    if UpdateOnscreenKeyboard() ~= 2 then
      local result = GetOnscreenKeyboardResult()
      return result
    else
      return nil
    end
end

local IsInPVP = false;

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register('F7','Interactgang', 'Actions gangs', function()
    if ESX.PlayerData.job2 ~= nil and ESX.PlayerData.job2.name ~= "unemployed2" and ESX.PlayerData.job2.name ~= "unemployed" then
        if (not IsInPVP) then
            PlaySoundFrontend(-1, 'ATM_WINDOW', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
            openF7()
        end
    end
end)