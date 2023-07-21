
--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

--- todo ajouter un timer de 15 mins pour aller au point et prevenir la police/bcso toute les 5 mins la position du gofaster

ESX = nil
local isAllowedToProgram = true
GoFastEnCours = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
    local model = GetHashKey("a_m_y_business_02")
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(1) end
    local ped = CreatePed(4, model, Config.GoFast.Pos, 302.12, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_COP_IDLES", 0, true)
    while true do
        local interval = 500
        local pCoords = GetEntityCoords(PlayerPedId())
        if #(pCoords - Config.GoFast.Pos) <= 3 then
            interval = 1
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour programmer un GoFast")
            if IsControlJustPressed(0, 51) then
                showGoFastMenu()
            end
        end
        Citizen.Wait(interval)
    end
end)

showGoFastMenu = function()
    local mainMenu = RageUI.CreateMenu("", "Programmer votre GoFast")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    ESX.TriggerServerCallback('checkDisponibility', function(canMake)
        if canMake then
            isAllowedToProgram = true
        else
            isAllowedToProgram = false
        end
    end)
    FreezeEntityPosition(PlayerPedId(), true)
    local camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    local ped = PlayerPedId()
    SetCamCoord(camera, 1262.1, -2565.2, 44.7)
    PointCamAtEntity(camera, ped, 0, 0, 0, 1)
    RenderScriptCams(1, 1, 1000, 1, 1)
    SetCamShakeAmplitude(camera, 3.0)

    Citizen.Wait(500)

    while mainMenu do
        RageUI.IsVisible(mainMenu, function()
            if isAllowedToProgram then
                RageUI.Button("Réaliser un GoFast", "A vos risques et périls :!", {RightLabel = "->"}, true, {
                    onSelected = function()
                        FreezeEntityPosition(PlayerPedId(), false)
                        TriggerServerEvent('StartGoFast')
                        RenderScriptCams(0, 1, 1000, 1, 1)
                        DestroyCam(camera, true)
                        AnimDebutMission()
                        RenderScriptCams(0, 1, 1000, 1, 1)
                        DestroyCam(camera, true)
                        RageUI.CloseAll()
                    end
                })
            else
                RageUI.Button("Revenez dans 30 minutes !", nil, {}, false, {
                })
            end
        end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            local camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
            local ped = PlayerPedId()
            FreezeEntityPosition(PlayerPedId(), false)
            RenderScriptCams(0, 1, 1000, 1, 1)
            DestroyCam(camera, true)
            RenderScriptCams(0, 1, 1000, 1, 1)
            DestroyCam(camera, true)
        end
        Citizen.Wait(0)
    end
end

finishGoFast = function()
    local ped = PlayerPedId()
	local vehicle = GetVehiclePedIsIn( ped, false )
	local plate = GetVehicleNumberPlateText(vehicle)
	if plate == '60LYV000' then
		ESX.ShowAdvancedNotification("GoFast", "~p~Livraison GoFast", "laisse le véhicule se garrer tout seul.", "CHAR_LESTER_DEATHWISH", 8)
		TaskVehiclePark(ped, vehicle, 101.661, 6624.771, 31.82, 44.52, 0, 20.0, false)
-- Cam
		local camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
		SetCamCoord(camera, 118.09, 6600.47, 34.04)
		PointCamAtEntity(camera, ped, 0, 0, 0, 1)
		RenderScriptCams(1, 1, 1000, 1, 1)
		SetCamShakeAmplitude(camera, 3.0)
		Wait(8000)
		RenderScriptCams(0, 1, 1000, 1, 1)
		DestroyCam(camera, true)
		
-- Fin cam
		SetVehicleEngineOn(vehicle, false, false, true)
		TaskLeaveAnyVehicle(ped, 1, 1)
		SetVehicleDoorsLocked(vehicle, 2)
-- Ouverture de toute les portes
		Wait(4000)
		SetVehicleDoorOpen(vehicle, 0, false, false)
		SetVehicleDoorOpen(vehicle, 1, false, false)
		SetVehicleDoorOpen(vehicle, 2, false, false)
		SetVehicleDoorOpen(vehicle, 3, false, false)
		SetVehicleDoorOpen(vehicle, 4, false, false)
		SetVehicleDoorOpen(vehicle, 5, false, false)
		SetVehicleDoorOpen(vehicle, 6, false, false)
		SetVehicleDoorOpen(vehicle, 7, false, false)
		ESX.ShowAdvancedNotification("Exelity", "~p~Livraison GoFast", "Calcule du butin en cours ...", "CHAR_LESTER_DEATHWISH", 8)
		FreezeEntityPosition(ped, true)
		Wait(6000)
		RemoveBlip(BlipsGoFast)
		local playerPed = PlayerPedId()
		--TriggerServerEvent("GoFast:Ending", Config.GoFast.Reward)
		FreezeEntityPosition(ped, false)
		ESX.Game.DeleteVehicle(vehicle)
		PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 1)
		GoFastEnCours = false
	else
		ESX.ShowAdvancedNotification("Exelity", "~p~Livraison GoFast", "Hein ? C'est quoi ça ? C'est pas la voiture du GoFast !", "CHAR_LESTER_DEATHWISH", 8)
		PlaySoundFrontend(-1, "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 1)
	end
end

-- Func Utils
local muteSound = true

function InitialSetup()
	SetManualShutdownLoadingScreenNui(true)
	ToggleSound(muteSound)
	if not IsPlayerSwitchInProgress() then
		SwitchOutPlayer(PlayerPedId(), 0, 1)
	end
end

function ToggleSound(state)
	if state then
		StartAudioScene("MP_LEADERBOARD_SCENE");
	else
		StopAudioScene("MP_LEADERBOARD_SCENE");
	end
end

function ClearScreen()
	SetCloudHatOpacity(cloudOpacity)
	HideHudAndRadarThisFrame()
	
	SetDrawOrigin(0.0, 0.0, 0.0, 0)
end

function AnimDebutMission()
	InitialSetup()
	local ped = PlayerPedId()
	
	while GetPlayerSwitchState() ~= 5 do
		Citizen.Wait(0)
		ClearScreen()
	end
	
	ShutdownLoadingScreen()
	
	ClearScreen()
	Citizen.Wait(0)
	ESX.Game.Teleport(ped, Config.GoFast.SpawnJoueur, cb)
	ShutdownLoadingScreenNui()
	
	ClearScreen()
	Citizen.Wait(0)
	ClearScreen()
	while not IsScreenFadedIn() do
		Citizen.Wait(0)
		ClearScreen()
	end
	
	local timer = GetGameTimer()
	
	ToggleSound(false)
	
	while true do
		ClearScreen()
		Citizen.Wait(0)
			
		if GetGameTimer() - timer > 5000 then
		
			SwitchInPlayer(PlayerPedId())
			ClearScreen()
			RequestModel(917809321)
			while not HasModelLoaded(917809321) do
				Citizen.Wait(0)
			end

			while spawn == false do
				local spawn = ESX.Game.IsSpawnPointClear(Config.GoFast.SpawnVehiculeJoueur, 7)
				Citizen.Wait(0)
			end

			local veh = CreateVehicle(917809321, Config.GoFast.SpawnVehiculeJoueur, 294.5, true, true)
			SetVehicleNumberPlateText(veh, '60LYV000')
			SetVehicleEnginePowerMultiplier(veh, 2.0 * 20.0)
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
		--	TaskEnterVehicle(ped, veh, 1000, -1, 1.0, 1, 0)
			--TaskVehiclePark(ped, veh, 1565.92, -2154.84, 77.55, 352.04, 0, 20.0, true)
			SetModelAsNoLongerNeeded(917809321)
			SetModelAsNoLongerNeeded(veh)
			SetVehicleAsNoLongerNeeded(veh)
			GoFastEnCours = true
            StartChecking()
			while GetPlayerSwitchState() ~= 12 do
				Citizen.Wait(0)
				ClearScreen()
			end
			break
		end
	end
	
	ClearDrawOrigin()
	TriggerServerEvent("GoFast:MessagePolice")
	GoFastBlips()
	PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 1)
end

GoFastBlips = function()
    BlipsGoFast = AddBlipForCoord(Config.GoFast.Sell)
	SetBlipSprite(BlipsGoFast, 272)
	SetBlipScale(BlipsGoFast, 0.85) -- set scale
	SetBlipColour(BlipsGoFast, 1)
	SetBlipAlpha(BlipsGoFast, 200)
	PulseBlip(BlipsGoFast)

	SetBlipRoute(BlipsGoFast,  true)

	while GoFastEnCours do
		SetBlipAlpha(BlipsGoFast, 200)
		Wait(1000)
	end
end

StartChecking = function()
    Citizen.CreateThread(function()
        while GoFastEnCours do
            local pCoords = GetEntityCoords(PlayerPedId())
            if #(pCoords - Config.GoFast.Sell) <= 10 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour conclure votre GoFast")
                if IsControlJustPressed(0, 51) then
                    finishGoFast()
                end
            end
            Citizen.Wait(1)
        end
    end)
end