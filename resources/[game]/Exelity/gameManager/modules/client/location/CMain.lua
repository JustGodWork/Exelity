--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

--- todo ajouter un timer pour faire un cooldowwn entre chaque achat coter server

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.Get.ESX, function(obj)
            ESX = obj
        end)
        Citizen.Wait(10)
    end
end)

Citizen.CreateThread(function()
    while true do
        local interval = 500
        local coords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.Location.allpos) do
            if #(coords - v.pos) <= 3 then
                interval = 0
                thepos = v.sortie
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder a la location")
                if IsControlJustPressed(0, 51) then
                    openLocation()
                end
            end
        end
        Citizen.Wait(interval)
    end
end)

local NoInSpam = true

InCooldown = function()
    NoInSpam = false
    Citizen.Wait(60000)
    NoInSpam = true
end

openLocation = function()
    local mainMenu = RageUI.CreateMenu("", "Choisissez un véhicule")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while mainMenu do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Panto", nil, {RightLabel = "625$"}, NoInSpam , {
                onSelected = function()
                    ESX.TriggerServerCallback('location:checkmoney', function(cb)
                        if cb then
                            if NoInSpam then
                                ESX.Game.SpawnVehicle('panto', thepos, 128.78, function (vehicle)
                                    SetVehicleNumberPlateText(vehicle, "LOCATION")
                                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                    ESX.ShowNotification("Vous avez payer 625~g~$")
                                end)
                                RageUI.CloseAll()
                                InCooldown()
                            else
                                ESX.ShowNotification("Vous pouvez pas louer un véhicule maintenant !")
                            end
                            else
                                ESX.ShowNotification("~r~Vous n'avez pas assez d'argent")
                        end
                    end)
                end
            })
        end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
        end
        Citizen.Wait(0)
    end
end