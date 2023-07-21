--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local PlayersWashing = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('playerDropped', function()
	PlayersWashing[source] = nil
end)

MoneyWash = {}
MoneyWash.MinimumMoney = 50000
MoneyWash.Percentage = 30

MoneyWash.Pos = vector3(1135.983, -989.4816, 46.11316)

local function WashMoney(xPlayer)
	SetTimeout(3000, function()
		if #(GetEntityCoords(GetPlayerPed(xPlayer.source)) - MoneyWash.Pos) < 15 then
			if PlayersWashing[xPlayer.source] then

				if xPlayer.getAccount('dirtycash').money < MoneyWash.MinimumMoney then
					TriggerClientEvent('esx:showNotification', xPlayer.source, ('Vous n\'avez pas assez d\'argent pour blanchir, il vous faut : 50 000 ~g~$~w~'))
				else
					local washedMoney = MoneyWash.MinimumMoney - MoneyWash.MinimumMoney * MoneyWash.Percentage / 100
						
					xPlayer.removeAccountMoney('dirtycash', MoneyWash.MinimumMoney)
					xPlayer.addAccountMoney('cash', washedMoney)

					WashMoney(xPlayer)
				end
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, ("Vous êtes trop loin de la machine"))
		end
	end)
end

RegisterServerEvent('esx_moneywash:startWash')
AddEventHandler('esx_moneywash:startWash', function()
	if #(GetEntityCoords(GetPlayerPed(source)) - MoneyWash.Pos) < 10 then
		PlayersWashing[source] = true
		TriggerClientEvent('esx:showNotification', source, 'Vous êtes en train de blanchir l\'argent sale.')
		WashMoney(ESX.GetPlayerFromId(source))
	else
		xPlayer.ban(0, '(esx_moneywash:startWash)');
	end
end)

RegisterServerEvent('esx_moneywash:stopWash')
AddEventHandler('esx_moneywash:stopWash', function()
	PlayersWashing[source] = nil
end)

ESX.RegisterServerCallback('moneywash:getPos', function(source, cb)
    cb(vector3(1135.983, -989.4816, 45.11316))
end)