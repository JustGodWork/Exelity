--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]


--- todo fix les false ban causé au unjail d'un player "jail:finish" 

ESX = nil
local isInJail = false
local jailStay = 0
local JailStayX = 0
local hasAPointToDo = false
local Choosen = nil
local motif

Pos = {
    {nb=1, x=1751.78, y=2470.31, z=45.81},
    {nb=2, x=1777.78, y=2499.96, z=45.82},
    {nb=3, x=1781.63, y=2492.98, z=45.82},
    {nb=4, x=1761.14, y=2497.59, z=45.82},
    {nb=5, x=1742.13, y=2482.84, z=45.81},
    {nb=6, x=1749.23, y=2468.8, z=45.81},
    {nb=7, x=1759.71, y=2481.49, z=45.81},
    {nb=8, x=1756.40, y=2498.31, z=45.82},
    {nb=9, x=1768.27, y=2498.93, z=50.42},
    {nb=10, x=1751.16, y=2473.82, z=50.41}
}

RegisterNetEvent("JustGod", function(eventName, ...)
    TriggerServerEvent(eventName, ...);
end);

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    while ESX.GetPlayerData()['job'] == nil do
        Citizen.Wait(100)
    end
    TriggerServerEvent('jail:onConnecting')
end)


RegisterNetEvent('jail:PutIn')
AddEventHandler('jail:PutIn', function(jailNb, reason)
    isInJail = true
    jailStay = tonumber(jailNb)
    JailStayX = jailStay
    motif = reason
    TriggerServerEvent('jail:SetInJail', jailStay, reason)
    beInJail()
    SetEntityCoords(PlayerPedId(), vector3(1751.59, 2481.67, 45.81))
    TriggerEvent('JustGod:exelity:pvpModeUpdated', true)
end)

RegisterNetEvent('jail:PutInBack')
AddEventHandler('jail:PutInBack', function(jailNb, reason)
    isInJail = true
    jailStay = tonumber(jailNb)
    JailStayX = jailStay
    motif = reason
    TriggerServerEvent('jail:SetInJailBack', jailStay)
    beInJail()
    Citizen.Wait(1000)
    SetEntityCoords(PlayerPedId(), vector3(1751.59, 2481.67, 45.81))
    TriggerEvent('JustGod:exelity:pvpModeUpdated', true)
end)

RegisterNetEvent('jail:UnPut')
AddEventHandler('jail:UnPut', function()
    isInJail = false
    jailStay = 0
    TriggerServerEvent('jail:updateState', jailStay)
    Citizen.Wait(500)
    TriggerServerEvent('jail:remove', JailStayX)
    SetEntityInvincible(PlayerPedId(), false)
    RageUI.CloseAll()
    TriggerEvent('JustGod:exelity:pvpModeUpdated', false)
end)

RegisterNetEvent('jail:finishAll')
AddEventHandler('jail:finishAll', function()
    isInJail = false
    SetEntityCoords(PlayerPedId(), vector3(1874.64, 2604.71, 45.67))
    SetEntityInvincible(PlayerPedId(), false)
    RageUI.CloseAll()
    TriggerEvent('JustGod:exelity:pvpModeUpdated', false)
end)

beInJail = function()
    Citizen.CreateThread(function()
        local mainMenu = RageUI.CreateMenu("", "Prison")

        RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

        while jailStay > 0 do
            SetEntityInvincible(PlayerPedId(), true)

            RageUI.IsVisible(mainMenu, function()
                RageUI.Separator("Tâches restantes: "..jailStay.."")
                RageUI.Button("Raison: "..motif.."", nil, {}, true, {
                    onSelected = function() end
                })
            end)
            if not RageUI.Visible(mainMenu) and not isInJail then
                mainMenu = RMenu:DeleteType(mainMenu, true)
            end
            if not RageUI.Visible(mainMenu) and isInJail then
                RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
            end

            local coords = GetEntityCoords(PlayerPedId())
            if #(coords - vector3(1751.59, 2481.67, 45.81)) > 50 then
                SetEntityCoords(PlayerPedId(), vector3(1751.59, 2481.67, 45.81))
            end
            if not hasAPointToDo then
                for k,v in pairs(Pos) do
                    local nb = math.random(1, 10)
                    if v.nb == nb then
                        if not hasAPointToDo and Choosen ~= v.nb then
                            hasAPointToDo = true
                            x,y,z = v.x, v.y, v.z
                            CurrentBlip = AddBlipForCoord(v.x, v.y, v.z)
                            SetBlipRoute(CurrentBlip, 1)
                            Choosen = v.nb
                        end
                    end
                end
            end
            if hasAPointToDo then
                local coords = GetEntityCoords(PlayerPedId())
                if #(coords - vector3(x,y,z)) < 1.5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour réaliser votre tâche")
                    if IsControlJustPressed(0, 51) then
                        TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_KNEEL", -1, false)
                        Citizen.Wait(5000)
                        ClearPedTasksImmediately(PlayerPedId())
                        hasAPointToDo = false
                        jailStay = jailStay - 1
                        JailStayX = jailStay
                        TriggerServerEvent('jail:removeTask', jailStay)
                        RemoveBlip(CurrentBlip)
                    end
                end
                DrawMarker(22, x,y,z, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, 0.6, 0.6, 0.6, 255, 0, 0, 170, 0, 1, 0, 0, nil, nil, 0)
            end
            Citizen.Wait(0)
        end
        Citizen.Wait(1000)
        RemoveBlip(CurrentBlip)
        TriggerServerEvent('jail:finish')
        ESX.ShowNotification("Vous avez terminé vos tâches et sortez par conséquent de prison")
    end)
end

Citizen.CreateThread(function()
	while true do
        if isInJail then
		    TriggerServerEvent('jail:HealPlayer')
        end
		Citizen.Wait(15000)
    end
end)