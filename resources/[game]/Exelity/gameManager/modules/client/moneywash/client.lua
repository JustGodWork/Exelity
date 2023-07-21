--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

local WashPosition

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(500)
	end
	ESX.TriggerServerCallback('moneywash:getPos', function(Pos)
        WashPosition = Pos
    end)
end)

local inBlanchiment = false
local Counter = false

Citizen.CreateThread(function()
	while WashPosition == nil do
        Citizen.Wait(100)
    end
	while true do
		local isProche = false
		local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), WashPosition)


		if dist > 50 then
			if inBlanchiment then
				TriggerServerEvent('esx_moneywash:stopWash')
				inBlanchiment = false
				ESX.ShowNotification('Vous vous êtes éloigner de la zone')
				Counter = true
			end
		end
		if dist < 50 then
			isProche = true
			DrawMarker(25, WashPosition, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 130,0,184, 255, false, false, 2, false, false, false, false)
		end
		if dist < 3 then
			ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour intéragir")
			if IsControlJustPressed(1,51) then
				if not inBlanchiment then
					if not Counter then
						inBlanchiment = true
						TriggerServerEvent('esx_moneywash:startWash')
					else
						ESX.ShowNotification('~y~ANTI GLITCH~n~Vous allez trop vite pour le système')
					end
				else
					TriggerServerEvent('esx_moneywash:stopWash')
					inBlanchiment = false
					ESX.ShowNotification('Vous avez arrêter de blanchir')
					Counter = true
				end
			end
		end
		
		if inBlanchiment then
			isProche = true
			DrawMissionText("Appuyez sur ~p~E~s~ pour arrêter l\'activité", 100)
		end

		if isProche then
			Wait(0)
		else
			Wait(750)
		end
	end
end)

Citizen.CreateThread(function()
	while true do 
		Wait(5000)
		Counter = false
	end
end)

function DrawMissionText(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end