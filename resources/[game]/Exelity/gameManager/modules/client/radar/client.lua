--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local GUI						= {}
GUI.Time						= 0
local vitesse_flash				= 0
local vitesse_flash				= nil
local is_flashed 				= false
local speedlimit				= 0
local PlayerPed 				= nil
local PedCoords					= nil
local PedSpeed					= 0
local i 						= 0
local timeout					= 0

Locale = 'fr'

Radars = {
    { station = 1, name = 'Commissariat', speedlimit = 130, r = 35, flash = { x = 398.1266, y = -1050.5014, z = 29.3957 }, props = { x = 419.1470, y = -1033.5052, z = 28.48 } },
    { station = 2, name = 'Benny\'s', speedlimit = 130, r = 40, flash = { x = -270.3585, y = -1139.8244, z = 23.0982 }, props = { x = -247.8916, y = -1125.0645, z = 18.84 } },
    { station = 3, name = 'San Andreas Avenue', speedlimit = 130, r = 40, flash = { x = -251.4578, y = -661.6170, z = 33.2561 }, props = { x = -232.1231, y = -650.5041, z = 32.27 } },
    { station = 4, name = 'Parking central', speedlimit = 130, r = 40, flash = {x = 169.67420959473, y = -819.68133544922, z = 31.177391052246}, props = {x = 201.02711486816, y = -805.37127685547, z = 30.064540863037} },
    { station = 5, name = 'Freeway', speedlimit = 350, r = 40, flash = {x = 1613.8607177734, y = 1122.4664306641, z = 82.664772033691}, props = {x = 1627.8889160156, y = 1135.5620117188, z = 82.054306030273}},
}

local ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
		end)
        Citizen.Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		PlayerPed = PlayerPedId()

		if IsPedInAnyVehicle(PlayerPed, false) and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPed, false), -1) == PlayerPed then
			PedCoords = GetEntityCoords(PlayerPed, true)
			for k, w in pairs(Config.Radars) do
				if GetDistanceBetweenCoords(PedCoords, Config.Radars[k].flash.x, Config.Radars[k].flash.y, Config.Radars[k].flash.z, true) < Config.Radars[k].r then
					if is_flashed == false and timeout == 0 then
                        speedlimit 	= Config.Radars[k].speedlimit + 6
                        PedSpeed	= GetEntitySpeed(PlayerPed)
                        PedSpeed 	= PedSpeed * 3.6
                        if PedSpeed > speedlimit then
                            vitesse_flash = (GetEntitySpeed(PlayerPed) * 3.6)

                            local price = 0
                            local speeding = PedSpeed - speedlimit

                            speeding = round(speeding)

                            if speeding < 20 then 
                                price = 180
                            end

                            if speeding < 30 then 
                                price = 235
                            end

                            if speeding < 50 then 
                                price = 300
                            end
                            
                            if speeding >= 50 then 
                                price = 375
                            end

                            if is_flashed == false then
                                StartScreenEffect('SwitchShortMichaelIn',  400,  false)
                                ESX.ShowNotification(_U('auto_fine_notif', (speeding + speedlimit), (speedlimit-6)))
                                if ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job.name == 'gouv' or ESX.PlayerData.job.name == 'bcso' or ESX.PlayerData.job.name == 'fib' then
                                    ESX.ShowNotification('Votre employeur sera notifié de cette excès de vitesse')
                                    is_flashed = false
                                    timeout = 85
                                else
                                TriggerServerEvent("police:SendFactureRadar", price)
                                is_flashed = true
                                timeout = 85
                            end
                        end
                    end
                end
				else
					price 			= 0
					vitesse_flash 	= 0
					is_flashed 		= false
				end
			end		
		end
		if timeout > 0 then
			timeout = timeout - 1
		end
		Citizen.Wait(55)
	end
end)

function round(num, dec)
	local mult = 10^(dec or 0)
	return math.floor(num * mult + 0.5) / mult
end