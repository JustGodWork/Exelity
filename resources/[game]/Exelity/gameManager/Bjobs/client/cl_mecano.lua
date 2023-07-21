--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)

local CurrentlyTowedVehicle = nil

openMecanoF6 = function()
    local mainMenu = RageUI.CreateMenu("", "Actions mécano")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while mainMenu do
        RageUI.IsVisible(mainMenu, function()

            RageUI.Separator("↓ Gestion Anonces ~s~ ↓")
            RageUI.Button("Annonce ~g~[Ouvertures]~s~", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Ouvre:Mecano')
                end
            })
            RageUI.Button("Annonce ~r~[Fermetures]~r~", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Ferme:Mecano')
                end
            })
            RageUI.Button("Annonce ~p~[Recrutement]", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Recrutement:Mecano')
                end
            })
            
            RageUI.Separator("↓ Gestion Mécanique ~s~ ↓")
            RageUI.Button("Réparer le véhicule", nil, {}, true, {
                onSelected = function()

                    local playerPed = PlayerPedId()
                    local coords    = GetEntityCoords(playerPed)
            
                    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
            
                        local vehicle = nil
            
                        if IsPedInAnyVehicle(playerPed, false) then
                            vehicle = GetVehiclePedIsIn(playerPed, false)
                        else
                            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                        end
            
                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                            Citizen.CreateThread(function()
                                Citizen.Wait(10000)
                                SetVehicleFixed(vehicle)
                                SetVehicleDeformationFixed(vehicle)
                                SetVehicleUndriveable(vehicle, false)
                                SetVehicleEngineOn(vehicle,  true,  true)
                                ClearPedTasksImmediately(playerPed)
                                ESX.ShowNotification("Véhicule réparé avec succès")
                            end)
                        end
                    end
                end
            })

            RageUI.Button("Nettoyer le véhicule", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords    = GetEntityCoords(playerPed)

                    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

                        local vehicle = nil

                        if IsPedInAnyVehicle(playerPed, false) then
                            vehicle = GetVehiclePedIsIn(playerPed, false)
                        else
                            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                        end

                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
                            Citizen.CreateThread(function()
                                Citizen.Wait(10000)
                                SetVehicleDirtLevel(vehicle, 0)
                                ClearPedTasksImmediately(playerPed)
                                ESX.ShowNotification("Véhicule nettoyé avec succès !")
                            end)
                        end
                    end
                end
            })

            RageUI.Button("Mettre / Retirer le véhicule du plateau", "~b~Information\n~s~Vous devez d'abord monter dans votre dépanneuse à plateau", {}, true, {
                onSelected = function()
                    local vehicledepannage = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 5.0, 0, 70)
                    local playerPed = PlayerPedId()
                    local vehicle = GetVehiclePedIsIn(playerPed, true)
            
                    local towmodel = GetHashKey('flatbed')
                    local isVehicleTow = IsVehicleModel(vehicle, towmodel)
            
                    if isVehicleTow then
                        if CurrentlyTowedVehicle == nil then
                            if DoesEntityExist(vehicledepannage) then
                                if not IsPedInAnyVehicle(playerPed, true) then
                                    if vehicle ~= vehicledepannage then
                                        ClearPedTasks(playerPed)
                                        AttachEntityToEntity(vehicledepannage, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                                        CurrentlyTowedVehicle = vehicledepannage
                                        ESX.ShowAdvancedNotification('Benny\'s', '~y~Notification', "~g~Mise sur le plateau réussi", 'CHAR_CARSITE3', 1)
                                    else
                                        ESX.ShowAdvancedNotification('Benny\'s', '~y~Notification', "~r~Vous ne pouvez pas attacher votre véhicule de dépannage", 'CHAR_CARSITE3', 1)
                                    end
                                end
                            else
                                ESX.ShowAdvancedNotification('Benny\'s', '~y~Notification', "~r~Aucun véhicule à proximité", 'CHAR_CARSITE3', 1)
                            end
                        else
                            AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                            DetachEntity(CurrentlyTowedVehicle, true, true)
                            CurrentlyTowedVehicle = nil
                            ESX.ShowAdvancedNotification('Benny\'s', '~y~Notification', "~g~Véhicule retiré du plateau", 'CHAR_CARSITE3', 1)
                        end
                    else
                        ESX.ShowAdvancedNotification('Benny\'s', '~y~Notification', "~r~Vous devez avoir un véhicule à plateau pour faire cela", 'CHAR_CARSITE3', 1)
                    end
                end
            })            

            RageUI.Button("Mettre le véhicule en fourrière", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords    = GetEntityCoords(playerPed)
                    local vehicle = nil
                    if IsPedInAnyVehicle(playerPed, false) then
                        vehicle = GetVehiclePedIsIn(playerPed, false)
                    else
                        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                    end
                    if DoesEntityExist(vehicle) then
                        TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                        Citizen.CreateThread(function()
                            Citizen.Wait(10000)
                            ESX.Game.DeleteVehicle(vehicle)
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("Véhicule mis en fourrière")
                        end)
                    end
                end
            })

            RageUI.Separator("↓ Gestion Facture ~s~ ↓")
            RageUI.Button("Faire une ~p~Facture", nil, {RightLabel = ""}, true , {
                onSelected = function()
                    local montant = KeyboardInputPolice("Montant:", 'Indiquez un montant', '', 7)
                    if tonumber(montant) == nil then
                        ESX.ShowNotification("Montant invalide")
                        return false
                    else
                        amount = (tonumber(montant))
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
							ESX.ShowNotification('~r~Personne autour de vous')
						else
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'mecano', "Benny's", amount)
						end
                    end
                end
            })
        end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
        end
        Citizen.Wait(0)
    end
