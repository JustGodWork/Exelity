--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterServerEvent('annonce:serviceRoxSherif')
AddEventHandler('annonce:serviceRoxSherif', function(status)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.getName(source)
    local xPlayers = ESX.GetPlayers()
    if status == "fin" then
        if xPlayer.hasWeapon("weapon_stungun") then
            xPlayer.removeWeapon("weapon_stungun")
        end
        if xPlayer.hasWeapon("weapon_nightstick") then
            xPlayer.removeWeapon("weapon_nightstick")
        end
        if xPlayer.hasWeapon("weapon_combatpistol") then
            xPlayer.removeWeapon("weapon_combatpistol")
        end
        if xPlayer.hasWeapon("weapon_carbinerifle") then
            xPlayer.removeWeapon("weapon_carbinerifle")
        end
    end
    if xPlayer.job.name == 'roxsherif' then
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            if thePlayer.job.name == 'roxsherif' then
                TriggerClientEvent('RoxSherif:InfoService', xPlayers[i], status, name)
            end
        end
    else
        xPlayer.ban(0, '(annonce:serviceRoxSherif)');
    end
end)

RegisterServerEvent('RoxSherif:verif')
AddEventHandler('RoxSherif:verif', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'roxsherif' then
        xPlayer.ban(0, '(RoxSherif:verif)');
    end
end)

