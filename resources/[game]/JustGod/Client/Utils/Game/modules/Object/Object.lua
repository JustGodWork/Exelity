--[[
----
----Created Date: 2:22 Sunday October 16th 2022
----Author: JustGod
----Made with ❤
----
----File: [Object]
----
----Copyright (c) 2022 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@type GameObject
GameObject = Class.new(function(class)

    ---@class GameObject: BaseObject
    local self = class;

    ---@param objectHash number | string
    ---@param coords table | vector3
    ---@param callback fun(obj: number)
    function self:Spawn(objectHash, coords, callback)
        local model = type(objectHash) == 'number' and objectHash or GetHashKey(objectHash);
        local vector = type(coords) == "vector3" and coords or vec(coords.x, coords.y, coords.z);
        CreateThread(function()
            Game.Streaming:RequestModel(model);
            local obj = CreateObject(model, vector.xyz, false, false, true)
            if (callback) then
                callback(obj);
            end
        end);
    end

    return self;
end);