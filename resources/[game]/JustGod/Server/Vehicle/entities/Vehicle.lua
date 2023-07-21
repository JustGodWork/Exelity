--[[
----
----Created Date: 4:57 Friday October 14th 2022
----Author: JustGod
----Made with ❤
----
----File: [Vehicle]
----
----Copyright (c) 2022 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@type Vehicle
Vehicle = Class.new(function(class) 

    ---@class Vehicle: BaseObject
    local self = class;

    function self:Constructor(model, position, heading, plate)
        self.model = Shared:IsString(model) and GetHashKey(model) or model;
        self.position = position;
        self.heading = heading;
        self.plate = plate;
        self.networkId = nil;
    end

    function self:GetPlate()
        return self.plate;
    end

    ---@return number
    function self:GetNetworkId()
        return self.networkId;
    end

    ---@param handle number
    function self:SetHandle(handle)
        self.handle = handle;
    end

    ---@param callback function
    function self:RequestNetworkId(callback)

        CreateThread(function()

            if (DoesEntityExist(self.handle)) then
                while not NetworkGetNetworkIdFromEntity(self.handle) do Wait(20); end
                self.networkId = NetworkGetNetworkIdFromEntity(self.handle);
                if (callback) then callback(); end

            end

        end);

    end

    ---@param handle number
    ---@param callback fun(handle: number)
    function self:Request(handle, callback)
        CreateThread(function()
            while not DoesEntityExist(handle) do Wait(200); end

            self.handle = handle;
            SetEntityDistanceCullingRadius(self.handle, 25000);

            while not NetworkGetNetworkIdFromEntity(handle) do Wait(200); end

            self.networkId = NetworkGetNetworkIdFromEntity(handle);

            if (self.plate ~= nil) then
                SetVehicleNumberPlateText(handle, self.plate);
            else
                self.plate = GetVehicleNumberPlateText(handle);
            end
            if (callback) then callback(handle); end
        end);
    end

    ---@param callback fun(handle: number)
    function self:Spawn(callback)
        local vehicle = CreateVehicle(self.model, self.position.x or 0, self.position.y or 0, self.position.z or 0, self.heading or 0, true, true);
        self:Request(vehicle, callback);
    end

    ---@return number
    function self:GetHandle()
        return self.handle
    end

    ---@param xPlayer xPlayer
    function self:SetDriver(xPlayer)
        SetPedIntoVehicle(GetPlayerPed(xPlayer.source), self.handle, -1);
    end

    ---@param xPlayer xPlayer
    ---@param seatIndex number
    function self:SetPlayerInSeat(xPlayer, seatIndex)
        SetPedIntoVehicle(GetPlayerPed(xPlayer.source), self.handle, seatIndex ~= -1 and seatIndex or 0);
    end

    ---@param xPlayer xPlayer
    ---@param callback fun(properties: table)
    function self:RequestProperties(xPlayer, callback)

        self.properties = nil;

        self:OnPropertiesUpdate(function()

            if (callback) then callback(self:GetProperties()); end

        end);
        
        Shared.Events:ToClient(xPlayer, Enums.Vehicles.Events.RequestProperties, self:GetPlate(), self:GetNetworkId());

    end

    ---@return table
    function self:GetProperties()
        return self.properties;
    end

    ---Apply properties
    ---@param properties table
    ---@param xPlayer xPlayer
    ---@param callback fun(properties: table)
    function self:SetProperties(properties, xPlayer, callback)
        Shared.Events:ToClient(xPlayer.source, Enums.Vehicles.Events.SetProperties, self:GetPlate(), self:GetNetworkId(), properties or self.properties);

        self:OnPropertiesUpdate(function()

            if (callback) then callback(self:GetProperties()); end

        end);

    end

    ---@param callback fun(xPlayer: xPlayer, properties: table)
    function self:OnPropertiesUpdate(callback)

        local hasUpdated;

        hasUpdated = Shared.Events:On(Enums.Vehicles.Events.OnPropertiesUpdate, function(xPlayer, plate, properties)

            if (plate == self:GetPlate()) then

                self.properties = properties;

                if (not self.properties or self.properties and Shared.Table:SizeOf(self.properties) == 0) then self.properties = nil; end

                if (self.properties) then
                    self.properties["plate"] = self:GetPlate();
                end

                if (callback) then

                    callback(xPlayer, self:GetProperties());

                end

            end

            RemoveEventHandler(hasUpdated);

        end);

    end

    ---Save properties of the vehicle
    ---@param properties table
    function self:SaveProperties(properties)
        self.properties = properties;
    end

    ---@param bool boolean
    function self:SetLocked(bool)
        SetVehicleDoorsLocked(self:GetHandle(), bool ~= nil and bool == true and 2 or 1);
    end

    ---@return boolean
    function self:IsLocked()
        return GetVehicleDoorLockStatus(self:GetHandle()) == 2;
    end

    return self;
end);