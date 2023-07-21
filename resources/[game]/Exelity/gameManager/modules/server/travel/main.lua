--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

ESX.RegisterServerCallback('razzouvoyage:givemoney', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local priceAvailable = false
	price = 3500

	if price == price then
		priceAvailable = true
	end

	if priceAvailable and xPlayer.getAccount('cash').money >= price then

		local society = ESX.DoesSocietyExist("planeseller");

		if (society) then

			xPlayer.removeAccountMoney('cash', price);
			ESX.AddSocietyMoney("planeseller", 1750);
			xPlayer.showNotification("Votre compte en banque à été réduit de "..price.."~g~$~s~.");
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez payez ~p~' .. price .. '$~s~, Bon voyage à vous !')
		cb(true)
	else
		cb(false)
	end
end)