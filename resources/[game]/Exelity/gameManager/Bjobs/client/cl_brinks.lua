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

openbrinksF6 = function()
    local mainMenu = RageUI.CreateMenu("", "Interaction")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while mainMenu do
        RageUI.IsVisible(mainMenu, function()

            RageUI.Separator("↓ Gestion Anonces ~s~ ↓")
            RageUI.Button("Annonce", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    OpenbrinksAnnouncementMenu()
                end
            })
            RageUI.Separator("↓ Gestion Facture ~s~ ↓")
            RageUI.Button("Faire une ~p~Facture", nil, {RightLabel = ""}, true , {
                onSelected = function()
                    local montant = KeyboardInputbrinks("Montant:", 'Indiquez un montant', '', 7)
                    if tonumber(montant) == nil then
                        ESX.ShowNotification("Montant invalide")
                        return false
                    else
                        amount = (tonumber(montant))
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
							ESX.ShowNotification('~r~Personne autour de vous')
						else
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_brinks', "brinks", amount)
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

function OpenbrinksAnnouncementMenu()
    local annonce = KeyboardInput("Entrez votre annonce", "", 100)
    if annonce and annonce ~= "" then
        TriggerServerEvent('brinks:annonce', annonce)
    end
end

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-9.426456, -685.5989, 33.27906)
    SetBlipSprite(blip, 67)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.7)
    SetBlipColour(blip, 2)
    SetBlipAsShortRange(blip, true)
  
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('[Public] brinks')
    EndTextCommandSetBlipName(blip)

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    while true do
        local interval = 500
        local coords = GetEntityCoords(PlayerPedId())
        if ESX.PlayerData.job.name == 'brinks' then
            for k, v in pairs(Config.Jobs.Brinks.SortirVehicle) do
                if #(coords - v.pos) <= 10 then
                    interval = 1
                    DrawMarker(Config.Get.Marker.Type, v.pos.x, v.pos.y, v.pos.z, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                    if #(coords - v.pos) <= 3 then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu")
                        if IsControlJustPressed(0, 51) then
                            openSortirVehicle()
                        end
                    end
                end
            end
            for k, v in pairs(Config.Jobs.Brinks.DeleteVehicle) do
                if #(coords - v.pos) <= 10 then
                    interval = 1
                    DrawMarker(Config.Get.Marker.Type, v.pos.x, v.pos.y, v.pos.z, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                    if #(coords - v.pos) <= 3 then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
                        if IsControlJustPressed(0, 51) then
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                    end
                end
            end
            for k, v in pairs(Config.Jobs.Brinks.Armurerie) do
                if #(coords - v.pos) <= 10 then
                    interval = 1
                    DrawMarker(Config.Get.Marker.Type, v.pos.x, v.pos.y, v.pos.z, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                    if #(coords - v.pos) <= 3 then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu")
                        if IsControlJustPressed(0, 51) then
                            OpenbrinksArmurerie()
                        end
                    end
                end
            end
        end
        Citizen.Wait(interval)
    end
end)


OpenbrinksArmurerie = function()
    local mainMenu = RageUI.CreateMenu("", "Achetez vos équipements")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    FreezeEntityPosition(PlayerPedId(), true)

    while mainMenu do
        RageUI.IsVisible(mainMenu, function()
            for k,v in pairs(Config.Jobs.Brinks.Items) do
                RageUI.Button(v.label, nil, {RightLabel = ""}, true, {
                    onSelected = function()
                        TriggerServerEvent('brinks:payWeapon', v.price, v.weapon)
                    end
                })
            end
        end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            FreezeEntityPosition(PlayerPedId(), false)
        end
        Citizen.Wait(0)
    end
end


openSortirVehicle = function()
    local mainMenu = RageUI.CreateMenu("", "Sortir un véhicule")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    FreezeEntityPosition(PlayerPedId(), true)

    while mainMenu do
        RageUI.IsVisible(mainMenu, function()
            for k,v in pairs(Config.Jobs.Brinks.ListeVehicle) do
                if ESX.PlayerData.job.grade >= v.grade then
                    RageUI.Button(v.label, nil, {RightLabel = ""}, true, {
                        onSelected = function()
                            ESX.Game.SpawnVehicle(v.model, Config.Jobs.Brinks.PosSortirVehicule, Config.Jobs.Brinks.HeadingSortirVehicule, function(vehicle)
                                TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                RageUI.CloseAll()
                            end)
                        end
                    })
                end
            end
        end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            FreezeEntityPosition(PlayerPedId(), false)
        end
        Citizen.Wait(0)
    end
end

local IsInPVP = false;

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register('F6','InteractionsJobbrinks', "Menu job brinks", function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'brinks' then

        if (not IsInPVP) then
            openbrinksF6()
        end

    end
end)