end

openLsF6 = function()
    local mainMenu2 = RageUI.CreateMenu("", "Actions mécano")

    RageUI.Visible(mainMenu2, not RageUI.Visible(mainMenu2))

    while mainMenu2 do
        RageUI.IsVisible(mainMenu2, function()

            RageUI.Separator("↓ Gestion Anonces ~s~ ↓")
            RageUI.Button("Annonce ~g~[Ouvertures]~s~", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Ouvre:Mecano2')
                end
            })
            RageUI.Button("Annonce ~r~[Fermetures]~r~", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Ferme:Mecano2')
                end
            })
            RageUI.Button("Annonce ~p~[Recrutement]", nil, {}, true, {
                onSelected = function()
                TriggerServerEvent('Recrutement:Mecano2')
                end
            })
            
            RageUI.Separator("↓ Gestion Mécanique ~s~ ↓")
            RageUI.Button("Réparer le véhicule", nil, {}, true, {
                onSelected = function()

                    local playerPed = PlayerPedId()
                    local coords    = GetEntityCoords(playerPed)
            
                    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
            
                        local vehicle = nil
            
                        if IsPedInAnyVehicle(playerPed, false) then
                            vehicle = GetVehiclePedIsIn(playerPed, false)
                        else
                            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                        end
            
                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                            Citizen.CreateThread(function()
                                Citizen.Wait(10000)
                                SetVehicleFixed(vehicle)
                                SetVehicleDeformationFixed(vehicle)
                                SetVehicleUndriveable(vehicle, false)
                                SetVehicleEngineOn(vehicle,  true,  true)
                                ClearPedTasksImmediately(playerPed)
                                ESX.ShowNotification("Véhicule réparé avec succès")
                            end)
                        end
                    end
                end
            })

            RageUI.Button("Nettoyer le véhicule", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords    = GetEntityCoords(playerPed)

                    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

                        local vehicle = nil

                        if IsPedInAnyVehicle(playerPed, false) then
                            vehicle = GetVehiclePedIsIn(playerPed, false)
                        else
                            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                        end

                        if DoesEntityExist(vehicle) then
                            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
                            Citizen.CreateThread(function()
                                Citizen.Wait(10000)
                                SetVehicleDirtLevel(vehicle, 0)
                                ClearPedTasksImmediately(playerPed)
                                ESX.ShowNotification("Véhicule nettoyé avec succès !")
                            end)
                        end
                    end
                end
            })

            RageUI.Button("Mettre / Retirer le véhicule du plateau", "~b~Information\n~s~Vous devez d'abord monter dans votre dépanneuse à plateau", {}, true, {
                onSelected = function()
                    local vehicledepannage = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 5.0, 0, 70)
                    local playerPed = PlayerPedId()
                    local vehicle = GetVehiclePedIsIn(playerPed, true)
            
                    local towmodel = GetHashKey('flatbed')
                    local isVehicleTow = IsVehicleModel(vehicle, towmodel)
            
                    if isVehicleTow then
                        if CurrentlyTowedVehicle == nil then
                            if DoesEntityExist(vehicledepannage) then
                                if not IsPedInAnyVehicle(playerPed, true) then
                                    if vehicle ~= vehicledepannage then
                                        ClearPedTasks(playerPed)
                                        AttachEntityToEntity(vehicledepannage, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                                        CurrentlyTowedVehicle = vehicledepannage
                                        ESX.ShowAdvancedNotification('LS Customs', '~y~Notification', "~g~Mise sur le plateau réussi", 'CHAR_CARSITE3', 1)
                                    else
                                        ESX.ShowAdvancedNotification('LS Customs', '~y~Notification', "~r~Vous ne pouvez pas attacher votre véhicule de dépannage", 'CHAR_CARSITE3', 1)
                                    end
                                end
                            else
                                ESX.ShowAdvancedNotification('LS Customs', '~y~Notification', "~r~Aucun véhicule à proximité", 'CHAR_CARSITE3', 1)
                            end
                        else
                            AttachEntityToEntity(CurrentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
                            DetachEntity(CurrentlyTowedVehicle, true, true)
                            CurrentlyTowedVehicle = nil
                            ESX.ShowAdvancedNotification('LS Customs', '~y~Notification', "~g~Véhicule retiré du plateau", 'CHAR_CARSITE3', 1)
                        end
                    else
                        ESX.ShowAdvancedNotification('LS Customs', '~y~Notification', "~r~Vous devez avoir un véhicule à plateau pour faire cela", 'CHAR_CARSITE3', 1)
                    end
                end
            })    

            RageUI.Button("Mettre le véhicule en fourrière", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords    = GetEntityCoords(playerPed)
                    local vehicle = nil
                    if IsPedInAnyVehicle(playerPed, false) then
                        vehicle = GetVehiclePedIsIn(playerPed, false)
                    else
                        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                    end
                    if DoesEntityExist(vehicle) then
                        TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                        Citizen.CreateThread(function()
                            Citizen.Wait(10000)
                            ESX.Game.DeleteVehicle(vehicle)
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("Véhicule mis en fourrière")
                        end)
                    end
                end
            })

            RageUI.Separator("↓ Gestion Facture ~s~ ↓")
            RageUI.Button("Faire une ~p~Facture", nil, {RightLabel = ""}, true , {
                onSelected = function()
                    local montant = KeyboardInputPolice("Montant:", 'Indiquez un montant', '', 7)
                    if tonumber(montant) == nil then
                        ESX.ShowNotification("Montant invalide")
                        return false
                    else
                        amount = (tonumber(montant))
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
							ESX.ShowNotification('~r~Personne autour de vous')
						else
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'mecano2', 'Ls Custom', amount)
						end
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

local IsInPVP = false;

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register('F6','InteractionsJobMecano', "Menu job Benny's", function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'mecano' then

        if (not IsInPVP) then
            openMecanoF6()
        end

    end
end)

Keys.Register('F6','InteractionsJobMecano2', 'Menu job Ls Custom', function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'mecano2' then

        if (not IsInPVP) then
            openLsF6()
        end

    end
end)

local openedGarage = false
local openedLSGarage = false

CustomJob = {
    {name = "mecano" , label = "Benny's", pointveh = vector3(-188.0177154541,-1292.912109375,31.295970916748), pointdelveh = vector3(-199.5074, -1297.388, 31.6891)},
}

CustomJob2 = {
    {name = "mecano2" , label = "Ls Custom", pointveh = vector3(-365.61938476563,-112.66687774658,38.696517944336), pointdelveh = vector3(-373.48431396484,-108.91676330566,38.682090759277)},
}

CreateThread(function() 
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob) do
            local mc = v.pointveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name then
                if dif < 10 then
                    interval = 1
                    DrawMarker(39,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,130,0,184,255,false,false,0,true,nil,nil,false)
                    if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder a la ~b~sortie véhicule~w~.")
                        if IsControlJustPressed(0, 51) then
                            openedGarage = true
                            openBennyGarage()
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)

