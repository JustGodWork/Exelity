--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

---@author Razzway
---@version 3.0

ESX = nil
local CreatorSecurity = {}
local registering = {};

TriggerEvent(CreatorConfig.getESX, function(lib) ESX = lib end)

RegisterServerEvent(_Prefix..":setBuckets")
AddEventHandler(_Prefix..":setBuckets", function(bool)
    local _src = source
    if bool then SetPlayerRoutingBucket(_src, _src+1) else SetPlayerRoutingBucket(_src, 0) end
end)

RegisterServerEvent(_Prefix..':identity:setIdentity')
AddEventHandler(_Prefix..':identity:setIdentity', function(playerInfo)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local coords = GetEntityCoords(GetPlayerPed(source))
    if #(coords - vector3(-774.95, 318.24, 195.86-0.9)) > 20 then
        --xPlayer.ban(0, '(identity:setIdentity)');
        xPlayer.kick("Désynchronisation avec le serveur (identity:setIdentity), merci de vous reconnecter.");
        return;
    end
    CreatorSecurity[source] = {
        isSafe = true
    }
    MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `height` = @height, `dateofbirth` = @dateofbirth, `sex` = @sex WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier,
        ['@firstname'] = playerInfo.firstname,
        ['@lastname'] = playerInfo.name,
        ['@height'] = playerInfo.height,
        ['@dateofbirth'] = playerInfo.birthday,
        ['@sex'] = playerInfo.sex,
    })
    if (CreatorConfig.consoleLogs) then
        print(("Le joueur ^3%s^7 a créé son identité ^3-->^7 [ Prénom : ^5%s^7 | Nom : ^6%s^7 | Taille : ^2%s^7 | Anniv : ^1%s^7 | Sexe : ^4%s^7 ]"):format(GetPlayerName(xPlayer.source), playerInfo.firstname, playerInfo.name, playerInfo.height, playerInfo.birthday, playerInfo.sex))
    end
    if (_ServerConfig.enableLogs) then
        logs:sendToDiscord(_ServerConfig.wehbook.identity, __["razzway_logs"], __["identity_logs_title"], (__["player_identity"]):format(GetPlayerName(xPlayer.source), __["line_separator"], playerInfo.firstname, playerInfo.name, playerInfo.height, playerInfo.birthday, playerInfo.sex), _ServerConfig.color.cyan)
    end
end)

exports["JustGod"]:RegisterCommand("register", function(xPlayer, args)

    local player_selected_id = tonumber(args[1])
    local player_selected_data = (xPlayer == nil or xPlayer.source ~= player_selected_id) and ESX.GetPlayerFromId(player_selected_id) or xPlayer

    if (player_selected_data == nil) then
        return
    elseif (xPlayer ~= nil and xPlayer.source ~= player_selected_data.source and not exports["JustGod"]:GroupIsHigher(xPlayer.getGroup(), player_selected_data.getGroup())) then
        return
    end

    registering[player_selected_data.source] = true;
    MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `height` = @height, `dateofbirth` = @dateofbirth, `sex` = @sex WHERE identifier = @identifier', {
        ['@identifier'] = player_selected_data.identifier,
        ['@firstname'] = nil,
        ['@lastname'] = nil,
        ['@height'] = nil,
        ['@dateofbirth'] = nil,
        ['@sex'] = nil,
    });
    SendLogs("Register", "Exelity | Register", "Le joueur **"..((xPlayer ~= nil and xPlayer.name) or "Console").."** (***"..((xPlayer ~= nil and xPlayer.identifier) or "CONSOLE:IDENTIFIER").."***) a register l'identité de **"..player_selected_data.name.."** (***"..player_selected_data.identifier.."***)", "https://discord.com/api/webhooks/1040505363348344884/wiy2oi8yWGPicqxB5mazQH_8WriFIbsBDu-8BSlw4RLruLVvr9J_DCqFi4Nvep1wC2T4")
    SetEntityCoords(GetPlayerPed(player_selected_data.source), -774.95, 318.24, 195.86-0.9);
    player_selected_data.triggerEvent("JustGod:RegisterPlayerIdentity");

end, {
    help = "Recréer l'identité d'un joueur",
    params = {
        {name = "player_id", help = "ID du joueur, qui va refaire son identité"}
    }
}, {
    permission = "player_register"
})

RegisterServerEvent('finallyCreator')
AddEventHandler('finallyCreator', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not source then return end
    if CreatorSecurity[source] and CreatorSecurity[source].isSafe == true then
        if (not registering[source]) then
            xPlayer.addAccountMoney('cash', 12500);
            xPlayer.addAccountMoney('bank', 12500);
        end
        registering[source] = nil;
        CreatorSecurity[source] = {
            isSafe = false
        }
    else
        xPlayer.ban(0, '(finallyCreator)');
        return
    end
end)

---@class Cardinal
Cardinal = {};
Cardinal.sizeProtect = 30

