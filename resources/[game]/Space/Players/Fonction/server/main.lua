RegisterServerEvent('Space:Menotter')
AddEventHandler('Space:Menotter', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    
    if (target ~= -1 and targetXPlayer) then
        if ( #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(target))) < 15.0 ) then
            TriggerClientEvent('Space:Menotter', target)
		else
			xPlayer.ban(0, '(Space:Menotter)')
        end
    end
end)

RegisterServerEvent('Space:Escorter')
AddEventHandler('Space:Escorter', function(target)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    
    if (target ~= -1 and targetXPlayer) then
        if ( #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(target))) < 15.0 ) then
            TriggerClientEvent('Space:Escorter', target, source)
		else
			xPlayer.ban(0, '(Space:Escorter)')
        end
    end
end)

RegisterNetEvent('Space:spawnVehicle', function(model, position, heading)
    local source = source
    ESX.SpawnVehicle(GetHashKey(model), position, heading, nil, false, nil, function(vehicle)
        TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
    end)
end)

RegisterServerEvent('buyWeaponForFIB')
AddEventHandler('buyWeaponForFIB', function(weapon)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	local coords = GetEntityCoords(GetPlayerPed(source));
	local distance = #(coords - vector3(2521.207, -336.6898, 100.8933));
	if xPlayer.job.name == 'fib' then
		if weapon == "weapon_stungun" or weapon == "weapon_flashlight" or weapon == "weapon_nightstick" or weapon == "weapon_combatpistol" or weapon == "weapon_carbinerifle" then
			if (distance < 35.0) then
				if not xPlayer.hasWeapon(weapon) then
					xPlayer.addWeapon(weapon, 255)
				else
					TriggerClientEvent('esx:showNotification', source, "~r~Vous possédez déjà ceci.")
				end
			else
				xPlayer.ban(0, '(buyWeaponForFIB)');
			end
		else
			xPlayer.ban(0, '(buyWeaponForFIB)');
		end
	else
        xPlayer.ban(0, '(buyWeaponForFIB)');
    end
end)

function SendLogs(name, title, message, web)
    local local_date = os.date('%H:%M:%S', os.time())
  
	local embeds = {
		{
			["title"]= title,
			["description"]= message,
			["type"]= "rich",
			["color"] = 10105796,
			["footer"]=  {
			["text"]= "Powered by Exelity ©   |  "..local_date.."",
			},
		}
	}
  
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(web, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end