CreateThread(function() 
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob2) do
            local mc = v.pointveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name then
                if dif < 10 then
                    interval = 1
                    DrawMarker(39,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,130,0,184,255,false,false,0,true,nil,nil,false)
                    if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder a la ~b~sortie véhicule~w~.")
                        if IsControlJustPressed(0, 51) then
                            openedLSGarage = true
                            openLSGarage()
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)

function openBennyGarage()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openedGarage do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Dépanneuse", nil, {RightLabel = "→"}, true, {
                onSelected = function()
                    TriggerServerEvent('benny:spawnVehicle', "flatbed")
                    RageUI.CloseAll()
                end
            })
            
        end)
        
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            openedGarage = false
        end

        Citizen.Wait(0)
    end
end

function openLSGarage()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openedLSGarage do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Dépanneuse", nil, {RightLabel = "→"}, true, {
                onSelected = function()
                    TriggerServerEvent('ls:spawnVehicle', "flatbed")
                    RageUI.CloseAll()
                end
            })
            
        end)
        
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            openedLSGarage = false
        end

        Citizen.Wait(0)
    end
end

CreateThread(function() 
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob) do
            local mc = v.pointdelveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name then
                if dif < 10 then
                    interval = 1
                    DrawMarker(20,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,130,0,184,255,false,false,0,true,nil,nil,false)
                    if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
                        if IsControlJustPressed(0, 51) then
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)

CreateThread(function() 
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob2) do
            local mc = v.pointdelveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name then
                if dif < 10 then
                    interval = 1
                    DrawMarker(20,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,130,0,184,255,false,false,0,true,nil,nil,false)
                    if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
                        if IsControlJustPressed(0, 51) then
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)