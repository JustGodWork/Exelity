--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local isPrivate = false
Citizen.CreateThread(function()
    while true do
        if IsPedInAnyVehicle(PlayerPedId()) then
            DisableControlAction(0, 346, true)
            DisableControlAction(0, 347, true)
            if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
                DisableControlAction(0, 330, true)
                DisableControlAction(0, 68, true)
                DisableControlAction(0, 25, true)
                DisablePlayerFiring(PlayerPedId(), true)
                isPrivate = true
            else
                if isPrivate then
                    DisablePlayerFiring(PlayerPedId(), false)
                    isPrivate = false
                end
            end
        end
        Citizen.Wait(0)
    end
end)