--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

local outsideVehicles = {};

ESX.RegisterServerCallback('cardealer:getCategories', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then 

        if xPlayer.job.name ~= 'cardealer' then
            xPlayer.ban(0, '(cardealer:getCategories)')
            return
        end

        MySQL.Async.fetchAll('SELECT * FROM vehicle_categories', {}, function(result)
            cb(result)
        end)
    end
end)

RegisterServerEvent('cardealer:changeBucket')
AddEventHandler('cardealer:changeBucket', function(reason)
    local source = source
    if reason == "enter" then
        SetPlayerRoutingBucket(source, source+1)
    else
        SetPlayerRoutingBucket(source, 0)
    end
end)

ESX.RegisterServerCallback('cardealer:getAllVehicles', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then 

        if xPlayer.job.name ~= 'cardealer' then
            xPlayer.ban(0, '(cardealer:getAllVehicles)')
            return
        end

        MySQL.Async.fetchAll('SELECT * FROM vehicles', {
        }, function(result)
            cb(result)
        end)
    end
end)

ESX.RegisterServerCallback('cardealer:getSocietyMoney', function(source, cb)

    local xPlayer = ESX.GetPlayerFromId(source);

    local society = ESX.DoesSocietyExist("cardealer");

    if (society) then

        cb(ESX.GetSocietyMoney("cardealer"));

    else

        cb(0);
        xPlayer.showNotification("Une erreur est survenue, Code erreur ~b~'cardealer_get_money_error'~s~. Veuillez contacter un ~b~administrateur~s~.");

    end

end);

ESX.RegisterServerCallback('cardealer:getSocietyVehicles', function(source, cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then 

        if xPlayer.job.name ~= 'cardealer' then
            xPlayer.ban(0, '(cardealer:getSocietyVehicles)')
            return
        end

        MySQL.Async.fetchAll('SELECT * FROM cardealer_vehicles WHERE society = @a', {
            ['@a'] = 'society_cardealer'
        }, function(result)
            cb(result)
        end)
    end
end)

RegisterServerEvent('cardealer:buyVehicle')
AddEventHandler('cardealer:buyVehicle', function(props, name, price)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= "cardealer" then
        xPlayer.ban(0, '(cardealer:buyVehicle)');
        return
    end

    local society = ESX.DoesSocietyExist("cardealer");

    if (society) then

        MySQL.Async.execute('INSERT INTO cardealer_vehicles (vehicle, name, price, society) VALUES (@a, @b, @c, @d)', {
            ['@a']   = props,
            ['@b']   = name,
            ['@c']   = price,
            ['@d']   = 'society_cardealer'
        }, function()

            ESX.RemoveSocietyMoney("cardealer", tonumber(price));
            
        end);

    else

        xPlayer.showNotification("Une erreur est survenue, Code erreur ~b~'cardealer_buyVehicle_error'~s~. Veuillez contacter un ~b~administrateur~s~.");

    end

end);

RegisterServerEvent('cardealer:removesocietycar', function(id, model, plate, menuData)
    local src = source;
    local xPlayer = ESX.GetPlayerFromId(src);
    if (xPlayer.job.name == "cardealer") then
        MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id = @id', {
            ['@id'] = id
        }, function()
            local vehicleModel = type(model) == 'number' and model or GetHashKey(model);
            ESX.SpawnVehicle(vehicleModel, vector3(-769.4286, -231.1507, 37.26457), 203.99, plate, true, xPlayer, function(handle, props)
                --CreateThread(function()

                    --while not (DoesEntityExist(handle)) do
                        --Wait(100);
                    --end

                    xPlayer.triggerEvent("cardealer:onSpawnVehicle", menuData, NetworkGetNetworkIdFromEntity(handle), props);
                    outsideVehicles[#outsideVehicles + 1] = {handle = handle, plate = plate, model = model, price = menuData.price, name = menuData.name};

                --end);
            end);
        end);
    end
end)

local function storeVehicle(vehicleModel, vehicleName, price)
    MySQL.Async.execute('INSERT INTO cardealer_vehicles (vehicle, name, price, society) VALUES (@a, @b, @c, @d)', {
        ['@a']   = vehicleModel,
        ['@b']   = vehicleName,
        ['@c']   = price,
        ['@d']   = 'society_cardealer'
    }, function(rowsChange)
    end)
end

