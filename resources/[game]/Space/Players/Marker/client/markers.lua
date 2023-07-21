ESX = nil
CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
		end)
        Citizen.Wait(100)
    end
    while ESX.GetPlayerData().job == nil do ---- Recherche du job du joueurs 
        Citizen.Wait(100)
    end
    ESX.PlayerData = ESX.GetPlayerData()
end)

ZonesListe = {
    ["Jetski"] = {
        Position = vector3(-1596.89 , -1163.28, 1.10),
        Public = true,
        Job = nil, 
        Job2 = nil, 
        Blip = {
            Name = "Location Jetski",
            Sprite = 410,
            Display = 4,
            Scale = 0.6,
            Color = 57
        },
        Action = function()
            MenuJetski()
        end
    },
    ["MenuVeheculesFBI"] = {
        Position = vector3(2544.805, -375.2866, 92.17),---r
        Public = false,
        Job = "fib", 
        Job2 = nil, 
        Blip = nil,
        Action = function()
            MenuVeheculesFBI()
        end
    },
    ["Menucustom"] = {
        Position = vector3(2552.6318359375,-328.79196166992,92.993560791016),---r
        Public = false,
        Job = "fib", 
        Job2 = nil, 
        Blip = nil,
        Action = function()
            Menucustom()
        end
    },
    ["DeleteVehicleFBI"] = {
        Position = vector3(2531.191, -399.0492, 92.09), 
        Public = false,
        Job = "fib", 
        Job2 = nil, 
        Blip = nil,
        Action = function()
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if veh ~= nil then 
                DeleteEntity(veh) 
            end
        end
    },
    ["MenuHelicoFBI"] = {
        Position = vector3(2516.895,-431.9052,118.2334), ---r
        Public = false,
        Job = "fib", 
        Job2 = nil, 
        Blip = nil,
        Action = function()
            MenuHelicoFBI()
        end
    },
    ["DeleteHelicoFBI"] = {
        Position = vector3(2511.3625488281,-341.73077392578,117.4), --
        Public = false,
        Job = "fib", 
        Job2 = nil, 
        Blip = nil,
        Action = function()
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if veh ~= nil then 
                DeleteEntity(veh) 
            end
        end
    },
    ["OpenSocietyChestFBI"] = {
        Position = vector3(2530.175, -337.3638, 101),
        Public = false,
        Job = "fib", 
        Job2 = nil, 
        Blip = nil,
        Action = function()
            ESX.OpenSocietyChest("fib")
        end
    },
    ["MenuWeaponsFBI"] = {
        Position = vector3(2521.207, -336.6898, 101),
        Public = false,
        Job = "fib", 
        Job2 = nil, 
        Blip = nil,
        Action = function()
            MenuWeaponsFBI()
        end
    },
    ["MenuVetementsFBI"] = {
        Position = vector3(2515.05, -344.4951, 101),
        Public = false,
        Job = "fib", 
        Job2 = nil, 
        Blip = nil,
        Action = function()
            MenuVetementsFBI()
        end
    },
    ["OpenSocietyMenuFBI"] = {
        Position = vector3(2514.903, -445.1931, 106.04),
        Public = false,
        Job = "fib",
        Job2 = nil, 
        Blip = nil,
        Action = function()
            if ESX.PlayerData.job.name == "fib" and ESX.PlayerData.job.grade_name == 'boss' then
                ESX.OpenSocietyMenu("fib")
            else
                ESX.ShowNotification("Vous ne disposez pas des clé")
            end
        end
    },
}

CreateThread(function()
    for _,marker in pairs(ZonesListe) do
        if marker.Blip then
            local blip = AddBlipForCoord(marker.Position)

            SetBlipSprite(blip, marker.Blip.Sprite)
            SetBlipScale(blip, marker.Blip.Scale)
            SetBlipColour(blip, marker.Blip.Color)
            SetBlipDisplay(blip, marker.Blip.Display)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(marker.Blip.Name)
            EndTextCommandSetBlipName(blip)
        end
	end
end)

local inZone = false
local inZoneMarker = false

-- local function Threads(coords, Action, Public, Job, Job2)
--     CreateThread(function()
--         while true do
--             if inZone and Public or ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == Job or ESX.PlayerData.job2.name == Job2 then
--                 ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour intéragir")
--                 if IsControlJustPressed(1,51) then
--                     Action(coords)
--                 end
--             else
--                 break
--             end
--             Wait(1)
--         end
--     end)
-- end

-- local function ThreadsMarker(coords, Public, Job, Job2)
--     CreateThread(function()
--         while true do
--             if inZoneMarker and Public or ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == Job or ESX.PlayerData.job2.name == Job2 then
--                 print(inZoneMarker)
--                 DrawMarker(25, coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.55, 0.55, 0.55, 0, 209, 255, 255, false, false, 2, false, false, false, false)
--             else
--                 print(inZoneMarker)
--                 break
--             end
--             Wait(1)
--         end
--     end)
-- end