RegisterNetEvent('RoxSherif:spawnVehicle', function(model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local position = vector3(-1044.99, 6681.864, 3.157529)
    if xPlayer.job.name ~= 'roxsherif' then
        xPlayer.ban(0, '(RoxSherif:verif)');
        return
    end
    ESX.SpawnVehicle(GetHashKey(model), position, 353.82, nil, false, nil, function(vehicle)
        TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
    end)
end)

AddEventHandler('playerDropped', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if (not xPlayer) then return; end

    if xPlayer.hasWeapon("weapon_stungun") then
        xPlayer.removeWeapon("weapon_stungun")
    end
    if xPlayer.hasWeapon("weapon_nightstick") then
        xPlayer.removeWeapon("weapon_nightstick")
    end
    if xPlayer.hasWeapon("weapon_combatpistol") then
        xPlayer.removeWeapon("weapon_combatpistol")
    end
    if xPlayer.hasWeapon("weapon_carbinerifle") then
        xPlayer.removeWeapon("weapon_carbinerifle")
    end
    if xPlayer.hasWeapon("weapon_advancedrifle") then
        xPlayer.removeWeapon("weapon_advancedrifle")
    end
end)

RegisterServerEvent('RoxSherif:buyWeapon')
AddEventHandler('RoxSherif:buyWeapon', function(weapon)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	local coords = GetEntityCoords(GetPlayerPed(source));
	local distance = #(coords - vector3(-1032.377, 6657.553, 3.185935));
	if xPlayer.job.name == 'roxsherif' then
		if weapon == "weapon_stungun" or weapon == "weapon_flashlight" or weapon == "weapon_nightstick" or weapon == "weapon_combatpistol" or weapon == "weapon_carbinerifle" then
			if (distance < 35.0) then
				if not xPlayer.hasWeapon(weapon) then
					xPlayer.addWeapon(weapon, 255)
				else
					TriggerClientEvent('esx:showNotification', source, "~r~Vous possédez déjà ceci.")
				end
			else
				xPlayer.ban(0, '(RoxSherif:buyWeapon)');
			end
		else
			xPlayer.ban(0, '(RoxSherif:buyWeapon)');
		end
	else
        xPlayer.ban(0, '(RoxSherif:buyWeapon)');
    end
end)

RegisterServerEvent('RoxSherif:menotter')
AddEventHandler('RoxSherif:menotter', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target);
    
    if xPlayer.job.name == 'roxsherif' then
        if (target ~= -1 and targetXPlayer) then
            if ( #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(target))) < 5.0 ) then
                TriggerClientEvent('menotterlejoueur', target)
            end
        end
    else
        xPlayer.ban(0, '(RoxSherif:menotter)');
    end
end);

RegisterServerEvent('RoxSherif:escorter')
AddEventHandler('RoxSherif:escorter', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target);
    
    if xPlayer.job.name == 'roxsherif' then
        if (target ~= -1 and targetXPlayer) then
            if ( #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(target))) < 5.0 ) then
                TriggerClientEvent('actionescorter', target, source)
            end
        end
    else
        xPlayer.ban(0, '(RoxSherif:escorter)');
    end
end);

RegisterServerEvent('RoxSherif:message', function(player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local pName = xPlayer.getName()
    if (xPlayer.job.name == "roxsherif" and player) then
        if (#(GetEntityCoords(GetPlayerPed(xPlayer.source)) - GetEntityCoords(GetPlayerPed(player))) < 5.0) then
            TriggerClientEvent('esx:showNotification', player, "Une personne vous fouille")
        end
    end
end);

RegisterServerEvent('RoxSherif:demande')
AddEventHandler('RoxSherif:demande', function(coords, raison)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
    if xPlayer.job.name == 'roxsherif' then
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            if thePlayer.job.name == 'roxsherif' then
                TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, raison)
            end
        end
    else
        xPlayer.ban(0, '(RoxSherif:demande)');
    end
end)

RegisterServerEvent('RoxSherif:insertintocasier')
AddEventHandler('RoxSherif:insertintocasier', function(name, firstname, dob, reason)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer.job.name == 'roxsherif' then
        xPlayer.ban(0, '(RoxSherif:insertintocasier)');
        return
    end
    MySQL.Async.execute('INSERT INTO casier VALUES (@identifier, @Nom, @Prenom, @Naissance, @Raison, @Auteur)', {  
        ['@identifier'] = xPlayer.identifier,        
        ['@Nom'] = firstname,      
        ['@Prenom'] = name,      
        ['@Naissance'] = dob,
        ['@Raison'] = reason,
        ['@Auteur'] = GetPlayerName(source),
		--['@Auteur'] = GetPlayerName(source)
        
    }, function(rowsChanged)            
    end)
    TriggerClientEvent('esx:showNotification', source, "~r~Le casier judiciaire a bien été enregistré !")
    local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'roxsherif' then
			TriggerClientEvent('updateinfos', xPlayers[i])
            --TriggerClientEvent("esx:showNotification", xPlayers[i], "Une plainte vient d'arrivée !")
		end
	end
end)

RegisterServerEvent('RoxSherif:validerplainte')
AddEventHandler('RoxSherif:validerplainte', function(name, firstname, tel, nom1, prenom1, num1, reason)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer.job.name == 'roxsherif' then
        xPlayer.ban(0, '(RoxSherif:validerplainte)');
        return
    end
    MySQL.Async.execute('INSERT INTO plaintes2 VALUES (@identifier, @Prenom, @Nom, @Num, @Prenom1, @Nom1, @Num1, @Raison, @Auteur)', {  
        ['@identifier'] = xPlayer.identifier,
        ['@Prenom'] = name,            
        ['@Nom'] = firstname,      
        ['@Num'] = tel,
        ['@Prenom1'] = nom1,            
        ['@Nom1'] = prenom1,      
        ['@Num1'] = num1,
        ['@Raison'] = reason,
        ['@Auteur'] = GetPlayerName(source),
		--['@Auteur'] = GetPlayerName(source)
        
    }, function(rowsChanged)            
    end)
    local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'roxsherif' then
			TriggerClientEvent('updateinfos', xPlayers[i])
            TriggerClientEvent("esx:showNotification", xPlayers[i], "~p~Une plainte vient d'arrivée !")
		end
	end
end)

ESX.RegisterServerCallback('RoxSherif:getPlaintes', function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM plaintes3', {}, function(result)
        cb(result)
    end)
end)

ESX.RegisterServerCallback('RoxSherif:getData', function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM casier3', {}, function(result)
        cb(result)
    end)
end)

