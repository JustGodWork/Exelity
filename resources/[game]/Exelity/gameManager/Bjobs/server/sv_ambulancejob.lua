--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterServerEvent('annonce:serviceAmbulance')
AddEventHandler('annonce:serviceAmbulance', function(status)

    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    local xPlayers = ESX.GetPlayers()

	if (xPlayer) then

		if xPlayer.job.name ~= "ambulance" then

			xPlayer.ban(0, '(annonce:serviceAmbulance)')

			return

		end
	
		for i = 1, #xPlayers, 1 do

			local ThePlayers = ESX.GetPlayerFromId(xPlayers[i])

			if (ThePlayers) then

				if ThePlayers.job.name == 'ambulance' then

					TriggerClientEvent('ambulance:InfoService', xPlayers[i], status, xPlayer.name)

				end

			end

		end

	end

end)

RegisterServerEvent('ambulance:deleteCall')
AddEventHandler('ambulance:deleteCall', function(k)

    local source = source

    local xPlayer = ESX.GetPlayerFromId(source)

    local xPlayers = ESX.GetPlayers()

	if (xPlayer) then

		if xPlayer.job.name ~= "ambulance" then

			xPlayer.ban(0, '(ambulance:deleteCall)')

			return

		end
	
		for i = 1, #xPlayers, 1 do

			local thePlayer = ESX.GetPlayerFromId(xPlayers[i])

			if thePlayer.job.name == 'ambulance' then

				TriggerClientEvent('isInServiceCheck', xPlayers[i], "-")

				TriggerClientEvent('ambulance:deleteAppel', xPlayers[i], k)

			end

		end
		
	end

end)

RegisterServerEvent('ambulance:sendnotification')
AddEventHandler('ambulance:sendnotification', function(type, args)

  	local source = source

	if type ~= nil then

		if type == 'guns' then

			TriggerClientEvent('esx:showNotification', source, "~p~Cette personne a été tuée par une arme à feu, précisément: "..args)

		end
		
	end

end)

RegisterServerEvent('ambulance:healsomeone')
AddEventHandler('ambulance:healsomeone', function(player, type)
		
	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		if xPlayer.job.name ~= "ambulance" then

			xPlayer.ban(0, '(ambulance:healsomeone)')

			return

		end

		local hasBandages = xPlayer.getInventoryItem('bandage')

		local hasMedi = xPlayer.getInventoryItem('medikit')

		if type == 'small' then

			if hasBandages.count >= 1 then

				TriggerClientEvent('ambulance:heal', player, type)

				TriggerClientEvent('esx:showNotification', source, "~p~Vous avez soigné votre patient.")

				xPlayer.removeInventoryItem('bandage', 1)

			else

				TriggerClientEvent('esx:showNotification', source, "~p~Vous n'avez pas de bandage sur vous")

			end

		elseif type == 'big' then

			if hasMedi.count >= 1 then

				TriggerClientEvent('ambulance:heal', player, type)

				TriggerClientEvent('esx:showNotification', source, "~p~Vous avez soigné votre patient.")

				xPlayer.removeInventoryItem('bandage', 1)

			else

			TriggerClientEvent('esx:showNotification', source, "~p~Vous n'avez pas de kit de soin sur vous")

			end

		end

	end

end)

RegisterNetEvent('ambulance:spawnVehicle', function(model)

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		if xPlayer.job.name ~= 'ambulance' then

			xPlayer.ban(0, '(ambulance:spawnVehicle)')

			return

		end

		ESX.SpawnVehicle(GetHashKey(model), vector3(-848.8617, -1226.54, 6.723508), 359.348, nil, false, nil, function(vehicle)

			TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)

		end)

	end

end)

RegisterNetEvent('ambulance:réanimer', function(player)

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		if xPlayer.job.name ~= "ambulance" then

			xPlayer.ban(0, '(ambulance:réanimer)')

			return

		end

		local hasMedi = xPlayer.getInventoryItem('medikit')

		if hasMedi.count >= 1 then

			TriggerClientEvent('ambulance:revive', player)

			xPlayer.removeInventoryItem('medikit', 1)

			local society = ESX.DoesSocietyExist("ambulance")

			if (society) then

				local xTarget = ESX.GetPlayerFromId(player)

				if (xTarget) then

					xTarget.removeAccountMoney('bank', price)

					ESX.AddSocietyMoney("ambulance", price)

					xTarget.showNotification("Votre compte en banque à été réduit de "..price.."~g~$~s~.")

				end

			end

		else

			TriggerClientEvent('esx:showNotification', source, "~p~Vous n'avez pas de kit de soin sur vous")

		end

	end

end)