-- CreateThread(function()
--     local debug = false
--     local zones = {}
--     local zonesMarker = {}
--     for k,v in pairs(ZonesListe) do
--         zones[#zones+1] = CircleZone:Create(vector3(v.Position.x, v.Position.y, v.Position.z), 5, {
--             name = "zones",
--             debugGrid = debug,
--             data = { coords = vector3(v.Position.x, v.Position.y, v.Position.z), Action = v.Action, Public = v.Public, Job = v.Job, Job2 = v.Job2 }
--         })
--         zonesMarker[#zonesMarker+1] = CircleZone:Create(vector3(v.Position.x, v.Position.y, v.Position.z), 15, {
--             name = "marker",
--             debugGrid = debug,
--             data = { coords = vector3(v.Position.x, v.Position.y, v.Position.z-0.95), Public = v.Public, Job = v.Job, Job2 = v.Job2 }
--         })
--     end
--     local comboZones = ComboZone:Create(zones, { name = "zones_combo", debugPoly = debug })
--     comboZones:onPlayerInOut(function(isPointInside, point, zone)
--         if isPointInside then
--             inZone = true
--             Threads(zone.data.coords, zone.data.Action, zone.data.Public, zone.data.Job, zone.data.Job2)
--         else
--             inZone = false
--         end
--     end)
--     -- local comboMarker = ComboZone:Create(zonesMarker, { name = "marker_combo", debugPoly = debug })
--     -- comboMarker:onPlayerInOut(function(isPointInside, point, zone)
--     --     if isPointInside then
--     --         inZoneMarker = true
--     --         ThreadsMarker(zone.data.coords, zone.data.Public, zone.data.Job, zone.data.Job2)
--     --     else
--     --         inZoneMarker = false
--     --     end
--     -- end)
-- end)


local interval = 750
local interval2 = 750
local interval3 = 750
local interval4 = 750
local interval5 = 750
local interval6 = 750
local interval7 = 750
local interval8 = 750
local interval9 = 750
local interval10 = 750
--- MenuWeaponsFBI
CreateThread(function()
    while true do
        local pPed = PlayerPedId()
        local pc = GetEntityCoords(pPed)
        local mc = ZonesListe["MenuWeaponsFBI"].Position
        local dif = #(mc - pc)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == "fib" then
            if dif > 5 then
                interval = 750
            else
                interval = 1
                if dif <= 3 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder a ~b~l'armurerie~w~.")
                    DrawMarker(6,mc.x,mc.y,mc.z,0.0,0.0,100.0,0.0,0.0,0.0,0.5,0.5,0.5,130,0,184,255,false,false,0,false,nil,nil,false)
                    if IsControlJustPressed(0, 51) then
                        MenuWeaponsFBI()
                    end
                end
            end
        end
        Wait(interval)
    end
end)

--- MenuVetementsFBI

CreateThread(function()
    while true do
        local pPed = PlayerPedId()
        local pc = GetEntityCoords(pPed)
        local mc = ZonesListe["MenuVetementsFBI"].Position
        local dif = #(mc - pc)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == "fib" then
            if dif > 3 then
                interval2 = 750
            else
                interval2 = 1
                if dif <= 3 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au ~b~vestiaire~w~.")
                    DrawMarker(6,mc.x,mc.y,mc.z,0.0,0.0,100.0,0.0,0.0,0.0,0.5,0.5,0.5,130,0,184,255,false,false,0,false,nil,nil,false)
                    if IsControlJustPressed(0, 51) then
                        MenuVetementsFBI() 
                    end
                end
            end
            
        end
        Wait(interval2)
    end
end)
--- Menu OpenSocietyMenuFBI
CreateThread(function()
    while true do
        local pPed = PlayerPedId()
        local pc = GetEntityCoords(pPed)
        local mc = ZonesListe["OpenSocietyMenuFBI"].Position
        local dif = #(mc - pc)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == "fib" and ESX.PlayerData.job.grade_name == 'boss' then
            if dif > 10 then
                interval3 = 750
            else
                interval3 = 1
                if dif <= 3 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder a la ~b~société~w~.")
                    DrawMarker(6,mc.x,mc.y,mc.z,0.0,0.0,100.0,0.0,0.0,0.0,0.5,0.5,0.5,130,0,184,255,false,false,0,false,nil,nil,false)
                    if IsControlJustPressed(0, 51) then
                        ESX.OpenSocietyMenu("fib")
                    end
                end
            end
        end
        Wait(interval3)
    end
end)

--- MenuJetski
CreateThread(function()
    while true do
        local pPed = PlayerPedId()
        local pc = GetEntityCoords(pPed)
        local mc = ZonesListe["Jetski"].Position
        local dif = #(mc - pc)
        --if ESX.PlayerData.job and ESX.PlayerData.job.name == "fib" then
            if dif > 6 then
                interval4 = 750
            else
                interval4 = 1
                if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au ~b~Garage Jetski~w~.")
                    DrawMarker(6,mc.x,mc.y,mc.z,0.0,0.0,100.0,0.0,0.0,0.0,0.5,0.5,0.5,130,0,184,255,false,false,0,false,nil,nil,false)
                    if IsControlJustPressed(0, 51) then
                        MenuJetski()
                    end
                end
            end
            
        --end
        Wait(interval4)
    end
end)

