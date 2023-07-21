RegisterServerEvent('demande:Fbi')
AddEventHandler('demande:Fbi', function(coords, raison)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
    if xPlayer.job.name == 'fib' then
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            if thePlayer.job.name == 'fib' then
                TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, raison)
            end
        end
    else
        xPlayer.ban(0, '(demande)');
    end
end)

ESX.RegisterServerCallback('getOtherPlayerDataFBI', function(source, cb, target, notify)
    local xPlayer = ESX.GetPlayerFromId(target)

    TriggerClientEvent("esx:showNotification", target, "~r~~Quelqu'un vous fouille")

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

ESX.RegisterServerCallback('FBI:getVehicleInfos', function(source, cb, plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if (xPlayer) then 

        if xPlayer.job.name ~= 'fib' then
            xPlayer.ban(0, '(FBI:getVehicleInfos)')
            return
        end

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
    end
end)

RegisterNetEvent('FBI:ConfiscatePlayerItem', function(target, itemType, itemName, amount)
    local source = source
    local sourceXPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    if (not sourceXPlayer or not targetXPlayer) then return end

    local ped = GetPlayerPed(sourceXPlayer.source);
    local targetPed = GetPlayerPed(targetXPlayer.source);

    if (xPlayer) then
        
        if sourceXPlayer.job.name ~= 'fib' then
            xPlayer.ban(0, '(confiscatePlayerItem)');
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
                            SendLogs("FIB", "Exelity | FIB", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre un item "..amount.." "..sourceItem.label.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discordapp.com/api/webhooks/1078403698499256350/A29Crk1ogQo6omAZrv8Sfd0agjzA9x3RaZTsEOOtYfY8P7HDkc6K29haKlQ4qdRxZGKJ")
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
                        SendLogs("FIB", "Exelity | FIB", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre de l'argent "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discordapp.com/api/webhooks/1078403698499256350/A29Crk1ogQo6omAZrv8Sfd0agjzA9x3RaZTsEOOtYfY8P7HDkc6K29haKlQ4qdRxZGKJ")
                    end
                end
            
                if itemType == 'item_weapon' then
                    if (targetXPlayer.hasWeapon(string.upper(itemName))) then
                        if (not sourceXPlayer.hasWeapon(string.upper(itemName))) then
                            targetXPlayer.removeWeapon(itemName, 0);
                            sourceXPlayer.addWeapon(itemName, amount);
                            SendLogs("FIB", "Exelity | FIB", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre une arme "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discordapp.com/api/webhooks/1078403698499256350/A29Crk1ogQo6omAZrv8Sfd0agjzA9x3RaZTsEOOtYfY8P7HDkc6K29haKlQ4qdRxZGKJ")
                        else
                            TriggerClientEvent("esx:showNotification", source, "Vous avez déjà cette arme.");
                        end
                    end
                end
            end
        end
    end
end);

RegisterNetEvent('confiscatePlayerItemFIB', function(target, itemType, itemName, amount)
    local source = source
    local sourceXPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    if (not sourceXPlayer or not targetXPlayer) then return end

    local ped = GetPlayerPed(sourceXPlayer.source);
    local targetPed = GetPlayerPed(targetXPlayer.source);

    if sourceXPlayer.job.name ~= 'fib' then
        xPlayer.ban(0, '(confiscatePlayerItem)');
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
                        SendLogs("FIB", "Exelity | FIB", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre un item "..amount.." "..sourceItem.label.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1078403698499256350/A29Crk1ogQo6omAZrv8Sfd0agjzA9x3RaZTsEOOtYfY8P7HDkc6K29haKlQ4qdRxZGKJ")
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
                    SendLogs("FIB", "Exelity | FIB", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre de l'argent "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1078403698499256350/A29Crk1ogQo6omAZrv8Sfd0agjzA9x3RaZTsEOOtYfY8P7HDkc6K29haKlQ4qdRxZGKJ")
                end
            end
        
            if itemType == 'item_weapon' then
                if (targetXPlayer.hasWeapon(string.upper(itemName))) then
                    if (not sourceXPlayer.hasWeapon(string.upper(itemName))) then
                        targetXPlayer.removeWeapon(itemName, 0);
                        sourceXPlayer.addWeapon(itemName, amount);
                        SendLogs("FIB", "Exelity | FIB", "Le joueur **"..sourceXPlayer.name.."** (***"..sourceXPlayer.identifier.."***) vient de prendre une arme "..amount.." "..itemName.." sur le joueur **"..targetXPlayer.name.."** (***"..targetXPlayer.identifier.."***)", "https://discord.com/api/webhooks/1078403698499256350/A29Crk1ogQo6omAZrv8Sfd0agjzA9x3RaZTsEOOtYfY8P7HDkc6K29haKlQ4qdRxZGKJ")
                    else
                        TriggerClientEvent("esx:showNotification", source, "Vous avez déjà cette arme.");
                    end
                end
            end
        end
    end
end);