local PositionAscSud = {
    {x = 620.3211, y = -2.436242, z = 90.47012}, -- 2
    {x = 620.3257, y = -2.411091, z = 84.39217}, -- 1
    {x = 620.3357, y = -2.348196, z = 77.49742}, -- -1
    {x = 620.3234, y = -2.316973, z = 70.62828}, -- -2
}

Citizen.CreateThread(function()
    while true do
        local fofo = 500
        local pCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(PositionAscSud) do
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, PositionAscSud[k].x, PositionAscSud[k].y, PositionAscSud[k].z)
			if distance <= 10.0 then
				fofo = 1
				DrawMarker(2, PositionAscSud[k].x, PositionAscSud[k].y, PositionAscSud[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 130, 0, 184, 255, 0, 0, 0, 1, nil, nil, 0)
			
				if distance <= 1.5 then
					ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour prendre l'ascenseur")
					if IsControlJustPressed(0, 51) then
						openAscSud()
					end
				end
			end
        end
        Citizen.Wait(fofo)
    end
end)

openAscSud = function()
    local mainMenuNord = RageUI.CreateMenu("", "Choisissez un étage")

    RageUI.Visible(mainMenuNord, not RageUI.Visible(mainMenuNord))

    while mainMenuNord do
        RageUI.IsVisible(mainMenuNord, function()
            RageUI.Button("~p~[2]~s~ Salle de Briefing et bureau", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(), 620.3211, -2.436242, 90.47012)
                end
            })
            RageUI.Button("~p~[1]~s~ Hall d'entrée et salle conférence", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(), 620.3257, -2.411091, 84.39217)
                end
            })
            RageUI.Button("~p~[-1]~s~ Cellules et salle interrogatoires", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(), 620.3357, -2.348196, 77.49742)
                end
            })
            RageUI.Button("~p~[-2]~s~ Garage", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(), 620.3234, -2.316973, 70.62828)
                end
            })
        end)
        if not RageUI.Visible(mainMenuNord) then
            mainMenuNord = RMenu:DeleteType(mainMenuNord, true)
        end
        Citizen.Wait(0)
    end
end

local PositionAscEMS = {
    {x = -793.7569, y = -1245.896, z = 7.33742},
    {x = -773.9708, y = -1207.424, z = 51.1471},
}

Citizen.CreateThread(function()
    while true do
        local fofo2 = 500
        local pCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(PositionAscEMS) do
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, PositionAscEMS[k].x, PositionAscEMS[k].y, PositionAscEMS[k].z)
			if distance <= 10.0 then
				fofo2 = 1
				DrawMarker(2, PositionAscEMS[k].x, PositionAscEMS[k].y, PositionAscEMS[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 130, 0, 184, 255, 0, 0, 0, 1, nil, nil, 0)
			
				if distance <= 1.5 then
					ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour prendre l'ascenseur")
					if IsControlJustPressed(0, 51) then
						openAsc()
					end
				end
			end
        end
        Citizen.Wait(fofo2)
    end
end)

openAsc = function()
    local mainMenuNord = RageUI.CreateMenu("", "Choisissez un étage")

    RageUI.Visible(mainMenuNord, not RageUI.Visible(mainMenuNord))

    while mainMenuNord do
        RageUI.IsVisible(mainMenuNord, function()
            RageUI.Button("~p~[2]~s~ Helipad", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(),-773.9708, -1207.424, 51.1471)
                end
            })
            RageUI.Button("~p~[1]~s~ Rez de chaussée", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    SetEntityCoords(PlayerPedId(),-793.7569, -1245.896, 7.33742)
                end
            })
        end)
        if not RageUI.Visible(mainMenuNord) then
            mainMenuNord = RMenu:DeleteType(mainMenuNord, true)
        end
        Citizen.Wait(0)
    end
end