RegisterCommand('afk', function()
    OpenAFKMenu()
end)

ESX = nil
CreateThread(function()
    while ESX == nil do
        TriggerEvent(fInvest.ESXEvents, function(obj) ESX = obj end)
        Wait(10)
    end
end)

function DrawMissionText(msg, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(time and math.ceil(time) or 0, true)
end

local PositionPed = {
    {x = 259.15, y = -783.07, z = 30.51},
}  

Citizen.CreateThread(function()
    while true do
        local fofo = 500
        local pCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(PositionPed) do
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, PositionPed[k].x, PositionPed[k].y, PositionPed[k].z)
			if distance <= 10.0 then
				fofo = 1
				DrawMarker(2, PositionPed[k].x, PositionPed[k].y, PositionPed[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 130, 0, 184, 255, 0, 0, 0, 1, nil, nil, 0)
			
				if distance <= 1.5 then
					ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour parler à la dame")
					if IsControlJustPressed(0, 51) then
						OpenAFKMenu()
					end
				end
			end
        end
        Citizen.Wait(fofo)
    end
end)

local AfkTime = 0
local InAfkZone = false

RegisterNetEvent('requestClientAfkTime')
AddEventHandler('requestClientAfkTime', function(result)
    AfkTime = result
end)

RegisterNetEvent('ForceLunchInvest')
AddEventHandler('ForceLunchInvest', function(result)
    InAfkZone = true
    InAFK = true
    Wait(150)
    OpenAFKMenuInvest()
end)

Citizen.CreateThread(function()
    Wait(2500)
    TriggerServerEvent("requteInvestTime")
    while true do
        if InAfkZone then
            if AfkTime >= 1 then
                Wait(60000)
                AfkTime = AfkTime - 1
                TriggerServerEvent("UpdateAfkTick", AfkTime)
            end
        end
        Wait(2500)
    end
end)

local PositionBACK = {
    {x = 994.593, y = -3002.594, z = -39.647},
}  

Citizen.CreateThread(function()
    while true do
        local wait = 500
        local pCoords = GetEntityCoords(PlayerPedId())
        if not InAfkZone then
            for k,v in pairs(PositionBACK) do
                local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, PositionBACK[k].x, PositionBACK[k].y, PositionBACK[k].z)
                if distance <= 15.0 then
                    wait = 1
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour retourner en ville")
                    if IsControlJustPressed(0, 51) then
                        SetEntityCoords(PlayerPedId(), fInvest.PositionCommand)
                    end
                end
            end
        end
        Citizen.Wait(wait)
    end
end)

function OpenAFKMenu()
    if #(GetEntityCoords(PlayerPedId()) - fInvest.PositionCommand) < fInvest.MaxDistance then

        local menu = RageUIafk.CreateMenu(fInvest.TitleMenu, fInvest.DescriptionMenu) 

        RageUIafk.Visible(menu, not RageUIafk.Visible(menu))

        while menu do
            Citizen.Wait(0)
            if #(GetEntityCoords(PlayerPedId()) - fInvest.PositionCommand) > fInvest.MaxDistance then
                RageUIafk.CloseAll()
            end
            RageUIafk.IsVisible(menu, function()
                RageUIafk.Separator(fInvest.TwoMessageMenu)
                if AfkTime <= 0 then
                    for k,v in pairs(fInvest.ListInvest) do
                        RageUIafk.Button(v.label, nil, {RightLabel = v.heures}, true, {onSelected = function()
                            InAfkZone = true
                            TriggerServerEvent("GoInvest", v.type)
                            RageUIafk.CloseAll()
                            InAFK = true
                            Wait(150)
                            OpenAFKMenuInvest()
                        end})
                    end
                else
                    RageUIafk.Separator(fInvest.HaveInvest)
                    RageUIafk.Button(fInvest.RestartInvest, nil, {}, true, {onSelected = function()
                        InAfkZone = true
                        RageUIafk.CloseAll()
                        InAFK = true
                        Wait(150)
                        OpenAFKMenuInvest()
                    end})
                end
            end, function()
            end)

            if not RageUIafk.Visible(menu) then
                menu = RMenu:DeleteType('menu', true)
            end
        end
    else
        ESX.ShowNotification(fInvest.ZoneSafeMessage)
    end
end

local disabledSafeZonesKeys = {
	{group = 2, key = 37, message = "Il est impossible de sortir une arme dans cet endroit."},
	{group = 0, key = 24, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 69, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 92, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 106, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 168, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 160, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 45, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 25, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 80, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 140, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 250, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 263, message = "Il est impossible d'engager un combat dans cet endroit."},
	{group = 0, key = 310, message = "Il est impossible d'engager un combat dans cet endroit."},
}

local InAFK = false
Citizen.CreateThread(function()
    while true do
        if InAfkZone then
            if AfkTime >= 1 then
                if #(GetEntityCoords(PlayerPedId()) - fInvest.Position) > 50 then
                    SetEntityCoords(PlayerPedId(), fInvest.Position)
                end
                if fInvest.Lang == 'FR' then
                    local plyPed = PlayerPedId()
                    for i = 1, #disabledSafeZonesKeys, 1 do
                        DisableControlAction(disabledSafeZonesKeys[i].group, disabledSafeZonesKeys[i].key, true)
                        SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
    
                        if IsDisabledControlJustPressed(disabledSafeZonesKeys[i].group, disabledSafeZonesKeys[i].key) then
                            SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
    
                            if disabledSafeZonesKeys[i].message then
                                ESX.ShowNotification(disabledSafeZonesKeys[i].message)
                                SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
                            end
                        end
                    end
                elseif fInvest.Lang == 'EN' then
                end
                InAFK = true
            else
                InAFK = false
            end
        else
            InAFK = false
        end
        if InAfkZone and AfkTime >= 1 then
            Wait(0)
        else
            Wait(2500)
        end
    end
end)

function OpenAFKMenuInvest()
	local menu = RageUIafk.CreateMenu(fInvest.TitleMenu, fInvest.FirstMessageInInvestMenu) 
    menu.Closable = false
    RageUIafk.Visible(menu, not RageUIafk.Visible(menu))

	while menu do
		Citizen.Wait(0)
        RageUIafk.IsVisible(menu, function()
            RageUIafk.Separator('')
            RageUIafk.Separator("Temps restant: "..AfkTime.." min(s)")
            RageUIafk.Button(fInvest.ReturnMessage, fInvest.ReturnDescription, {}, true, {onSelected = function()
                InAfkZone = false
                SetEntityCoords(PlayerPedId(), fInvest.ReturnPosition)
                RageUIafk.CloseAll()
            end})
            if AfkTime <= 0 then 
                RageUIafk.CloseAll()
            end
        end, function()
        end)

        if not RageUIafk.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end