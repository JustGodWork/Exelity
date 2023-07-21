--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local open = false 
local mainMenu = RageUI.CreateMenu('', 'Garage Bahamas')

mainMenu.Display.Header = true 
mainMenu.Closed = function()
  	open = false
end

local function OpenGarageBahamas()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
			while open do 
				RageUI.IsVisible(mainMenu,function() 

					RageUI.Separator("↓ ~p~Gestion Véhicule ~s~ ↓")

					RageUI.Button("Limousine", nil, {RightLabel = "→→"}, true , {
						onSelected = function()
							for k,v in pairs(Config.Jobs.Bahamas.SpawnVehicule) do
								TriggerServerEvent('bahamas:SpawnVehicle', "stretch", v.coords[1], v.coords[2]);
								RageUI.CloseAll()
							end
						end
					})

					RageUI.Button("Limousine 4x4", nil, {RightLabel = "→→"}, true , {
						onSelected = function()
							for k,v in pairs(Config.Jobs.Bahamas.SpawnVehicule) do
								TriggerServerEvent('bahamas:SpawnVehicle', "patriot2", v.coords[1], v.coords[2]);
								RageUI.CloseAll()
							end
						end
					})
				end)
				Wait(0)
			end
		end)
	end
end

Citizen.CreateThread(function()
    while true do
		for k,v in pairs(Config.Jobs.Bahamas.Garage) do
            local coords = GetEntityCoords(PlayerPedId())
            if #(coords - v.coords) <= 10 then
				if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'bahamas' then
					interval = 1
					DrawMarker(Config.Get.Marker.Type, v.coords, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
					if #(coords - v.coords) <= 3 then
						ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au garage")
						if IsControlJustPressed(0, 51) then
							OpenGarageBahamas()
						end
					end
				end
            end
        end
		for k,v in pairs(Config.Jobs.Bahamas.RangerVehicule) do
            local coords = GetEntityCoords(PlayerPedId())

            if #(coords - v.coords) <= 10 then
				if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'bahamas' then
					interval = 1
					DrawMarker(Config.Get.Marker.Type, v.coords, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
					if #(coords - v.coords) <= 3 then
						ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
						if IsControlJustPressed(0, 51) then
							local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
							ESX.Game.DeleteVehicle(vehicle)
						end
					end
				end
            end
        end
    	Citizen.Wait(wait)
    end
end)