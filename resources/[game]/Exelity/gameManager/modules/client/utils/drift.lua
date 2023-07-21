local drift = false
local kmh = 3.6
CreateThread(function()
    while true do
        local waiting = 250
        if IsPedInAnyVehicle(GetPed(), false) then

             local CarSpeed = GetEntitySpeed(GetCar()) * kmh
             waiting = 50

            if GetPedInVehicleSeat(GetCar(), -1) == GetPed() then

                if CarSpeed <= 140.00 then 
                    if drift then
                        waiting = 1
                        SetVehicleReduceGrip(GetCar(), true)
                    else
                        waiting = 1000
                        SetVehicleReduceGrip(GetCar(), false)
                    end
                end
            end
        end
        Wait(waiting)
    end
end)

RegisterCommand('+drift', function()
    drift = true
    if IsPedInAnyVehicle(GetPed(), false) then
    end
end, false)
RegisterCommand('-drift', function()
    drift = false
end, false)
RegisterKeyMapping('+drift', 'Mode Drift', 'keyboard', 'LSHIFT')

function GetPed() return PlayerPedId() end
function GetCar() return GetVehiclePedIsIn(PlayerPedId(),false) end