RegisterServerEvent('plaitetraiterRoxSherif')
AddEventHandler('plaitetraiterRoxSherif', function(prenom, nom, num)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    if not xPlayer.job.name == 'roxsherif' then
        xPlayer.ban(0, '(plaitetraiterRoxSherif)');
        return
    end

    MySQL.Async.execute("DELETE FROM plaintes3 WHERE Prenom = @a AND Nom = @b AND Num = @c", {
        ['a'] = prenom,
        ['b'] = nom,
        ['c'] = num
    }, function()
    end)
    for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'roxsherif' then
			TriggerClientEvent("esx:showNotification", xPlayers[i], "~p~La plainte de monsieur "..prenom.. " "..nom.. " a bien été traitée par le policier " ..xPlayer.getName().. " .")
            TriggerClientEvent('checkplaintes', xPlayers[i])
		end
	end
end)

RegisterServerEvent('RoxSherif:deletecasier')
AddEventHandler('RoxSherif:deletecasier', function(firstname, name, dob, reason, author)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    if not xPlayer.job.name == 'roxsherif' then
        xPlayer.ban(0, '(RoxSherif:deletecasier)');
        return
    end
    MySQL.Async.execute("DELETE FROM casier3 WHERE Prenom = @a AND Nom = @b AND naissance = @c AND raison = @d AND auteur = @e", {
        ['a'] = firstname,
        ['b'] = name,
        ['c'] = dob,
        ['d'] = reason,
        ['e'] = author
    }, function()
    end)
    for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'roxsherif' then
			TriggerClientEvent("esx:showNotification", xPlayers[i], "~p~Le casier judiciare de monsieur "..firstname.. " "..name.. " a bien été supprimé par le policier " ..xPlayer.getName().. " .")
            TriggerClientEvent('updateinfos', xPlayers[i])
		end
	end
end)

