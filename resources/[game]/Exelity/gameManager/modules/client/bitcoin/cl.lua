--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

Citizen.CreateThread(function()
    -- Ped Vente
    local model = GetHashKey('a_m_m_eastsa_02')
    local posspawn = Config.Bitcoin.Vente
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(1) end
    local ped = CreatePed(4, model, posspawn, 1.98, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_COP_IDLES", 0, true)

    -- Blip Recolte
    local blip = AddBlipForCoord(Config.Bitcoin.Recolte)
    SetBlipSprite (blip, 490)
    SetBlipColour(blip, 5)
    SetBlipScale(blip, 0.6)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("[Activité] Recolte de Bitcoin")
    EndTextCommandSetBlipName(blip)

    -- Blip Vente
    local blip = AddBlipForCoord(Config.Bitcoin.Vente)
    SetBlipSprite (blip, 431)
    SetBlipColour(blip, 81)
    SetBlipScale(blip, 0.6)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("[Activité] Vente de Bitcoin")
    EndTextCommandSetBlipName(blip)
end)
