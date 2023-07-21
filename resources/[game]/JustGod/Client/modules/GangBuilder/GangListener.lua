--
--Created Date: 19:20 17/12/2022
--Author: JustGod
--Made with ❤
--
--File: [GangListener]
--
--Copyright (c) 2022 JustGodWork, All Rights Reserved.
--This file is part of JustGodWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
--

---@type GangListener
GangListener = Class.new(function(class)

    ---@class GangListener: BaseObject
    local self = class;

    function self:Constructor()
        self.data = {};
    end

    function self:RequestData()
        Shared.Events:ToServer(Enums.GangBuilder.RequestGangData);
    end

    ---@return boolean
    function self:IsPlayerBoss()
        return Client.Player:GetJob2().grade_name == "boss";
    end

    ---@param data table
    function self:SetData(data)
        self.data = data;
    end

    ---@param key string
    ---@return any
    function self:GetData(key)
        return self.data and self.data[key] or nil;
    end

    ---@return table
    function self:GetAllData()
        return self.data;
    end

    return self;

end);