RegisterNetEvent("cardealer:deleteAllVehicles", function()
    local src = source;
    local xPlayer = ESX.GetPlayerFromId(src);
    if (xPlayer.job.name == "cardealer") then
        for i = 1, #outsideVehicles do
            local vehicle = outsideVehicles[i];
            ESX.RemoveVehicle(vehicle.plate, function()
                storeVehicle(vehicle.model, vehicle.name, vehicle.price);
            end);
        end
        outsideVehicles = {};
    end
end);

RegisterServerEvent('cardealer:recupvehicle')
AddEventHandler('cardealer:recupvehicle', function(vehicle, name, price, society)
    MySQL.Async.execute('INSERT INTO cardealer_vehicles (vehicle, name, price, society) VALUES (@a, @b, @c, @d)', {
        ['@a']   = vehicle,
        ['@b']   = name,
        ['@c']   = price,
        ['@d']   = 'society_cardealer'
    }, function(rowsChange)
    end)
end)

ESX.RegisterServerCallback('vehicle:verifierplaquedispoboutique', function (source, cb, plate)
    MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function (result)
        cb(result[1] ~= nil)
    end)
end)

RegisterServerEvent('sellthevehicle')
AddEventHandler('sellthevehicle', function(player, props)
    local xPlayer = ESX.GetPlayerFromId(source)
    local tPlayer = ESX.GetPlayerFromId(player)

    if xPlayer.job.name ~= "cardealer" then
        xPlayer.ban(0, '(sellthevehicle)');
    else
        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, state) VALUES (@owner, @plate, @vehicle, @state)', {
            ['@owner']   = tPlayer.identifier,
            ['@plate']   = props.plate,
            ['@vehicle'] = json.encode(props),
            ['@state']   = 0
        }, function()
            SendLogs("Concessionnaire", "Exelity | Concessionnaire", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) à vendu la voiture avec la plaque (***"..props.plate.."***) au joueur **"..tPlayer.name.."** (***"..tPlayer.identifier.."***)", "https://discord.com/api/webhooks/1093245677561196594/2chlIyAOvhV0wOp4-kCsi8Ubr6XM2CfifubKRRWwPrkbxIWelk2ADJmA13N7NLyBLo-h")
            ESX.GiveCarKey(tPlayer, props.plate);
            for i = 1, #outsideVehicles do
                local vehicle = outsideVehicles[i];
                if (vehicle.plate == props.plate) then
                    table.remove(outsideVehicles, i);
                    break;
                end
            end
        end)
    end
end)

local TimeoutJob3 = {};

RegisterServerEvent('Ouvre:CarShop')
AddEventHandler('Ouvre:CarShop', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob3[xPlayer.identifier] or GetGameTimer() - TimeoutJob3[xPlayer.identifier] > 600000) then
		TimeoutJob3[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "cardealer" then
            xPlayer.ban(0, '(Ouvre:CarShop)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Voiture', '~r~Annonce', 'Le concessionnaire Voiture est désormais Ouvert~s~ !', 'CHAR_MP_STRIPCLUB_PR', 8)
        end
    else
        xPlayer.showNotification("Vous devez attendre 10 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Ferme:CarShop')
AddEventHandler('Ferme:CarShop', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob3[xPlayer.identifier] or GetGameTimer() - TimeoutJob3[xPlayer.identifier] > 600000) then
		TimeoutJob3[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "cardealer" then
            xPlayer.ban(0, '(Ferme:CarShop)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Voiture', '~r~Annonce', 'Le concessionnaire Voiture est désormais Fermer~s~ !', 'CHAR_MP_STRIPCLUB_PR', 8)
        end
    else
        xPlayer.showNotification("Vous devez attendre 10 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)

RegisterServerEvent('Recrutement:CarShop')
AddEventHandler('Recrutement:CarShop', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
    if (not TimeoutJob3[xPlayer.identifier] or GetGameTimer() - TimeoutJob3[xPlayer.identifier] > 600000) then
		TimeoutJob3[xPlayer.identifier] = GetGameTimer();
        if xPlayer.job.name ~= "cardealer" then
            xPlayer.ban(0, '(Recrutement:CarShop)');
            return
        end
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Voiture', '~g~Annonce', 'Les Recrutement en cours, rendez-vous au concessionnaire Voiture !', 'CHAR_MP_STRIPCLUB_PR', 8)
        end
    else
        xPlayer.showNotification("Vous devez attendre 10 minutes avant de pouvoir faire une annonce à nouveau.");
    end
end)