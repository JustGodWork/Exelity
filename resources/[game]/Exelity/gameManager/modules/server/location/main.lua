--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)
enableprice = true 

ESX.RegisterServerCallback('location:checkmoney', function(source, cb)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getAccount('cash').money >= 625 then
		cb(true)
		xPlayer.removeAccountMoney('cash', 625)
	else
		cb(false)
	end
end)
