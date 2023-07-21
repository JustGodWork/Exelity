NearestePed = nil
local DejaVenduPed = {}

DispoVente = false

Citizen.CreateThread(function()
    while true do 
        if DispoVente then
            DrawMissionText("~p~Vous êtes a la recherche de client...", 2000)
        else
            break
        end
        Wait(1500)
    end
end)

Citizen.CreateThread(function()
    while ESX == nil do
        Wait(100)
    end
    while true do
        local zone = GetZoneDevant()
        local ped = ESX.Game.GetClosestPed(zone, {})
        local model = GetEntityModel(ped)
        if ped ~= PlayerPedId() and not IsPedAPlayer(ped) and not IsPedInAnyVehicle(ped, 1) and not IsPedDeadOrDying(ped, 1) then
            if model ~= GetHashKey("s_f_y_cop_01") and model ~= GetHashKey("S_M_Y_Casino_01") and model ~= GetHashKey("s_m_m_autoshop_02") and model ~= GetHashKey("S_F_Y_Casino_01") and model ~= GetHashKey("a_f_y_femaleagent") and model ~= GetHashKey("s_m_m_dockwork_01")and model ~= GetHashKey("s_m_y_dockwork_01") and model ~= GetHashKey("s_m_y_dealer_01") and model ~= GetHashKey("s_m_y_robber_01") and model ~= GetHashKey("mp_f_boatstaff_01") and model ~= GetHashKey("s_m_y_construct_01") and model ~= GetHashKey("s_m_m_gardener_01") and model ~= GetHashKey("a_f_y_business_02") and model ~= GetHashKey("s_m_y_cop_01") and model ~= GetHashKey("s_m_m_security_01") and model ~= GetHashKey("a_c_boar") and model ~= GetHashKey("a_c_deer") and model ~= GetHashKey("a_c_dolphin") and model ~= GetHashKey("a_c_fish") and model ~= GetHashKey("a_c_hen") and model ~= GetHashKey("a_c_humpback") and model ~= GetHashKey("a_c_husky") and model ~= GetHashKey("a_c_killerwhale") and model ~= GetHashKey("a_c_mtlion") and model ~= GetHashKey("a_c_pig") and model ~= GetHashKey("a_c_poodle") and model ~= GetHashKey("a_c_pug") and model ~= GetHashKey("a_c_rabbit_01") and model ~= GetHashKey("a_c_rat") and model ~= GetHashKey("a_c_retriever") and model ~= GetHashKey("a_c_rhesus") and model ~= GetHashKey("a_c_rottweiler") and model ~= GetHashKey("a_c_seagull") and model ~= GetHashKey("a_c_sharkhammer") and model ~= GetHashKey("a_c_sharktiger") and model ~= GetHashKey("a_c_shepherd") and model ~= GetHashKey("a_c_stingray") and model ~= GetHashKey("a_c_pigeon") and model ~= GetHashKey("a_c_westy") and model ~= GetHashKey("a_c_cat_01") and model ~= GetHashKey("s_m_m_pilot_02") and model ~= GetHashKey("a_c_chickenhawk") and model ~= GetHashKey("a_c_chimp") and model ~= GetHashKey("a_c_chop") and model ~= GetHashKey("a_c_cormorant") and model ~= GetHashKey("a_c_cow") and model ~= GetHashKey("a_c_coyote") and model ~= GetHashKey("a_c_crow") and model ~= GetHashKey("a_c_rat") and model ~= GetHashKey("mp_m_shopkeep_01") and model ~= GetHashKey("mp_m_weapexp_01") and model ~= GetHashKey("csb_burgerdrug") and model ~= GetHashKey("a_f_m_bevhills_02") and model ~= GetHashKey("s_m_m_doctor_01") and model ~= GetHashKey("a_m_m_eastsa_02") and model ~= GetHashKey("ig_hunter") and model ~= GetHashKey("a_m_y_downtown_01") and model ~= GetHashKey("a_m_m_afriamer_01") and model ~= GetHashKey("a_m_y_vindouche_01") and model ~= GetHashKey("s_m_y_sheriff_01") and model ~= GetHashKey("s_m_m_armoured_01") and model ~= GetHashKey("s_m_m_armoured_02") and model ~= GetHashKey("a_m_y_business_02") and model ~= GetHashKey("a_m_y_vinewood_01") and model ~= GetHashKey("s_m_y_factory_01") and model ~= GetHashKey("g_m_y_salvaboss_01") and model ~= GetHashKey("s_m_m_armoured_01") and model ~= GetHashKey("csb_stripper_01") then -- Blacklist des modèles ici, flème de faire une liste
                local coords = GetEntityCoords(ped, true)
                local distance = ESX.Math.Round(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(), true), coords, true), 0)
                if distance <= 10 and not exports.Exelity:IsInSafeZone() then
                    NearestePed = ped
                else
                    NearestePed = nil
                end
            end
        end
        Citizen.Wait(2500)
    end