-- OpenSocietyChestFBI
CreateThread(function()
    
    while true do
        local pPed = PlayerPedId()
        local pc = GetEntityCoords(pPed)
        local mc = ZonesListe["OpenSocietyChestFBI"].Position
        local dif = #(mc - pc)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == "fib" then
            if dif > 6 then
                interval5 = 750
            else
                interval5 = 1
                if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au ~b~Coffre~w~.")
                    DrawMarker(6,mc.x,mc.y,mc.z,0.0,0.0,100.0,0.0,0.0,0.0,0.5,0.5,0.5,130,0,184,255,false,false,0,false,nil,nil,false)
                    if IsControlJustPressed(0, 51) then
                        ESX.OpenSocietyChest("fib")
                    end
                end
            end
        end
        Wait(interval5)
    end
end)
--- MenuHelicoFBI
CreateThread(function()
    
    while true do
        local pPed = PlayerPedId()
        local pc = GetEntityCoords(pPed)
        local mc = ZonesListe["MenuHelicoFBI"].Position
        local dif = #(mc - pc)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == "fib" then
            if dif > 10 then
                interval6 = 750
            else
                interval6 = 1
                if dif <= 9 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au ~b~Garage Helicoptere~w~.")
                    DrawMarker(34,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,130,0,180,255,false,false,0,true,nil,nil,false)
                    if IsControlJustPressed(0, 51) then
                        MenuHelicoFBI()
                    end
                end
            end
        end
        Wait(interval6)
    end
end)
--- DeleteVehicleFBI
CreateThread(function()
    while true do
        local pPed = PlayerPedId()
        local vh = GetVehiclePedIsIn(pPed, false)
        local pc = GetEntityCoords(pPed)
        local mc = ZonesListe["DeleteVehicleFBI"].Position
        local dif = #(mc - pc)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == "fib" then
            if dif > 15 then
                interval7 = 750
            else
                interval7 = 1
                if dif <= 13 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour rentre votre véhicule au ~b~Garage~w~.")
                    DrawMarker(6,mc.x,mc.y,mc.z,0.0,0.0,100.0,0.0,0.0,0.0,0.5,0.5,0.5,130,0,184,255,false,false,0,false,nil,nil,false)
                    if IsControlJustPressed(0, 51) then
                        if vh ~= nil then
                            DeleteEntity(vh)
                        else
                            ESX.showNotification("Vous etes pas dans un véhicule")
                        end
                    end
                end
            end
        end
        Wait(interval7)
    end
end)

---- DeleteHelicoFBI

CreateThread(function()
    while true do
        local pPed = PlayerPedId()
        local pc = GetEntityCoords(pPed)
        local vh = GetVehiclePedIsIn(pPed, false)
        local mc = ZonesListe["DeleteHelicoFBI"].Position
        local dif = #(mc - pc)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == "fib" then
            if dif > 8 then
                interval8 = 750
            else
                interval8 = 1
                if dif <= 7 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour rentre votre Helicopter au ~b~Garage~w~.")
                    DrawMarker(6,mc.x,mc.y,mc.z,0.0,0.0,10.0,0.0,0.0,0.0,7.0,3.0,7.0,130,0,184,255,false,false,0,false,nil,nil,false)
                    if IsControlJustPressed(0, 51) then
                        if vh ~= nil then
                            DeleteEntity(vh)
                        else
                            ESX.showNotification("Vous etes pas dans un véhicule")
                        end
                    end
                end
            end
        end
        Wait(interval8)
    end
end)

--- MenuVeheculesFBI
CreateThread(function()
    while true do
        local pPed = PlayerPedId()
        local pc = GetEntityCoords(pPed)
        local mc = ZonesListe["MenuVeheculesFBI"].Position
        local dif = #(mc - pc)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == "fib" then
            if dif > 6 then
                interval9 = 750
            else
                interval9 = 1
                if dif <= 5 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au ~b~Garage~w~.")
                    DrawMarker(6,mc.x,mc.y,mc.z,0.0,0.0,100.0,0.0,0.0,0.0,0.5,0.5,0.5,130,0,184,255,false,false,0,false,nil,nil,false)
                    if IsControlJustPressed(0, 51) then
                        MenuVeheculesFBI()
                    end
                end
            end
        end
        Wait(interval9)
    end
end)
--- Menucustom
CreateThread(function()
    while true do
        local pPed = PlayerPedId()
        local pc = GetEntityCoords(pPed)
        local mc = ZonesListe["Menucustom"].Position
        local dif = #(mc - pc)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == "fib" then
            if dif > 10 then
                interval10 = 750
            else
                interval10 = 1
                if dif <= 9 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au ~b~menu custom~w~.")
                    DrawMarker(36,mc.x,mc.y,mc.z,0.0,0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,130,0,184,255,false,false,0,true,nil,nil,false)
                    if IsControlJustPressed(0, 51) then
                        Menucustom()
                    end
                end
            end
        end
        Wait(interval10)
    end
end)
