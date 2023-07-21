--[[
----
----Created Date: 9:42 Friday October 14th 2022
----Author: JustGod
----Made with ❤
----
----File: [Notification]
----
----Copyright (c) 2022 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@type Notification
Notification = Class.new(function(class) 

    ---@class Notification: BaseObject
    local self = class;

    function self:Constructor()
        Shared:Initialized("Game.Notification");
    end

    ---@param message string
    ---@param hudColorIndex number
    function self:Simple(message, hudColorIndex)

        BeginTextCommandThefeedPost('STRING');
        AddTextComponentSubstringPlayerName(message);
        if (hudColorIndex) then ThefeedSetNextPostBackgroundColor(hudColorIndex); end
        EndTextCommandThefeedPostTicker(0, 1);

    end

    ---@param message string
    ---@param hudColorIndex number
    function self:ShowSimple(message, hudColorIndex)

        local msg = message ~= nil and type(message) == "string" and message or "No message provided";
        local configEnabled = Config["Notification"] ~= nil
            and Config["Notification"]["Enabled"]
            and Config["Notification"]["Custom"] ~= nil
            and type(Config["Notification"]["Custom"]) == "function";

        if (not configEnabled) then
            self:Simple(msg, hudColorIndex);
        else
            Config["Notification"]["Custom"](msg, hudColorIndex);
        end

    end

    ---@param sender string
    ---@param subject string
    ---@param message string
    ---@param textureDict string
    ---@param iconType number
    ---@param flash boolean
    ---@param saveToBrief boolean
    ---@param hudColorIndex number
    function self:Advanced(sender, subject, message, textureDict, iconType, flash, saveToBrief, hudColorIndex)

        AddTextEntry('JustGodAdvancedNotification', message);
        BeginTextCommandThefeedPost('JustGodAdvancedNotification');
        ThefeedSetNextPostBackgroundColor(hudColorIndex or 140);
        EndTextCommandThefeedPostMessagetext(textureDict or "CHAR_DEFAULT", textureDict or "CHAR_DEFAULT", false, iconType or 1, sender or "No sender", subject or "No subject");
        EndTextCommandThefeedPostTicker(flash or false, saveToBrief or true);

    end

    ---@param sender string
    ---@param subject string
    ---@param message string
    ---@param textureDict string
    ---@param iconType number
    ---@param flash boolean
    ---@param saveToBrief boolean
    ---@param hudColorIndex number
    function self:ShowAdvanced(sender, subject, message, textureDict, iconType, flash, saveToBrief, hudColorIndex)

        local msg = message ~= nil and type(message) == "string" and message or "No message provided";
        local configEnabled = Config["AdvancedNotification"] ~= nil
            and Config["AdvancedNotification"]["Enabled"]
            and Config["AdvancedNotification"]["Custom"] ~= nil
            and type(Config["AdvancedNotification"]["Custom"]) == "function";

        if (not configEnabled) then
            self:Advanced(sender, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex);
        else
            Config["AdvancedNotification"]["Custom"](sender, subject, message, textureDict, iconType, flash, saveToBrief, hudColorIndex);
        end

    end

    ---@param message string
    ---@param thisFrame boolean
    ---@param beep boolean
    ---@param duration number
    function self:ShowHelp(message, thisFrame, beep, duration)

        AddTextEntry('JustGodHelpNotification', message);

        if (thisFrame) then

            DisplayHelpTextThisFrame('JustGodHelpNotification', false);

        else

            BeginTextCommandDisplayHelp('JustGodHelpNotification');
            EndTextCommandDisplayHelp(0, false, (beep ~= nil and beep) or true, duration or -1);

        end

    end

    return self;
end);