end)

Citizen.CreateThread(function()
    while true do
        local count = 0
        local attente = 3000
        for k,v in ipairs(DejaVenduPed) do
            local NetPed = NetworkGetEntityFromNetworkId(v)
            if DoesEntityExist(NetPed) then 
                count = count + 1
                attente = 1000
            end
        end
        if count == 0 then
            DejaVenduPed = {}
            attente = 10000
        end  
        Citizen.Wait(attente)
    end
end)

Citizen.CreateThread(function()
    while ESX == nil do
        Wait(100)
    end
    while true do

        local waitdrogue = 1000
        for k,v in ipairs(DejaVenduPed) do
            local NetPed = NetworkGetEntityFromNetworkId(v)
            if NetPed == NearestePed then 
                NearestePed = nil
            end
        end

        if NearestePed ~= nil then
            if DispoVente == true then
                local ped = NearestePed
                local coords = GetEntityCoords(ped, true)
                local distance = ESX.Math.Round(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(), true), coords, true), 0)
                if distance <= 5.0 then
                    waitdrogue = 1
                    if distance >= 3.0 then
                        DrawMarker(32, coords.x, coords.y, coords.z+1.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 170, 0, 0, 2, 1, nil, nil, 0)
                    else
                        DrawMarker(32, coords.x, coords.y, coords.z+1.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 0, 2, 1, nil, nil, 0)
                        ESX.ShowHelpNotification('Appuie sur ~INPUT_CONTEXT~ pour intéragir')
                        if IsControlJustReleased(1, 51) then
                            local PedNetId = NetworkGetNetworkIdFromEntity(ped)
                            OpenNpcMenu(PedNetId)
                        end
                    end
                else
                    NearestePed = nil
                end
            end
        end
        Citizen.Wait(waitdrogue)
    end
end)

function GetZoneDevant()
    local backwardPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)
	return backwardPosition
end

