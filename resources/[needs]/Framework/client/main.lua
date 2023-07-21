local isLoadoutLoaded, isPaused, disableUi, isPlayerSpawned, isDead, pickups, IsInPVP = false, false, false, false, false, {}, false;

print("[^3"..GetCurrentResourceName().."^0] : ^5initialized for Exelity")

Citizen.CreateThread(function()
    StartAudioScene('CHARACTER_CHANGE_IN_SKY_SCENE')
    SetAudioFlag("PoliceScannerDisabled", true)
end)


Citizen.CreateThread(function()
	SetGarbageTrucks(0)
	SetRandomBoats(0)
	SetRandomTrains(0)
	SetRelationshipBetweenGroups(0, GetHashKey("CIVMALE"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("CIVFEMALE"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("SECURITY_GUARD"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("PRIVATE_SECURITY"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("DEALER"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("HATES_PLAYER"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("HEN"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("WILD_ANIMAL"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("SHARK"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("COUGAR"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("SPECIAL"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("MISSION2"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("MISSION3"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("MISSION4"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("MISSION5"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("MISSION6"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("MISSION7"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("MISSION8"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("ARMY"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("GUARD_DOG"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("CAT"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("COP"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("MEDIC"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("FIREMAN"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("GANG_1"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("GANG_2"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("GANG_9"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("GANG_10"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("AMBIENT_GANG_LOST"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("AMBIENT_GANG_MEXICAN"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("AMBIENT_GANG_FAMILY"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("AMBIENT_GANG_BALLAS"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("AMBIENT_GANG_MARABUNTE"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("AMBIENT_GANG_CULT"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("AMBIENT_GANG_SALVA"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("AMBIENT_GANG_WEICHENG"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("AMBIENT_GANG_HILLBILLY"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(0, GetHashKey("PRISONER"), GetHashKey("PLAYER"))
end)

local scenarios = {
    'WORLD_VEHICLE_ATTRACTOR',
    'WORLD_VEHICLE_AMBULANCE',
    'WORLD_VEHICLE_BICYCLE_BMX',
    'WORLD_VEHICLE_BICYCLE_BMX_BALLAS',
    'WORLD_VEHICLE_BICYCLE_BMX_FAMILY',
    'WORLD_VEHICLE_BICYCLE_BMX_HARMONY',
    'WORLD_VEHICLE_BICYCLE_BMX_VAGOS',
    'WORLD_VEHICLE_BICYCLE_MOUNTAIN',
    'WORLD_VEHICLE_BICYCLE_ROAD',
    'WORLD_VEHICLE_BIKE_OFF_ROAD_RACE',
    'WORLD_VEHICLE_BIKER',
    'WORLD_VEHICLE_BOAT_IDLE',
    'WORLD_VEHICLE_BOAT_IDLE_ALAMO',
    'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
    'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
    'WORLD_VEHICLE_BROKEN_DOWN',
    'WORLD_VEHICLE_BUSINESSMEN',
    'WORLD_VEHICLE_HELI_LIFEGUARD',
    'WORLD_VEHICLE_CLUCKIN_BELL_TRAILER',
    'WORLD_VEHICLE_CONSTRUCTION_SOLO',
    'WORLD_VEHICLE_CONSTRUCTION_PASSENGERS',
    'WORLD_VEHICLE_DRIVE_PASSENGERS',
    'WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED',
    'WORLD_VEHICLE_DRIVE_SOLO',
    'WORLD_VEHICLE_FIRE_TRUCK',
    'WORLD_VEHICLE_EMPTY',
    'WORLD_VEHICLE_MARIACHI',
    'WORLD_VEHICLE_MECHANIC',
    'WORLD_VEHICLE_MILITARY_PLANES_BIG',
    'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
    'WORLD_VEHICLE_PARK_PARALLEL',
    'WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN',
    'WORLD_VEHICLE_PASSENGER_EXIT',
    'WORLD_VEHICLE_POLICE_BIKE',
    'WORLD_VEHICLE_POLICE_CAR',
    'WORLD_VEHICLE_POLICE',
    'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
    'WORLD_VEHICLE_QUARRY',
    'WORLD_VEHICLE_SALTON',
    'WORLD_VEHICLE_SALTON_DIRT_BIKE',
    'WORLD_VEHICLE_SECURITY_CAR',
    'WORLD_VEHICLE_STREETRACE',
    'WORLD_VEHICLE_TOURBUS',
    'WORLD_VEHICLE_TOURIST',
    'WORLD_VEHICLE_TANDL',
    'WORLD_VEHICLE_TRACTOR',
    'WORLD_VEHICLE_TRACTOR_BEACH',
    'WORLD_VEHICLE_TRUCK_LOGS',
    'WORLD_VEHICLE_TRUCKS_TRAILERS',
    'WORLD_VEHICLE_DISTANT_EMPTY_GROUND'
  }

for i, v in ipairs(scenarios) do
    SetScenarioTypeEnabled(v, false)
end

local numbers = 0.2

local areaCleared = {
	{coords = vector3(321.48, -2029.72, 20.76), radius = 50.0},
	{coords = vector3(963.2, -135.56, 74.4), radius = 50.0},
	{coords = vector3(225.63, -785.830, 30.87), radius = 50.0},
	{coords = vector3(-2031.09, 3145.10, 32.81), radius = 50.0},
	{coords = vector3(-2130.08, 3257.94, 32.81), radius = 50.0},
	{coords = vector3(-2181.67, 3185.35, 32.81), radius = 50.0},
	{coords = vector3(-2284.56, 3183.05, 32.80), radius = 50.0},
	{coords = vector3(-2241.43, 3242.48, 32.81), radius = 50.0},
	{coords = vector3(-1995.55, 3061.22, 32.81), radius = 50.0},
	{coords = vector3(-2008.47, 2954.21, 32.80), radius = 50.0},
	{coords = vector3(-2139.84, 3031.79, 32.81), radius = 50.0},
	{coords = vector3(-1091.87, -835.80, 19.00), radius = 50.0},
	{coords = vector3(-1075.90, -826.58, 5.47), radius = 50.0},
	{coords = vector3(306.00, -589.16, 57.72), radius = 50.0},
	{coords = vector3(-204.32, -1333.83, 34.86), radius = 20.0},
	{coords = vector3(-1134.72, -2876.73, 13.94), radius = 30.0},
	{coords = vector3(-729.45, -1471.039, 5.00), radius = 40.0},
	{coords = vector3(-473.89, 5990.47, 31.33), radius = 30.0},
	{coords = vector3(-6.28, -1840.38, 23.79), radius = 20.0},
	{coords = vector3(220.53, 210.11, 104.50), radius = 30.0},
	{coords = vector3(-547.35, -186.71, 41.03), radius = 50.0},
	{coords = vector3(-2970.34,483.89,15.79), radius = 20.0},
	{coords = vector3(-2970.34,483.89,15.79), radius = 20.0},
}

local players = 0

RegisterNetEvent("players:update")
AddEventHandler("players:update", function(nbPlayerTotal)
	players = nbPlayerTotal
end)

Citizen.CreateThread(function()
    while true do -- OPTIMIZED
		local pPed = PlayerPedId()
        local pCoords = GetEntityCoords(pPed)
		if players < 150 then
            numbers = 0.01
        end
		if players >= 150 then
            numbers = 0.0
        end
        for i = 1, #areaCleared, 1 do
			if #(pCoords - areaCleared[i].coords) < 100 then
				ClearAreaOfVehicles(areaCleared[i].coords, areaCleared[i].radius, false, false, false, false, false)
				ClearAreaOfPeds(areaCleared[i].coords, areaCleared[i].radius, 1)
			end
		end
        Wait(3000)
    end
end)

Citizen.CreateThread(function()
    for i = 1,15 do
        EnableDispatchService(i, false)
    end
    while true do -- NO OPTIMIZED
        Wait(1)
	   	SetVehicleDensityMultiplierThisFrame(numbers)
        SetRandomVehicleDensityMultiplierThisFrame(numbers)
	    SetParkedVehicleDensityMultiplierThisFrame(numbers)

	    SetPedDensityMultiplierThisFrame(0.2)
	    SetScenarioPedDensityMultiplierThisFrame(0.2, 0.2)

		SetEveryoneIgnorePlayer(PlayerId(), true)
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
		HideHudComponentThisFrame(1)
		HideHudComponentThisFrame(2)
		HideHudComponentThisFrame(3)
		HideHudComponentThisFrame(4)
		HideHudComponentThisFrame(6)
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(9)
		HideHudComponentThisFrame(13)
		HideHudComponentThisFrame(17)
		HideHudComponentThisFrame(20)
    end
end)

CreateThread(function()
    while true do -- OPTIMIZED
        local pool = GetGamePool("CPed")
        for i = 1, #pool do
            local ped = pool[i]
            SetPedDropsWeaponsWhenDead(ped, false)
        end
        Wait(500)
    end
end);

Citizen.CreateThread(function()
    local SCENARIO_GROUPS = {
        2017590552,
        2141866469,
        1409640232,
        "ng_planes",
    }
    local SUPPRESSED_MODELS = {
        "SHAMAL",
        "LUXOR",
        "LUXOR2",
        "JET",
        "LAZER",
        "TITAN",
        "BARRACKS",
        "BARRACKS2",
        "CRUSADER",
        "RHINO",
        "AIRTUG",
        "RIPLEY",
		"POLMAV",
		"LGUARD",
		"BUZZARD",
		"BUZZARD2",
		"FROGGER",
		"FROGGER2",
		"SWIFT",
		"SWIFT2",
		"SUPERVOLITO",
		"SUPERVOLITO2",
		"CARGOBOB",
		"CARGOBOB2",
		"CARGOBOB3",
		"CARGOBOB4",
		"MAVERICK",
		"SOVEREIGN",
		"STOCKADE",
		"FIRETRUK",
		"AMBULANCE",
		"AIRBUS",
		"BUS",
		"COACH",
    }
    while true do -- OPTIMIZED
        for _, scgrp in next, SCENARIO_GROUPS do
            SetScenarioGroupEnabled(scgrp, false)
        end
        for _, model in next, SUPPRESSED_MODELS do
            SetVehicleModelIsSuppressed(GetHashKey(model), true)
        end
        Wait(1000)
    end
end)

local PosBL = {
    {pos = vector3(406.7928, -1006.758, 29.26582)},
    {pos = vector3(-453.9952, 6004.273, 31.34049)},
}

local WaitZonePDP = 1000

Citizen.CreateThread(function()
    for i = 1, 15 do
        Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
    end
    while true do -- OPTIMIZED
        Wait(WaitZonePDP)
        local playerLocalisation = GetEntityCoords(PlayerPedId())
        for k,v in pairs(PosBL) do
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.pos, true) < 100 then
                WaitZonePDP = 0
                ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
            else
                WaitZonePDP = 1000
            end
        end
    end
end)

local function HasWeapon(weaponHash)

	local hasWeapon = false;

	for _, weapon in pairs(ESX.PlayerData.loadout) do

		if (type(weapon) == "table") then

			if (type(weapon.name) == "string") then
				if (GetHashKey(weapon.name) == weaponHash) then
					hasWeapon = true;
				end
			end

		end
	end

	return hasWeapon;

end

---@param weaponName string
---@return table, number | boolean, nil
local function GetWeaponInLoadout(weaponName)

	for i = 1, #ESX.PlayerData.loadout do

		local weapon = ESX.PlayerData.loadout[i];

		if (type(weapon) == "table") then
			
			if (type(weapon.name) == "string") then
				
				if (weapon.name == weaponName) then

					return weapon, i

				end

			end

		end

	end

	return false, nil;

end

local function handleWeapons()

	CreateThread(function()

		while (ESX.PlayerLoaded) do

			Wait(500);

			local ped = PlayerPedId();

			for i = 1, #Config.Weapons do
					
				local name = Config.Weapons[i].name;
				local hash = GetHashKey(name)
				local _hasWeapon = HasWeapon(hash);
				local _hasGameWeapon = HasPedGotWeapon(ped, hash, false);

				if (_hasGameWeapon and not _hasWeapon) then

					RemoveWeaponFromPed(ped, hash);
					SetPedInfiniteAmmo(ped, false, hash);

				elseif (_hasWeapon and not _hasGameWeapon) then

					GiveWeaponToPed(ped, hash, 0, false, false);

					local weaponType = ESX.GetWeaponType(name);

					if (weaponType) then

						local ammo = ESX.PlayerData.ammo[weaponType];
						SetPedAmmo(ped, hash, type(ammo) == "number" and ammo or 0);

						if (IsInPVP) then
							SetPedInfiniteAmmo(ped, true, hash);
						else
							SetPedInfiniteAmmo(ped, false, hash);
						end

					end

				end

				local playerWeapon = GetWeaponInLoadout(name);

				if (playerWeapon) then

					for j = 1, #playerWeapon.components do
						local weaponComponent = playerWeapon.components[j];
						local component = ESX.GetWeaponComponent(name, weaponComponent);
						local componentHash = component.hash;

						if (not HasPedGotWeaponComponent(ped, hash, componentHash)) then
							GiveWeaponComponentToPed(ped, hash, componentHash);
						end

					end

				end

			end
		end

	end);

end

local function JustGodStartAmmoSaveLoop()

	CreateThread(function()

		local currentWeapon = {Ammo = 0}

		while ESX.PlayerLoaded do

			local sleep = 1500
			local ped = PlayerPedId();

			if (GetSelectedPedWeapon(ped) ~= -1569615261) then

				sleep = 1000;
				local _, weaponHash = GetCurrentPedWeapon(ped, true);

				local weapon = ESX.GetWeaponFromHash(weaponHash);

				if (weapon) then

					if (not IsInPVP) then

						local ammoCount = GetAmmoInPedWeapon(ped, weaponHash)

						if (weapon.name ~= currentWeapon.name) then

							currentWeapon.Ammo = ammoCount
							currentWeapon.name = weapon.name

						else

							if (ammoCount ~= currentWeapon.Ammo) then
								currentWeapon.Ammo = ammoCount
								TriggerServerEvent('JustGod:updateWeaponAmmo', weapon.name, ammoCount);
							end

						end

					end

				end
			end

			Wait(sleep)

		end

	end);

end

RegisterNetEvent('esx:playerLoaded', function(xPlayer)

	ESX.PlayerLoaded = true;
	ESX.PlayerData = xPlayer;

	JustGodStartAmmoSaveLoop();
	handleWeapons();

end);

RegisterNetEvent('esx:setMaxWeight')
AddEventHandler('esx:setMaxWeight', function(newMaxWeight)
	ESX.PlayerData.maxWeight = newMaxWeight
end)

AddEventHandler('playerSpawned', function(_, isFirstSpawn)
	while not ESX.PlayerLoaded do
		Citizen.Wait(10)
	end

	TriggerEvent('esx:restoreLoadout')

	if (isFirstSpawn) then
		TriggerServerEvent('esx:positionSaveReady');
	end

	isLoadoutLoaded, isPlayerSpawned, isDead = true, true, false
	SetCanAttackFriendly(PlayerPedId(), true, true)
	NetworkSetFriendlyFireOption(true)
end)

AddEventHandler('esx:onPlayerDeath', function() isDead = true; end);

AddEventHandler('skinchanger:loadDefaultModel', function() isLoadoutLoaded = false end);

local function restoreLoadout()

	local ammoTypes = {};

	RemoveAllPedWeapons(PlayerPedId());

	for _, weapon in pairs(Config.Weapons) do

		if (type(weapon) == "table" and type(weapon.name) == "string") then

			local name = string.upper(weapon.name);
			local hash = GetHashKey(name);

			if (HasWeapon(hash)) then

				local ped = PlayerPedId();

				GiveWeaponToPed(ped, hash, 0, false, false);

				if (not IsInPVP) then

					local weaponType = ESX.GetWeaponType(name);

					if (weaponType) then

						if (not ammoTypes[weaponType]) then
							ammoTypes[weaponType] = type(ESX.PlayerData.ammo[weaponType]) == "number" and ESX.PlayerData.ammo[weaponType] or 0;
						end

						SetPedAmmo(ped, hash, ammoTypes[weaponType]);
						SetPedInfiniteAmmo(ped, false, hash);

						local playerWeapon = GetWeaponInLoadout(name);

						if (playerWeapon) then

							for j = 1, #playerWeapon.components, 1 do
								local weaponComponent = playerWeapon.components[j];
								local component = ESX.GetWeaponComponent(name, weaponComponent);
								local componentHash = component.hash;
								GiveWeaponComponentToPed(ped, hash, componentHash);
							end

						end

					end

				else

					SetPedAmmo(ped, hash, 250);
					SetPedInfiniteAmmo(ped, true, hash);

				end

			end

		end

	end

	isLoadoutLoaded = true;
end

AddEventHandler('esx:restoreLoadout', restoreLoadout);

AddEventHandler('skinchanger:modelLoaded', function()
	while not ESX.PlayerLoaded do
		Citizen.Wait(1)
	end

	restoreLoadout();
end);

RegisterNetEvent("esx:refreshLoadout", function(playerLoadout, playerAmmo)

	ESX.PlayerData.loadout = playerLoadout;
	ESX.PlayerData.ammo = playerAmmo;
	restoreLoadout();
end);

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	for i = 1, #ESX.PlayerData.accounts, 1 do
		if ESX.PlayerData.accounts[i].name == account.name then
			ESX.PlayerData.accounts[i] = account
			break
		end
	end

	ESX.UI.HUD.UpdateElement('account_' .. account.name, {
		money = ESX.Math.GroupDigits(account.money)
	});
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item)
	ESX.UI.ShowInventoryItemNotification(true, item.label, item.count)
	table.insert(ESX.PlayerData.inventory, item)
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, identifier)
	for i = 1, #ESX.PlayerData.inventory, 1 do
		if ESX.PlayerData.inventory[i].name == item.name and (not identifier or (item.unique and ESX.PlayerData.inventory[i].extra.identifier and ESX.PlayerData.inventory[i].extra.identifier == identifier)) then
			ESX.UI.ShowInventoryItemNotification(false, item.label, item.count)
			table.remove(ESX.PlayerData.inventory, i)
			break
		end
	end
end)

RegisterNetEvent('esx:updateItemCount', function(itemName, count)
	for i = 1, #ESX.PlayerData.inventory, 1 do
		if ESX.PlayerData.inventory[i].name == itemName then

			local itemCount = ESX.PlayerData.inventory[i].count

			ESX.UI.ShowInventoryItemNotification(itemCount > count, ESX.PlayerData.inventory[i].label, add and (count - ESX.PlayerData.inventory[i].count) or (ESX.PlayerData.inventory[i].count - count))
			ESX.PlayerData.inventory[i].count = count
			break
		end
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	ESX.UI.HUD.UpdateElement('job', {
		job_label = job.label,
		grade_label = job.grade_label
	})
	TriggerServerEvent('verifPossible', job.label)
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	ESX.PlayerData.job2 = job2

	ESX.UI.HUD.UpdateElement('job2', {
		job2_label = job2.label,
		grade2_label = job2.grade_label
	})
	TriggerServerEvent('verifPossible2', job2.label)
end)

RegisterNetEvent('esx:setGroup')
AddEventHandler('esx:setGroup', function(group, lastGroup)
	ESX.PlayerData.group = group
end)

RegisterNetEvent('esx:addWeapon')
AddEventHandler('esx:addWeapon', function(weaponName, weaponAmmo)
	local found = false

	local weaponType = ESX.GetWeaponType(weaponName);

	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			found = true
			break
		end
	end

	if not found then
		local playerPed = PlayerPedId()
		local weaponHash = GetHashKey(weaponName)
		local weaponLabel = ESX.GetWeaponLabel(weaponName)
		ESX.UI.ShowInventoryItemNotification(true, weaponLabel, false)

		table.insert(ESX.PlayerData.loadout, {
			name = weaponName,
			label = weaponLabel,
			components = {}
		})

		GiveWeaponToPed(playerPed, weaponHash, 0, false, false);

		if (weaponType) then

			ESX.PlayerData.ammo[weaponType] = weaponAmmo;
			SetPedAmmo(playerPed, weaponHash, weaponAmmo);

		else
			SetPedAmmo(playerPed, weaponHash, 0);
		end
	end
end)

RegisterNetEvent('esx:addWeaponComponent')
AddEventHandler('esx:addWeaponComponent', function(weaponName, weaponComponent)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local component = ESX.GetWeaponComponent(weaponName, weaponComponent)

			if component then
				local found = false

				for j = 1, #ESX.PlayerData.loadout[i].components, 1 do
					if ESX.PlayerData.loadout[i].components[j] == weaponComponent then
						found = true
						break
					end
				end

				if not found then
					local playerPed = PlayerPedId()
					local weaponHash = GetHashKey(weaponName)

					ESX.UI.ShowInventoryItemNotification(true, component.label, false)
					table.insert(ESX.PlayerData.loadout[i].components, weaponComponent)
					GiveWeaponComponentToPed(playerPed, weaponHash, component.hash)
				end
			end
		end
	end
end)

RegisterNetEvent('esx:setWeaponAmmo', function(weaponName, weaponAmmo)

	local weaponType = ESX.GetWeaponType(weaponName);

	if (weaponType) then

		ESX.PlayerData.ammo[weaponType] = weaponAmmo;
		SetPedAmmo(PlayerPedId(), GetHashKey(weaponName), weaponAmmo);

	end

end)

RegisterNetEvent('esx:removeWeapon')
AddEventHandler('esx:removeWeapon', function(weaponName, ammo)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local weaponType = ESX.GetWeaponType(weaponName);
			local playerPed = PlayerPedId()
			local weaponHash = GetHashKey(weaponName)
			local weaponLabel = ESX.GetWeaponLabel(weaponName)

			ESX.UI.ShowInventoryItemNotification(false, weaponLabel, false)
			table.remove(ESX.PlayerData.loadout, i)
			RemoveWeaponFromPed(playerPed, weaponHash);

			if (ammo) then

				if (weaponType) then

					ESX.PlayerData.ammo[weaponType] = ammo;
					SetPedAmmo(playerPed, weaponHash, ammo);

				else

					SetPedAmmo(playerPed, weaponHash, 0);

				end

			else
				SetPedAmmo(playerPed, weaponHash, 0);
			end

			break
		end
	end
end)

RegisterNetEvent('esx:removeWeaponComponent')
AddEventHandler('esx:removeWeaponComponent', function(weaponName, weaponComponent)
	for i = 1, #ESX.PlayerData.loadout, 1 do
		if ESX.PlayerData.loadout[i].name == weaponName then
			local component = ESX.GetWeaponComponent(weaponName, weaponComponent)

			if component then
				for j = 1, #ESX.PlayerData.loadout[i].components, 1 do
					if ESX.PlayerData.loadout[i].components[j] == weaponComponent then
						local playerPed = PlayerPedId()
						local weaponHash = GetHashKey(weaponName)

						ESX.UI.ShowInventoryItemNotification(false, component.label, false)
						table.insert(ESX.PlayerData.loadout[i].components, j)
						RemoveWeaponComponentFromPed(playerPed, weaponHash, component.hash)
						break
					end
				end
			end
		end
	end
end)

-- Commands
RegisterNetEvent('esx:teleport')
AddEventHandler('esx:teleport', function(coords)
	ESX.Game.Teleport(PlayerPedId(), coords)
end)

RegisterNetEvent("JustGod:updateXP", function(xp)
	ESX.PlayerData.xp = xp;
end);

RegisterNetEvent("JustGod:CanFight", function(canFight)
	ESX.PlayerData.canFight = canFight;
end);

RegisterNetEvent("JustGod:addXP", function(xp)
	ESX.PlayerData.xp = ESX.PlayerData.xp + xp;
end);

RegisterNetEvent("JustGod:removeXP", function(xp)
	ESX.PlayerData.xp = ESX.PlayerData.xp - xp;
end);

AddEventHandler('tempui:toggleUi', function(value)
	disableUi = value
end)

-- Last position
Citizen.CreateThread(function()
	while true do -- OPTIMIZED
		Citizen.Wait(1000)
		local playerPed = PlayerPedId()

		if ESX.PlayerLoaded and isPlayerSpawned then
			if not IsEntityDead(playerPed) then
				ESX.PlayerData.lastPosition = GetEntityCoords(playerPed, false)
			end
		end

		if IsEntityDead(playerPed) and isPlayerSpawned then
			isPlayerSpawned = false
		end
	end
end)

Citizen.CreateThread(function()
    while true do -- NO OPTIMIZED
        Citizen.Wait(0)
        DisablePlayerVehicleRewards(PlayerId())
    end
end)

Citizen.CreateThread(function()
	while not ESX.PlayerLoaded do
		Citizen.Wait(10)
	end

	local playerPed = PlayerPedId()

	if playerPed and playerPed ~= -1 then
		while GetResourceState('Exelity') ~= 'started' do
			Citizen.Wait(10)
		end

		TriggerEvent('spawnmanager:spawnPlayer', {model = GetHashKey("mp_m_freemode_01"), coords = ESX.PlayerData.lastPosition, heading = 0.0})
		return
	end
end)

Citizen.CreateThread(function()
	while true do -- OPTIMIZED
		Citizen.Wait(0)

		if NetworkIsSessionStarted() then
			TriggerServerEvent('esx:firstJoinProper')
			return
		end
	end
end)

local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
	while true do -- NO OPTIMIZED
		Citizen.Wait(10)
		if IsPedInAnyVehicle(PlayerPedId(), false) and disableShuffle then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), 0) == PlayerPedId() then
				if GetIsTaskActive(PlayerPedId(), 165) then
					SetPedIntoVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), 0)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do -- NO OPTIMIZED
        local plyPed = PlayerPedId()
        if IsPedSittingInAnyVehicle(plyPed) then
            local plyVehicle = GetVehiclePedIsIn(plyPed, false)
			CarSpeed = GetEntitySpeed(plyVehicle) * 3.6
			if CarSpeed <= 50.0 then
				if IsControlJustReleased(0, 157) then
					SetPedIntoVehicle(plyPed, plyVehicle, -1)
					Citizen.Wait(10)
				end
				if IsControlJustReleased(0, 158) then
					SetPedIntoVehicle(plyPed, plyVehicle, 0)
					Citizen.Wait(10)
				end
				if IsControlJustReleased(0, 160) then
					SetPedIntoVehicle(plyPed, plyVehicle, 1)
					Citizen.Wait(10)
				end
				if IsControlJustReleased(0, 164) then
					SetPedIntoVehicle(plyPed, plyVehicle, 2)
					Citizen.Wait(10)
				end
			end
		end
		Citizen.Wait(10)
	end
end)

Citizen.CreateThread(function()
    while true do -- NO OPTIMIZED
        Wait(0); 
        if (not IsPedArmed(PlayerPedId(), 1)) and (GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('weapon_unarmed')) then
			SetPlayerTargetingMode(3);
            DisableControlAction(0, 140, true); 
            DisableControlAction(0, 141, true);
            DisableControlAction(0, 142, true); 
        end
    end
end)
