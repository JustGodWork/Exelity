local drugs = {}
local cooldown = false
local RecompenceVIP = 10

local function help(str)
    AddTextEntry("DRUGS", str)
    DisplayHelpTextThisFrame("DRUGS", 0)
end

local function onInteract()
    cooldown = true
    Citizen.SetTimeout(2200, function() cooldown = false end);
end

function StartHarvestAnim()
    FreezeEntityPosition(PlayerPedId(), true)
    RequestAnimDict("anim@mp_snowball")
    while (not HasAnimDictLoaded("anim@mp_snowball")) do Citizen.Wait(0) end
    TaskPlayAnim(PlayerPedId(),"anim@mp_snowball","pickup_snowball",1.0,-1.0, 5000, 0, 1, true, true, true)
    ESX.ShowNotification("Récolte en cours")
    Wait(2000)
    FreezeEntityPosition(PlayerPedId(), false)
end

function StartTransformAnim()
    FreezeEntityPosition(PlayerPedId(), true)
    ESX.ShowNotification("Traitement en cours")
    Wait(2000)
    FreezeEntityPosition(PlayerPedId(), false)
end

function StartSellAnim()
    FreezeEntityPosition(PlayerPedId(), true)
    ESX.ShowNotification("Vente en cours")
    Wait(2000)
    FreezeEntityPosition(PlayerPedId(), false)
end

function updateDrugs(infos)
    drugs = infos
end

function startMakerLoop()
    local interval = 1
    Citizen.CreateThread(function()
        while true do
            local pCords = GetEntityCoords(PlayerPedId())
            local closeToMarker = false
            for drugID, drugInfos in pairs(drugs) do
                local type = "Harvest"
                local distance = GetDistanceBetweenCoords(drugInfos.harvest.x, drugInfos.harvest.y, drugInfos.harvest.z, pCords, true)
                if distance <= 5.0 then
                    closeToMarker = true
                    --DrawMarker(22, drugInfos.harvest.x, drugInfos.harvest.y, drugInfos.harvest.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255,0,0, 255, 55555, false, true, 2, false, false, false, false)
                    if distance <= 5.0 then
                        help("Appuyez sur ~INPUT_CONTEXT~ pour récolter ~p~"..drugInfos.name)
                        if IsControlJustPressed(0, 51) then
                            if not cooldown then
                                onInteract()
                                StartHarvestAnim()
                                TriggerServerEvent("exedrugs_on"..type, drugID)
                            end
                        end
                    end
                end

                type = "Transform"
                distance = GetDistanceBetweenCoords(drugInfos.treatement.x, drugInfos.treatement.y, drugInfos.treatement.z, pCords, true)
                if distance <= 5.0 then
                    closeToMarker = true
                    --DrawMarker(22, drugInfos.treatement.x, drugInfos.treatement.y, drugInfos.treatement.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255,0,0, 255, 55555, false, true, 2, false, false, false, false)
                    if distance <= 5.0 then
                        help("Appuyez sur ~INPUT_CONTEXT~ pour traiter ~p~"..drugInfos.name)
                        if IsControlJustPressed(0, 51) then
                            if not cooldown then
                                onInteract()
                                StartTransformAnim()
                                TriggerServerEvent("exedrugs_on"..type, drugID)
                            end
                        end
                    end
                end

                type = "Sell"
                distance = GetDistanceBetweenCoords(drugInfos.vendor.x, drugInfos.vendor.y, drugInfos.vendor.z, pCords, true)
                if distance <= 5.0 and drugInfos.sale ~= 1 then
                    closeToMarker = true
                    --DrawMarker(22, drugInfos.vendor.x, drugInfos.vendor.y, drugInfos.vendor.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255,0,0, 255, 55555, false, true, 2, false, false, false, false)
                    if distance <= 5.0 then
                        help("Appuyez sur ~INPUT_CONTEXT~ pour vendre ~p~"..drugInfos.name)
                        if IsControlJustPressed(0, 51) then
                            if not cooldown then
                                onInteract()
                                StartSellAnim()
                                TriggerServerEvent("exedrugs_on"..type, drugID)
                            end
                        end
                    end
                end
            end
            if closeToMarker then interval = 1 else interval = 500 end
            Wait(interval)
        end
    end)
end