RegisterNetEvent('RoxSherif:confiscatePlayerItem', function(target, itemType, itemName, amount)
    local source = source
    local sourceXPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    if (not sourceXPlayer or not targetXPlayer) then return end

    local ped = GetPlayerPed(sourceXPlayer.source);
    local targetPed = GetPlayerPed(targetXPlayer.source);

    if sourceXPlayer.job.name ~= 'roxsherif' then
        xPlayer.ban(0, '(RoxSherif:confiscatePlayerItem)');
    else
        if (#(GetEntityCoords(targetPed) - GetEntityCoords(ped)) < 4.0) then
            if itemType == 'item_standard' then
                local sourceItem = sourceXPlayer.getInventoryItem(itemName)
                TriggerEvent('esx_addoninventory:getSharedInventory', 'society_roxsherif', function(inventory)
                    if (amount and tonumber(amount) and sourceItem and sourceItem.count and tonumber(sourceItem.count)) then
                        if sourceItem.count >= amount and amount > 0 then 
                            inventory.addItem(itemName, amount);
                            targetXPlayer.removeInventoryItem(itemName, amount);
                            TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~p~"..amount..' '..sourceItem.label.."~s~.")
                            TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a pris ~p~"..amount..' '..sourceItem.label.."~s~.")
                            SendLogs("RoxSherif", "Exelity | RoxSherif", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre un item "..amount.." "..sourceItem.label.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1110217673058562098/7CnFJrMWQ5w20VhKNbxy27tiF8TPydjCFIzSZaU92ywF3yJyd0bUM2WDrWK8gzT22jgW")
                        else
                            TriggerClientEvent('esx:showNotification', source, "Quantité invalide");
                        end
                    end
                end);
            end         
            if itemType == 'item_account' then
                local targetAccount = targetXPlayer.getAccount(itemName)
                if (targetAccount and targetAccount.money >= amount) then
                    targetXPlayer.removeAccountMoney(itemName, amount);
                    TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~p~"..amount.."$ ~s~argent non déclaré~s~.");
                    TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a pris ~p~"..amount.."$ ~s~argent non déclaré~s~.");
                    SendLogs("RoxSherif", "Exelity | RoxSherif", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre de l'argent "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1110217673058562098/7CnFJrMWQ5w20VhKNbxy27tiF8TPydjCFIzSZaU92ywF3yJyd0bUM2WDrWK8gzT22jgW")
                else
                    TriggerClientEvent('esx:showNotification', source, "Quantité invalide");
                end
            end
        
            if itemType == 'item_weapon' then
                if (targetXPlayer.hasWeapon(string.upper(itemName))) then
                    targetXPlayer.removeWeapon(itemName, 0);
                    TriggerEvent('esx_datastore:getSharedDataStore', 'society_roxsherif', function(store)
                        local weapons = store.get('weapons') or {}
                        local foundWeapon = false

                        for i=1, #weapons, 1 do
                            if weapons[i].name == itemName then
                                weapons[i].count = weapons[i].count + 1
                                foundWeapon = true
                                break
                            end
                        end

                        if not foundWeapon then
                            table.insert(weapons, {
                                name  = itemName,
                                count = 1
                            })
                        end                    
                        store.set('weapons', weapons)
                    end)
                    SendLogs("RoxSherif", "Exelity | RoxSherif", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre une arme "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1110217673058562098/7CnFJrMWQ5w20VhKNbxy27tiF8TPydjCFIzSZaU92ywF3yJyd0bUM2WDrWK8gzT22jgW")
                end
            end
        end
    end
end);

ESX.RegisterServerCallback('getOtherPlayerDataRoxSherif', function(source, cb, target, notify)
    local xPlayer = ESX.GetPlayerFromId(target)

    if xPlayer then
        local data = {
            name = xPlayer.getName(),
            job = xPlayer.job.label,
            grade = xPlayer.job.grade_label,
            inventory = xPlayer.getInventory(),
            accounts = xPlayer.getAccounts(),
            weapons = xPlayer.getLoadout()
        }

        cb(data)
    end
end)

ESX.RegisterServerCallback('getVehicleInfos', function(source, cb, plate)

    MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)

        local retrivedInfo = {
            plate = plate
        }

        if result[1] then
            MySQL.Async.fetchAll('SELECT name, firstname, lastname FROM users WHERE identifier = @identifier',  {
                ['@identifier'] = result[1].owner
            }, function(result2)

                --if Config.EnableESXIdentity then
                    retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname
            --	else
                    retrivedInfo.owner = result2[1].name
                --end

                cb(retrivedInfo)
            end)
        else
            cb(retrivedInfo)
        end
    end)
end)


RegisterNetEvent("RoxSherif:SendFacture", function(target, price)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'roxsherif' then
        xPlayer.ban(0, '(RoxSherif:SendFacture)');
        return
	end

    local society = ESX.DoesSocietyExist("roxsherif");

    if (society) then

        local xPlayer = ESX.GetPlayerFromId(target)
        xPlayer.removeAccountMoney('bank', price)
        ESX.AddSocietyMoney("RoxSherif", price);
        TriggerClientEvent("esx:showNotification", target, "Votre compte en banque à été réduit de "..price.."~g~$~s~.")
        TriggerClientEvent("esx:showNotification", source, "Vous avez donné une amende de "..price.."~g~$~s~")
        SendLogs("Facture", "Exelity | Facture", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) vient d'envoyer une facture de "..price.."$ au joueur **"..xTarget.name.."** (***"..xTarget.identifier.."***) pour l'entreprise **B.C.S.O** ", "https://discord.com/api/webhooks/1060516689344741396/ND9GdygiHYb8E7mR7jMlpf3epTBIli4YeFnNpLG_cZ_i498WvOfVunmEaYNaC5XVrfvz")

    else

        TriggerClientEvent("esx:showNotification", source, "Une erreur est survenue. 'RoxSherif:SendFacture'");

    end

end)

