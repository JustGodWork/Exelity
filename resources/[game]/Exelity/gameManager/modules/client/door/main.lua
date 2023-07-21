--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)
		Citizen.Wait(500)
	end

	while not ESX.GetPlayerData().job do
		Citizen.Wait(500)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	-- Update the door list
	ESX.TriggerServerCallback('esx_doorlock:getDoorState', function(doorState)
		for index,state in pairs(doorState) do
			Config.DoorList[index].locked = state
		end
	end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job) ESX.PlayerData.job = job end)

RegisterNetEvent('esx_doorlock:setDoorState')
AddEventHandler('esx_doorlock:setDoorState', function(index, state) Config.DoorList[index].locked = state end)

Citizen.CreateThread(function()
	while true do
		local interval = 500
		local playerCoords = GetEntityCoords(PlayerPedId())

		for k,v in ipairs(Config.DoorList) do
			--if #(playerCoords - v.doors.objCoords) <= Config.DoorList.maxDistance then
				v.isAuthorized = isAuthorized(v)

				if v.doors then
					for k2,v2 in ipairs(v.doors) do
						--if #(playerCoords - v.doors.objCoords) <= Config.DoorList.maxDistance then
							if v2.object and DoesEntityExist(v2.object) then
								if k2 == 1 then
									v.distanceToPlayer = #(playerCoords - GetEntityCoords(v2.object))
								end

								if v.locked and v2.objHeading and ESX.Math.Round(GetEntityHeading(v2.object)) ~= v2.objHeading then
									SetEntityHeading(v2.object, v2.objHeading)
								end
							else
								v.distanceToPlayer = nil
								v2.object = GetClosestObjectOfType(v2.objCoords, 1.0, v2.objHash, false, false, false)
							end
						--end
					end
				else
					if v.object and DoesEntityExist(v.object) then
						v.distanceToPlayer = #(playerCoords - GetEntityCoords(v.object))

						if v.locked and v.objHeading and ESX.Math.Round(GetEntityHeading(v.object)) ~= v.objHeading then
							SetEntityHeading(v.object, v.objHeading)
						end
					else
						v.distanceToPlayer = nil
						v.object = GetClosestObjectOfType(v.objCoords, 1.0, v.objHash, false, false, false)
					end
				end
			--end
		end

		Citizen.Wait(interval)
	end
end)

Citizen.CreateThread(function()
	while true do
		local interval = 500

		for k,v in ipairs(Config.DoorList) do
			if v.distanceToPlayer and v.distanceToPlayer < 10 then
				interval = 1

				if v.doors then
					for k2,v2 in ipairs(v.doors) do
						FreezeEntityPosition(v2.object, v.locked)
					end
				else
					FreezeEntityPosition(v.object, v.locked)
				end
				if v.distanceToPlayer and v.distanceToPlayer < v.maxDistance then
					local size, displayText = 1, "~g~Ouvert~s~"
	
					if v.size then size = v.size end
					if v.locked then displayText = "~r~Fermé~s~" end
					if v.isAuthorized then displayText = "[E] "..displayText.."" end
	
					ESX.Game.Utils.DrawText3D(v.textCoords, displayText, size)
	
					if IsControlJustReleased(0, 38) then
						if v.isAuthorized then
							v.locked = not v.locked
							TriggerServerEvent('esx_doorlock:updateState', k, v.locked) -- broadcast new state of the door to everyone
						end
					end
				end
			end
		end

		Citizen.Wait(interval)
	end
end)

function isAuthorized(door)
	if not ESX or not ESX.PlayerData.job then
		return false
	end

	for k,job in pairs(door.authorizedJobs) do
		if job == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end
