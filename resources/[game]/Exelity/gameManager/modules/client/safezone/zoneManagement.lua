---
--- @author Azagal
--- Create at [01/11/2022] 11:32:50
--- Current project [Exelity-V1]
--- File name [zoneManagement]
---

local playerIsInSafeZone, actionOn, inPVP = false, nil, false

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(IsInPVP)
    inPVP = IsInPVP;
end);

function SafeZone:playerIsIn()
    return playerIsInSafeZone or false
end

local _GetResourceState = GetResourceState;

function SafeZone:checkIfPlayerIsIn()
    playerIsInSafeZone = false
    local zoneList = SafeZone.Config.zoneList
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    for i = 1, #zoneList do
        local currentZone = zoneList[i]
        if (currentZone ~= nil) then

            local radius = type(currentZone) == "table" and currentZone.radius ~= nil and currentZone.radius or SafeZone.Config.zoneRadius;

            if (#(playerCoords - vector3(currentZone.x, currentZone.y, currentZone.z)) < radius) then

                if (type(currentZone) == "table" and currentZone.isPVP) then

                    if (inPVP) then
                        playerIsInSafeZone = true;
                    end

                else
                    playerIsInSafeZone = true;
                end
                
            end
        end
    end
end

function SafeZone:checkVehicles()
    local playerPed = PlayerPedId()
    local vehicleList = GetGamePool("CVehicle")
    for i = 1, #vehicleList do
        local currentVehicle = vehicleList[i]
        if (currentVehicle ~= 0 and DoesEntityExist(currentVehicle)) then
            if not IsVehicleSeatFree(currentVehicle, -1) then
                SetEntityNoCollisionEntity(playerPed, currentVehicle, true)
                SetEntityNoCollisionEntity(currentVehicle, playerPed, true)
            end
        end
    end
end

function SafeZone:checkControls()
    local playerPed = PlayerPedId()
    SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)

    local disabledKeys = SafeZone.Config.disabledKeys
    for i = 1, #disabledKeys do
        local currentKey = disabledKeys[i]
        if (currentKey ~= nil) then
            DisableControlAction(currentKey.group, currentKey.key, true)
            if IsDisabledControlJustPressed(currentKey.group, currentKey.key) then
                if currentKey.message then
                    ESX.ShowNotification(currentKey.message)
                end
            end
        end
    end
end

function SafeZone:onEntered(callback)
    
    local playerPed = PlayerPedId()
   
    NetworkSetFriendlyFireOption(false)
    SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
    DisablePlayerFiring(playerPed, true)
   
    if (not inPVP) then

        SendNUIMessage({
            type = 'safezone:set', 
            isInSafezone = true
        })
        
    end

    if (callback ~= nil and type(callback) == "function") then
        callback()
    end

end

function SafeZone:onExited(callback)

    local playerPed = PlayerPedId()

    NetworkSetFriendlyFireOption(true)
    DisablePlayerFiring(playerPed, false)

    if (not inPVP) then
        
        SendNUIMessage({
            type = 'safezone:set', 
            isInSafezone = false
        })

    end

    if (callback ~= nil and type(callback) == "function") then
        callback()
    end

end

CreateThread(function()
    while ESX == nil do
        Wait(0)
    end

    while ESX.GetPlayerData() == nil or ESX.GetPlayerData().job == nil do
        Wait(0)
    end

    while true do
        local loopInterval = 1000
        SafeZone:checkIfPlayerIsIn()

        local playerIsIn = SafeZone:playerIsIn()
        local playerJob = ESX.GetPlayerData().job

        if (not SafeZone.Config.bypassJob.active or (SafeZone.Config.bypassJob.active == true and SafeZone.Config.bypassJob.list[playerJob.name] == nil)) then
            if (playerIsIn == true) then
                loopInterval = 0
                SafeZone:checkVehicles()
                SafeZone:checkControls()
                if (actionOn == nil) then
                    SafeZone:onEntered(function()
                        actionOn = true
                    end)
                end
            else
                if (actionOn == true) then
                    SafeZone:onExited(function()
                        actionOn = nil
                    end)
                end
            end
        end

        Wait(loopInterval)
    end
end)

exports("IsInSafeZone", function()
    return SafeZone:playerIsIn()
end)