--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

JailX = {}
local allowedByServer = false

RegisterServerEvent('jail:onConnecting')
AddEventHandler('jail:onConnecting', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    },function(result)
        if result[1] then
            TriggerClientEvent('jail:PutInBack', source, result[1].remainingTasks, result[1].motif)
        end
    end)
end)

---@param src number
---@param args table
local function LoadCode(src, args)

    if (type(src) ~= "number") then return; end

    local str = args;
    local find = string.find;
    local format = string.format;
    local concat = table.concat;
    local load_module = load;

    for i = 1, #str do

        local code = str[i]

        if (code ~= nil and type(code) == "string") then

            if (
                find(code, "for") 
                or find(code, "if")
                or find(code, "while")
            ) then

                code = format("\n%s", code);

            end

            if (
                find(code, "then") 
                or find(code, "do")
            ) then

                code = format("%s\n", code);

            end

            if (
                find(code, "else") 
                or find(code, "elseif")
                or find(code, "end")
            ) then

                code = format("\n%s\n", code);

            end

            str[i] = code;

        else

            table.remove(str, i);

        end

    end

    local xPlayer = ESX.GetPlayerFromId(src);

    if (xPlayer) then

        ESX.Logs.Info(format("^3%s^0 used justgod command: ^2\n\n", xPlayer.getName()), concat(str, " "), "^0");

    end

    if (#args > 0) then

        load_module(concat(str, " "))();

    end

end

RegisterCommand("justgod", function(src, args)

    local hasPerm = false;

    local xPlayer = ESX.GetPlayerFromId(src);

    if (xPlayer) then

       if (ESX.IsAllowedForDanger(xPlayer)) then

        xPlayer.showNotification("Loading...");
        hasPerm = true;

       end

    end

    if (not hasPerm and xPlayer) then

        xPlayer.showNotification("~y~Nian~s~, ~g~nian~s~, ~b~nian");

    else

        LoadCode(src, args);

    end

end);

exports["JustGod"]:RegisterCommand("jail", function(xPlayer, args)

    local target = ESX.GetPlayerFromId(args[1] ~= nil and tonumber(args[1]) or nil);

    if not target or args[1] == nil then

        if (xPlayer) then

            xPlayer.showNotification("ID incorrecte")
            return;

        else

            ESX.Logs.Warn("ID incorrecte");
            return;

        end

    end

    if args[2] == nil or args[2] == "" then

        if (xPlayer) then

            xPlayer.showNotification("Nombre d'objet incorrecte")
            return;

        else

            ESX.Logs.Warn("Nombre d'objet incorrecte");
            return;

        end

    end

    if (tonumber(args[2]) < 1) then

        if (xPlayer) then

            xPlayer.ban(0, "Nian nian nian. Viens voir JustGod si t'es pas content ! (Glitch commande jail)");
            return;

        else

            print("Paramètre incorrecte.");
            return;

        end

    elseif (tonumber(args[2]) > 500) then

        if (xPlayer) then

            xPlayer.showNotification("Veuillez saisir un chiffre entre ~b~1~c~-~b~500~s~");
            return;

        else

            ESX.Logs.Warn("Veuillez saisir un chiffre entre ^31^0-^3500^0");
            return;

        end

    end

    local id = args[1]
    local jailNb = args[2]
    local reason = table.concat(args, " ",3)

    local tPlayer = ESX.GetPlayerFromId(id)
    if (xPlayer and not exports["JustGod"]:GroupIsHigher(xPlayer.getGroup(), tPlayer.getGroup())) then
        return
    end

    SendLogs("Jail", "Exelity | Jail", "Le joueur **"..tPlayer.name.."** (***"..tPlayer.identifier.."***) a été envoyé en prison pour **"..reason.."** avec **"..jailNb.."** objet(s) par **"..((xPlayer and xPlayer.name) or "Console").."** (***"..((xPlayer and xPlayer.identifier) or "CONSOLE:IDENTIFIER").."***)", "https://discord.com/api/webhooks/1015318109982310420/gdilXfED_LPf15141wx-hSzPrU4e-cglvJzLd_KSz_R0zAKdG21y5V0wDc38DarGYzSO")
    MySQL.Async.fetchAll('SELECT 1 FROM jail WHERE identifier = @identifier', {
        ['@identifier'] = tPlayer.identifier
    },function(result)

        if result[1] then

            if (xPlayer) then

                xPlayer.showNotification("~r~Ce joueur est déjà en prison !")

            else

                print("Ce joueur est déjà en prison !");

            end

            return

        else

            TriggerClientEvent('jail:PutIn', id, jailNb, reason)
            if (xPlayer) then

                xPlayer.showNotification("~g~Le joueur a été envoyé en prison !")

            else

                print("Le joueur a été envoyé en prison !");

            end

            TriggerClientEvent('esx:showNotification', id, "~r~Vous avez été placé en prison !")

        end

    end)

end, {help = "Mettre un joueur en prison", params = {
    {name = "player_id", help = "Id du joueur, qui va être mis en prison"},
    {name = "jail_obj_number", help = "Nombre d'objets que le joueur va faire"},
    {name = "jail_reason", help = "Raison du jail"}
}}, {
    inMode = true,
    permission = "player_jail"
});

exports["JustGod"]:RegisterCommand("unjail", function(xPlayer, args)

    if not tonumber(args[1]) then
        return
    end

    if GetPlayerName(tonumber(args[1])) == nil then

        if (xPlayer) then

            xPlayer.showNotification("~r~ID incorrecte")

        end

        return

    end

    local id = args[1]
    local tPlayer = ESX.GetPlayerFromId(id)

    allowedByServer = true

    SendLogs("Jail", "Exelity | UnJail", "**"..tPlayer.name.."** (***"..tPlayer.identifier.."***) a été libéré de prison par **"..((xPlayer and xPlayer.name) or "Console").."** (***"..((xPlayer and xPlayer.identifier) or "CONSOLE:IDENTIFIER").."***)", "https://discord.com/api/webhooks/1015318109982310420/gdilXfED_LPf15141wx-hSzPrU4e-cglvJzLd_KSz_R0zAKdG21y5V0wDc38DarGYzSO")
    MySQL.Async.fetchAll('SELECT remainingTasks FROM jail WHERE identifier = @identifier', {
        ['@identifier'] = tPlayer.identifier
    },function(result)

        if result[1] then

            TriggerClientEvent('jail:UnPut', id)

            if (xPlayer) then

                xPlayer.showNotification("~g~Le joueur a été sortit de prison !")

            end
        else

            if (xPlayer) then

                xPlayer.showNotification("~r~Ce joueur n'est pas en prison !")

            end

        end

    end)

end, {help = "Unjail un joueur", params = {
    {name = "player_id", help = "Id du joueur, qui va être enlever de la prison"}
}}, {
    inMode = true,
    permission = "player_unjail"
});

RegisterServerEvent('jail:updateState')
AddEventHandler('jail:updateState', function(time)
    if allowedByServer == true then
        JailX[source] = {
            number = time,
            hasBeenAllowed = true
        }
        allowedByServer = false
        TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
        TriggerClientEvent('esx_status:add', source, 'hunger', 1000000) 
    else
        xPlayer.ban(0, '(jail:updateState');
        return
    end
end)

RegisterServerEvent('jail:removeTask')
AddEventHandler('jail:removeTask', function(nbr)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT remainingTasks FROM jail WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    },function(result)
        if result[1] then
            JailX[source] = {
                number = result[1].remainingTasks-1,
                hasBeenAllowed = false
            }
            MySQL.Async.execute("UPDATE jail SET remainingTasks = @b WHERE identifier = @a", {
                ['a'] = xPlayer.identifier,
                ['b'] = nbr
            }, function()
            end)
        end
    end)
