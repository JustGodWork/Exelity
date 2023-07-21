CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(500)
    end
end)
DoScreenFadeIn(500)

local selected = nil;
local lockmenu = true
local quittest = false 
local blabla = true
local VehicleJournalier = {}

local IsInPVP = false;

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register("f1", "menuboutique", "Menu Boutique", function()

    if (IsInPVP) then return; end
    PlaySoundFrontend(-1, 'ATM_WINDOW', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 1) 
    OpenMenuMain()
end);

local ExelityCoins = 0
local LastVeh = nil
local LastLastVeh = nil
local lastPos = nil
local rot = nil
local index = {
    list = 1
}

local Button = 1

local Action = {
    'Visualiser',
    'Acheter'
 }

local ActionNN = {
   'Visualiser',
   'Essayer',
   'Acheter'
}

CreateThread(function()
    Wait(2500)
    TriggerServerEvent('ewen:getFivemID')
end)

RegisterNetEvent('ewen:ReceiveFivemId', function(ReceiveInfo)
    fivemid = ReceiveInfo
end)

RegisterNetEvent("hello:bro", function()
    ESX.TriggerServerCallback('ewen:getPoints', function(result)
        ExelityCoins = result
    end)    
end)

local VehicleSpawned = {}


function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

function OpenMenuMain()
    local menu = RageUI.CreateMenu("Boutique Exelity", "Bienvenue sur notre boutique")
    -- local vehicles = RageUI.CreateSubMenu(menu, "Boutique Exelity", "Bienvenue sur notre boutique")
    local voitures = RageUI.CreateSubMenu(menu, "Boutique Exelity", "Bienvenue sur notre boutique")
    -- local avionhelico = RageUI.CreateSubMenu(menu, "Boutique Exelity", "Bienvenue sur notre boutique")
    -- local bateaux = RageUI.CreateSubMenu(menu, "Boutique Exelity", "Bienvenue sur notre boutique")
    local PacksMenu = RageUI.CreateSubMenu(menu, "Boutique Exelity", "Bienvenue sur notre boutique")
    -- local ArmesMenu = RageUI.CreateSubMenu(menu, "Boutique Exelity", "Bienvenue sur notre boutique")
    -- local ArmesShopMenu = RageUI.CreateSubMenu(menu, "Boutique Exelity", "Bienvenue sur notre boutique")
    local CustomArmesShopMenu = RageUI.CreateSubMenu(menu, "Boutique Exelity", "Bienvenue sur notre boutique")
    local CaseMenu = RageUI.CreateSubMenu(menu, "Boutique Exelity", "Bienvenue sur notre boutique")
    local VipMenu = RageUI.CreateSubMenu(menu, "Boutique Exelity", "Bienvenue sur notre boutique")
    CustomArmesShopMenu.onIndexChange = function(index)
        if (selected ~= nil) then
            GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(selected.name), selected.components[index].hash)
            if (selected.components[index - 1] ~= nil) and (selected.components[index - 1].hash ~= nil) then
                RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(selected.name), selected.components[index - 1].hash)
            end
            if (index == 1) then
                RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(selected.name), selected.components[#selected.components].hash)
            end
        end
    end
    CustomArmesShopMenu.Closed = function() 
        TriggerEvent('esx:restoreLoadout')
    end
    voitures.Closed = function() 
        if not blabla then 
            quittest = true
        end 
        DoScreenFadeOut(500)
        Wait(1000)
        lockmenu = true
        DeleteEntity(LastVeh)
        DeleteEntity(LastLastVeh)
        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityVisible(PlayerPedId(), true, 0)
        SetEntityCoords(PlayerPedId(), lastPos)
        SetFollowPedCamViewMode(1)
        for k,v in pairs(VehicleSpawned) do 
            if DoesEntityExist(v.model) then
                Wait(150)
                DeleteEntity(v.model)
                table.remove(VehicleSpawned, k)
            end
        end
        TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
        DoScreenFadeIn(500)   
    end
    -- avionhelico.Closed = function() 
    --     DeleteEntity(LastVeh)
    --     DeleteEntity(LastLastVeh)
    --     FreezeEntityPosition(PlayerPedId(), false)
    --     SetEntityVisible(PlayerPedId(), true, 0)
    --     SetEntityCoords(PlayerPedId(), lastPos)
    --     SetFollowPedCamViewMode(1)
    --     for k,v in pairs(VehicleSpawned) do 
    --         if DoesEntityExist(v.model) then
    --             Wait(150)
    --             DeleteEntity(v.model)
    --             table.remove(VehicleSpawned, k)
    --         end
    --     end
    --     TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
    -- end
    -- bateaux.Closed = function() 
    --     DeleteEntity(LastVeh)
    --     DeleteEntity(LastLastVeh)
    --     FreezeEntityPosition(PlayerPedId(), false)
    --     SetEntityVisible(PlayerPedId(), true, 0)
    --     SetEntityCoords(PlayerPedId(), lastPos)
    --     SetFollowPedCamViewMode(1)
    --     for k,v in pairs(VehicleSpawned) do 
    --         if DoesEntityExist(v.model) then
    --             Wait(150)
    --             DeleteEntity(v.model)
    --             table.remove(VehicleSpawned, k)
    --         end
    --     end
    --     TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
    -- end
    ESX.TriggerServerCallback('ewen:getPoints', function(result)
        ExelityCoins = result
    end)
    RageUI.Visible(menu, not RageUI.Visible(menu))
    while menu ~= nil do
        RageUI.IsVisible(menu, function()
            if fivemid == nil then 
                fivemid = 'Aucun'
            end
            RageUI.Separator('Code Boutique : ~p~'..fivemid)
            RageUI.Separator('ExelityCoins : ~p~'..ExelityCoins)
            RageUI.Button('~p~→ ~s~Accéder au site web', nil, {}, true, {
                onActive = function()
                    RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins..""}, {})
                    end,
                onSelected = function()
                    SendNUIMessage({
                        action = 'openLink',
                        url = 'https://boutique.exelity.net/'
                    })
                end
            })
            RageUI.Button('~p~→ ~s~Historique', nil, {}, true, {
                onActive = function()
                    RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins..""}, {})
                    end,
                onSelected = function()
                    RageUI.CloseAll()
                    OpenHistoryMenu()
                end
            })
            RageUI.Separator('~p~↓ Nos catégories ↓')
            if exports.Exelity:IsInSafeZone() and not exports.Exelity:IsInMenotte() and not exports.Exelity:IsInPorter() and not exports.Exelity:IsInOtage() then
                RageUI.Button('~p~→ ~s~Véhicules', nil, {}, true, {
                    onActive = function()
                        RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins..""}, {})
                        end,
                        onSelected = function()
                            DoScreenFadeOut(500)
                            Wait(1000)
                            lastPos = GetEntityCoords(PlayerPedId())
                            rot = 1.0
                            SetEntityCoords(PlayerPedId(), vector3(-74.9472, -812.6113, 325.1751))
                            SetEntityHeading(PlayerPedId(), 184.531)
                            TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', true)             
                            DoScreenFadeIn(500)           
                        end
                    }, voitures)
            else
                RageUI.Button('~p~→ ~s~Véhicules', nil, {RightBadge = RageUI.BadgeStyle.Lock}, true, {
                    onActive = function()
                        RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins..""}, {})
                        end,
                        onSelected = function()
                            ESX.ShowNotification('Vous devez être en Zone Safe pour acceder à cette catégorie')
                        end
                    })
            end
                RageUI.Button("~p~→ ~s~Customisation d'armes", nil, {}, true, {
                    onActive = function()
                        RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins..""}, {})
                        end,
                    onSelected = function()
                        
                    end
                }, CustomArmesShopMenu)
            RageUI.Button('~p~→ ~s~Packs', nil, {}, true, {
                onActive = function()
                    RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins..""}, {})
                    end,
                onSelected = function()
                    
                end
            }, PacksMenu)
            RageUI.Button('~p~→ ~s~Caisse Mystère', nil, {}, true, {
                onActive = function()
                    RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins..""}, {})
                    end,
                onSelected = function()
                    
                end
            }, CaseMenu)
            RageUI.Button("~p~→ ~s~VIP", nil, {}, true, {
                onActive = function()
                    RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins..""}, {})
                    end,
                onSelected = function()
                    
                end
            }, VipMenu)
        end)
        -- RageUI.IsVisible(vehicles, function()
        --     RageUI.Button('Voitures', nil, {}, true, {
        --         onSelected = function()
        --             lastPos = GetEntityCoords(PlayerPedId())
        --             rot = 1.0
        --             SetEntityCoords(PlayerPedId(), vector3(-74.9472, -812.6113, 325.1751))
        --             SetEntityHeading(PlayerPedId(), 184.531)
        --             TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', true)
        --         end
        --     }, voitures)
        --    RageUI.Button('Avion/Hélicoptère', nil, {}, true, {
        --        onSelected = function()
        --            lastPos = GetEntityCoords(PlayerPedId())
        --            rot = 1.0
        --            SetEntityCoords(PlayerPedId(), vector3(-964.772, -2988.266, 13.945))
        --            SetEntityHeading(PlayerPedId(), 150.864)
        --            TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', true)
        --        end
        --    }, avionhelico)
        --     RageUI.Button('Bateaux', nil, {}, true, {
        --         onSelected = function()
        --             lastPos = GetEntityCoords(PlayerPedId())
        --             rot = 1.0
        --             SetEntityCoords(PlayerPedId(), vector3(530.6523, -3371.662, 5.361))
        --             SetEntityHeading(PlayerPedId(), 282.959)
        --             TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', true)
        --         end
        --     },bateaux)
        -- end)

        RageUI.IsVisible(voitures, function()
            for k,v in pairs(BoutiqueVehicles) do
                RageUI.List(v.label..'', ActionNN, index.list, nil, {}, lockmenu, {
                        onActive = function()
                            RageUI.Info('~p~Boutique Exelity', {'~w~Prix : ~p~'..v.price..' ExelityCoins', "~w~Place(s) : ~p~"..v.place.."", "~w~Vitesse (non custom) : ~p~"..v.speed.." km/h", "~w~Coffre : ~p~"..v.trunk.." kg", }, {})
                            FreezeEntityPosition(PlayerPedId(), true)
                            SetEntityVisible(PlayerPedId(), false, 0)
                            SetWeatherTypeNow('EXTRASUNNY')
                            SetFollowPedCamViewMode(4)
                            if LastVeh ~= nil then
                                rot = rot + 0.10
                                SetEntityHeading(LastVeh, rot)
                            end
                        end,
                        onListChange = function(Index, Item)
                            index.list = Index;
                            Button = Index;
                        end,
                        onSelected = function()
                            if lockmenu then 
                                if Button == 1 then
                                    if not blabla then 
                                        quittest = true
                                    end 
                                    lockmenu = false
                                    SetEntityCoords(PlayerPedId(), vector3(-74.9472, -812.6113, 325.1751))
                                    if ESX.Game.IsSpawnPointClear(vector3(-75.16219, -819.2629, 325.1755), 100) then
                                        ESX.Game.SpawnLocalVehicle(v.model, vector3(-75.16219, -819.2629, 325.1755), 355.858, function(vehicle)
                                            lockmenu = true
                                            LastVeh = vehicle
                                            FreezeEntityPosition(vehicle, true)
                                            SetVehicleDoorsLocked(vehicle, 2)
                                            SetEntityInvincible(vehicle, true)
                                            SetVehicleFixed(vehicle)
                                            SetVehicleDirtLevel(vehicle, 0.0)
                                            SetVehicleEngineOn(vehicle, true, true, true)
                                            SetVehicleLights(vehicle, 2)
                                            SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
                                            SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
                                            table.insert(VehicleSpawned, {model = vehicle})
                                        end)
                                    else
                                        lockmenu = false
                                        DeleteEntity(LastVeh)
                                        DeleteEntity(LastLastVeh)
                                        ESX.Game.SpawnLocalVehicle(v.model, vector3(-75.16219, -819.2629, 325.1755), 355.858, function(vehicle)
                                            lockmenu = true
                                            LastVeh = vehicle
                                            FreezeEntityPosition(vehicle, true)
                                            SetVehicleDoorsLocked(vehicle, 2)
                                            SetEntityInvincible(vehicle, true)
                                            SetVehicleFixed(vehicle)
                                            SetVehicleDirtLevel(vehicle, 0.0)
                                            SetVehicleEngineOn(vehicle, true, true, true)
                                            SetVehicleLights(vehicle, 2)
                                            SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
                                            SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
                                            table.insert(VehicleSpawned, {model = vehicle})
                                        end)
                                    end
                                elseif Button == 2 then
                                    if LastLastVeh == nil then
                                        lockmenu = false
                                        blabla = false
                                        if not blabla then 
                                            quittest = false
                                        end 
                                        DoScreenFadeOut(500)
                                        Wait(1000)
                                        ESX.ShowNotification('Vous disposez de 30s pour votre test !')
                                        FreezeEntityPosition(PlayerPedId(), false)
                                        SetEntityVisible(PlayerPedId(), true, 0)
                                        SetFollowPedCamViewMode(1)
                                        SetEntityCoords(PlayerPedId(), -871.19, -3220.34, 13.94)
                                        DeleteEntity(LastVeh)
                                        DeleteEntity(LastLastVeh)
                                        ESX.Game.SpawnLocalVehicle(v.model, vector3(-871.19, -3220.34, 13.94), 355.858, function(vehicle)
                                            lockmenu = true
                                            LastLastVeh = vehicle
                                            SetVehicleDoorsLocked(vehicle, 2)
                                            SetEntityInvincible(vehicle, true)
                                            SetVehicleDirtLevel(vehicle, 0.0)
                                            SetVehicleEngineOn(vehicle, true, true, true)
                                            SetVehicleLights(vehicle, 2)
                                            SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
                                            SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
                                            table.insert(VehicleSpawned, {model = vehicle})
                                            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                        end)
                                        SetTimeout(31000, function()
                                            if not quittest then
                                                lockmenu = false
                                                DoScreenFadeOut(500)
                                                Wait(1000)
                                                DeleteEntity(LastLastVeh)
                                                ESX.ShowNotification('Vous venez de finir votre test de 30s !')
                                                SetEntityCoords(PlayerPedId(), vector3(-74.9472, -812.6113, 325.1751))
                                                ESX.Game.SpawnLocalVehicle(v.model, vector3(-75.16219, -819.2629, 325.1755), 355.858, function(vehicle)
                                                    lockmenu = true
                                                    LastVeh = vehicle
                                                    FreezeEntityPosition(vehicle, true)
                                                    SetVehicleDoorsLocked(vehicle, 2)
                                                    SetEntityInvincible(vehicle, true)
                                                    SetVehicleFixed(vehicle)
                                                    SetVehicleDirtLevel(vehicle, 0.0)
                                                    SetVehicleEngineOn(vehicle, true, true, true)
                                                    SetVehicleLights(vehicle, 2)
                                                    SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
                                                    SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
                                                    table.insert(VehicleSpawned, {model = vehicle})
                                                end)
                                                LastLastVeh = nil
                                                DoScreenFadeIn(500)
                                            end
                                            LastLastVeh = nil
                                            blabla = true
                                            quittest = false
                                        end)
                                        DoScreenFadeIn(500)
                                    else
                                        ESX.ShowNotification('Vous venez de faire un test attendez un peut !')
                                    end
                                elseif Button == 3 then
                                    if not blabla then 
                                        quittest = true
                                    end 
                                    local Confirm = KeyboardInput("Confirmer vous votre achat ?", "Oui / Non", 10)

                                    if Confirm == "Oui" then 
                                        TriggerServerEvent('aBoutique:BuyVehicle', v.model, v.price, v.label)
                                        DeleteEntity(LastVeh)
                                        DeleteEntity(LastLastVeh)
                                        FreezeEntityPosition(PlayerPedId(), false)
                                        SetEntityVisible(PlayerPedId(), true, 0)
                                        SetEntityCoords(PlayerPedId(), lastPos)
                                        SetFollowPedCamViewMode(1)
                                        for k,v in pairs(VehicleSpawned) do 
                                            if DoesEntityExist(v.model) then
                                                Wait(150)
                                                DeleteEntity(v.model)
                                                table.remove(VehicleSpawned, k)
                                            end
                                        end
                                        TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
                                        RageUI.CloseAll()     
                                    else
                                        ESX.ShowNotification('Achat non confirmer.')
                                        DeleteEntity(LastVeh)
                                        DeleteEntity(LastLastVeh)
                                        FreezeEntityPosition(PlayerPedId(), false)
                                        SetEntityVisible(PlayerPedId(), true, 0)
                                        SetEntityCoords(PlayerPedId(), lastPos)
                                        SetFollowPedCamViewMode(1)
                                        for k,v in pairs(VehicleSpawned) do 
                                            if DoesEntityExist(v.model) then
                                                Wait(150)
                                                DeleteEntity(v.model)
                                                table.remove(VehicleSpawned, k)
                                            end
                                        end
                                        TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
                                        RageUI.CloseAll()     
                                    end                     
                                end
                        end
                    end
                })
            end
        end)
        -- RageUI.IsVisible(avionhelico, function()
        --     for k,v in pairs(BoutiqueAirPlaines) do 
        --         RageUI.List(GetLabelText(v.model)..' | Prix : ~p~'..v.price, Action, index.list, nil, {}, true, {
        --             onActive = function()
        --                 FreezeEntityPosition(PlayerPedId(), true)
        --                 SetEntityVisible(PlayerPedId(), false, 0)
        --                 SetWeatherTypeNow('EXTRASUNNY')
        --                 SetFollowPedCamViewMode(4)
        --                 if LastVeh ~= nil then
        --                     rot = rot + 0.10
        --                     SetEntityHeading(LastVeh, rot)
        --                 end
        --             end,
        --             onListChange = function(Index, Item)
        --                 index.list = Index;
        --                 Button = Index;
        --             end,
        --             onSelected = function()
        --                 if Button == 1 then
        --                     if ESX.Game.IsSpawnPointClear(vector3(-970.8639, -2999.831, 13.945), 100) then
        --                         ESX.Game.SpawnLocalVehicle(v.model, vector3(-970.8639, -2999.831, 13.945), 337.120, function(vehicle)
        --                             LastVeh = vehicle
        --                             FreezeEntityPosition(vehicle, true)
        --                             SetVehicleDoorsLocked(vehicle, 2)
        --                             SetEntityInvincible(vehicle, true)
        --                             SetVehicleFixed(vehicle)
        --                             SetVehicleDirtLevel(vehicle, 0.0)
        --                             SetVehicleEngineOn(vehicle, true, true, true)
        --                             SetVehicleLights(vehicle, 2)
        --                             SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
        --                             SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
        --                             table.insert(VehicleSpawned, {model = vehicle})
        --                         end)
        --                     else
        --                         DeleteEntity(LastVeh)
        --                         DeleteEntity(LastLastVeh)
        --                         ESX.Game.SpawnLocalVehicle(v.model, vector3(-970.8639, -2999.831, 13.945), 337.120, function(vehicle)
        --                             LastVeh = vehicle
        --                             FreezeEntityPosition(vehicle, true)
        --                             SetVehicleDoorsLocked(vehicle, 2)
        --                             SetEntityInvincible(vehicle, true)
        --                             SetVehicleFixed(vehicle)
        --                             SetVehicleDirtLevel(vehicle, 0.0)
        --                             SetVehicleEngineOn(vehicle, true, true, true)
        --                             SetVehicleLights(vehicle, 2)
        --                             SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
        --                             SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
        --                             table.insert(VehicleSpawned, {model = vehicle})
        --                         end)
        --                     end
        --                 elseif Button == 2 then
        --                     TriggerServerEvent('aBoutique:BuyVehiclePlane', v.model, GetLabelText(v.model))
        --                     DeleteEntity(LastVeh)
        --                     DeleteEntity(LastLastVeh)
        --                     FreezeEntityPosition(PlayerPedId(), false)
        --                     SetEntityVisible(PlayerPedId(), true, 0)
        --                     SetEntityCoords(PlayerPedId(), lastPos)
        --                     SetFollowPedCamViewMode(1)
        --                     for k,v in pairs(VehicleSpawned) do 
        --                         if DoesEntityExist(v.model) then
        --                             Wait(150)
        --                             DeleteEntity(v.model)
        --                             table.remove(VehicleSpawned, k)
        --                         end
        --                     end
        --                     TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
        --                     RageUI.CloseAll()     
        --                 end
        --             end
        --         })
        --     end
		-- end)

        -- RageUI.IsVisible(bateaux, function()
        --     for k,v in pairs(BoutiqueBoat) do 
        --         RageUI.List(GetLabelText(v.model)..' | Prix : ~p~'..v.price, Action, index.list, nil, {}, true, {
        --             onActive = function()
        --                 FreezeEntityPosition(PlayerPedId(), true)
        --                 SetEntityVisible(PlayerPedId(), false, 0)
        --                 SetWeatherTypeNow('EXTRASUNNY')
        --                 SetFollowPedCamViewMode(4)
        --                 if LastVeh ~= nil then
        --                     rot = rot + 0.10
        --                     SetEntityHeading(LastVeh, rot)
        --                 end
        --             end,
        --             onListChange = function(Index, Item)
        --                 index.list = Index;
        --                 Button = Index;
        --             end,
        --             onSelected = function()
        --                 if Button == 1 then
        --                     if ESX.Game.IsSpawnPointClear(vector3(550.243, -3378.061, 5.843), 100) then
        --                         ESX.Game.SpawnLocalVehicle(v.model, vector3(550.243, -3378.061, 5.843), 282.959, function(vehicle)
        --                             LastVeh = vehicle
        --                             FreezeEntityPosition(vehicle, true)
        --                             SetVehicleDoorsLocked(vehicle, 2)
        --                             SetEntityInvincible(vehicle, true)
        --                             SetVehicleFixed(vehicle)
        --                             SetVehicleDirtLevel(vehicle, 0.0)
        --                             SetVehicleEngineOn(vehicle, true, true, true)
        --                             SetVehicleLights(vehicle, 2)
        --                             SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
        --                             SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
        --                             table.insert(VehicleSpawned, {model = vehicle})
        --                         end)
        --                     else
        --                         DeleteEntity(LastVeh)
        --                         DeleteEntity(LastLastVeh)
        --                         ESX.Game.SpawnLocalVehicle(v.model, vector3(550.243, -3378.061, 5.843), 282.959, function(vehicle)
        --                             LastVeh = vehicle
        --                             FreezeEntityPosition(vehicle, true)
        --                             SetVehicleDoorsLocked(vehicle, 2)
        --                             SetEntityInvincible(vehicle, true)
        --                             SetVehicleFixed(vehicle)
        --                             SetVehicleDirtLevel(vehicle, 0.0)
        --                             SetVehicleEngineOn(vehicle, true, true, true)
        --                             SetVehicleLights(vehicle, 2)
        --                             SetVehicleCustomPrimaryColour(vehicle, 33,33,33)
        --                             SetVehicleCustomSecondaryColour(vehicle, 33,33,33)
        --                             table.insert(VehicleSpawned, {model = vehicle})
        --                         end)
        --                     end
        --                 elseif Button == 2 then
        --                     TriggerServerEvent('aBoutique:BuyVehicleBoat', v.model, GetLabelText(v.model))
        --                     DeleteEntity(LastVeh)
        --                     DeleteEntity(LastLastVeh)
        --                     FreezeEntityPosition(PlayerPedId(), false)
        --                     SetEntityVisible(PlayerPedId(), true, 0)
        --                     SetEntityCoords(PlayerPedId(), lastPos)
        --                     SetFollowPedCamViewMode(1)
        --                     for k,v in pairs(VehicleSpawned) do 
        --                         if DoesEntityExist(v.model) then
        --                             Wait(150)
        --                             DeleteEntity(v.model)
        --                             table.remove(VehicleSpawned, k)
        --                         end
        --                     end
        --                     TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
        --                     RageUI.CloseAll() 
        --                 end
        --             end
        --         })
        --     end
		-- end)
        RageUI.IsVisible(PacksMenu, function() 
            RageUI.Button('Crée ton Organisation', nil, {RightLabel = 3500}, true, {
                onActive = function()
                    RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins.."", "~w~Prix : ~p~3500"}, {})
                end,
                onSelected = function()
                    TriggerServerEvent('aBoutique:Illegal')
                    RageUI.CloseAll()
                end
            })
            RageUI.Button('Crée ton Gang', nil, {RightLabel = 3000}, true, {
                onActive = function()
                    RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins.."", "~w~Prix : ~p~3000"}, {})
                end,
                onSelected = function()
                    TriggerServerEvent('aBoutique:Illegal2')
                    RageUI.CloseAll()
                end
            })
            RageUI.Button('Crée ton Entreprise Farm', nil, {RightLabel = 2000}, true, {
                onActive = function()
                    RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins.."", "~w~Prix : ~p~2000"}, {})
                end,
                onSelected = function()
                    TriggerServerEvent('aBoutique:entreprise')
                    RageUI.CloseAll()
                end
            })
            RageUI.Button('Ajout Véhicule au choix', nil, {RightLabel = 7000}, true, {
                onActive = function()
                    RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins.."", "~w~Prix : ~p~7000"}, {})
                end,
                onSelected = function()
                    TriggerServerEvent('aBoutique:vehunique')
                    RageUI.CloseAll()
                end
            })
            RageUI.Button('Vente d\'arme Illégal', nil, {RightLabel = 25000}, true, {
                onActive = function()
                    RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins.."", "~w~Prix : ~p~25 000"}, {})
                end,
                onSelected = function()
                    TriggerServerEvent('aBoutique:IllegalWeapon')
                    RageUI.CloseAll()
                end
            })
        end)

        -- RageUI.IsVisible(ArmesMenu, function() 
        --     RageUI.Button('Armes', nil, {}, true, {
        --         onSelected = function()

        --         end
        --     }, ArmesShopMenu)
        -- end)
        -- RageUI.IsVisible(ArmesShopMenu, function()
        --     for k,v in pairs(WeaponBoutique) do
        --         RageUI.Button(v.label, v.description, {RightLabel = 'Prix : '.. v.price}, true, {
        --             onActive = function()
        --                 RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins.."", "~w~Arme : ~p~"..v.label.."", "~w~Prix : ~p~"..v.price..""}, {})
        --                 RageUI.RenderWeapons("vehicles", v.name)
        --             end,
        --             onSelected = function()
        --                 TriggerServerEvent('ewen:buyweapon', v.name, v.price, v.label)
        --                 RageUI.CloseAll()
        --             end
        --         })
        --      end
        -- end)

        RageUI.IsVisible(CustomArmesShopMenu, function()
            local sWeapon = GetSelectedPedWeapon(PlayerPedId())
            local weapon = ESX.GetWeaponFromHash(sWeapon)
            if sWeapon ~= GetHashKey("WEAPON_UNARMED") then
                local isPermanent = ESX.IsWeaponPermanent(weapon.name)
                if isPermanent then
                    RageUI.Separator(weapon.label)
                    RageUI.Separator("")
                    if (ESX.Table.SizeOf(weapon) > 0) then
                        for _, v in pairs(weapon.components) do
                            if v.name ~= "luxary_finish" and v.name ~= "clip_default" and v.name ~= "ammo_tracer" and v.name ~= "ammo_incendiary" and v.name ~= "ammo_armor" and v.name ~= "ammo_fmj" and v.name ~= "ammo_explosive" and v.name ~= "ammo_hollowpoint" and v.name ~= "shells_explosive" and v.name ~= "shells_hollowpoint" and v.name ~= "shells_armor" and v.name ~= "shells_incendiary" and v.name ~= "shells_incendiary" then
                                RageUI.Button(v.label, nil, {}, not HasPedGotWeaponComponent(PlayerPedId(), sWeapon, v.hash), {
                                    onActive = function()
                                        if v.name == "clip_extended" then
                                            RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins.."", "~w~Composant : ~p~"..v.label.."", "~w~Prix : ~p~500"}, {})
                                        elseif v.name == "clip_drum" then
                                            RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins.."", "~w~Composant : ~p~"..v.label.."", "~w~Prix : ~p~750"}, {})
                                        elseif v.name == "clip_box" then
                                            RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins.."", "~w~Composant : ~p~"..v.label.."", "~w~Prix : ~p~1000"}, {})
                                        else
                                            RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins.."", "~w~Composant : ~p~"..v.label.."", "~w~Prix : ~p~250"}, {})
                                        end
                                    end,
                                    onSelected = function()
                                        TriggerServerEvent('tebex:on-process-checkout-weapon-custom', weapon.name, GetHashKey(v.name))
                                    end,
                                })
                            end
                        end
                    else
                        RageUI.Separator("Aucune personnalisation disponible")
                    end
                else
                    RageUI.Separator("Aucune personnalisation sur ce type d'arme")
                end
            else
                RageUI.Separator("")
                RageUI.Separator("~r~Vous n'avez pas d'armes en main~s~")
                RageUI.Separator("")
            end
        end)
        RageUI.IsVisible(CaseMenu, function() 
            for k,v in pairs(BoutiqueMysteryBox) do
                if v.model ~= 'caisse_fidelite' then
                    RageUI.List(v.label..' | Prix : ~p~'..v.price, Action, index.list, v.description, {}, true, {
                        onActive = function()
                            RageUI.RenderCaisse("caisse", v.model)
                            RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins..""}, {})
                        end,
                        onListChange = function(Index, Item)
                            index.list = Index;
                            Button = Index;
                        end,
                        onSelected = function()
                            if Button == 1 then
                                OpenMenuPreviewCaisse(v.model, v.label)
                            elseif Button == 2 then
                                RageUI.CloseAll()
                                TriggerServerEvent('Exelity:process_checkout_case', v.model)
                            end
                        end
                    })
                else
                    RageUI.List(v.label..' | Bonus Fidélité', Action, index.list, nil, {}, true, {
                        onActive = function()
                            RageUI.RenderCaisse("caisse", v.model)
                            RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins..""}, {})
                        end,
                        onListChange = function(Index, Item)
                            index.list = Index;
                            Button = Index;
                        end,
                        onSelected = function()
                            if Button == 1 then
                                OpenMenuPreviewCaisse(v.model, v.label)
                            elseif Button == 2 then
                                ESX.ShowNotification('Vous ne povuez pas acheter cette Caisse')
                            end
                        end
                    })
                end
            end
        end)
        RageUI.IsVisible(VipMenu, function() 
            RageUI.Button('VIP ~p~Gold (1 mois)', nil, { RightLabel = 1000}, true, {
                onActive = function()
                RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins.."", "~w~Temps : ~p~1 Mois","~w~VIP : ~p~Gold", "~w~Bonus: ~p~500 ExelityCoins"}, {})
                end,
                onSelected = function()
                    TriggerServerEvent('eBoutique:BuyVIP', "gold")
                end,
            })
            RageUI.Button('VIP ~p~Diamond (1 mois)', nil, { RightLabel = 2000}, true, {
                onActive = function()
                    RageUI.Info('~p~Boutique Exelity', {'~w~Code Boutique : ~p~'..fivemid..'', "~w~ExelityCoins : ~p~"..ExelityCoins.."", "~w~Temps : ~p~1 Mois","~w~VIP : ~p~Diamond", "~w~Bonus: ~p~1000 ExelityCoins"}, {})
                end,
                onSelected = function()
                    TriggerServerEvent('eBoutique:BuyVIP', "diamond")
                end,
            })
        end)
        if not RageUI.Visible(menu) 
        and not RageUI.Visible(vehicles) 
        and not RageUI.Visible(voitures) 
        and not RageUI.Visible(avionhelico) 
        and not RageUI.Visible(bateaux) 
        and not RageUI.Visible(PacksMenu) 
        and not RageUI.Visible(ArmesMenu) 
        and not RageUI.Visible(ArmesShopMenu) 
        and not RageUI.Visible(CustomArmesShopMenu) 
        and not RageUI.Visible(CaseMenu)
        and not RageUI.Visible(VipMenu)
        then
            menu = RMenu:DeleteType('menu', true)
		end
		Wait(0)
    end
