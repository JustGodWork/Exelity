ESX = nil
object = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)
        Citizen.Wait(10)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

RegisterNetEvent('Menu-Props:SpawnObject')
AddEventHandler('Menu-Props:SpawnObject', function(model)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local forwardVector = GetEntityForwardVector(playerPed)
    local x, y, z = table.unpack(coords + forwardVector * 1.0)

    ESX.TriggerServerCallback('Menu-Props:SpawnObject', function()
        ESX.Game.SpawnObject(model, {x = x, y = y, z = z}, function(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(obj)
            SetModelAsNoLongerNeeded(model)
            SetEntityAsMissionEntity(obj, true, true)
            table.insert(object, NetworkGetNetworkIdFromEntity(obj))
        end)
    end, model)
end)

function SpawnObj(model)
    ESX.TriggerServerCallback('Menu-Props:SpawnObject', function()
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local forwardVector = GetEntityForwardVector(playerPed)
        local x, y, z = table.unpack(coords + forwardVector * 1.0)

        ESX.Game.SpawnObject(model, {x = x, y = y, z = z}, function(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(obj)
            SetModelAsNoLongerNeeded(model)
            SetEntityAsMissionEntity(obj, true, true)
            table.insert(object, NetworkGetNetworkIdFromEntity(obj))
        end)
    end, model)
end

function MenuProps()
    local MenuProps = RageUIjh.CreateMenu(nil, "~b~Menu des différents Props.")
    local PropsSup = RageUIjh.CreateSubMenu(MenuProps, "", "Menu Supprésions Props")

    RageUIjh.Visible(MenuProps, not RageUIjh.Visible(MenuProps))
    while MenuProps do
        Citizen.Wait(0)

        RageUIjh.IsVisible(MenuProps, true, true, true, function()
            local coords = GetEntityCoords(PlayerPedId())

            RageUIjh.Separator("↓ Menu Props ↓")

            RageUIjh.ButtonWithStyle("Supprésions Props", 'Liste des objets déjà spawn', {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
            end, PropsSup)

            RageUIjh.ButtonWithStyle("Personnalisée", 'Fait spawn un objet de ton choix', {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
                if Selected then
                    local personalise = KeyboardInput("Quelle Props ?", '' , '', 8)
                    SpawnObj(personalise)
                    ESX.ShowNotification('Vous avez fait spawn un props : ' .. personalise)
                end
            end)

            RageUIjh.Separator('')
            RageUIjh.Separator('↓ Props Définit ↓')
            RageUIjh.Separator('')

            for _, v in pairs(Config.Props) do
                RageUIjh.ButtonWithStyle(v.nameprops, nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if Selected then
                        local timer = 1500
                        local _src = source
                        SpawnObj(v.modelprops)
                        local nameprops = v.nameprops
                        ExecuteCommand("e pickup")
                        FreezeEntityPosition(PlayerPedId(), true)
                        Wait(timer)
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), false)
                        ESX.ShowNotification('Vous avez fait spawn : ' .. nameprops)
                    end
                end)
            end

        end, function() 
        end)

        RageUIjh.IsVisible(PropsSup, true, true, true, function()
            for k, v in pairs(object) do
                if GoodName(GetEntityModel(NetworkGetEntityFromNetworkId(v))) == 0 then
                    table.remove(object, k)
                end
                RageUIjh.ButtonWithStyle("Object: "..GoodName(GetEntityModel(NetworkGetEntityFromNetworkId(v))).." ["..v.."]", nil, {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
                    if Active then
                        local entity = NetworkGetEntityFromNetworkId(v)
                        local ObjCoords = GetEntityCoords(entity)
                        DrawMarker(0, ObjCoords.x, ObjCoords.y, ObjCoords.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 1, 0, 2, 1, nil, nil, 0)
                    end
                    if Selected then
                        RemoveObj(v, k)
                    end
                end)
            end
        end, function()
        end)

        if not RageUIjh.Visible(MenuProps) and not RageUIjh.Visible(PropsSup) then
            MenuProps = RMenu:DeleteType("", true)
        end
    end
end

RegisterCommand('props', function(source, args, rawCommand)
    ESX.TriggerServerCallback("Menu-Props:getUsergroup", function(group)
        if Restrein then
            if (group) == Group.Authorize1 or (group) == Group.Authorize2 or (group) == Group.Authorize3 or (group) == Group.Authorize4 or (group) == Group.Authorize5 then
                MenuProps()
            end
        else
            if ActiveMenu then
                MenuProps()
            end
        end
    end)
end, false)
