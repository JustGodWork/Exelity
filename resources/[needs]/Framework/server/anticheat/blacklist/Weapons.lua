--[[
----
----Created Date: 11:15 Thursday March 30th 2023
----Author: JustGod
----Made with ❤
----
----File: [Weapons]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

--[[local _GetSelectedPedWeapon = GetSelectedPedWeapon;
local WEAPON_UNARMED = GetHashKey("WEAPON_UNARMED");
local _RemoveWeaponFromPed = RemoveWeaponFromPed;
local _DoesEntityExist = DoesEntityExist;
local _GetPlayerPed = GetPlayerPed;
local _GetHashKey = GetHashKey;
local weapons = {};
local blacklisted = {};
local banned = {};

CreateThread(function()

    for i = 1, #Config.Weapons do
        
        local weapon = Config.Weapons[i];

        if (type(weapon) == "table") then

            if (type(weapon.name) == "string") then

                local name = weapon.name:upper();
                local hash = _GetHashKey(name);
                weapons[hash] = name;

            end

        end

    end

    for i = 1, #Config.BlacklistedWeapons do

        local weapon = Config.BlacklistedWeapons[i];

        if (type(weapon) == "string") then

            local name = weapon:upper();
            local hash = _GetHashKey(name);
            blacklisted[hash] = name;

        end

    end

    while true do
        
        local players = GetPlayers();

        if (#players > 0) then

            for i = 1, #players do

                local source = tonumber(players[i]);
                local ped = _GetPlayerPed(source);

                local xPlayer = ESX.GetPlayerFromId(source);
                local identifier = ESX.GetIdentifierFromId(source);

                if (not banned[identifier]) then

                    local isJustGod = ESX.IsPlayerJustGod(xPlayer);
                    local isFowlmas = ESX.IsPlayerFowlmas(xPlayer);
                    local Aryxq = ESX.IsPlayerAryxq(xPlayer);
                    local isAllowed = isFowlmas or Aryxq;

                    if (_DoesEntityExist(ped)) then

                        local weapon = _GetSelectedPedWeapon(ped);

                        if (weapon ~= WEAPON_UNARMED) then

                            local weaponValid = ESX.GetWeaponFromHash(weapon);

                            if (weaponValid) then

                                if (blacklisted[weapon]) then

                                    if (xPlayer) then

                                        if (not isAllowed) then

                                            local weaponIndex = xPlayer.GetWeaponIndex(weapons[weapon]);

                                            if (weaponIndex) then
                                                xPlayer.removeWeapon(weapons[weapon]);
                                            end

                                            _RemoveWeaponFromPed(ped, weapon);
                                            ESX.Logs.Warn(("Player ^7(^4%s^0, ^4%s^7)^0 tried to give himself a blacklisted weapon ^7(^4%s^0, ^4%s^7)^0"):format(source, identifier, weapon, weaponValid.label));
                                            ExecuteCommand(("ban %s 0 %s"):format(source, "Vous avez été banni définitivement pour avoir essayé de vous donner une arme interdite."));
                                            banned[identifier] = true;

                                        end

                                    else

                                        _RemoveWeaponFromPed(ped, weapon);
                                        ESX.Logs.Warn(("Player ^7(^4%s^0, ^4%s^7)^0 tried to give himself a blacklisted weapon ^7(^4%s^0, ^4%s^7)^0"):format(source, identifier, weapon, weaponValid.label));
                                        ExecuteCommand(("ban %s 0 %s"):format(source, "Vous avez été banni définitivement pour avoir essayé de vous donner une arme interdite."));
                                        banned[identifier] = true;

                                    end

                                end

                                if (xPlayer) then
                                    
                                    local banMessage = "Vous avez été banni définitivement pour avoir essayé de vous donner une arme";

                                    if (not isAllowed) then

                                        local weaponIndex = xPlayer.GetWeaponIndex(weapons[weapon]);

                                        if (not weaponIndex) then

                                            _RemoveWeaponFromPed(ped, weapon);
                                            ESX.Logs.Warn(("Player ^7(^4%s^0, ^4%s^7)^0 tried to give himself a weapon ^7(^4%s^0, ^4%s^7)^0"):format(source, identifier, weapon, weaponValid.label));
                                            ExecuteCommand(("ban %s 0 %s"):format(source, banMessage));
                                            banned[identifier] = true;

                                        end
                                        
                                    end

                                else
                                    _RemoveWeaponFromPed(ped, weapon);
                                    ESX.Logs.Warn(("Unregistered Player ^7(^4%s^0, ^4%s^7)^0 tried to give himself a weapon ^7(^4%s^0, ^4%s^7)^0"):format(source, identifier, weapon, weaponValid.label));
                                    ExecuteCommand(("ban %s 0 %s"):format(source, banMessage));
                                    banned[identifier] = true;
                                end

                            else

                                _RemoveWeaponFromPed(ped, weapon);
                                ESX.Logs.Warn(("Player ^7(^4%s^0, ^4%s^7)^0 tried to give himself an invalid weapon ^7(^4%s^7)^0"):format(source, identifier, weapon));

                            end

                        end

                    end

                end

            end

        end

        Wait(0);

    end

end);]]