function VenteWeed(npc)
    local ped = NetworkGetEntityFromNetworkId(npc)
    FreezeEntityPosition(ped, true)
    local random = math.random(1,10)

    if random <= 8 then
        local heading = GetEntityHeading(ped)
        local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.14, 0.0)

        
        SetEntityHeading(PlayerPedId(), heading - 180.1)
        SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)
        Wait(300)
        while not HasAnimDictLoaded("mp_common") do
            RequestAnimDict("mp_common")
            Citizen.Wait(1)
        end
        TriggerServerEvent('NPC:VenteDrugs', 'Weed')
        TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
        TaskPlayAnim(ped, "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
        Wait(4500)
        FreezeEntityPosition(ped, false)
    
        local NetId = NetworkGetNetworkIdFromEntity(ped)
        table.insert(DejaVenduPed, NetId)
        NearestePed = nil
    else
        FreezeEntityPosition(ped, false)
        ESX.ShowNotification("Non merci, Sa ne m'interesse pas !")
        TaskCombatPed(ped, PlayerPedId(), 0, 16)

        local chance = math.random(0, 10)
        local coords = GetEntityCoords(PlayerPedId(), true)

        local NetId = NetworkGetNetworkIdFromEntity(ped)
        table.insert(DejaVenduPed, NetId)
        NearestePed = nil

        if 7 < chance then
            local coords = GetEntityCoords(PlayerPedId(), true)
            TriggerServerEvent("NPCVente:AppelLSPD", coords)
        end
    end
end

function VenteOpium(npc)
    local ped = NetworkGetEntityFromNetworkId(npc)
    FreezeEntityPosition(ped, true)
    local random = math.random(1,10)

    if random <= 8 then
        local pochonBuy = math.random(1,10)
        local heading = GetEntityHeading(ped)
        local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.14, 0.0)

        
        SetEntityHeading(PlayerPedId(), heading - 180.1)
        SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)
        Wait(300)
        while not HasAnimDictLoaded("mp_common") do
            RequestAnimDict("mp_common")
            Citizen.Wait(1)
        end
        TriggerServerEvent('NPC:VenteDrugs', 'Opium')
        TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
        TaskPlayAnim(ped, "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
        Wait(4500)
        FreezeEntityPosition(ped, false)
    
        local NetId = NetworkGetNetworkIdFromEntity(ped)
        table.insert(DejaVenduPed, NetId)
        NearestePed = nil
    else
        FreezeEntityPosition(ped, false)
        ESX.ShowNotification("Je ne touche pas a la drogue, Casse toi d'ici ou j'apelle les flics")
        TaskCombatPed(ped, PlayerPedId(), 0, 16)

        local chance = math.random(0, 10)
        local coords = GetEntityCoords(PlayerPedId(), true)

        local NetId = NetworkGetNetworkIdFromEntity(ped)
        table.insert(DejaVenduPed, NetId)
        NearestePed = nil

        if 7 < chance then
            local coords = GetEntityCoords(PlayerPedId(), true)
            TriggerServerEvent("NPCVente:AppelLSPD", coords)
        end
    end
end

function VentePochon(npc)
    local ped = NetworkGetEntityFromNetworkId(npc)
    FreezeEntityPosition(ped, true)
    local random = math.random(1,10)

    if random <= 8 then
        local pochonBuy = math.random(1,10)
        local heading = GetEntityHeading(ped)
        local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.14, 0.0)

        
        SetEntityHeading(PlayerPedId(), heading - 180.1)
        SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)
        Wait(300)
        while not HasAnimDictLoaded("mp_common") do
            RequestAnimDict("mp_common")
            Citizen.Wait(1)
        end
        TriggerServerEvent('NPC:VenteDrugs', 'Meth')
        TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
        TaskPlayAnim(ped, "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
        Wait(4500)
        FreezeEntityPosition(ped, false)
    
        local NetId = NetworkGetNetworkIdFromEntity(ped)
        table.insert(DejaVenduPed, NetId)
        NearestePed = nil
    else
        FreezeEntityPosition(ped, false)
        ESX.ShowNotification("Je ne touche pas a la drogue, Casse toi d'ici ou j'apelle les flics")
        TaskCombatPed(ped, PlayerPedId(), 0, 16)

        local chance = math.random(0, 10)
        local coords = GetEntityCoords(PlayerPedId(), true)

        local NetId = NetworkGetNetworkIdFromEntity(ped)
        table.insert(DejaVenduPed, NetId)
        NearestePed = nil

        if 7 < chance then
            local coords = GetEntityCoords(PlayerPedId(), true)
            TriggerServerEvent("NPCVente:AppelLSPD", coords)
        end
    end
end

function VenteCoke(npc)
    local ped = NetworkGetEntityFromNetworkId(npc)
    FreezeEntityPosition(ped, true)
    local random = math.random(1,10)

    if random <= 6 then
        local cokeBuy = math.random(1,15)
        local heading = GetEntityHeading(ped)
        local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.14, 0.0)

        
        SetEntityHeading(PlayerPedId(), heading - 180.1)
        SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)
        Wait(300)
        while not HasAnimDictLoaded("mp_common") do
            RequestAnimDict("mp_common")
            Citizen.Wait(1)
        end
        TriggerServerEvent('NPC:VenteDrugs', 'Coke')
        TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
        TaskPlayAnim(ped, "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
        Wait(4500)
        FreezeEntityPosition(ped, false)

        local NetId = NetworkGetNetworkIdFromEntity(ped)
        table.insert(DejaVenduPed, NetId)
        NearestePed = nil
    else
        FreezeEntityPosition(ped, false)
        ESX.ShowNotification("Non merci, Sa ne m'interesse pas !")
        TaskCombatPed(ped, PlayerPedId(), 0, 16)
        
        local chance = math.random(0, 10)
        local coords = GetEntityCoords(PlayerPedId(), true)

        local NetId = NetworkGetNetworkIdFromEntity(ped)
        table.insert(DejaVenduPed, NetId)
        NearestePed = nil

        if 7 < chance then
            local coords = GetEntityCoords(PlayerPedId(), true)
            TriggerServerEvent("NPCVente:AppelLSPD", coords)
        end
    end
end

function VenteCLSD(npc)
    local ped = NetworkGetEntityFromNetworkId(npc)
    FreezeEntityPosition(ped, true)
    local random = math.random(1,10)

    if random <= 6 then
        local lsdBuy = math.random(1,15)
        local heading = GetEntityHeading(ped)
        local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.14, 0.0)

        
        SetEntityHeading(PlayerPedId(), heading - 180.1)
        SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, 0)
        Wait(300)
        while not HasAnimDictLoaded("mp_common") do
            RequestAnimDict("mp_common")
            Citizen.Wait(1)
        end
        TriggerServerEvent('NPC:VenteDrugs', 'Lsd')
        TaskPlayAnim(PlayerPedId(), "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
        TaskPlayAnim(ped, "mp_common", "givetake1_a", 2.0, 2.0, -1, 0, 0, false, false, false)
        Wait(4500)
        FreezeEntityPosition(ped, false)

        local NetId = NetworkGetNetworkIdFromEntity(ped)
        table.insert(DejaVenduPed, NetId)
        NearestePed = nil
    else
        FreezeEntityPosition(ped, false)
        ESX.ShowNotification("Non merci, Sa ne m'interesse pas !")
        TaskCombatPed(ped, PlayerPedId(), 0, 16)
        
        local chance = math.random(0, 10)
        local coords = GetEntityCoords(PlayerPedId(), true)

        local NetId = NetworkGetNetworkIdFromEntity(ped)
        table.insert(DejaVenduPed, NetId)
        NearestePed = nil

        if 7 < chance then
            local coords = GetEntityCoords(PlayerPedId(), true)
            TriggerServerEvent("NPCVente:AppelLSPD", coords)
        end
    end
end

RegisterNetEvent("NPCVente:AffichageAppel", function(coords)
    -- PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
    -- PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
    ESX.ShowAdvancedNotification("LSPD CENTRAL", "~p~Vente de drogue", "Des citoyens ont vu des gens vendre de la drogue.", "CHAR_CHAT_CALL", 8)

    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, 51)
    SetBlipScale(blip, 0.85)
    SetBlipColour(blip, 47)
    SetBlipShrink(blip, true)

    local blipZone = AddBlipForCoord(coords)
    SetBlipSprite(blipZone, 161)
    SetBlipScale(blipZone, 3.0)
    SetBlipColour(blipZone, 8)
    SetBlipShrink(blipZone, true)


    Wait(1000)
    -- PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
    -- PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)

    Citizen.Wait(60*1000)
    RemoveBlip(blip)
    RemoveBlip(blipZone)