RegisterServerEvent('ambulance:sendrapport')
AddEventHandler('ambulance:sendrapport', function(firstname, name, type, amount)

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		if xPlayer.job.name ~= "ambulance" then

			xPlayer.ban(0, '(ambulance:sendrapport)');

			return
		end

		if (type) then

			if type == 'petit' then

				type = "Petits soins"

			elseif type == 'grand' then

				type = "Grands soins"

			elseif type == 'rea' then

				type = "Réanimation"

			end

		end

		MySQL.Async.execute('INSERT INTO rapports VALUES (@Prenom, @Nom, @Type, @Montant)', {    
			['@Prenom'] = firstname,
			['@Nom'] = name,
			['@Type'] = type,
			['@Montant'] = amount,
		}, function()    

		end)

	end

end)

RegisterServerEvent('ambulance:deleterapport')
AddEventHandler('ambulance:deleterapport', function(firstname, name, type, amount)

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		if xPlayer.job.name ~= "ambulance" then

			xPlayer.ban(0, '(ambulance:deleterapport)');

			return

		end

		MySQL.Async.execute("DELETE FROM rapports WHERE Prenom = @a AND Nom = @b AND Type = @c AND Montant = @d", {

			['a'] = firstname,
			['b'] = name,
			['c'] = type,
			['d'] = amount

		}, function()

		end)

	end

end)

ESX.RegisterServerCallback('getAllRapports', function(source, cb)

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		if xPlayer.job.name ~= "ambulance" then

			xPlayer.ban(0, '(getAllRapports)');
	
			return
	
		end
		
		MySQL.Async.fetchAll('SELECT * FROM rapports', {}, function(result)

			cb(result)

		end)

	end

end)

RegisterServerEvent('réanimer')
AddEventHandler('réanimer', function(player)

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	local tPlayer = ESX.GetPlayerFromId(player)

	if (xPlayer) and (tPlayer) then

		if xPlayer.getGroup() == "user" then

			xPlayer.ban(0, '(réanimer)');

			return

		end

		tPlayer.removeWeapon('gadget_parachute')

		TriggerClientEvent('ambulance:revive', player)

	end

end)

RegisterServerEvent('ambulance:payNPC')
AddEventHandler('ambulance:payNPC', function()

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		xPlayer.removeAccountMoney('bank', 1500)

		TriggerClientEvent('esx:showNotification', source, "Vous avez payer 1500 ~g~$~s~ de frais médicaux.")

	end

end)

RegisterNetEvent('ambulance:takebandage', function()

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		local hasBandages = xPlayer.getInventoryItem('bandage')

		if xPlayer.job.name ~= "ambulance" then

			xPlayer.ban(0, '(ambulance:takebandage)');
			return;

		end

		if (hasBandages.count < 5) then
			xPlayer.addInventoryItem('bandage', 1);
		else
			TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez plus de place dans votre inventaire.");
		end
		
	end

end)

RegisterServerEvent('ambulance:takemedikits')
AddEventHandler('ambulance:takemedikits', function()

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= "ambulance" then

		xPlayer.ban(0, '(ambulance:takemedikits)');

		return

	end

	local hasMedi = xPlayer.getInventoryItem('medikit')

	if hasMedi.count < 10 then

		xPlayer.addInventoryItem('medikit', 1)

	else

		TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez plus de place dans votre inventaire.")

	end

end)

ESX.RegisterUsableItem('medikit', function(source)

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		xPlayer.removeInventoryItem('medikit', 1)

		TriggerClientEvent('ambulance:heal', source, 'big')

		TriggerClientEvent('esx:showNotification', source, "~p~Vous avez utiliser un kit de soin")

	end

end)

ESX.RegisterUsableItem('bandage', function(source)

	local source = source

	local xPlayer = ESX.GetPlayerFromId(source)

	if (xPlayer) then

		xPlayer.removeInventoryItem('bandage', 1)

		TriggerClientEvent('ambulance:heal', source, 'small')

		TriggerClientEvent('esx:showNotification', source, "~p~Vous avez utilisé un bandage")
		
	end

end)

