--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

local TimeoutAmbulance = {};

RegisterServerEvent('ambulance:sendsignal')
AddEventHandler('ambulance:sendsignal', function(x,y,z)

    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    local xPlayers = ESX.GetPlayers()

    if (xPlayer) then

        if (not TimeoutAmbulance[xPlayer.identifier] or GetGameTimer() - TimeoutAmbulance[xPlayer.identifier] > 300000) then

            TimeoutAmbulance[xPlayer.identifier] = GetGameTimer();

            for i=1, #xPlayers, 1 do

                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

                if xPlayer.job.name == 'ambulance' then

                    TriggerClientEvent('isInServiceCheck', xPlayers[i], "+")

                    TriggerClientEvent('ambulance:signal', xPlayers[i], x,y,z)

                end

            end

        else

            xPlayer.showNotification("Vous devez attendre 5 minutes avant de pouvoir refaire un appel.");

        end

    end

end);

RegisterServerEvent('ambulance:sendAnnonce')
AddEventHandler('ambulance:sendAnnonce', function(args)

    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then

        if xPlayer.job.name ~= "ambulance" then

            xPlayer.ban(0, '(ambulance:sendAnnonce)')

            return

        end

        if args == "+" then

            TriggerClientEvent('esx:showAdvancedNotification', source, 'Demande', 'Notification', "Une personne à besoin d'aide !", 'CHAR_CALL911', 8)

        elseif args == "-" then

            TriggerClientEvent('esx:showAdvancedNotification', source, 'Demande', 'Notification', "Une demande vient d'être prise en charge.", 'CHAR_CALL911', 8)

        end

    end

end)

local waitingForRevive = {}

RegisterNetEvent('réanimerafterdie', function()

    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    if (GetGameTimer() - waitingForRevive[xPlayer.identifier] >= 200) then
        TriggerClientEvent('ambulance:reviveAfterDie', source);
    end

end)

AddEventHandler("JustGod:exelity:playerDied", function(src)

    local player = ESX.GetPlayerFromId(src);

    if (player) then

        if (not waitingForRevive[player.identifier]) then

            waitingForRevive[player.identifier] = GetGameTimer()

            player.triggerEvent("JustGod:ReceiveDeathStatus", true);

        end
        
    end

end)

AddEventHandler("JustGod:exelity:playerRevived", function(src)

    local player = ESX.GetPlayerFromId(src);

    if (player) then

        if (waitingForRevive[player.identifier]) then

            waitingForRevive[player.identifier] = nil

            player.triggerEvent("JustGod:ReceiveDeathStatus", false);

        end

    end

end)