ESX.RegisterServerCallback('RoxSherif:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_roxsherif', function(inventory)
		cb(inventory.items)
	end)
end)


RegisterNetEvent('RoxSherif:getStockItem')
AddEventHandler('RoxSherif:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_roxsherif', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
                SendLogs("RoxSherif", "Coffre | RoxSherif", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a retiré "..count.." "..inventoryItem.label.." du coffre", "https://discord.com/api/webhooks/1110218484283088926/w44AkqBLrcM6juotQrzpU4PPtWQMCLbVxkHxnJnP-zHoG1zZhsF7rRD7DxffI4iOLri8")
		else
			TriggerClientEvent('esx:showNotification', _source, "Quantité invalide")
		end
	end)
end)

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

RegisterNetEvent('RoxSherif:putStockItems')
AddEventHandler('RoxSherif:putStockItems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_roxsherif', function(inventory)

		local inventoryItem = inventory.getItem(itemName);

        if (count and tonumber(count) and sourceItem and sourceItem.count and tonumber(sourceItem.count)) then
            -- does the player have enough of the item?
            if sourceItem.count >= count and count > 0 then
                
                xPlayer.removeInventoryItem(itemName, count);
                inventory.addItem(itemName, count);
                TriggerClientEvent('esx:showNotification', _source, "Objet déposé "..count.." "..inventoryItem.label.."");  -- JustGod à touché.
                SendLogs("RoxSherif", "Coffre | RoxSherif", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a déposé "..count.." "..inventoryItem.label.." dans le coffre", "https://discord.com/api/webhooks/1110218484283088926/w44AkqBLrcM6juotQrzpU4PPtWQMCLbVxkHxnJnP-zHoG1zZhsF7rRD7DxffI4iOLri8")
           
            else

                TriggerClientEvent('esx:showNotification', _source, "Quantité invalide");

            end
        else

            xPlayer.showNotification("Une erreur est survenue, Code erreur ~b~'RoxSherif_stock_put_items_error'~s~. Veuillez contacter un administrateur.");

        end

	end);
end);

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

ESX.RegisterServerCallback('RoxSherif:getArmoryWeapons', function(source, cb)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_roxsherif', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end
		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('RoxSherif:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
        SendLogs("RoxSherif", "Coffre | RoxSherif", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a déposé "..weaponName.." dans le coffre", "https://discord.com/api/webhooks/1110218484283088926/w44AkqBLrcM6juotQrzpU4PPtWQMCLbVxkHxnJnP-zHoG1zZhsF7rRD7DxffI4iOLri8")
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_roxsherif', function(store)
		local weapons = store.get('weapons') or {}
		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('RoxSherif:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 0)
    SendLogs("RoxSherif", "Coffre | RoxSherif", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a retiré "..weaponName.." du coffre", "https://discord.com/api/webhooks/1110218484283088926/w44AkqBLrcM6juotQrzpU4PPtWQMCLbVxkHxnJnP-zHoG1zZhsF7rRD7DxffI4iOLri8")

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_roxsherif', function(store)
		local weapons = store.get('weapons') or {}

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('RoxSherif:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

RegisterNetEvent("RoxSherif:SendFacture", function(target, price)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'roxsherif' then
        xPlayer.ban(0, '(RoxSherif:SendFacture)');
        return
	end

    local society = ESX.DoesSocietyExist("roxsherif");

    if (society) then

        local xTarget = ESX.GetPlayerFromId(target);

        if (xTarget) then

            xTarget.removeAccountMoney('bank', price);
            ESX.AddSocietyMoney("roxsherif", price);
            xTarget.showNotification("Votre compte en banque à été réduit de "..price.."~g~$~s~.");
            xPlayer.showNotification("Vous avez donné une amende de "..price.."~g~$~s~");

        end

    end

end);