end)

function openVenteDrogue(npc)
	local menu = RageUI.CreateMenu("", "Vente de drogue en cours...")

    RageUI.Visible(menu, not RageUI.Visible(menu))

	while menu do
		Citizen.Wait(5)
        RageUI.IsVisible(menu, function()
            RageUI.Button('Vendre de la Weed', nil, {}, true, {onSelected = function()
                RageUI.CloseAll()
                VenteWeed(npc)
            end});
            RageUI.Button('Vendre de la cocaÎne', nil, {}, true, {onSelected = function()
                RageUI.CloseAll()
                VenteCoke(npc)
            end});
            RageUI.Button('Vendre de la méthamphétamine', nil, {}, true, {onSelected = function()
                RageUI.CloseAll()
                VentePochon(npc)
            end});
            RageUI.Button('Vendre de l\'opium', nil, {}, true, {onSelected = function()
                RageUI.CloseAll()
                VenteOpium(npc)
            end});
            RageUI.Button('Vendre de la LSD', nil, {}, true, {onSelected = function()
                RageUI.CloseAll()
                VenteCLSD(npc)
            end});
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

local TargetNpc = nil
local count = 0

function OpenNpcMenu(npc)
    openVenteDrogue(npc)
    Wait(100)
    PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
    local ped = NetworkGetEntityFromNetworkId(npc)
    TaskTurnPedToFaceEntity(ped, PlayerPedId(), 5000)
    TargetNpc = npc
end

function DrawMissionText(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end

RegisterCommand('ventedrogue', function(sourec, args, rawCommand)

    droguezeubi = not droguezeubi

    if droguezeubi then

        DispoVente = true

        ESX.ShowNotification("Vous avez activé la vente de drogue")

    else

        DispoVente = false

        ESX.ShowNotification("Vous avez désactivé la vente de drogue")
        
    end
    
end)