end

RegisterNetEvent('aBoutique:BuyCustomMaxClient', function()
    local vehicle = GetVehiclePedIsUsing(PlayerPedId())
    FullCustom(vehicle)
end)

function FullCustom(veh)
	SetVehicleModKit(veh, 0)
	ToggleVehicleMod(veh, 18, true)
	ToggleVehicleMod(veh, 22, true)
	SetVehicleMod(veh, 16, 5, false)
	SetVehicleMod(veh, 12, 2, false)
	SetVehicleMod(veh, 11, 3, false)
	SetVehicleMod(veh, 14, 14, false)
	SetVehicleMod(veh, 15, 3, false)
	SetVehicleMod(veh, 13, 2, false)
	SetVehicleMod(veh, 23, 21, true)
	SetVehicleMod(veh, 0, 1, false)
	SetVehicleMod(veh, 1, 1, false)
	SetVehicleMod(veh, 2, 1, false)
	SetVehicleMod(veh, 3, 1, false)
	SetVehicleMod(veh, 4, 1, false)
	SetVehicleMod(veh, 5, 1, false)
	SetVehicleMod(veh, 6, 1, false)
	SetVehicleMod(veh, 7, 1, false)
	SetVehicleMod(veh, 8, 1, false)
	SetVehicleMod(veh, 9, 1, false)
	SetVehicleMod(veh, 10, 1, false)
	SetVehicleModKit(veh, 0)
	ToggleVehicleMod(veh, 20, true)
	SetVehicleModKit(veh, 0)
	SetVehicleNumberPlateTextIndex(veh, true)
    myCar = ESX.Game.GetVehicleProperties(GetVehiclePedIsIn(PlayerPedId(), false))
	TriggerServerEvent('esx_lscustom:refreshOwnedVehicle', myCar);
