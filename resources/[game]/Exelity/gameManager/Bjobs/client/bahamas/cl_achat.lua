--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local open = false 
local mainMenu = RageUI.CreateMenu('', 'Frigo Bahamas') 

mainMenu.Display.Header = true
mainMenu.Closed = function()
    open = false
    nomprenom = nil
    numero = nil
    heurerdv = nil
    rdvmotif = nil
end

local function KeyboardInputBahamas(entryTitle, textEntry, inputText, maxLength)
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

local function OpenFrigoBahamas() 
    if open then 
        open = false
        RageUI.Visible(mainMenu, false)
        return
    else
        open = true 
        RageUI.Visible(mainMenu, true)

        CreateThread(function()
            while open do 
                RageUI.IsVisible(mainMenu, function()

                    RageUI.Separator("↓ Boisson ↓")

                    RageUI.Button("~p~Acheter~s~ x1 Vin", nil, {RightLabel = "20$"}, not codesCooldown5 , {
                        onSelected = function()
                            local count = KeyboardInputBahamas("Combien ?", 'Indiquez un nombre', '', 2)
                            if count == "" and tonumber(count) == nil then
                                ESX.ShowNotification('Montant invalide')
                            else
                                TriggerServerEvent('bahamas:BuyItem', "vine", 20, count)
                            end
                        end
                    })

                    RageUI.Button("~p~Acheter~s~ x1 Mojito", nil, {RightLabel = "10$"}, not codesCooldown5 , {
                        onSelected = function()
                            local count = KeyboardInputBahamas("Combien ?", 'Indiquez un nombre', '', 2)
                            if count == "" and tonumber(count) == nil then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('bahamas:BuyItem', "mojito", 10, count)
                            end
                        end 
                    })

                    RageUI.Button("~p~Acheter~s~ x1 Ice Tea", nil, {RightLabel = "8$"}, not codesCooldown5 , {
                        onSelected = function()
                            local count = KeyboardInputBahamas("Combien ?", 'Indiquez un nombre', '', 2)
                            if count == "" and tonumber(count) == nil then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('bahamas:BuyItem', "icetea", 8, count)
                            end
                        end
                    })

                    RageUI.Button("~p~Acheter~s~ x1 Eau", nil, {RightLabel = "7$"}, not codesCooldown5 , {
                        onSelected = function()
                            local count = KeyboardInputBahamas("Combien ?", 'Indiquez un nombre', '', 2)
                            if count == "" and tonumber(count) == nil then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('bahamas:BuyItem', "water", 7, count)
                            end
                        end
                    })

                    RageUI.Button("~p~Acheter~s~ x1 Whisky-coca", nil, {RightLabel = "12$"}, not codesCooldown5 , {
                        onSelected = function()
                            local count = KeyboardInputBahamas("Combien ?", 'Indiquez un nombre', '', 2)
                            if count == "" and tonumber(count) == nil then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('bahamas:BuyItem', "wiskycoca", 12, count)
                            end
                        end
                    })

                    RageUI.Button("~p~Acheter~s~ x1 Coca", nil, {RightLabel = "6$"}, not codesCooldown5 , {
                        onSelected = function()
                            local count = KeyboardInputBahamas("Combien ?", 'Indiquez un nombre', '', 2)
                            if count == "" and tonumber(count) == nil then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('bahamas:BuyItem', "coca", 6, count)
                            end
                        end
                    })

                    RageUI.Button("~p~Acheter~s~ x1 Limonade", nil, {RightLabel = "7$"}, not codesCooldown5 , {
                        onSelected = function()
                            local count = KeyboardInputBahamas("Combien ?", 'Indiquez un nombre', '', 2)
                            if count == "" and tonumber(count) == nil then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('bahamas:BuyItem', "limonade", 7, count)
                            end
                        end 
                    })

                    RageUI.Button("~p~Acheter~s~ x1 Fanta", nil, {RightLabel = "10$"}, not codesCooldown5 , {
                        onSelected = function()
                            local count = KeyboardInputBahamas("Combien ?", 'Indiquez un nombre', '', 2)
                            if count == "" and tonumber(count) == nil then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('bahamas:BuyItem', "fanta", 10, count)
                            end
                        end 
                    })

                    RageUI.Separator("↓ Nouriture ↓")

                    RageUI.Button("~p~Acheter~s~ x1 Chips", nil, {RightLabel = "2$"}, not codesCooldown5 , {
                        onSelected = function()
                            local count = KeyboardInputBahamas("Combien ?", 'Indiquez un nombre', '', 2)
                            if count == "" and tonumber(count) == nil then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('bahamas:BuyItem', "chips", 2, count)
                            end
                        end 
                    })

                    RageUI.Button("~p~Acheter~s~ x1 Cacahuète", nil, {RightLabel = "1$"}, not codesCooldown5 , {
                        onSelected = function()
                            local count = KeyboardInputBahamas("Combien ?", 'Indiquez un nombre', '', 2)
                            if count == "" and tonumber(count) == nil then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('bahamas:BuyItem', "cacahuete", 1, count)
                            end
                        end
                    })

                    RageUI.Button("~p~Acheter~s~ x1 Olive", nil, {RightLabel = "1$"}, not codesCooldown5 , {
                        onSelected = function()
                            local count = KeyboardInputBahamas("Combien ?", 'Indiquez un nombre', '', 2)
                            if count == "" and tonumber(count) == nil then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('bahamas:BuyItem', "olive", 1, count)
                            end
                        end 
                    })
                end)			
                Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
        local interval = 750

        for k,v in pairs(Config.Jobs.Bahamas.Frigo) do
            local coords = GetEntityCoords(PlayerPedId())

            if #(coords - v.coords) <= 10 then
                if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'bahamas' then
                    interval = 1
                    DrawMarker(Config.Get.Marker.Type, v.coords, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)

                    if #(coords - v.coords) <= 5 then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le frigo")

                        if IsControlJustPressed(1, 51) then
                            OpenFrigoBahamas()
                        end
                    end
                end
            end
        end
        Citizen.Wait(interval)
    end
end)