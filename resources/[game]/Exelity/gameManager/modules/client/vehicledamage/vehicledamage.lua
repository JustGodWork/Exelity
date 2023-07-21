ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
        Wait(100)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)

CreateThread(function()
    while true do
        SetPedSuffersCriticalHits(PlayerPedId(),false) -- descativer les tete
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local veh = GetVehiclePedIsIn(playerPed, false)
            if GetVehicleEngineHealth(veh) > 1 and GetVehicleEngineHealth(veh) < 450 then
                ESX.ShowNotification("~b~[Tableau de bord]~s~ le moteur du véhicule est ~o~fortement endommagé")
                PlaySoundFrontend(-1,"Timer_10s", "GTAO_FM_Events_Soundset", true)
                Wait(20000) -------
                ESX.ShowNotification("~b~[Tableau de bord]~s~ le moteur du véhicule est en ~y~état critique")
                local soundId2 = GetSoundId()
                PlaySoundFrontend(soundId2,"Tank_Critical_Damage_Loop", "dlc_vw_am_ip_tank_sounds", true)
                Wait(20000) -------
                StopSound(soundId2)
                ReleaseSoundId(soundId2)
                ESX.ShowNotification("~b~[Tableau de bord]~s~ Le moteur du véhicule est ~y~hors-service")
                SetVehicleEngineHealth(veh,-4000.0)
                Wait(5000)
                SetVehicleEngineHealth(veh,0.0)
                local soundId3 = GetSoundId()
                PlaySoundFrontend(soundId3,"Engine_fail", "DLC_PILOT_ENGINE_FAILURE_SOUNDS", true)
            end
        end
        Wait(300)
    end
end)