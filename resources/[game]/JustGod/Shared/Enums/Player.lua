--
--Created Date: 16:29 11/12/2022
--Author: JustGod
--Made with ❤
--
--File: [Player]
--
--Copyright (c) 2022 JustGodWork, All Rights Reserved.
--This file is part of JustGodWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
--

Enums.Player = {
    Manager = {
        Request = "justgod:exelity:player:manager:request",
        Init = "justgod:exelity:player:manager:init",
        Add = "justgod:exelity:player:manager:add",
        Added = "justgod:exelity:player:manager:added",
        Remove = "justgod:exelity:player:manager:remove",
        Removed = "justgod:exelity:player:manager:removed",
        Set = "justgod:exelity:player:manager:set",
        SetAll = "justgod:exelity:player:manager:set_all"
    },
    Events = {
        updateZonesAndBlips = "justgod:exelity:player:update_zones&blips",
        LoadPlayerData = "justgod:exelity:player:load_player_data",
        ReceivePlayerData = "justgod:exelity:player:receive_player_data",
        PlayerLoaded = "justgod:exelity:player:player_loaded",
        KickPlayer = "justgod:exelity:player:kick_player",
        onDeath = "justgod:exelity:player:on_death",
        onRevive = "justgod:exelity:player:on_revive",
        LoadSkin = "justgod:exelity:player:load:skin",
        SetWaypoint = "justgod:exelity:player:set:waypoint"
    };
};