Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job2 == nil do
		Citizen.Wait(10)
    end
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	  ESX.PlayerData = xPlayer
end)

local open = false 
local tacosMain5 = RageUI.CreateMenu('', 'Interaction')
tacosMain5.Display.Header = true 
tacosMain5.Closed = function()
    open = false
end

function OpenPrepa()
    if open then
        open = false
        RageUI.Visible(tacosMain5, false)
        return
    else
        open = true
        RageUI.Visible(tacosMain5, true)
        CreateThread(function()
            while open do
              RageUI.IsVisible(tacosMain5,function()
                  RageUI.Separator("↓ BurgerShot ↓")
                  RageUI.Button("Préparer la garnitures", "Requis : Salade + Cornichons + Tomates", {RightLabel = "→→"}, true , {
                      onSelected = function()
                        local playerPed = PlayerPedId()
                        TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BBQ', 0, true)
                        Citizen.Wait(6500)
                        TriggerServerEvent('burgershot:garnitures')
                        ClearPedTasksImmediately(playerPed)
                    end
                  })
              end)
              Citizen.Wait(0)
            end
        end)
    end
end

local position = {
    {x = -1197.032, y = -897.78, z = 13.88616}
}

Citizen.CreateThread(function()
    while true do
        local wait = 750
        for k in pairs(position) do
          if ESX.PlayerData.job and ESX.PlayerData.job.name == 'burgershot' then
              local plyCoords = GetEntityCoords(PlayerPedId(), false)
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

              if dist <= 5.0 then
                  wait = 0
                  DrawMarker(Config.MarkerType, -1197.032, -897.78, 13.88616, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 130, 0, 184, 255, 0, 0, 0, 1, nil, nil, 0)

                if dist <= 1.0 then
                    wait = 0
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour préparer la garnitures")
                    if IsControlJustPressed(1,51) then
                        OpenPrepa()
                    end
                end
            end
        end
        Citizen.Wait(wait)
    end
end
end)