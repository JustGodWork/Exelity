RegisterNetEvent('NPC:VenteDrugs', function(drugs)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	local cops = 0
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'bcso' then
			cops = cops + 1
		end
	end
	
	if cops >= 0 then
        if drugs == 'Weed' then
            local xPlayer = ESX.GetPlayerFromId(source)
            local QuantityItem = xPlayer.getInventoryItem("weed_pooch").count
            local QuantityBuy = math.random(1,10)
            if QuantityItem >= QuantityBuy then
                local PrixWeed = 73*2
                local PrixWeedFinal = QuantityBuy * PrixWeed
                xPlayer.removeInventoryItem("weed_pooch", QuantityBuy)
                xPlayer.addAccountMoney('dirtycash', PrixWeedFinal)
                xPlayer.showNotification("Tu as vendu ~p~"..QuantityBuy.. " ~w~pochons de Weed pour ~p~"..PrixWeedFinal.."$")
            else
                xPlayer.showNotification("Le clients voulait plus de drogues que se que tu avais.")
            end
        elseif drugs == 'Coke' then
            local xPlayer = ESX.GetPlayerFromId(source)
            local QuantityItem = xPlayer.getInventoryItem("coke_pooch").count
            local QuantityBuy = math.random(1,10)
            if QuantityItem >= QuantityBuy then
                local PrixCoke = 81*2
                local PrixCokeFinal = QuantityBuy * PrixCoke
                xPlayer.removeInventoryItem("coke_pooch", QuantityBuy)
                xPlayer.addAccountMoney('dirtycash', PrixCokeFinal)
                xPlayer.showNotification("Tu as vendu ~p~"..QuantityBuy.. " ~w~pochons de Coke pour ~p~"..PrixCokeFinal.."$")
            else
                xPlayer.showNotification("Le clients voulait plus de drogues que se que tu avais.")
            end
        elseif drugs == 'Meth' then
            local xPlayer = ESX.GetPlayerFromId(source)
            local QuantityItem = xPlayer.getInventoryItem("meth_pooch").count
            local QuantityBuy = math.random(1,10)
            if QuantityItem >= QuantityBuy then
                local PrixMeth = 87*2
                local PrixMethFinal = QuantityBuy * PrixMeth
                xPlayer.removeInventoryItem("meth_pooch", QuantityBuy)
                xPlayer.addAccountMoney('dirtycash', PrixMethFinal)
                xPlayer.showNotification("Tu as vendu ~p~"..QuantityBuy.. " ~w~pochons de Meth pour ~p~"..PrixMethFinal.."$")
            else
                xPlayer.showNotification("Le clients voulait plus de drogues que se que tu avais.")
            end
        elseif drugs == 'Opium' then
            local xPlayer = ESX.GetPlayerFromId(source)
            local QuantityItem = xPlayer.getInventoryItem("opium_pooch").count
            local QuantityBuy = math.random(1,10)
            if QuantityItem >= QuantityBuy then
                local PrixOpium = 118*2
                local PrixOpiumFinal = QuantityBuy * PrixOpium
                xPlayer.removeInventoryItem("opium_pooch", QuantityBuy)
                xPlayer.addAccountMoney('dirtycash', PrixOpiumFinal)
                xPlayer.showNotification("Tu as vendu ~p~"..QuantityBuy.. " ~w~pochons d'opium pour ~p~"..PrixOpiumFinal.."$")
            else
                xPlayer.showNotification("Le clients voulait plus de drogues que se que tu avais.")
            end
        elseif drugs == 'Lsd' then
            local xPlayer = ESX.GetPlayerFromId(source)
            local QuantityItem = xPlayer.getInventoryItem("lsd_pooch").count
            local QuantityBuy = math.random(1,10)
            if QuantityItem >= QuantityBuy then
                local PrixLsd = 100*2
                local PrixLsdFinal = QuantityBuy * PrixLsd
                xPlayer.removeInventoryItem("lsd_pooch", QuantityBuy)
                xPlayer.addAccountMoney('dirtycash', PrixLsdFinal)
                xPlayer.showNotification("Tu as vendu ~p~"..QuantityBuy.. " ~w~pochons de LSD pour ~p~"..PrixLsdFinal.."$")
            else
                xPlayer.showNotification("Le clients voulait plus de drogues que se que tu avais.")
            end
        end
    else
		TriggerClientEvent('esx:showNotification', _source, 'Il n y a pas assez de ~d~ flics ~s~ en service!')
	end
end)

-- Appel LSPD 
RegisterNetEvent("NPCVente:AppelLSPD", function(coords)
    local xPlayers	= ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' or xPlayer.job.name == 'bcso' then
            TriggerClientEvent('NPCVente:AffichageAppel', xPlayers[i], coords)
        end
    end
end)