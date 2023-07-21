--[[
----
----Created Date: 2:52 Monday January 2nd 2023
----Author: JustGod
----Made with ❤
----
----File: [main]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

JustGod = {};

exports("getSharedJustGod", function()
    return JustGod;
end);

exports("RegisterCommand", function(commandName, callback, suggestion, adminOnly)
    return Shared:RegisterCommand(commandName, callback, suggestion, adminOnly)
end);