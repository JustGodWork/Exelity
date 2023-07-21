ESX = nil
local hunger, thirst = 0, 0

CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

CreateThread(function()
    while true do
        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            hunger = status.getPercent()
        end)
        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            thirst = status.getPercent()
        end)
        Wait(10000)
    end
end)

CreateThread(function()
	Wait(2500)
	local iddd = GetPlayerServerId(PlayerId())
	Wait(10000)
	SendNUIMessage({actionhud = "setValue", key = "id", value = "ID : "..iddd})
	local sleep = 1500
	local enabledSpeedo = false
	local IsPaused = false
	TriggerServerEvent("rHud:getInfo")
	while true do
		if not GetIsWidescreen() then 
			SendNUIMessage({actionhud = "setResolution"})
		else
			SendNUIMessage({actionhud = "resetResolution"})
		end
		local heur = GetClockHours()
		local minute = GetClockMinutes()
		if minute < 10 then 
			minute = "0"..minute 
		end
		if heur < 10 then 
			heur = "0"..heur 
		end
		local ped = PlayerPedId()
		local getVeh = GetVehiclePedIsIn(ped, false)
		local isInVehicle = IsPedInAnyVehicle(ped, false)
		local classe = GetVehicleClass((getVeh)) 
		local playerVehicle = GetVehiclePedIsIn(ped, false)
		local vehicleSeat = GetPedInVehicleSeat(playerVehicle, -1)
		SendNUIMessage({actionhud = "setValue", key = "clock", value = heur.." : "..minute})
		SendNUIMessage({actionhud = "setValue", key = "eat", value = hunger})
		SendNUIMessage({actionhud = "setValue", key = "drink", value = thirst})
		if IsPauseMenuActive() and not IsPaused then
			IsPaused = true
			SendNUIMessage({actionhud = "showhud", showhud = false})
			if isInVehicle and not (classe == 13)  then 
				SendNUIMessage({
					actionspeedo = "showspeedo",
					showspeedo = false
				})
			end
		elseif not IsPauseMenuActive() and IsPaused then
			IsPaused = false
			SendNUIMessage({actionhud = "showhud", showhud = true})
			if isInVehicle and not (classe == 13)  then 
				SendNUIMessage({
					actionspeedo = "showspeedo",
					showspeedo = true
				})
			end
		end
		if isInVehicle and not (classe == 13) then
			if not enabledSpeedo then
				if not (classe == 13) and (playerVehicle ~= 0 ) and (not IsPauseMenuActive()) and vehicleSeat == ped then 
					SendNUIMessage({
						actionspeedo = "showspeedo",
						showspeedo = true
					})
					enabledSpeedo = true
					sleep = 0
				end
			end
			local vehicle = GetVehiclePedIsIn(ped, false)
			local fuel = exports["JustGod"]:GetFuel(vehicle)
			local speed = math.ceil(GetEntitySpeed(vehicle) * 3.6)
			SendNUIMessage({actionspeedo = "setValue", key = "speed", value = speed})
			SendNUIMessage({actionspeedo = "setValue", key = "fuel", value = fuel})
		else
			SendNUIMessage({
				actionspeedo = "showspeedo",
				showspeedo = false
			})
			enabledSpeedo = false
			sleep = 1000
		end
		Wait(sleep)
	end
end)

RegisterNetEvent('esx:playerLoaded', function(xPlayer) 
	local data = xPlayer
	local accounts = data.accounts

	for _,v in pairs(accounts) do
		local account = v
		if account.name == "cash" then
			local moneymoney = ESX.Math.GroupDigits(account.money)
			SendNUIMessage({actionhud = "setValue", key = "money", value = moneymoney.." $"})
		end
        if account.name == "dirtycash" then
			local moneymoney = ESX.Math.GroupDigits(account.money)
			SendNUIMessage({actionhud = "setValue", key = "sale", value = moneymoney.." $"})
		end
	end
end)

RegisterNetEvent('esx:setAccountMoney', function(account)
	if account.name == "cash" then
		local moneymoney = ESX.Math.GroupDigits(account.money)
		SendNUIMessage({actionhud = "setValue", key = "money", value = moneymoney.." $"})
	end
    if account.name == "dirtycash" then
        local moneymoney = ESX.Math.GroupDigits(account.money)
        SendNUIMessage({actionhud = "setValue", key = "sale", value = moneymoney.." $"})
    end
end)

RegisterNetEvent("Hud:hide", function(show) 
	SendNUIMessage({actionhud = "showhud", showhud = show}) 
end)

RegisterNetEvent("rHud:setInfo", function(cash, dirty) 
    SendNUIMessage({actionhud = "setValue", key = "money", value = ESX.Math.GroupDigits(cash).." $"})
    SendNUIMessage({actionhud = "setValue", key = "sale", value = ESX.Math.GroupDigits(dirty).." $"})
end)

RegisterNetEvent("ui:update")
AddEventHandler("ui:update", function(nbPlayerTotal)
    SendNUIMessage({actionhud = "setValue", key = "player", value = nbPlayerTotal})
end)