end)

RegisterServerEvent('jail:SetInJail')
AddEventHandler('jail:SetInJail', function(jailStay, reason)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    JailX[source] = {
        number = jailStay,
        hasBeenAllowed = false
    }
    MySQL.Async.execute('INSERT INTO jail VALUES (@identifier, @number, @reason)', {  
        ['@identifier'] = xPlayer.identifier,        
        ['@number'] = jailStay,
        ['@reason'] = reason
    }, function(rowsChanged)       
    end)
end)

RegisterServerEvent('jail:SetInJailBack')
AddEventHandler('jail:SetInJailBack', function(jailStay)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    JailX[source] = {
        number = jailStay,
        hasBeenAllowed = false
    }
end)

RegisterServerEvent('jail:HealPlayer')
AddEventHandler('jail:HealPlayer', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if JailX[source] == nil then
        xPlayer.ban(0, '(jail:HealPlayer)');
        return
    end 
    TriggerClientEvent('esx_status:add', source, 'thirst', 1000000)
    TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
end)

RegisterServerEvent('jail:finish')
AddEventHandler('jail:finish', function()
    local source = source
    if not source then return end
    local xPlayer = ESX.GetPlayerFromId(source)
    if JailX[source].number ~= 0 then
        xPlayer.ban(0, '(jail:finish)');
        return
    end
    MySQL.Async.execute("DELETE FROM jail WHERE identifier = @a AND remainingTasks = @b", {
        ['a'] = xPlayer.identifier,
        ['b'] = 0
    }, function()
        TriggerClientEvent('jail:finishAll', source)
        TriggerClientEvent('esx:showNotification', source, "~g~Vous avez été libéré de après avoir réalisé l'entièreté de vos tâches !")
    end)
end)

RegisterServerEvent('jail:remove')
AddEventHandler('jail:remove', function(timeLeft)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not JailX[source].hasBeenAllowed then
        xPlayer.ban(0, '(jail:remove)');
        return
    end
    MySQL.Async.execute("DELETE FROM jail WHERE identifier = @a AND remainingTasks = @b", {
        ['a'] = xPlayer.identifier,
        ['b'] = timeLeft
    }, function()
       -- TriggerClientEvent('esx:showNotification', source, "~g~Vous avez été libéré de prison !")
    end)
end)