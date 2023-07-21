--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterNetEvent("JustGod:UpdatePlayer", function()
	local src = source;
	local xPlayer = ESX.GetPlayerFromId(src);
	if (xPlayer) then
		xPlayer.triggerEvent('JustGod:ReloadPlayer', {
			character_id = xPlayer.character_id,
			identifier = xPlayer.identifier,
			accounts = xPlayer.getAccounts(),
			level = xPlayer.getLevel(),
			group = xPlayer.getGroup(),
			job = xPlayer.getJob(),
			job2 = xPlayer.getJob2(),
			inventory = xPlayer.getInventory(),
			loadout = xPlayer.getLoadout(),
			lastPosition = xPlayer.getLastPosition(),
			maxWeight = xPlayer.maxWeight,
			xp = xPlayer.getXP(),
			vip = xPlayer.getVIP()
		})
	end
end);

-- Announce
---@param xPlayer xPlayer
exports["JustGod"]:RegisterCommand("announce", function(xPlayer, args)

	local annonce_message = table.concat(args, " ")
	if (annonce_message:len() <= 5) then
		return
	end

	TriggerClientEvent("txAdmin:receiveAnnounce", -1, annonce_message, ((xPlayer ~= nil and xPlayer.getName()) or "Console"))

end, {
	help = "Annoncer un message a tous les joueurs du serveur",
	params = {
		{name = "message", help = "Message de l'annonce"}
	}
}, {
	permission = "make_announce"
})

-- Kick
exports["JustGod"]:RegisterCommand("kick", function(xPlayer, args)

	local target_player_id = tonumber(args[1])
	if (target_player_id == nil) then
		return
	end

	local target_player_selected = ESX.GetPlayerFromId(target_player_id)
	if (target_player_selected == nil) then
		return
	end

	if (xPlayer and not exports["JustGod"]:GroupIsHigher(xPlayer.getGroup(), target_player_selected.getGroup())) then
		return
	end

	local kick_reason = tostring(table.concat(args, " ", 2))
	if (kick_reason == nil or kick_reason:len() <= 5) then
		return
	end

	local staffInfo = {
		name = (xPlayer ~= nil and xPlayer.getName() or "Console"),
		identifier = (xPlayer ~= nil and xPlayer.getIdentifier() or "CONSOLE:IDENTIFIER")
	}

	SendLogs("Staff", "Exelity | Kick", "Le staff **"..staffInfo.name.."** (***"..staffInfo.identifier.."***) vient de kick le joueur **"..target_player_selected.getName().."** (***"..target_player_selected.getIdentifier().."***) pour la raison [**"..kick_reason.."**]", "https://discord.com/api/webhooks/1075754900903952424/IB4OzQlviVYMkKaTNx6zb2xOhjclir-MkYeNjiRv19O_XUw3ww-CnNM22YXrz7QAVKRT")
	return target_player_selected.kick(kick_reason)

end, {
	help = "Kick un joueur connecté sur le serveur",
	params = {
		{name = "player_id", help = "ID du joueur que vous souhaitez kick"},
		{name = "kick_reason", help = "Raison du kick, ce que verra le joueur"}
	}
}, {
	inMode = true,
	permission = "player_kick"
})