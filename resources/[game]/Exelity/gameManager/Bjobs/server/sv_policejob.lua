--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterServerEvent('annonce:servicePolice')
AddEventHandler('annonce:servicePolice', function(status)
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
    if xPlayer.job.name == 'police' then
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            if thePlayer.job.name == 'police' then
                TriggerClientEvent('police:InfoService', xPlayers[i], status, name)
            end
        end
    else
        xPlayer.ban(0, '(annonce:servicePolice)');
    end
end)

RegisterServerEvent('police:verif')
AddEventHandler('police:verif', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'police' then
        xPlayer.ban(0, '(police:verif)');
    end
end)

RegisterNetEvent('police:spawnVehicle', function(model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'police' then
        xPlayer.ban(0, '(police:spawnVehicle)');
        return
    end
    ESX.SpawnVehicle(GetHashKey(model), vector3(445.9571, -988.778, 25.09348), 269.53283691406, nil, false, nil, function(vehicle)
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

RegisterServerEvent('buyWeaponForLSPD')
AddEventHandler('buyWeaponForLSPD', function(weapon)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	local coords = GetEntityCoords(GetPlayerPed(source));
	local distance = #(coords - vector3(485.4806, -995.615, 30.69032));
	if xPlayer.job.name == 'police' then
		if weapon == "weapon_stungun" or weapon == "weapon_flashlight" or weapon == "weapon_nightstick" or weapon == "weapon_combatpistol" or weapon == "weapon_carbinerifle" then
			if (distance < 35.0) then
				if not xPlayer.hasWeapon(weapon) then
					xPlayer.addWeapon(weapon, 255)
				else
					TriggerClientEvent('esx:showNotification', source, "~r~Vous possédez déjà ceci.")
				end
			else
				xPlayer.ban(0, '(buyWeaponForLSPD)');
			end
		else
			xPlayer.ban(0, '(buyWeaponForLSPD)');
		end
	else
        xPlayer.ban(0, '(buyWeaponForLSPD)');
    end
end)

RegisterServerEvent('menotterForPolice')
AddEventHandler('menotterForPolice', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target);
    
    if xPlayer.job.name == 'police' then
        if (target ~= -1 and targetXPlayer) then
            if ( #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(target))) < 5.0 ) then
                TriggerClientEvent('menotterlejoueur', target)
            end
        end
    else
        xPlayer.ban(0, '(menotterForPolice)');
    end
end);

RegisterServerEvent('escorterpolice')
AddEventHandler('escorterpolice', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target);
    
    if xPlayer.job.name == 'police' then
        if (target ~= -1 and targetXPlayer) then
            if ( #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(target))) < 5.0 ) then
                TriggerClientEvent('actionescorter', target, source)
            end
        end
    else
        xPlayer.ban(0, '(escorterpolice)');
    end
end);

RegisterServerEvent('menotterForGouv')
AddEventHandler('menotterForGouv', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target);
    
    if xPlayer.job.name == 'gouv' then
        if (target ~= -1 and targetXPlayer) then
            if ( #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(target))) < 5.0 ) then
                TriggerClientEvent('menotterlejoueur', target)
            end
        end
    else
        xPlayer.ban(0, '(menotterForGouv)');
    end
end);

RegisterServerEvent('escorterGouv')
AddEventHandler('escorterGouv', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target);
    
    if xPlayer.job.name == 'gouv' then
        if (target ~= -1 and targetXPlayer) then
            if ( #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(target))) < 5.0 ) then
                TriggerClientEvent('actionescorter', target, source)
            end
        end
    else
        xPlayer.ban(0, '(escorterGouv)');
    end
end);

RegisterServerEvent('message', function(player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local pName = xPlayer.getName()
    if (xPlayer.job.name == "police" and player) then
        if (#(GetEntityCoords(GetPlayerPed(xPlayer.source)) - GetEntityCoords(GetPlayerPed(player))) < 5.0) then
            TriggerClientEvent('esx:showNotification', player, "Une personne vous fouille")
        end
    end
end);

RegisterServerEvent('messageGouv', function(player)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local pName = xPlayer.getName()
    if (xPlayer.job.name == "gouv" and player) then
        if (#(GetEntityCoords(GetPlayerPed(xPlayer.source)) - GetEntityCoords(GetPlayerPed(player))) < 5.0) then
            TriggerClientEvent('esx:showNotification', player, "Une personne vous fouille")
        end
    end
end);

RegisterServerEvent('demande')
AddEventHandler('demande', function(coords, raison)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
    if xPlayer.job.name == 'police' then
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            if thePlayer.job.name == 'police' then
                TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, raison)
            end
        end
    else
        xPlayer.ban(0, '(demande)');
    end
end)

RegisterServerEvent('insertintocasier')
AddEventHandler('insertintocasier', function(name, firstname, dob, reason)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer.job.name == 'police' then
        xPlayer.ban(0, '(insertintocasier)');
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
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('updateinfos', xPlayers[i])
            --TriggerClientEvent("esx:showNotification", xPlayers[i], "Une plainte vient d'arrivée !")
		end
	end
end)

RegisterServerEvent('validerplainte')
AddEventHandler('validerplainte', function(name, firstname, tel, nom1, prenom1, num1, reason)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer.job.name == 'police' then
        xPlayer.ban(0, '(validerplainte)');
        return
    end
    MySQL.Async.execute('INSERT INTO plaintes VALUES (@identifier, @Prenom, @Nom, @Num, @Prenom1, @Nom1, @Num1, @Raison, @Auteur)', {  
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
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('updateinfos', xPlayers[i])
            TriggerClientEvent("esx:showNotification", xPlayers[i], "~p~Une plainte vient d'arrivée !")
		end
	end
end)

ESX.RegisterServerCallback('getPlaintes', function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM plaintes', {}, function(result)
        cb(result)
    end)
end)

ESX.RegisterServerCallback('getData', function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM casier', {}, function(result)
        cb(result)
    end)
end)

RegisterServerEvent('plaitetraiter')
AddEventHandler('plaitetraiter', function(prenom, nom, num)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    if not xPlayer.job.name == 'police' then
        xPlayer.ban(0, '(plaitetraiter)');
        return
    end
    MySQL.Async.execute("DELETE FROM plaintes WHERE Prenom = @a AND Nom = @b AND Num = @c", {
        ['a'] = prenom,
        ['b'] = nom,
        ['c'] = num
    }, function()
    end)
    for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent("esx:showNotification", xPlayers[i], "~p~La plainte de monsieur "..prenom.. " "..nom.. " a bien été traitée par le policier " ..xPlayer.getName().. " .")
            TriggerClientEvent('checkplaintes', xPlayers[i])
		end
	end
end)

RegisterServerEvent('deletecasier')
AddEventHandler('deletecasier', function(firstname, name, dob, reason, author)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    if not xPlayer.job.name == 'police' then
        xPlayer.ban(0, '(deletecasier)');
        return
    end
    MySQL.Async.execute("DELETE FROM casier WHERE Prenom = @a AND Nom = @b AND naissance = @c AND raison = @d AND auteur = @e", {
        ['a'] = firstname,
        ['b'] = name,
        ['c'] = dob,
        ['d'] = reason,
        ['e'] = author
    }, function()
    end)
    for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent("esx:showNotification", xPlayers[i], "~p~Le casier judiciare de monsieur "..firstname.. " "..name.. " a bien été supprimé par le policier " ..xPlayer.getName().. " .")
            TriggerClientEvent('updateinfos', xPlayers[i])
		end
	end
end)

RegisterNetEvent('confiscatePlayerItem', function(target, itemType, itemName, amount)
    local source = source
    local sourceXPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    if (not sourceXPlayer or not targetXPlayer) then return end

    local ped = GetPlayerPed(sourceXPlayer.source);
    local targetPed = GetPlayerPed(targetXPlayer.source);

    if sourceXPlayer.job.name ~= 'police' then
        xPlayer.ban(0, '(confiscatePlayerItem)');
    else
        if (#(GetEntityCoords(targetPed) - GetEntityCoords(ped)) < 4.0) then
            if itemType == 'item_standard' then
                local sourceItem = sourceXPlayer.getInventoryItem(itemName)
                TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
                    if (amount and tonumber(amount) and sourceItem and sourceItem.count and tonumber(sourceItem.count)) then
                        if sourceItem.count >= amount and amount > 0 then 
                            inventory.addItem(itemName, amount);
                            targetXPlayer.removeInventoryItem(itemName, amount);
                            TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~p~"..amount..' '..sourceItem.label.."~s~.")
                            TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a pris ~p~"..amount..' '..sourceItem.label.."~s~.")
                            SendLogs("Police", "Exelity | Police", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre un item "..amount.." "..sourceItem.label.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1043372630998261811/zQm8rIakd4aRBqcJdCzLv2a-qLVn5_bDRMJKtv91qY5dbEFn4jnjZIrvwzQqlExYqc2P")
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
                    SendLogs("Police", "Exelity | Police", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre de l'argent "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1043372630998261811/zQm8rIakd4aRBqcJdCzLv2a-qLVn5_bDRMJKtv91qY5dbEFn4jnjZIrvwzQqlExYqc2P")
                else
                    TriggerClientEvent('esx:showNotification', source, "Quantité invalide");
                end
            end
        
            if itemType == 'item_weapon' then
                if (targetXPlayer.hasWeapon(string.upper(itemName))) then
                    targetXPlayer.removeWeapon(itemName, 0);
                    TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
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
                    SendLogs("Police", "Exelity | Police", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre une arme "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1043372630998261811/zQm8rIakd4aRBqcJdCzLv2a-qLVn5_bDRMJKtv91qY5dbEFn4jnjZIrvwzQqlExYqc2P")
                end
            end
        end
    end
end);

RegisterNetEvent('confiscatePlayerItemGouv', function(target, itemType, itemName, amount)
    local source = source
    local sourceXPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    if (not sourceXPlayer or not targetXPlayer) then return end

    local ped = GetPlayerPed(sourceXPlayer.source);
    local targetPed = GetPlayerPed(targetXPlayer.source);

    if sourceXPlayer.job.name ~= 'gouv' then
        xPlayer.ban(0, '(confiscatePlayerItemGouv)');
    else
        if (#(GetEntityCoords(targetPed) - GetEntityCoords(ped)) < 4.0) then
            if itemType == 'item_standard' then
                local sourceItem = sourceXPlayer.getInventoryItem(itemName)
                TriggerEvent('esx_addoninventory:getSharedInventory', 'society_gouv', function(inventory)
                    if (amount and tonumber(amount) and sourceItem and sourceItem.count and tonumber(sourceItem.count)) then
                        if sourceItem.count >= amount and amount > 0 then 
                            inventory.addItem(itemName, amount);
                            targetXPlayer.removeInventoryItem(itemName, amount);
                            TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~p~"..amount..' '..sourceItem.label.."~s~.")
                            TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a pris ~p~"..amount..' '..sourceItem.label.."~s~.")
                            SendLogs("Gouv", "Exelity | Gouv", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre un item "..amount.." "..sourceItem.label.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1043372677294993488/WfdM8G5y772zPAHovKMumPRC54qrljThk1iK9tqdGJLT387L6VZAVf8lMx9LKHh_zTlH")
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
                    SendLogs("Gouv", "Exelity | Gouv", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre de l'argent "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1043372677294993488/WfdM8G5y772zPAHovKMumPRC54qrljThk1iK9tqdGJLT387L6VZAVf8lMx9LKHh_zTlH")
                else
                    TriggerClientEvent('esx:showNotification', source, "Quantité invalide");
                end
            end
        
            if itemType == 'item_weapon' then
                if (targetXPlayer.hasWeapon(string.upper(itemName))) then
                    targetXPlayer.removeWeapon(itemName, 0);
                    TriggerEvent('esx_datastore:getSharedDataStore', 'society_gouv', function(store)
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
                    SendLogs("Gouv", "Exelity | Gouv", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre une arme "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1043372677294993488/WfdM8G5y772zPAHovKMumPRC54qrljThk1iK9tqdGJLT387L6VZAVf8lMx9LKHh_zTlH")
                end
            end
        end
    end
end);

ESX.RegisterServerCallback('getOtherPlayerDataPolice', function(source, cb, target, notify)
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


RegisterNetEvent("police:SendFacture", function(target, price)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'police' then
        xPlayer.ban(0, '(police:SendFacture)');
        return
	end

    local society = ESX.DoesSocietyExist("police");

    if (society) then

        local xTarget = ESX.GetPlayerFromId(target);

        if (xTarget) then

            xTarget.removeAccountMoney('bank', price);
            ESX.AddSocietyMoney("police", price);
            xTarget.showNotification("Votre compte en banque à été réduit de "..price.."~g~$~s~.");
            xPlayer.showNotification("Vous avez donné une amende de "..price.."~g~$~s~");
            SendLogs("Facture", "Exelity | Facture", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) vient d'envoyer une facture de "..price.."$ au joueur **"..xTarget.name.."** (***"..xTarget.identifier.."***) pour l'entreprise **Police** ", "https://discord.com/api/webhooks/1060516689344741396/ND9GdygiHYb8E7mR7jMlpf3epTBIli4YeFnNpLG_cZ_i498WvOfVunmEaYNaC5XVrfvz")

        end

    end

end);

ESX.RegisterServerCallback('fpolice:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		cb(inventory.items)
	end)
end)


RegisterNetEvent('fpolice:getStockItem')
AddEventHandler('fpolice:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
            SendLogs("Police", "Exelity | Police", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a retiré "..count.." "..inventoryItem.label.." dans le coffre", "https://discord.com/api/webhooks/1023416482509619293/YYauYt-h7Mv_k2yMcpayxOzvPKgfHDXUyV6MvLBzeCiMs-IHzzI_VwNj8IUTC5StZbuB")
		else
			TriggerClientEvent('esx:showNotification', _source, "<C>Quantité invalide")
		end
	end)
end)

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

RegisterNetEvent('fpolice:putStockItems')
AddEventHandler('fpolice:putStockItems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

        if (count and tonumber(count) and sourceItem and sourceItem.count and tonumber(sourceItem.count)) then
            -- does the player have enough of the item?
            if sourceItem.count >= count and count > 0 then
                xPlayer.removeInventoryItem(itemName, count)
                inventory.addItem(itemName, count)
                TriggerClientEvent('esx:showNotification', _source, "Objet déposé "..count.." "..inventoryItem.label..""); -- JustGod à touché.
                SendLogs("Police", "Exelity | Police", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a déposé "..count.." "..inventoryItem.label.." dans le coffre", "https://discord.com/api/webhooks/1023416482509619293/YYauYt-h7Mv_k2yMcpayxOzvPKgfHDXUyV6MvLBzeCiMs-IHzzI_VwNj8IUTC5StZbuB")
            else
                TriggerClientEvent('esx:showNotification', _source, "Quantité invalide")
            end
        else

            xPlayer.showNotification("Une erreur est survenue, Code erreur ~b~'police_stock_put_items_error'~s~. Veuillez contacter un administrateur.");

        end
	end)
end)

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

ESX.RegisterServerCallback('policejob:getArmoryWeapons', function(source, cb)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end
		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('policejob:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
        SendLogs("Police", "Exelity | Police", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a déposé "..weaponName.." dans le coffre", "https://discord.com/api/webhooks/1023416482509619293/YYauYt-h7Mv_k2yMcpayxOzvPKgfHDXUyV6MvLBzeCiMs-IHzzI_VwNj8IUTC5StZbuB")
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
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

ESX.RegisterServerCallback('policejob:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 0)
    SendLogs("Police", "Exelity | Police", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) a retiré "..weaponName.." dans le coffre", "https://discord.com/api/webhooks/1023416482509619293/YYauYt-h7Mv_k2yMcpayxOzvPKgfHDXUyV6MvLBzeCiMs-IHzzI_VwNj8IUTC5StZbuB")

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
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

ESX.RegisterServerCallback('fpolice:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

--johnny

ClothesPlayer = {}

Citizen.CreateThread(function()
    MySQL.Async.fetchAll("SELECT * FROM clothes_societies ", {}, function(result)
        for k, v in pairs(result) do
            if not ClothesPlayer[v.identifier] then 
                ClothesPlayer[v.identifier] = {}
            end
            if not ClothesPlayer[v.identifier][v.id] then
                ClothesPlayer[v.identifier][v.id] = {}
            end 
            ClothesPlayer[v.identifier][v.id].identifier = v.identifier
            ClothesPlayer[v.identifier][v.id].label = v.label 
            ClothesPlayer[v.identifier][v.id].skin = v.skin
            ClothesPlayer[v.identifier][v.id].type = v.type
            ClothesPlayer[v.identifier][v.id].equip = v.equip
            ClothesPlayer[v.identifier][v.id].id = v.id
        end
        print('[^4LOAD^0] [^4'..#result..'^0] Tenues ont été load avec succès')
    end)
end)


RegisterNetEvent("johnny:addtenue", function(label, skin)
    local NumberCount = 0
    local xPlayer = ESX.GetPlayerFromId(source)
    local NumberTenueAutorized = 9999
    if not ClothesPlayer[xPlayer.identifier] then
        NumberCount = 0
    else
        NumberCount = 0
    end

    if NumberCount+1 > NumberTenueAutorized then 
        xPlayer.showNotification('Vous avez déjà trop de tenue.')
    else
        local IdTenue = math.random(11111,99999)
        local IdTenue2 = math.random(11111,99999)
        local ValidateID = IdTenue+IdTenue2

        if not ClothesPlayer[xPlayer.identifier][ValidateID] then
            ClothesPlayer[xPlayer.identifier][ValidateID] = {}
            ClothesPlayer[xPlayer.identifier][ValidateID].identifier = xPlayer.identifier
            ClothesPlayer[xPlayer.identifier][ValidateID].label = label
            ClothesPlayer[xPlayer.identifier][ValidateID].type = "vetement"
            ClothesPlayer[xPlayer.identifier][ValidateID].equip = "n"
            ClothesPlayer[xPlayer.identifier][ValidateID].skin = json.encode(skin)
            ClothesPlayer[xPlayer.identifier][ValidateID].id = ValidateID
        end
        MySQL.Async.execute("INSERT INTO clothes_societies (label, skin, type, identifier) VALUES (@label, @skin, @type, @identifier)", {
            ["@label"] = tostring(label),
            ["@skin"] = json.encode(skin),
            ["@type"] = "vetement",
            ["@identifier"] = xPlayer.identifier 
        })
        xPlayer.showNotification('Vous avez crée une tenue (~g~'..label..'~w~)')
        TriggerClientEvent("johnny:recieveclientsidevetement", xPlayer.source, ClothesPlayer[xPlayer.identifier])
       
    end
end)


RegisterNetEvent('johnny:RenameTenue', function(id, NewLabel)
    local xPlayer = ESX.GetPlayerFromId(source)
    if ClothesPlayer[xPlayer.identifier][id] then
        if ClothesPlayer[xPlayer.identifier][id].identifier == xPlayer.identifier then
            xPlayer.showNotification('Vous avez renommer votre tenue (~g~'..ClothesPlayer[xPlayer.identifier][id].label..'~w~)')
            ClothesPlayer[xPlayer.identifier][id].label = NewLabel
            TriggerClientEvent("johnny:recieveclientsidevetement", xPlayer.source, ClothesPlayer[xPlayer.identifier])
            MySQL.Async.execute("UPDATE clothes_societies set label = @label WHERE id = @id", {
                ["@label"] = tostring(NewLabel),
                ["@id"] = id
            })
        else
            DropPlayer(source, 'Mhh c\'est chaud c\'que t\'essaie de faire')
        end
    end
end)

RegisterNetEvent('johnny:deletetenue', function(id, NewLabel)
    local xPlayer = ESX.GetPlayerFromId(source)
    if ClothesPlayer[xPlayer.identifier][id] then
        if ClothesPlayer[xPlayer.identifier][id].identifier == xPlayer.identifier then
            xPlayer.showNotification('Vous avez supprimer votre tenue (~g~'..ClothesPlayer[xPlayer.identifier][id].label..'~w~)')
            ClothesPlayer[xPlayer.identifier][id] = nil
            TriggerClientEvent("johnny:recieveclientsidevetement", xPlayer.source, ClothesPlayer[xPlayer.identifier])
            MySQL.Async.execute("DELETE FROM clothes_societies WHERE id = @id", {
                ["@id"] = id
            })
        else
            DropPlayer(source, 'Mhh c\'est chaud c\'que t\'essaie de faire')
        end
    end
end)

RegisterNetEvent("RecieveVetement", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if not ClothesPlayer[xPlayer.identifier] then 
        ClothesPlayer[xPlayer.identifier] = {}
        TriggerClientEvent("johnny:recieveclientsidevetement", xPlayer.source, nil)
    else
        TriggerClientEvent("johnny:recieveclientsidevetement", xPlayer.source, ClothesPlayer[xPlayer.identifier])
    end
end)

ESX.RegisterServerCallback('johnny:getVehicleInfos', function(source, cb, plate)

	MySQL.Async.fetchAll('SELECT owner, vehicle FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)

		local retrivedInfo = {
			plate = plate
		}

		if result[1] then
			MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname

				retrivedInfo.vehicle = json.decode(result[1].vehicle)

				cb(retrivedInfo)

			end)
		else
			cb(retrivedInfo)
		end
	end)
end)

RegisterServerEvent('Police:avocat')
AddEventHandler('Police:avocat', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LSPD', '~r~Annonce', 'Un avocat est prié de se présenter au PDP', 'CHAR_POLICE', 8)
	end
end)

RegisterServerEvent('Police:annonce')
AddEventHandler('Police:annonce', function(annonce)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LSPD', '~r~Annonce', annonce, 'CHAR_police', 8)
    end
end)