end

function OpenMenuPreviewCaisse(model, label)
    local CaissePreview = RageUI.CreateMenu('Boutique Exelity', "Bienvenue sur notre boutique")
    RageUI.Visible(CaissePreview, not RageUI.Visible(CaissePreview))
    while CaissePreview do
        Wait(0)
        RageUI.IsVisible(CaissePreview, function()
            RageUI.Separator('Prévisualisation de la caisse : '..label)
            for k,v in pairs(VisualitionCaisse[model]) do
                if v.rarity == 4 then
                    RageUI.Button(v.label, nil, {RightLabel = '~p~Ultime'}, true, {
                        onActive = function()
                            RageUI.RenderCaissePreview('caissemystere', v.model)
                        end,
                        onSelected = function()
        
                        end
                    })
                end
            end
            for k,v in pairs(VisualitionCaisse[model]) do
                if v.rarity == 3 then
                    RageUI.Button(v.label, nil, {RightLabel = '~y~Légendaire'}, true, {
                        onActive = function()
                            RageUI.RenderCaissePreview('caissemystere', v.model)
                        end,
                        onSelected = function()
        
                        end
                    })
                end
            end
            for k,v in pairs(VisualitionCaisse[model]) do
                if v.rarity == 2 then
                    RageUI.Button(v.label, nil, {RightLabel = '~p~Rare'}, true, {
                        onActive = function()
                            RageUI.RenderCaissePreview('caissemystere', v.model)
                        end,
                        onSelected = function()
        
                        end
                    })
                end
            end
            for k,v in pairs(VisualitionCaisse[model]) do
                if v.rarity == 1 then
                    RageUI.Button(v.label, nil, {RightLabel = '~g~Commun'}, true, {
                        onActive = function()
                            RageUI.RenderCaissePreview('caissemystere', v.model)
                        end,
                        onSelected = function()
        
                        end
                    })
                end
            end
        end, function()
        end)

        if not RageUI.Visible(CaissePreview) then
            CaissePreview = RMenu:DeleteType('BoutiqueSub', true)
            Wait(100)
            OpenMenuMain()
        end
    end
