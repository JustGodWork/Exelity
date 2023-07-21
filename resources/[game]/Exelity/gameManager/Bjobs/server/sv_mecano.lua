ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterNetEvent('benny:spawnVehicle', function(model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'mecano' then
        xPlayer.ban(0, '(benny:spawnVehicle)')
        return
    end
      
    ESX.SpawnVehicle(GetHashKey(model), vector3(-182.4041, -1313.647, 30.68917), 1.1301537752151, nil, false, nil, function(vehicle)
        TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
    end)
end)

RegisterNetEvent('ls:spawnVehicle', function(model)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'mecano2' then
        xPlayer.ban(0, '(ls:spawnVehicle)')
        return
    end

    ESX.SpawnVehicle(GetHashKey(model), vector3(-384.4778, -127.9943, 38.07802), 208.34944152832, nil, false, nil, function(vehicle)
        TaskWarpPedIntoVehicle(GetPlayerPed(source), vehicle, -1)
    end)
end)
