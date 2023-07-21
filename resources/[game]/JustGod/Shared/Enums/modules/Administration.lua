--[[
----
----Created Date: 4:00 Saturday December 24th 2022
----Author: JustGod
----Made with ❤
----
----File: [Administration]
----
----Copyright (c) 2022 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

Enums.Administration = {

    Server = {

        RequestOpenMenu = "justgod:exelity:administration:request:open:menu",

        StaffChangeState = "justgod:exelity:administration:staff:change:state",

        ReportTake = "justgod:exelity:administration:staff:report:take",
        ReportRemove = "justgod:exelity:administration:staff:report:remove",

        Actions = {

            CreateGroup = "justgod:exelity:administration:staff:actions:create:group",
            DeleteGroup = "justgod:exelity:administration:staff:actions:delete:group",
            UpdateGroupPermission = "justgod:exelity:administration:staff:actions:update:group:permission",

            SendMessage = "justgod:exelity:administration:staff:actions:send:message",

            Player = {

                GetInventory = "justgod:exelity:administration:staff:get:inventory",
                GiveItem = "justgod:exelity:administration:staff:give:item",
                RemoveItem = "justgod:exelity:administration:staff:remove:item",

                GetAccounts = "justgod:exelity:administration:staff:get:accounts",
                TeleportCoords = "justgod:exelity:administration:staff:actions:teleport:coords",
                Freeze = "justgod:exelity:administration:staff:actions:freeze:coords",

            },

            Goto = "justgod:exelity:administration:staff:actions:goto",

            Bring = "justgod:exelity:administration:staff:actions:bring",
            BringBack = "justgod:exelity:administration:staff:actions:bring_back",

            SetPed = "justgod:exelity:administration:staff:actions:set:ped",

            Entity = "justgod:exelity:administration:entity:execute"

        }

    },

    Client = {

        Init = "justgod:exelity:administration:init",

        StaffSetValue = "justgod:exelity:administration:staff:set:value",
        StaffAdd = "justgod:exelity:administration:staff:add",
        StaffRemove = "justgod:exelity:administration:staff:remove",

        PlayerDropped = "justgod:exelity:administration:player:dropped",

        GroupSetValue = "justgod:exelity:administration:group:set:value",
        GroupAdd = "justgod:exelity:administration:group:add",
        GroupDelete = "justgod:exelity:administration:group:delete",

        ReportSetValue = "justgod:exelity:administration:report:set:value",
        ReportAdd = "justgod:exelity:administration:report:add",
        ReportRemove = "justgod:exelity:administration:report:remove",

        Actions = {

            Entity = "justgod:exelity:administration:entity:execute",

            ReceiveInventory = "justgod:exelity:administration:receive:inventory",
            ReceiveAccounts = "justgod:exelity:administration:receive:accounts"

        }

    }

};