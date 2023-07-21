--[[
--Created Date: Friday September 23rd 2022
--Author: JustGod
--Made with ❤
-------
--Last Modified: Friday September 23rd 2022 3:33:03 pm
-------
--Copyright (c) 2022 JustGodWork, All Rights Reserved.
--This file is part of JustGodWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
-------
--]]

---@type fun():Log
Log = Class.new(function(class)
    
    ---@class Log: BaseObject
    local self = class;

    function self:Constructor()
        self.types = {
            ["info"] = "^4INFO",
            ["warn"] = "^3WARN",
            ["error"] = "^1ERROR",
            ["debug"] = "^6DEBUG",
            ["success"] = "^2SUCCESS",
        };
    end

    ---Get wheter the script is running on the server or the client
    ---@private
    function self:getSide()
        if (IsDuplicityVersion()) then
            return "^5SERVER";
        else
            return "^5CLIENT";
        end
    end

    ---@private
    ---@param args table
    ---@return table | nil
    function self:convertArgs(args)
        local argsConverted = {};
        if (#args > 0) then
            for i = 1, #args do
                if (type(args[i]) == "table") then
                    argsConverted[i] = json.encode(args[i], {indent = true}); --Shared.Table:Dump(args[i]);
                elseif (type(args[i]) == "boolean" or type(args[i]) == "number" or args[i] == nil or type(args[i]) == "string") then
                    argsConverted[i] = tostring(args[i]);
                end
            end
        else
            argsConverted = nil;
        end
        return argsConverted
    end

    ---@private
    ---@param logType string
    ---@param message any
    ---@param messageType type
    ---@param ... any
    function self:convertMessage(logType, message, messageType, ...)
        local msg = string.format("^7[%s^7]^0 => ^7[%s^7]^0 => %s", self:getSide(), self.types[logType], message)
        local args = self:convertArgs({...})
        if (messageType == "string" or messageType == "boolean" or messageType == "number" or message == nil) then
            msg = string.format("^7[%s^7]^0 => ^7[%s^7]^0 => %s", self:getSide(), self.types[logType], tostring(message))
            if (args) then
                for i = 1, #args do
                    msg = string.format("%s %s", msg, args[i]);
                end
            end
        elseif (messageType == "table") then
            msg = string.format("^7[%s^7]^0 => ^7[%s^7]^0 => %s", self:getSide(), self.types[logType], json.encode(message, {indent = true}));--json.encode(message, {indent = true})--Shared.Table:Dump(message)
            if (args) then
                for i = 1, #args do
                    msg = string.format("%s %s", msg, args[i]);
                end
            end
        end
        return msg;
    end

    ---@private
    ---@param logType string
    ---@param message any
    ---@param ... any
    function self:send(logType, message, ...)
        local msg = self:convertMessage(logType, message, type(message), ...);
        print(msg);
    end

    ---@param message any
    ---@param ... any
    function self:Info(message, ...)
        self:send("info", message, ...);
    end

    ---@param message any
    ---@param ... any
    function self:Warn(message, ...)
        self:send("warn", message, ...);
    end

    ---@param message any
    ---@param ... any
    function self:Error(message, ...)
        self:send("error", message, ...);
    end

    ---@param message any
    ---@param ... any
    function self:Debug(message, ...)
        if (Config["Debug"]) then
            self:send("debug", message, ...);
        end
    end

    ---@param message any
    ---@param ... any
    function self:Success(message, ...)
        self:send("success", message, ...);
    end

    ---@param logType string
    ---@param message any
    ---@param ... any
    function self:SendToServer(logType, message, ...)
        TriggerServerEvent("JustGod:Log:Send", logType, message, ...);
    end

    return self;
end);

if (IsDuplicityVersion()) then
    RegisterNetEvent("JustGod:Log:Send", function(logType, message, ...)
        local src = source;
        local player = ESX.GetPlayerFromId(src);
        local name, identifier;
        if (player) then
            name = player.getName();
            identifier = player.getIdentifier();
        else
            name = GetPlayerName(src);
            identifier = "Unknown";
        end
        Shared.Log:send(string.lower(logType), ("Received log from ^7(^4%s^0, ^4%s^0, ^4%s^7)^0: "):format(name, identifier, src), message, ...);
    end);
end