exports["JustGod"]:RegisterCommand("revive", function(xPlayer, args)

	local player_selected_id = tonumber(args[1])
	local player_selected_data = (xPlayer == nil or xPlayer.source ~= player_selected_id) and ESX.GetPlayerFromId(player_selected_id) or xPlayer

	if (player_selected_data == nil) then
		return
	end

	local player_selected_ped = GetPlayerPed(player_selected_data.source)
	local player_selected_max_health = GetEntityMaxHealth(player_selected_ped);
	local player_selected_health = GetEntityHealth(player_selected_ped);

	if ((player_selected_max_health / 100) >= player_selected_health) then

		player_selected_data.triggerEvent("ambulance:revive")
		SendLogs('Revive', "Exelity | Revive", ("___%s___ vient de faire revivre ***%s***."):format(((xPlayer ~= nil and xPlayer.getName()) or "Console"), player_selected_data.getName()), "https://discord.com/api/webhooks/1017651229725294594/zJePt2OrW22KqZAXMcStZpqHlqs7XXPi87DXlQpVHqM3qJp1ZHps9qspd5qPadMjgtv8")

		if (xPlayer ~= nil) then
			xPlayer.showNotification(("Vous avez revive le joueur ~p~%s~s~."):format(player_selected_data.getName()))
		end

	else

		if (xPlayer ~= nil) then
			xPlayer.showNotification(("Le joueur ~p~%s~s~ n'est pas mort."):format(player_selected_data.getName()))
		end

	end

end, {help = "Faire revivre un joueur", params = {
	{name = "id", help = "Id du joueur"}
}}, {
	inMode = true
});

exports["JustGod"]:RegisterCommand("revivezone", function(xPlayer, args)

	local admin = xPlayer;

	local players = GetPlayers();

	local count = 0;

	args[1] = args[1] ~= nil and tonumber(args[1]) or 10;

	if (admin) then

		if (tonumber(args[1]) <= 500 and tonumber(args[1]) >= 0) then

			for i = 1, #players do

				local target_player = ESX.GetPlayerFromId(players[i]);

				if (target_player) then

					local coords = GetEntityCoords(GetPlayerPed(players[i]));
					local distance = #(coords - admin.getCoords());

					if (distance <= tonumber(args[1])) then

						local ped = GetPlayerPed(target_player.source);
						local health = GetEntityHealth(ped);
						local maxHealth = GetEntityMaxHealth(ped);

						if (maxHealth /100 >= health) then

							count = count + 1;
							target_player.triggerEvent('ambulance:revive');

						end

					end

				end

			end

			if (count > 0) then

				admin.showNotification(("Vous venez de revive ~p~%s joueur(s)~h~ dans ce rayon."):format(count))
				SendLogs('ReviveZone', "Exelity | ReviveZone", "**"..admin.getName().."** vient de revive **"..count.."** joueurs", "https://discord.com/api/webhooks/1017651229725294594/zJePt2OrW22KqZAXMcStZpqHlqs7XXPi87DXlQpVHqM3qJp1ZHps9qspd5qPadMjgtv8")

			end

		else

			admin.showNotification("Veuillez saisir un nombre entre 0 et 500");

		end

	end

end, {help = "Faire revivre tout les joueurs d'une zone", params = {
	{name = "radius", help = "Rayon dans lequel cette action va s'effectuer"}
}}, {
	inMode = true
});

exports["JustGod"]:RegisterCommand("slay", function(xPlayer, args)

	local player_selected_id = tonumber(args[1])
	local player_selected_data = (xPlayer == nil or xPlayer.source ~= player_selected_id) and ESX.GetPlayerFromId(player_selected_id) or xPlayer

	if (player_selected_data == nil) then
		return
	elseif (xPlayer ~= nil and xPlayer.source ~= player_selected_data.source and not exports["JustGod"]:GroupIsHigher(xPlayer.getGroup(), player_selected_data.getGroup())) then
		return
	end

	player_selected_data.triggerEvent("ambulance:slay")

	if (xPlayer ~= nil) then
		xPlayer.showNotification(("Vous avez slay le joueur ~p~%s~s~."):format(player_selected_data.getName()))
	end

end, {help = "Tuer un joueur", params = {
	{name = "id", help = "Id du joueur"}
}}, {
	inMode = true,
	permission = "player_slay"
});

exports["JustGod"]:RegisterCommand("heal", function(xPlayer, args)

	if (not xPlayer) then
		return
	end

	local player_selected_id = tonumber(args[1])
	local player_selected_data = xPlayer.source ~= player_selected_id and ESX.GetPlayerFromId(player_selected_id) or xPlayer
	if (player_selected_data == nil) then
		return
	end

	player_selected_data.triggerEvent("esx_basicneeds:healPlayer", "big")

	player_selected_data.showNotification("Vous avez été soigné.")
	xPlayer.showNotification(("Vous avez soigné ~p~%s~s~."):format(player_selected_data.getName()))
	SendLogs('Heal', "Exelity | Heal", ("___%s___ vient de soigner ***%s***."):format(xPlayer.getName(), player_selected_data.getName()), "https://discord.com/api/webhooks/1017657792812826634/8Q2nxumuecTbx4d5sJyYdsj7Rs9rsjyThOugfMUwPV8N9woTftLqWvXeS_xlJ2SrYImr")

end, {help = "Heal un joueur", params = {
	{name = "id", help = "Id du joueur, qui va être soigné"}
}}, {
	inMode = true
});