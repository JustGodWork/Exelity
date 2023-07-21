ESX = nil
TriggerEvent(ConfigWipe.ESX..'esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("wipe", function(source, args, raw)
    local xPlayer = ESX.GetPlayerFromId(source)

    if source == 0 or ConfigWipe.Autorized[xPlayer.getGroup()] then 
        local tPlayer = ESX.GetPlayerFromIdentifier(args[1])
        if tPlayer ~= nil then 
            DropPlayer(tPlayer.source, ConfigWipe.MessageWipe)
        end

        MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier=@identifier", {
            ["@identifier"] = args[1]
        }, function(result)
            
            if result[1] ~= nil then 

                -- Armes
                Weapons = json.decode(result[1].loadout)
                NewWeapon = {}
                for k, v in pairs(Weapons) do 
                    if ConfigWipe.WeaponsPerm[v.name] ~= nil then 
                        table.insert(NewWeapon, {
                            name = v.name,
                            label = v.label,
                            ammo = v.ammo,
                            components = v.components
                        })
                    end
                end

                -- Items 
                Items = json.decode(result[1].inventory)
                NewItems = {}
                for k, v in pairs(Items) do 
                    if ConfigWipe.ItemsPerm[v.name] ~= nil then 
                        table.insert(NewItems, {
                            name = v.name,
                            count = v.count
                        })
                    end

                end

                -- Argent
                Accounts = json.decode(result[1].accounts)
                NewAccounts = {}
                for k, v in pairs(Accounts) do 
                    table.insert(NewAccounts, {
                        name = v.name,
                        money = 0
                    })
                end

                for k, v in pairs(ConfigWipe.TableDelete) do 
                    MySQL.Async.execute("DELETE FROM "..v.name.." WHERE "..v.id.." = @"..v.id.."", {
                        ["@"..v.id] = args[1]
                    })
                end
                for k, v in pairs(ConfigWipe.TableUpdate) do 
                    MySQL.Async.execute("UPDATE "..v.tablename.." SET "..v.var.." = @"..v.var.." WHERE "..v.id.." = @"..v.id.."", {
                        ["@"..v.id] = args[1],
                        ["@"..v.var] = v.finalvalue
                    })
                end

                MySQL.Async.execute("UPDATE users SET loadout=@loadout, accounts=@accounts, inventory=@inventory WHERE identifier=@identifier", {
                    ["@identifier"] = args[1],
                    ["@loadout"] = json.encode(NewWeapon),
                    ["@accounts"] = json.encode(NewAccounts),
                    ["@inventory"] = json.encode(NewItems)
                })

                Source = source == 0 and "CONSOLE" or xPlayer.getName()
                SendLogs("Wipe", "Exelity | Wipe", "La licence **"..args[1].."** vient de se faire wipe par **"..Source.."**", "https://discord.com/api/webhooks/1019894843356483586/7nhedLjpgiSiwG2v03qN-Y44dSGw2HfTSXBylcM9hYTNB-37Qg3yXbQJkf-Rojau9-Yn")    

                if source == 0 then 
                    print("Le joueur ^4"..args[1].."^0 à été wipe !")
                else
                    TriggerClientEvent(ConfigWipe.ESX..'esx:showNotification', source, "Le joueur ~p~"..args[1].."~s~ à été wipe avec succès !")
                end
                
            else
                if source == 0 then 
                    print("Le joueur est introuvable !")
                else
                    TriggerClientEvent(ConfigWipe.ESX..'esx:showNotification', source, "Aucun joueur trouvé !")
                end
            end
        end)

    else
        print(xPlayer.getName()..' - '..source.." attemp to wipe player")
        TriggerClientEvent(ConfigWipe.ESX..'esx:showNotification', source, "Vous ne disposez pas des permissions")
    end
end)
