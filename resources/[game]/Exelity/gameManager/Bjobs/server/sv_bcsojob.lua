--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterServerEvent('annonce:serviceBcso')
AddEventHandler('annonce:serviceBcso', function(status)
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
    if xPlayer.job.name == 'bcso' then
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            if thePlayer.job.name == 'bcso' then
                TriggerClientEvent('bcso:InfoService', xPlayers[i], status, name)
            end
        end
    else
        xPlayer.ban(0, '(annonce:serviceBcso)');
    end
end)

RegisterServerEvent('bcso:verif')
AddEventHandler('bcso:verif', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'bcso' then
        xPlayer.ban(0, '(bcso:verif)');
    end
end)

RegisterNetEvent('bcso:spawnVehicle', function(model, position, heading)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'bcso' then
        xPlayer.ban(0, '(bcso:verif)');
        return
    end
    ESX.SpawnVehicle(GetHashKey(model), position, heading, nil, false, nil, function(vehicle)
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

RegisterServerEvent('bcso:buyWeapon')
AddEventHandler('bcso:buyWeapon', function(weapon)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	local coords = GetEntityCoords(GetPlayerPed(source));
	local distance = #(coords - vector3(-443.837, 6013.124, 37.008));
	if xPlayer.job.name == 'bcso' then
		if weapon == "weapon_stungun" or weapon == "weapon_flashlight" or weapon == "weapon_nightstick" or weapon == "weapon_combatpistol" or weapon == "weapon_carbinerifle" then
			if (distance < 35.0) then
				if not xPlayer.hasWeapon(weapon) then
					xPlayer.addWeapon(weapon, 255)
				else
					TriggerClientEvent('esx:showNotification', source, "~r~Vous possédez déjà ceci.")
				end
			else
				xPlayer.ban(0, '(bcso:buyWeapon)');
			end
		else
			xPlayer.ban(0, '(bcso:buyWeapon)');
		end
	else
        xPlayer.ban(0, '(bcso:buyWeapon)');
    end
end)

RegisterServerEvent('bcso:menotter')
AddEventHandler('bcso:menotter', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target);
    
    if xPlayer.job.name == 'bcso' then
        if (target ~= -1 and targetXPlayer) then
            if ( #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(target))) < 5.0 ) then
                TriggerClientEvent('menotterlejoueur', target)
            end
        end
    else
        xPlayer.ban(0, '(bcso:menotter)');
    end
end);

RegisterServerEvent('bcso:escorter')
AddEventHandler('bcso:escorter', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target);
    
    if xPlayer.job.name == 'bcso' then
        if (target ~= -1 and targetXPlayer) then
            if ( #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(target))) < 5.0 ) then
                TriggerClientEvent('actionescorter', target, source)
            end
        end
    else
        xPlayer.ban(0, '(bcso:escorter)');
    end
end);

RegisterServerEvent('bcso:message', function(player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local pName = xPlayer.getName()
    if (xPlayer.job.name == "bcso" and player) then
        if (#(GetEntityCoords(GetPlayerPed(xPlayer.source)) - GetEntityCoords(GetPlayerPed(player))) < 5.0) then
            TriggerClientEvent('esx:showNotification', player, "Une personne vous fouille")
        end
    end
end);

RegisterServerEvent('bcso:demande')
AddEventHandler('bcso:demande', function(coords, raison)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
    if xPlayer.job.name == 'bcso' then
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            if thePlayer.job.name == 'bcso' then
                TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, raison)
            end
        end
    else
        xPlayer.ban(0, '(bcso:demande)');
    end
end)

RegisterServerEvent('bcso:insertintocasier')
AddEventHandler('bcso:insertintocasier', function(name, firstname, dob, reason)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer.job.name == 'bcso' then
        xPlayer.ban(0, '(bcso:insertintocasier)');
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
		if thePlayer.job.name == 'bcso' then
			TriggerClientEvent('updateinfos', xPlayers[i])
            --TriggerClientEvent("esx:showNotification", xPlayers[i], "Une plainte vient d'arrivée !")
		end
	end
end)

RegisterServerEvent('bcso:validerplainte')
AddEventHandler('bcso:validerplainte', function(name, firstname, tel, nom1, prenom1, num1, reason)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer.job.name == 'bcso' then
        xPlayer.ban(0, '(bcso:validerplainte)');
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
		if thePlayer.job.name == 'bcso' then
			TriggerClientEvent('updateinfos', xPlayers[i])
            TriggerClientEvent("esx:showNotification", xPlayers[i], "~p~Une plainte vient d'arrivée !")
		end
	end
end)

ESX.RegisterServerCallback('bcso:getPlaintes', function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM plaintes2', {}, function(result)
        cb(result)
    end)
end)

ESX.RegisterServerCallback('bcso:getData', function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM casier2', {}, function(result)
        cb(result)
    end)
end)

RegisterServerEvent('plaitetraiterbcso')
AddEventHandler('plaitetraiterbcso', function(prenom, nom, num)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    if not xPlayer.job.name == 'bcso' then
        xPlayer.ban(0, '(plaitetraiterbcso)');
        return
    end

    MySQL.Async.execute("DELETE FROM plaintes2 WHERE Prenom = @a AND Nom = @b AND Num = @c", {
        ['a'] = prenom,
        ['b'] = nom,
        ['c'] = num
    }, function()
    end)
    for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'bcso' then
			TriggerClientEvent("esx:showNotification", xPlayers[i], "~p~La plainte de monsieur "..prenom.. " "..nom.. " a bien été traitée par le policier " ..xPlayer.getName().. " .")
            TriggerClientEvent('checkplaintes', xPlayers[i])
		end
	end
end)

RegisterServerEvent('bcso:deletecasier')
AddEventHandler('bcso:deletecasier', function(firstname, name, dob, reason, author)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    if not xPlayer.job.name == 'bcso' then
        xPlayer.ban(0, '(bcso:deletecasier)');
        return
    end
    MySQL.Async.execute("DELETE FROM casier2 WHERE Prenom = @a AND Nom = @b AND naissance = @c AND raison = @d AND auteur = @e", {
        ['a'] = firstname,
        ['b'] = name,
        ['c'] = dob,
        ['d'] = reason,
        ['e'] = author
    }, function()
    end)
    for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'bcso' then
			TriggerClientEvent("esx:showNotification", xPlayers[i], "~p~Le casier judiciare de monsieur "..firstname.. " "..name.. " a bien été supprimé par le policier " ..xPlayer.getName().. " .")
            TriggerClientEvent('updateinfos', xPlayers[i])
		end
	end
end)

RegisterNetEvent('bcso:confiscatePlayerItem', function(target, itemType, itemName, amount)
    local source = source
    local sourceXPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    if (not sourceXPlayer or not targetXPlayer) then return end

    local ped = GetPlayerPed(sourceXPlayer.source);
    local targetPed = GetPlayerPed(targetXPlayer.source);

    if sourceXPlayer.job.name ~= 'bcso' then
        xPlayer.ban(0, '(bcso:confiscatePlayerItem)');
    else
        if (#(GetEntityCoords(targetPed) - GetEntityCoords(ped)) < 4.0) then
            if itemType == 'item_standard' then
                local targetItem = targetXPlayer.getInventoryItem(itemName)
                local sourceItem = sourceXPlayer.getInventoryItem(itemName)

                if (targetItem and targetItem.count >= amount) then
                    if (sourceXPlayer.canCarryItem(itemName, amount)) then
                        targetXPlayer.removeInventoryItem(itemName, amount);
                        sourceXPlayer.addInventoryItem(itemName, amount);
                        TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~p~"..amount..' '..sourceItem.label.."~s~.")
                        TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a pris ~p~"..amount..' '..sourceItem.label.."~s~.")
                        SendLogs("BCSO", "Exelity | BCSO", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre un item "..amount.." "..sourceItem.label.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1049499838141714462/p3mDDiJ4Xy62OnUridFEx0dHppYerZPdrKDGXqylKGtSAq54hY2X9hbebTK33Tm_Garr")
                    else
                        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas assez de place dans votre inventaire.");
                    end
                end
            end
                
            if itemType == 'item_account' then
                local targetAccount = targetXPlayer.getAccount(itemName)
                if (targetAccount and targetAccount.money >= amount) then
                    targetXPlayer.removeAccountMoney(itemName, amount);
                    sourceXPlayer.addAccountMoney(itemName, amount);
                    
                    TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~p~"..amount.."$ ~s~argent non déclaré~s~.");
                    TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a pris ~p~"..amount.."$ ~s~argent non déclaré~s~.");
                    SendLogs("BCSO", "Exelity | BCSO", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre de l'argent "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1049499838141714462/p3mDDiJ4Xy62OnUridFEx0dHppYerZPdrKDGXqylKGtSAq54hY2X9hbebTK33Tm_Garr")
                end
            end
        
            if itemType == 'item_weapon' then
                if (targetXPlayer.hasWeapon(string.upper(itemName))) then
                    if (not sourceXPlayer.hasWeapon(string.upper(itemName))) then
                        targetXPlayer.removeWeapon(itemName, 0);
                        sourceXPlayer.addWeapon(itemName, amount);
                        SendLogs("BCSO", "Exelity | BCSO", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre une arme "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1049499838141714462/p3mDDiJ4Xy62OnUridFEx0dHppYerZPdrKDGXqylKGtSAq54hY2X9hbebTK33Tm_Garr")
                    else
                        TriggerClientEvent("esx:showNotification", source, "Vous avez déjà cette arme.");
                    end
                end
            end
        end
    end
end);

ESX.RegisterServerCallback('getOtherPlayerDataBcso', function(source, cb, target, notify)
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


RegisterNetEvent("bsco:SendFacture", function(target, price)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'bcso' then
        xPlayer.ban(0, '(bsco:SendFacture)');
        return
	end

    local society = ESX.DoesSocietyExist("bcso");

    if (society) then

        local xPlayer = ESX.GetPlayerFromId(target)
        xPlayer.removeAccountMoney('bank', price)
        ESX.AddSocietyMoney("bcso", price);
        TriggerClientEvent("esx:showNotification", target, "Votre compte en banque à été réduit de "..price.."~g~$~s~.")
        TriggerClientEvent("esx:showNotification", source, "Vous avez donné une amende de "..price.."~g~$~s~")
        SendLogs("Facture", "Exelity | Facture", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) vient d'envoyer une facture de "..price.."$ au joueur **"..xTarget.name.."** (***"..xTarget.identifier.."***) pour l'entreprise **B.C.S.O** ", "https://discord.com/api/webhooks/1060516689344741396/ND9GdygiHYb8E7mR7jMlpf3epTBIli4YeFnNpLG_cZ_i498WvOfVunmEaYNaC5XVrfvz")

    else

        TriggerClientEvent("esx:showNotification", source, "Une erreur est survenue. 'bsco:SendFacture'");

    end

end)

ESX.RegisterServerCallback('bcso:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bcso', function(inventory)
		cb(inventory.items)
	end)
end)


RegisterNetEvent('bcso:getStockItem')
AddEventHandler('bcso:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bcso', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
            SendLogs("BCSO", "Exelity | BCSO", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a retiré "..count.." "..inventoryItem.label.." dans le coffre", "https://discord.com/api/webhooks/1049498628185669712/avx1GZUHsQBhywN80sB3wWy39Iki2SzDKeaNWYBPksHBlI-ys25Kor6jboHCeytuIxQE")
		else
			TriggerClientEvent('esx:showNotification', _source, "Quantité invalide")
		end
	end)
end)

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

RegisterNetEvent('bcso:putStockItems')
AddEventHandler('bcso:putStockItems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)

		local inventoryItem = inventory.getItem(itemName);

        if (count and tonumber(count) and sourceItem and sourceItem.count and tonumber(sourceItem.count)) then
            -- does the player have enough of the item?
            if sourceItem.count >= count and count > 0 then
                
                xPlayer.removeInventoryItem(itemName, count);
                inventory.addItem(itemName, count);
                TriggerClientEvent('esx:showNotification', _source, "Objet déposé "..count.." "..inventoryItem.label.."");  -- JustGod à touché.
                SendLogs("BCSO", "Exelity | BCSO", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a déposé "..count.." "..inventoryItem.label.." dans le coffre", "https://discord.com/api/webhooks/1049498628185669712/avx1GZUHsQBhywN80sB3wWy39Iki2SzDKeaNWYBPksHBlI-ys25Kor6jboHCeytuIxQE")
           
            else

                TriggerClientEvent('esx:showNotification', _source, "Quantité invalide");

            end
        else

            xPlayer.showNotification("Une erreur est survenue, Code erreur ~b~'bcso_stock_put_items_error'~s~. Veuillez contacter un administrateur.");

        end

	end);
end);

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

ESX.RegisterServerCallback('bcso:getArmoryWeapons', function(source, cb)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_bcso', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end
		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('bcso:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
        SendLogs("BCSO", "Exelity | BCSO", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a déposé "..weaponName.." dans le coffre", "https://discord.com/api/webhooks/1049498628185669712/avx1GZUHsQBhywN80sB3wWy39Iki2SzDKeaNWYBPksHBlI-ys25Kor6jboHCeytuIxQE")
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_bcso', function(store)
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

ESX.RegisterServerCallback('bcso:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 0)
    SendLogs("BCSO", "Exelity | BCSO", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a retiré "..weaponName.." dans le coffre", "https://discord.com/api/webhooks/1049498628185669712/avx1GZUHsQBhywN80sB3wWy39Iki2SzDKeaNWYBPksHBlI-ys25Kor6jboHCeytuIxQE")

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_bcso', function(store)
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

ESX.RegisterServerCallback('bcso:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

RegisterNetEvent("bcso:SendFacture", function(target, price)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'bcso' then
        xPlayer.ban(0, '(bcso:SendFacture)');
        return
	end

    local society = ESX.DoesSocietyExist("bcso");

    if (society) then

        local xTarget = ESX.GetPlayerFromId(target);

        if (xTarget) then

            xTarget.removeAccountMoney('bank', price);
            ESX.AddSocietyMoney("bcso", price);
            xTarget.showNotification("Votre compte en banque à été réduit de "..price.."~g~$~s~.");
            xPlayer.showNotification("Vous avez donné une amende de "..price.."~g~$~s~");

        end

    end

end);