end

-- OPENING CASE

local picture;

local mysterybox = RageUI.CreateMenu("Caisse Mystère", "Bonne chance !")

RegisterNetEvent('ewen:caisseopenclientside')
AddEventHandler('ewen:caisseopenclientside', function(animations, name, message)
    RageUI.Visible(mysterybox, not RageUI.Visible(mysterybox))
    CreateThread(function()
        Wait(250)
        for k, v in pairs(animations) do
            picture = v.name
            RageUI.PlaySound("HUD_FREEMODE_SOUNDSET", "NAV_UP_DOWN")
            if v.time == 5000 then
                RageUI.PlaySound("HUD_AWARDS", "FLIGHT_SCHOOL_LESSON_PASSED")
                ESX.ShowAdvancedNotification('Notification', 'Boutique', message, 'CHAR_Exelity', 6)
                Wait(4000)
            end
            Wait(v.time)
        end
    end)
end)

CreateThread(function()
    while (true) do
        Wait(1.0)

        RageUI.IsVisible(mysterybox, function()
        end, function()
            if (picture) then
                RageUI.CaissePreviewOpen("caissemystere", picture)
            end
        end)


    end
end)

RegisterNetEvent('aBoutique:SendJournaliereBoutique')
AddEventHandler('aBoutique:SendJournaliereBoutique', function(vehicle)
    VehicleJournalier = vehicle
end)

CreateThread(function()
    Wait(1500)
    TriggerServerEvent('aBoutique:RetrieveJournaliereBoutique')
end)

CreateThread(function()
	Wait(2000)
	TriggerServerEvent('ewen:boutiquecashout')
end)