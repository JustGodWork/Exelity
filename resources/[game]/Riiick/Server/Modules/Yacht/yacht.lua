ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

RegisterNetEvent('Riiick:checkYachtBuilder')
AddEventHandler('Riiick:checkYachtBuilder', function()
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        if xPlayer.getGroup() == "founder" then
            TriggerClientEvent("Riiick:openYachtBuilder", source)
        else
            xPlayer.showNotification("Vous n'êtes pas fondateur pour utiliser se menu !")
        end
    end
end)

local resource = GetCurrentResourceName();

local file = LoadResourceFile(resource, "Common/yacht.json");
local data = {};

if (file) then
    data = file and type(file) == "string" and file ~= "" and file ~= "[]" and json.decode(file) or {};
end

---@param playerIdentifier string
---@return table, number | boolean, nil
function GetDataYacht(playerIdentifier)

    for i = 1, #data do

        if (type(data[i]) == "table") then

            if (data[i].ply and data[i].ply == playerIdentifier) then
                return data[i], i;
            end

        end

    end

    return false, nil;

end

local function SetYacht(_data, src)
    TriggerClientEvent("Riiick:setYachtProperty", src, _data);
    TriggerClientEvent("Riiick:addYachtZoneTel", -1, _data.teleport, _data.ply);
end

local function SetSouteInv(_data, src)
    TriggerClientEvent("Riiick:setSoutInv", src, _data);
end

local function removeYacht(_data)

    local owner = ESX.GetPlayerFromIdentifier(_data.ply);
    if (owner) then TriggerClientEvent("Riiick:setYachtProperty", owner.source, nil); end
    TriggerClientEvent("Riiick:removeYachtZoneTel", -1, _data.ply);
end

RegisterNetEvent('Riiick:addYacht')
AddEventHandler('Riiick:addYacht', function(player, posg, veh1, veh2_yacht, possv, posv, posdj, posdec, tel, tel2, tel3, tel4)
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)
    local xJoueur = ESX.GetPlayerFromId(player)

    if (xPlayer) and (xJoueur) then
        if xPlayer.getGroup() == "founder" then
            if xJoueur then 
                table.insert(data, {

                    ply = xJoueur.getIdentifier(), 
                    pg = posg, 
                    v1 = veh1, 
                    v2 = veh2_yacht, 
                    psv = possv, 
                    pv = posv, 
                    pdj = posdj, 
                    pdec = posdec,
                    teleport = {tel = tel, tel2 = tel2, tel3 = tel3, tel4 = tel4}
                });
                local dtt,_ = GetDataYacht(xJoueur.identifier)
                SetYacht(dtt, player);

            else
                xPlayer.showNotification("ID du joueur invalide")
            end
        else
            xPlayer.ban(0, '(Riiick:addYacht)');
        end
    end
end);

AddEventHandler('esx:playerLoaded', function(source)
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        local dttt,_ = GetDataYacht(xPlayer.identifier)
        if dttt then 
        SetYacht(dttt, source);
        SetSouteInv(dttt, source)
        end
    end
end)

RegisterNetEvent('Riiick:checkPlayerYacht')
AddEventHandler('Riiick:checkPlayerYacht', function()
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        local dtt,_ = GetDataYacht(xPlayer.identifier)
        if dtt then 
        SetYacht(dtt, source);
        SetSouteInv(dtt, source)
        end
    end
end)


RegisterNetEvent('Riiick:goToSleep')
AddEventHandler('Riiick:goToSleep', function()
    local source = source 
    DropPlayer(source, "Bonne nuit ! ;-)")
end)

RegisterNetEvent('Riiick:addItemStock')
AddEventHandler('Riiick:addItemStock', function(count, item)
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then
        local iteminInv = xPlayer.getInventoryItem(item); 

        if (iteminInv) then

            if (iteminInv.count >= count) then
                local _, index = GetDataYacht(xPlayer.identifier)

                if (not data[index].items) then
                    data[index].items = {}
                end

                if (data[index].items[item]) then
                    data[index].items[item].count = data[index].items[item].count + count;
                else
                    data[index].items[item] = { name = item, count = count, label = iteminInv.label};
                end
                xPlayer.removeInventoryItem(item, count)
                local dtt,_ = GetDataYacht(xPlayer.identifier)
                if dtt then 
                    SetSouteInv(dtt, source)
                 end
            else
                xPlayer.showNotification("Vous n'avez pas assez d'items sur vous !")
            end

        end
    end
end);

RegisterNetEvent('Riiick:removeItemStock')
AddEventHandler('Riiick:removeItemStock', function(count, item)
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then 
        local _, index = GetDataYacht(xPlayer.identifier)

        if (data[index].items[item] and data[index].items[item].count >= count) then
            data[index].items[item].count = data[index].items[item].count - count;
            if (data[index].items[item].count - count == 0) then
                data[index].items[item] = nil;
            end
            xPlayer.addInventoryItem(item, count);
        end
        local dtt,_ = GetDataYacht(xPlayer.identifier)
        if dtt then 
            SetSouteInv(dtt, source)
        end
    end
end);

CreateThread(function()
    while true do
        local cached = json.encode(data);
        local success, msg = pcall(SaveResourceFile, resource, "Common/yacht.json", cached, cached:len());
        if (not success) then
            ESX.Logs.Error(("An error occured when trying to save %s: ^1%s^0"):format("yacht data", msg));
        else
            ESX.Logs.Success("Saved yacht successfully");
        end
        Wait(5 * 1000 * 60)
    end
end)

RegisterCommand("debugyatch", function(source, args)

    local xPlayer = ESX.GetPlayerFromId(source);

    if (ESX.IsAllowedForDanger(xPlayer) or source == 0) then 

        local yatch, index = GetDataYacht(args[1]);
        
        if (data[index]) then 
            
            removeYacht(yatch);
            table.remove(data, index);

            local cached = json.encode(data);
            local success, msg = pcall(SaveResourceFile, resource, "Common/yacht.json", cached, cached:len());

            if (not success) then
                ESX.Logs.Error(("An error occured when trying to save %s: ^1%s^0"):format("yacht data", msg));

                if (xPlayer) then
                    xPlayer.showNotification("An error occured when trying to save yacht data");
                end

            else

                ESX.Logs.Success("Saved yacht successfully");

                if (xPlayer) then
                    xPlayer.showNotification("Yacht supprimé !");
                else
                    ESX.Logs.Success("Yacht supprimé !");
                end

            end

        else

            if (xPlayer) then
                xPlayer.showNotification("Yacht introuvable !");
            else
                ESX.Logs.Error("Yacht introuvable !");
            end

        end

    end

end);

RegisterServerEvent("Riiick:refreshDataCloth")
AddEventHandler("Riiick:refreshDataCloth", function()
    local playerSrc = source
    local xPlayer = ESX.GetPlayerFromId(playerSrc)

    if (xPlayer) then
        MySQL.Async.fetchAll('SELECT * FROM clothes_data WHERE identifier = @identifier', {
            ["@identifier"] = xPlayer.identifier
        }, function(result)
            TriggerClientEvent("Riiick:sendDataCloth", playerSrc, result)
        end)
    end
end)


AddEventHandler('playerDropped', function (reason)
    local playerSrc = source
    local xPlayer = ESX.GetPlayerFromId(playerSrc)

    if (xPlayer) then
        local dttt,_ = GetDataYacht(xPlayer.identifier)
        if dttt then 
            removeYacht(dttt)
        end
    end
end)
  