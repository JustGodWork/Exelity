--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

local housesStates = {}

Citizen.CreateThread(function()
    for _,house in pairs(robberiesConfiguration.houses) do
        table.insert(housesStates, {state = true, robbedByID = nil})
    end
end)

RegisterNetEvent("esx_robberies:houseRobbed")
AddEventHandler("esx_robberies:houseRobbed",function(houseID)
    local _src = source
    housesStates[houseID].state = false
    housesStates[houseID].robbedByID = _src
    Citizen.SetTimeout((1000*60)*robberiesConfiguration.houseRobRegen, function()
        housesStates[houseID].state = true
        housesStates[houseID].robbedByID = nil
    end)
end)

RegisterNetEvent("esx_robberies:callThePolice")
AddEventHandler("esx_robberies:callThePolice", function(houseIndex)
    local authority = robberiesConfiguration.houses[houseIndex].authority
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

        if xPlayer.job.name == 'police' or xPlayer.job.name == 'bcso' then
            TriggerClientEvent("initializePoliceBlip",xPlayers[i], houseIndex, robberiesConfiguration.houses[houseIndex].policeBlipDuration)
        end
    end
end)

RegisterNetEvent("esx_robberies:getHousesStates")
AddEventHandler("esx_robberies:getHousesStates", function()
    local _src = source
    TriggerClientEvent("esx_robberies:getHousesStates", _src, housesStates)
end)

local players = {};

RegisterNetEvent('esx_robberies:money', function(robbItems)
    local source = source;
    local xPlayer = ESX.GetPlayerFromId(source);

    ESX.Logs.Warn("Debug (esx_robberies:money) ", xPlayer.name, robbItems);

    if (type(robbItems) ~= "table") then return; end

    if (not players[xPlayer.identifier] or GetGameTimer() - players[xPlayer.identifier] > 60000) then

        local finalReward = 0

        for _, itemData in pairs(robberiesConfiguration.items) do

            for i = 1, #robbItems do
                
                local item = robbItems[i];

                if (type(item) == "table" and type(item.name) == "string" and type(item.resell) == "number") then
                    if ( (itemData.name == item.name) and (itemData.resellerValue == item.resell) ) then
                        finalReward = finalReward + item.resell;
                    end
                end

            end

        end

        players[xPlayer.identifier] = GetGameTimer();

        if (finalReward == 0) then return; end

        xPlayer.addAccountMoney('dirtycash', finalReward);
        xPlayer.showAdvancedNotification(
            "Gary McKinnon",
            "~r~Cambriolage",
            "Félicitations tu as reçus ~g~"..finalReward.."$ ~s~grâce aux objects que tu as volé! Je te recontacterai",
            "CHAR_HACKEUR",
            9
        );
        
    else
        xPlayer.ban(0, "esx_robberies:money (https://www.youtube.com/watch?v=dQw4w9WgXcQ)")
    end
end)