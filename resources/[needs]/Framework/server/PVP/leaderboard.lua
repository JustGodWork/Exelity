--[[
----
----Created Date: 1:37 Sunday March 19th 2023
----Author: JustGod
----Made with ❤
----
----File: [leaderboard]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

local leaderboard = {};

MySQL.ready(function()

    MySQL.Async.fetchAll("SELECT * FROM pvp_leaderboard", {}, function(result)
        
        for i = 1, #result do
            leaderboard[result[i]["identifier"]] = {};
            leaderboard[result[i]["identifier"]]["kills"] = result[i]["kills"];
            leaderboard[result[i]["identifier"]]["death"] = result[i]["death"];
            leaderboard[result[i]["identifier"]]["name"] = result[i]["name"];
        end

        ESX.Logs.Success("Loaded pvp leaderboard successfully");

    end);
    
end)

---@param player xPlayer
---@param callback function
local function CreateData(player, callback)
    if (not leaderboard[player.identifier]) then
        leaderboard[player.identifier] = {};
        leaderboard[player.identifier]["kills"] = 0;
        leaderboard[player.identifier]["death"] = 0;
        leaderboard[player.identifier]["name"] = player.name;
    end

    if (callback) then  callback(); end
end

---@param killer xPlayer
local function AddKill(killer)
    CreateData(killer, function()
        leaderboard[killer.identifier]["name"] = killer.name;
        leaderboard[killer.identifier]["kills"] = leaderboard[killer.identifier]["kills"] + 1;
    end);
end

---@param player xPlayer
local function AddDeath(player)
    CreateData(player, function()
        leaderboard[player.identifier]["name"] = player.name;
        leaderboard[player.identifier]["death"] = leaderboard[player.identifier]["death"] + 1;
    end);
end

---@param player xPlayer
function ESX.AddKill(player)
    AddKill(player)
end

---@param player xPlayer
function ESX.AddKill(player)
    AddDeath(player)
end

CreateThread(function()
    while true do
        Wait(5 * 1000 * 60);

        for identifier, data in pairs(leaderboard) do

            local playerData = {

                ["@identifier"] = identifier,
                ["@kills"] = data["kills"],
                ["@death"] = data["death"],
                ["@name"] = data["name"]

            };

            MySQL.Async.fetchAll("SELECT * FROM pvp_leaderboard WHERE identifier = @identifier", {["@identifier"] = identifier}, function(result)

                if (#result > 0) then

                    MySQL.Async.execute("UPDATE pvp_leaderboard SET kills = @kills, death = @death, name = @name WHERE identifier = @identifier", playerData);

                else

                    MySQL.Async.execute("INSERT INTO pvp_leaderboard VALUES(@identifier, @kills, @death, @name)", playerData);

                end

            end);
            
        end

        ESX.Logs.Success("Saved pvp leaderboard successfully");

    end
end);

exports("AddKill", function(src)
    
    local player = ESX.GetPlayerFromId(src);
    if (player) then AddKill(player); end

end);

exports("AddDeath", function(src)
    
    local player = ESX.GetPlayerFromId(src);
    if (player) then AddDeath(player); end

end);

RegisterNetEvent("JustGod:exelity:requestLeaderBoard", function()
    local src = source;
    local player = ESX.GetPlayerFromId(src);

    if (player) then
        player.triggerEvent("JustGod:exelity:receiveLeaderBoard", leaderboard);
    end

end);