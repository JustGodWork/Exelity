--
--Created Date: 19:02 13/12/2022
--Author: JustGod
--Made with ❤
--
--File: [Logs]
--
--Copyright (c) 2022 JustGodWork, All Rights Reserved.
--This file is part of JustGodWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
--

ESX.Logs = {
    ---@param message string
    ["Info"] = function (message, ...)
    exports["JustGod"]:Info(message, ...);
    end,

    ---@param message string
    ["Warn"] = function (message, ...)
    exports["JustGod"]:Warn(message, ...);
    end,

    ---@param message string
    ["Error"] = function (message, ...)
    exports["JustGod"]:Error(message, ...);
    end,

    ---@param message string
    ["Success"] = function (message, ...)
    exports["JustGod"]:Success(message, ...);
    end
};