--[[RegisterServerEvent(_Prefix..":starter:setToPlayer")
AddEventHandler(_Prefix..":starter:setToPlayer", function(type)
    local xPlayer = ESX.GetPlayerFromId(source)
    local pCoords = GetEntityCoords(GetPlayerPed(source))
    local interactionPos = CreatorConfig.kitchen.pos
    if CreatorConfig.starterPack.enable then
        if (type) == "legal" then
            if #(pCoords-interactionPos) < (Cardinal.sizeProtect) then
                if (CreatorConfig.use.calif) then
                    xPlayer.addAccountMoney('cash', CreatorConfig.starterPack.legal["cash"])
                    xPlayer.addAccountMoney('bank', CreatorConfig.starterPack.legal["bank"])
                    TriggerClientEvent(CreatorConfig.events.showNotification, (xPlayer.source), __["choose_legal_kit"])
                    TriggerClientEvent(CreatorConfig.events.showNotification, (xPlayer.source), (__["reward_kit_legal"]):format(CreatorConfig.starterPack.legal["cash"], CreatorConfig.starterPack.legal["bank"]))
                else
                    xPlayer.addMoney(CreatorConfig.starterPack.legal["cash"])
                    xPlayer.addAccountMoney('bank', CreatorConfig.starterPack.legal["bank"])
                    TriggerClientEvent(CreatorConfig.events.showNotification, (xPlayer.source), __["choose_legal_kit"])
                    TriggerClientEvent(CreatorConfig.events.showNotification, (xPlayer.source), (__["reward_kit_legal"]):format(CreatorConfig.starterPack.legal["cash"], CreatorConfig.starterPack.legal["bank"]))
                end
                if (_ServerConfig.enableLogs) then
                    logs:sendToDiscord(_ServerConfig.wehbook.starter, __["razzway_logs"], __["starter_logs_title"], (__["starter_logs_message"]):format("Kit legal", GetPlayerName(xPlayer.source), PLAYER_IP, PLAYER_STEAMHEX, PLAYER_DISCORD), _ServerConfig.color.green)
                end
            else
                if (_ServerConfig.enableLogs) then
                    logs:sendToDiscord(_ServerConfig.wehbook.anticheat, __["razzway_logs"], __["anticheat_logs_title"], (__["anticheat_logs_message"]):format(GetPlayerName(xPlayer.source), PLAYER_IP, PLAYER_STEAMHEX, PLAYER_DISCORD), _ServerConfig.color.red)
                end
                DropPlayer(xPlayer.source, (__["cheat_detect"]):format(GetCurrentResourceName()))
            end
        end
        if (type) == "illegal" then
            if #(pCoords-interactionPos) < (Cardinal.sizeProtect) then
                if (CreatorConfig.use.calif) then
                    xPlayer.addAccountMoney('dirtycash', CreatorConfig.starterPack.illegal["black_money"])
                    xPlayer.addAccountMoney('bank', CreatorConfig.starterPack.illegal["bank"])
                    xPlayer.addWeapon(CreatorConfig.starterPack.illegal["weapon"], 255)
                    TriggerClientEvent(CreatorConfig.events.showNotification, (xPlayer.source), __["choose_illegal_kit"])
                    TriggerClientEvent(CreatorConfig.events.showNotification, (xPlayer.source), (__["reward_kit_illegal"]):format(CreatorConfig.starterPack.illegal["black_money"], CreatorConfig.starterPack.illegal["bank"], CreatorConfig.starterPack.illegal["weapon"]))
                else
                    xPlayer.addAccountMoney('black_money', CreatorConfig.starterPack.illegal["black_money"])
                    xPlayer.addAccountMoney('bank', CreatorConfig.starterPack.illegal["bank"])
                    xPlayer.addWeapon(CreatorConfig.starterPack.illegal["weapon"], 255)
                    TriggerClientEvent(CreatorConfig.events.showNotification, (xPlayer.source), __["choose_illegal_kit"])
                    TriggerClientEvent(CreatorConfig.events.showNotification, (xPlayer.source), (__["reward_kit_illegal"]):format(CreatorConfig.starterPack.illegal["black_money"], CreatorConfig.starterPack.illegal["bank"], CreatorConfig.starterPack.illegal["weapon"]))
                end
                if (_ServerConfig.enableLogs) then
                    logs:sendToDiscord(_ServerConfig.wehbook.starter, __["razzway_logs"], __["starter_logs_title"], (__["starter_logs_message"]):format("Kit illegal", GetPlayerName(xPlayer.source), PLAYER_IP, PLAYER_STEAMHEX, PLAYER_DISCORD), _ServerConfig.color.yellow)
                end
            else
                if (_ServerConfig.enableLogs) then
                    logs:sendToDiscord(_ServerConfig.wehbook.anticheat, __["razzway_logs"], __["anticheat_logs_title"], (__["anticheat_logs_message"]):format(GetPlayerName(xPlayer.source), PLAYER_IP, PLAYER_STEAMHEX, PLAYER_DISCORD), _ServerConfig.color.red)
                end
                DropPlayer(xPlayer.source, (__["cheat_detect"]):format(GetCurrentResourceName()))
            end
        end
    else
        if (_ServerConfig.enableLogs) then
            logs:sendToDiscord(_ServerConfig.wehbook.anticheat, __["razzway_logs"], __["anticheat_logs_title"], (__["anticheat_logs_message"]):format(GetPlayerName(xPlayer.source), PLAYER_IP, PLAYER_STEAMHEX, PLAYER_DISCORD), _ServerConfig.color.red)
        end
        DropPlayer(xPlayer.source, (__["cheat_detect"]):format(GetCurrentResourceName()))
    end
end)]]