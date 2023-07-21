--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX  = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('cmg2_animations:sync')
AddEventHandler('cmg2_animations:sync', function(animationLib, animation, animation2, distans, distans2, height, targetSrc, length, spin, controlFlagSrc, controlFlagTarget, animFlagTarget)
	if targetSrc ~= -1 then
		TriggerClientEvent('cmg2_animations:syncTarget', targetSrc, source, animationLib, animation2, distans, distans2, height, length, spin, controlFlagTarget, animFlagTarget)
		TriggerClientEvent('cmg2_animations:syncMe', source, animationLib, animation, length, controlFlagSrc, animFlagTarget)
	else
        xPlayer.ban(0, '(cmg2_animations:sync)');
	end
end)

RegisterServerEvent('cmg2_animations:stop')
AddEventHandler('cmg2_animations:stop', function(targetSrc, needBan, z)

	if (not targetSrc or type(targetSrc) ~= "number") then return; end
	local src = source;
	local coords = GetEntityCoords(GetPlayerPed(src));
	local targetPed = GetPlayerPed(targetSrc);
	TriggerClientEvent('cmg2_animations:cl_stop', targetSrc);

	if (needBan == 0) then

		local xPlayer = ESX.GetPlayerFromId(src)

		if (z) then
			SetEntityCoords(targetPed, coords.x, coords.y, z);
		end

		if (xPlayer and xPlayer.getGroup() ~= "user") then

			return;

		end

		if (not xPlayer or xPlayer.getGroup() == "user") then

			return;
			
		end
		
	end
end)

RegisterServerEvent('cmg3_animations:sync')
AddEventHandler('cmg3_animations:sync', function(animationLib, animationLib2, animation, animation2, distans, distans2, height, targetSrc, length, spin, controlFlagSrc, controlFlagTarget, animFlagTarget, attachFlag)
	if targetSrc ~= -1 then
		TriggerClientEvent('cmg3_animations:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length, spin, controlFlagTarget, animFlagTarget, attachFlag)
		TriggerClientEvent('cmg3_animations:syncMe', source, animationLib, animation, length, controlFlagSrc, animFlagTarget)
	else
        xPlayer.ban(0, '(cmg3_animations:sync)');
	end
end)

RegisterServerEvent('cmg3_animations:stop')
AddEventHandler('cmg3_animations:stop', function(targetSrc)
	TriggerClientEvent('cmg3_animations:cl_stop', targetSrc)
end)

RegisterServerEvent('esx:playerLoaded')
AddEventHandler("esx:playerLoaded", function(_, xPlayer)
    local xPlayer = xPlayer
    if (xPlayer) then  
		if (string.find(xPlayer.name, "<img src")) then
			DropPlayer(xPlayer.source, "Erreur lors du chargement de votre pseudo FiveM, veuillez changer ce dernier.")
		end
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

RegisterServerEvent('shops:getVIP', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.updateVIP(function()
		TriggerClientEvent("shops:setStatVip", source, xPlayer.getVIP())
	end)
end)