--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

Locale   = 'fr'

Radars = {
    { station = 1, name = 'Commissariat', speedlimit = 80, r = 35, flash = { x = 398.1266, y = -1050.5014, z = 29.3957 }, props = { x = 419.1470, y = -1033.5052, z = 28.48 } },
    { station = 2, name = 'Benny\'s', speedlimit = 80, r = 40, flash = { x = -270.3585, y = -1139.8244, z = 23.0982 }, props = { x = -247.8916, y = -1125.0645, z = 18.84 } },
    { station = 3, name = 'San Andreas Avenue', speedlimit = 80, r = 40, flash = { x = -251.4578, y = -661.6170, z = 33.2561 }, props = { x = -232.1231, y = -650.5041, z = 32.27 } },
    { station = 4, name = 'Base Militaire', speedlimit = 130, r = 40, flash = { x = -2567.9621, y = 3362.5593, z = 13.3978 }, props = { x = -2551, y = 3369.9814, z = 13.52 }  },
}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("police:SendFactureRadar", function(price)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	local society = ESX.DoesSocietyExist("police");

	if (society) then

		local bank = xPlayer.getAccount('bank');

		if (bank and bank.money) then

			xPlayer.removeAccountMoney('bank', price);
			ESX.AddSocietyMoney("police", price);
			xPlayer.showNotification("Votre compte en banque à été réduit de "..price.."~g~$~s~.");

		end

	end

end)