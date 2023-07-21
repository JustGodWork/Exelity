--[[
----
----Created Date: 2:31 Saturday October 15th 2022
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

---@param xPlayer xPlayer
---@param numberPlate string
---@param notify boolean
exports('GiveCarKey', function(xPlayer, numberPlate, notify)
	return JG.KeyManager:AddKey(xPlayer, VehicleKey, Shared.Vehicle:ConvertPlate(numberPlate), "vehicle", notify or true);
end);

---@param model string
---@param position vector3
---@param heading number
---@param plate string
---@param locked boolean
---@param xPlayer xPlayer
---@param callback fun(handle: number, properties: table)
exports('SpawnVehicle', function(model, position, heading, plate, locked, xPlayer, callback)
	JG.VehicleManager:CreateVehicle(model, position, heading, plate, function(vehicle, properties)
		vehicle:SetLocked(locked ~= nil and locked or false);
		if (callback) then
			callback(vehicle:GetHandle(), properties);
		end
	end, xPlayer);
end);

---@param plate string
---@param callback function
exports("RemoveVehicle", function(plate, callback)
	JG.VehicleManager:RemoveVehicle(plate, callback);
end);