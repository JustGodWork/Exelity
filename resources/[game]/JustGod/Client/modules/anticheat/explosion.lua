--[[
----
----Created Date: 3:07 Tuesday March 21st 2023
----Author: JustGod
----Made with ❤
----
----File: [vehicleExplosion]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

local _PlayerId = PlayerId;
local _PlayerPedId = PlayerPedId;
local _IsPedDeadOrDying = IsPedDeadOrDying;
local _IsEntityDead = IsEntityDead;
local _GetEntityType = GetEntityType;
local _SetVehicleFixed = SetVehicleFixed;
local _StopEntityFire = StopEntityFire;
local _GetVehiclePedIsIn = GetVehiclePedIsIn;
local _GetWeaponDamageType = GetWeaponDamageType;
local _GetVehicleEngineHealth = GetVehicleEngineHealth;
local _GetVehicleBodyHealth = GetVehicleBodyHealth;
local _NetworkGetEntityOwner = NetworkGetEntityOwner;
local _SetVehicleUndriveable = SetVehicleUndriveable;
local _SetVehicleEngineHealth = SetVehicleEngineHealth;
local _SetVehicleDeformationFixed = SetVehicleDeformationFixed;
local _SetVehicleOnGroundProperly = SetVehicleOnGroundProperly;
local _NetworkHasControlOfEntity = NetworkHasControlOfEntity;
local _NetworkRequestControlOfEntity = NetworkRequestControlOfEntity;

Client:SubscribeToGameEvent("CEventNetworkVehicleUndrivable", function(data)
    
    local victimEntity, _, weaponHash = table.unpack(data);

    local ped = _PlayerPedId();
    local entityOwner = _NetworkGetEntityOwner(victimEntity);
    local isOwner = entityOwner == _PlayerId();
    local explosionHashs = joaat("WEAPON_EXPLOSION");
    local damageType = _GetWeaponDamageType(weaponHash);
    local isEntityAVehicle = _GetEntityType(victimEntity) == 2;

    local pedCoords = GetEntityCoords(ped);
    local heading = GetEntityHeading(ped);
    local victimEntityCoords = GetEntityCoords(victimEntity);
    local victimEntityCoordsHeading = GetEntityHeading(victimEntity);
    local dist = #(pedCoords - victimEntityCoords);
    local triesRequest = 0;

    if (isEntityAVehicle and not isOwner and entityOwner == -1 and (weaponHash == 0 or explosionHash == weaponHash or damageType == 5)) then

        while not _NetworkHasControlOfEntity(victimEntity) and triesRequest < 500 do
            triesRequest = triesRequest + 1;
            _NetworkRequestControlOfEntity(victimEntity);

            if (triesRequest == 500 and not _NetworkHasControlOfEntity(victimEntity)) then
                Shared.Log:Warn("^7[^1BETA^7] ^7[^4Anti Grief^7] Cannot get control of entity. Aborting...");
                break;
            end

            Wait(0);
        end

    end

    if (isEntityAVehicle and isOwner and (weaponHash == 0 or explosionHash == weaponHash or damageType == 5)) then

        -- Shared.Log:SendToServer("Warn", "^3Player Vehicle explosion detected^0", {

        --     owner = GetPlayerServerId(_NetworkGetEntityOwner(victimEntity)),
        --     isOwner = isOwner,
        --     isEntityAVehicle = isEntityAVehicle,
        --     weaponHash = weaponHash,
        --     explosionHash = explosionHash,
        --     damageType = damageType,
        --     vehicle = {
                
        --         handle = victimEntity,
        --         coords = victimEntityCoords,
        --         heading = victimEntityCoordsHeading,
        --         engine_health = _GetVehicleEngineHealth(victimEntity),
        --         body_health = _GetVehicleBodyHealth(victimEntity),
            
        --     },
        --     ped = {
    
        --         handle = ped,
        --         coords = pedCoords,
        --         heading = heading,
        --         dist_with_vehicle = dist,
        --         is_dead = _IsPedDeadOrDying(ped),
    
        --     },
    
        -- });

        Shared.Log:Warn("^7[^1BETA^7] ^7[^4Anti Grief^7] ^3Vehicle damaged by explosion, trying to fix it...");

        local isInVehicle = _GetVehiclePedIsIn(ped, false) == victimEntity;

        local tries = {};
        tries["health"] = 0;
        tries["revive"] = 0;

        CreateThread(function()
            while tries["health"] < 500 and DoesEntityExist(victimEntity) do

                tries["health"] = tries["health"] + 1;
                _StopEntityFire(victimEntity);

                for i = 1, GetVehicleNumberOfWheels(victimEntity) do
                    SetVehicleTyreFixed(victimEntity, i);
                end
                
                _SetVehicleUndriveable(victimEntity, false);
                _SetVehicleEngineHealth(victimEntity,1000.0); 
                _SetVehicleDeformationFixed(victimEntity);
                _SetVehicleFixed(victimEntity);
                SetEntityCoords(victimEntity, victimEntityCoords.x, victimEntityCoords.y, victimEntityCoords.z);
                SetEntityHeading(victimEntity, victimEntityCoordsHeading);
                _SetVehicleOnGroundProperly(victimEntity);

                if (tries["health"] == 500) then
                    break;
                end

                Wait(0);
                
            end

        end);

        CreateThread(function()
            if (dist < 30) then
                
                while (tries["revive"] < 250 and DoesEntityExist(victimEntity)) do
                    tries["revive"] = tries["revive"] + 1;
                    if (_IsPedDeadOrDying(ped)) then
                        SetPedCanRagdoll(ped, false);
                        NetworkResurrectLocalPlayer(pedCoords.x, pedCoords.y, pedCoords.z, heading, true, false);
                        ClearPedBloodDamage(ped);

                        SetEntityCoords(ped, pedCoords);
                        SetEntityHeading(ped, heading);
                        ClearPedTasksImmediately(ped);
                        ResetPedRagdollTimer(ped);
                        if (tries["revive"] == 250) then
                            SetPedCanRagdoll(ped, false);
                            Shared.Log:Warn("Vehicle explosion detected, but couldn't revive player. Please report this using command /report");
                            break;
                        end
                    end

                    if (tries["revive"] == 250) then
                        SetPedCanRagdoll(ped, true);
                        if (not _IsPedDeadOrDying(ped)) then

                            local respawnData = { 

                                coords = pedCoords,
                                heading = heading or 0.0,
                                model = GetEntityModel(ped),

                            };

                            TriggerEvent("playerSpawned", respawnData, false);
                            Shared.Log:Warn("^7[^1BETA^7] ^7[^4Anti Grief^7] Player revived after vehicle explosion.");
                        end
                        break;
                    end

                    Wait(0);
                end
                
            end
        end);

    end

end);