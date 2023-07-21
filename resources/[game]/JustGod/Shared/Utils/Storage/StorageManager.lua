--[[
----
----Created Date: 4:39 Sunday November 27th 2022
----Author: JustGod
----Made with ❤
----
----File: [Storage]
----
----Copyright (c) 2022 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@type StorageManager
StorageManager = Class.new(function(class) 

    ---@class StorageManager: BaseObject
    local self = class;

    function self:Constructor()
        self.data = {};
    end

    ---@param name string
    ---@param data table | nil
    ---@return Storage
    function self:Register(name, data)
        self.data[name] = Storage(name, data);
        return self.data[name];
    end

    ---@param name string
    ---@return Storage
    function self:Get(name)
        return self.data[name];
    end

    return self;
end);