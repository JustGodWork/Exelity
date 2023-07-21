---
--- @author Azagal
--- Create at [31/10/2022] 12:18:01
--- Current project [Exelity-V1]
--- File name [spawnVehicle]
---

RegisterNetEvent("Taxi:Spawn:Vehicle", function(positionIndex)
    local playerSrc = source
    local xPlayer = ESX.GetPlayerFromId(playerSrc)
    if (not xPlayer) then
        return
    end

    local playerJob = xPlayer.getJob()
    if (playerJob ~= nil and playerJob.name ~= "taxi") then
        return --[[BAN : Not in job]]
    end

    local selectedPosition = Taxi.Config.vehicle.spawnPosition[positionIndex]
    if (selectedPosition == nil) then
        return
    end

    CreateVehicle(Taxi.Config.vehicle.model, selectedPosition["x"], selectedPosition["y"], selectedPosition["z"], selectedPosition["w"], true, true)
    xPlayer.showNotification("Vous avez ~g~sorti~s~ un ~p~véhicule~s~.")
end)