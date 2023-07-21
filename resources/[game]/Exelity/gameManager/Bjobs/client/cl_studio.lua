ESX = nil

local openedGarage = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)

openstudioF6 = function()
    local mainMenu = RageUI.CreateMenu("", "Interaction")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while mainMenu do
        RageUI.IsVisible(mainMenu, function()

            RageUI.Separator("↓ Gestion Anonces ~s~ ↓")
            RageUI.Button("Annonce", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    OpenStudioAnnouncementMenu()
                end
            })
            RageUI.Separator("↓ Gestion Facture ~s~ ↓")
            RageUI.Button("Faire une ~p~Facture", nil, {RightLabel = ""}, true , {
                onSelected = function()
                    local montant = KeyboardInputstudio("Montant:", 'Indiquez un montant', '', 7)
                    if tonumber(montant) == nil then
                        ESX.ShowNotification("Montant invalide")
                        return false
                    else
                        amount = (tonumber(montant))
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
							ESX.ShowNotification('~r~Personne autour de vous')
						else
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_studio', "studio", amount)
						end
                    end
                end
            })
        end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
        end
        Citizen.Wait(0)
    end
end

function OpenStudioAnnouncementMenu()
    local annonce = KeyboardInput("Entrez votre annonce", "", 100)
    if annonce and annonce ~= "" then
        TriggerServerEvent('Studio:annonce', annonce)
    end
end

Citizen.CreateThread(function()
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    while true do
        local interval = 500
        for k,v in pairs(Config.Jobs.studio.RangerVehicule) do
            local coords = GetEntityCoords(PlayerPedId())
            if #(coords - v.pos) <= 10 then
                interval = 1
                DrawMarker(Config.Get.Marker.Type, v.pos, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                if #(coords - v.pos) <= 3 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
                    if IsControlJustPressed(0, 51) then
                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                        ESX.Game.DeleteVehicle(vehicle)
                    end
                end
            end
        end
        for k,v in pairs(Config.Jobs.studio.Zones) do
            local coords = GetEntityCoords(PlayerPedId(), false)
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'studio' then
                if #(coords - v.PosGarage) <= 10 then
                    if isInService then
                        interval = 1
                        DrawMarker(Config.Get.Marker.Type, v.PosGarage, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                        if #(coords - v.PosGarage) <= 3 then
                            if IsControlJustPressed(0, 51) then
                                openedGarage = true
                                openSortirVehicle()
                            end
                            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au garage")
                        end
                    end
                end
            end
        end
        Citizen.Wait(interval)
    end
end)

function openSortirVehicle()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openedGarage do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Sultan", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    TriggerServerEvent('studio:spawnVehicle', "sultan");
                    RageUI.CloseAll()
                end
            })
        end)

        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            openedGarage = false
        end

        Citizen.Wait(0)
    end
end

local IsInPVP = false;

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register('F6','InteractionsJobstudio', "Menu job studio", function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'studio' then

        if (not IsInPVP) then
            openstudioF6()
        end

    end
end)

CreateThread(function() 
    while true do 
        local interval = 750
        for _,v in pairs(CustomJob) do
            local mc = v.pointdelveh
            local pPed = PlayerPedId()
            local pc = GetEntityCoords(pPed)
            local dif = #(pc - mc)
            if ESX.PlayerData.job and ESX.PlayerData.job.name == v.name then
                if dif < 10 then
                    interval = 1
                    DrawMarker(20,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,130,0,184,255,false,false,0,true,nil,nil,false)
                    if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
                        if IsControlJustPressed(0, 51) then
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                    end
                end
            end
        end
        Wait(interval)
    end
end)
