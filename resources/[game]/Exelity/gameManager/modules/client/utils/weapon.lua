--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local weapons = {
	[GetHashKey("WEAPON_UNARMED")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},

	[GetHashKey("WEAPON_KNIFE")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_NIGHTSTICK")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_HAMMER")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_BAT")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_CROWBAR")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_GOLFCLUB")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_BOTTLE")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_DAGGER")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_HATCHET")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_KNUCKLE")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_MACHETE")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_FLASHLIGHT")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_SWITCHBLADE")] = {parameters = {anim = false, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_BATTLEAXE")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_POOLCUE")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_WRENCH")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},

	[GetHashKey("WEAPON_PISTOL")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_PISTOL_MK2")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_COMBATPISTOL")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_PISTOL50")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_SNSPISTOL")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_SNSPISTOL_MK2")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_HEAVYPISTOL")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_VINTAGEPISTOL")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_MARKSMANPISTOL")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_REVOLVER")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_REVOLVER_MK2")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_DOUBLEACTION")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_APPISTOL")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_STUNGUN")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_FLAREGUN")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_CERAMICPISTOL")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_NAVYREVOLVER")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_GADGETPISTOL")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},

	[GetHashKey("WEAPON_MICROSMG")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_MACHINEPISTOL")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_MINISMG")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_SMG")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_SMG_MK2")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_ASSAULTSMG")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_COMBATPDW")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_MG")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_COMBATMG")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_COMBATMG_MK2")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_GUSENBERG")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},

	[GetHashKey("WEAPON_ASSAULTRIFLE")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_ASSAULTRIFLE_MK2")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_CARBINERIFLE")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_CARBINERIFLE_MK2")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_ADVANCEDRIFLE")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_SPECIALCARBINE")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_SPECIALCARBINE_MK2")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_BULLPUPRIFLE")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_BULLPUPRIFLE_MK2")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_COMPACTRIFLE")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_MILITARYRIFLE")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_HEAVYRIFLE")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_TACTICALRIFLE")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},

	[GetHashKey("WEAPON_PUMPSHOTGUN")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_PUMPSHOTGUN_MK2")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_SAWNOFFSHOTGUN")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_BULLPUPSHOTGUN")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_ASSAULTSHOTGUN")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_MUSKET")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_HEAVYSHOTGUN")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_DBSHOTGUN")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_AUTOSHOTGUN")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_COMBATSHOTGUN")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},

	[GetHashKey("WEAPON_SNIPERRIFLE")] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_HEAVYSNIPER")] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_HEAVYSNIPER_MK2")] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_MARKSMANRIFLE")] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_MARKSMANRIFLE_MK2")] = {parameters = {anim = true, onlyBag = true, scoped = true, shakeCam = 0, infiniteAmmo = false}},

	[GetHashKey("WEAPON_GRENADELAUNCHER")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_RPG")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_STINGER")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_MINIGUN")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_FIREWORK")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_RAILGUN")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0.0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_HOMINGLAUNCHER")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_COMPACTLAUNCHER")] = {parameters = {anim = true, onlyBag = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},

	[GetHashKey("WEAPON_GRENADE")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_STICKYBOMB")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_PROXMINE")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_SMOKEGRENADE")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_BZGAS")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_MOLOTOV")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_FIREEXTINGUISHER")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = true}},
	[GetHashKey("WEAPON_PETROLCAN")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = true}},
	[GetHashKey("WEAPON_BALL")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_SNOWBALL")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_FLARE")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}},
	[GetHashKey("WEAPON_PIPEBOMB")] = {parameters = {anim = true, scoped = false, shakeCam = 0, infiniteAmmo = false}}
}

local allowed_bags = {
	40,
	41,
	44,
	45,
	81,
	82,
	85,
	86,
	111,
	112,
	114,
	116,
	117,
	118,
	119,
	120,
	121,
	122,
	124,
	125,
	197
}

local function bagIsAllowed(bagIndex)

	for i = 1, #allowed_bags do

		if (allowed_bags[i] == bagIndex) then

			return true

		end

	end

	return false

end

local unarmedHash = GetHashKey("WEAPON_UNARMED")
local currWeapon = unarmedHash
local holstered = true
local canFire = true
local weapon_bypass = false
local IsInPVP = false;

RegisterNetEvent("JustGod:exelity:weapon_bypass")
AddEventHandler("JustGod:exelity:weapon_bypass", function()

	local resource = GetInvokingResource()

	if (not resource or resource == "JustGod") then

		weapon_bypass = not weapon_bypass;
		ESX.ShowNotification(("WeaponBypass : ~p~%s~s~"):format(weapon_bypass == true and "actif" or "inactif"))

	else

		ForceSocialClubUpdate();

	end

end);

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

CreateThread(function()

	while not ESX.IsPlayerLoaded() do
		Citizen.Wait(500)
	end

	while true do

		Wait(0)

		local Player = PlayerPedId();

		if ( not weapon_bypass and not IsInPVP ) then

			if DoesEntityExist(Player) and not IsPedDeadOrDying(Player) and IsPedOnFoot(Player) then

				local newWeap = GetSelectedPedWeapon(Player)

				if newWeap ~= currWeapon then

					SetCurrentPedWeapon(Player, currWeapon, true)
					local continue = true

					if (weapons[newWeap] ~= nil) and (weapons[newWeap].parameters.onlyBag) then

						local bagIndex = GetPedDrawableVariation(Player, 5)
						if (not bagIsAllowed(bagIndex)) then

							local vehicle = ESX.Game.GetVehicleInDirection()

							if DoesEntityExist(vehicle) then

								SetVehicleDoorOpen(vehicle, 5, false, false)
								Wait(2000)
								SetVehicleDoorShut(vehicle, 5, false)

							else

								ESX.ShowNotification("~r~Action Impossible~s~ : Vous devez disposer d'un sac ou être proche d'une voiture.")
								continue = false

							end

						end

					end

					if continue then

						ESX.Streaming.RequestAnimDict('reaction@intimidation@1h')

						if (weapons[newWeap] ~= nil) and (weapons[newWeap].parameters.anim) then

							if holstered then

								canFire = false
								TaskPlayAnimAdvanced(Player, 'reaction@intimidation@1h', 'intro', GetEntityCoords(Player), 0, 0, GetEntityHeading(Player), 8.0, 3.0, -1, 50, 0, 0, 0)
								Wait(1000)
								SetCurrentPedWeapon(Player, newWeap, true)
								currWeapon = newWeap
								Wait(2000)
								ClearPedTasks(Player)
								holstered = false
								canFire = true

							elseif newWeap ~= currWeapon then

								canFire = false
								TaskPlayAnimAdvanced(Player, 'reaction@intimidation@1h', 'outro', GetEntityCoords(Player), 0, 0, GetEntityHeading(Player), 8.0, 3.0, -1, 50, 0, 0, 0)
								SetCurrentPedWeapon(Player, unarmedHash, true)
								SetCurrentPedWeapon(Player, newWeap, true)
								currWeapon = newWeap
								Wait(2000)
								ClearPedTasks(Player)
								holstered = false
								canFire = true

							end

						else

							if not holstered and (weapons[currWeapon] ~= nil) and (weapons[currWeapon].parameters.anim) then

								canFire = false
								TaskPlayAnimAdvanced(Player, 'reaction@intimidation@1h', 'outro', GetEntityCoords(Player), 0, 0, GetEntityHeading(Player), 8.0, 3.0, -1, 50, 0, 0, 0)
								SetCurrentPedWeapon(Player, unarmedHash, true)
								ClearPedTasks(Player)
								SetCurrentPedWeapon(Player, newWeap, true)
								holstered = true
								canFire = true
								currWeapon = newWeap

							else

								SetCurrentPedWeapon(Player, newWeap, true)
								holstered = false
								canFire = true
								currWeapon = newWeap

							end

						end

						RemoveAnimDict('reaction@intimidation@1h')
					end
				end
			end

			if not canFire then
				DisableControlAction(0, 25, true)
				DisablePlayerFiring(PlayerPedId(), true)
			end

		end

	end

end)

 local recoils = {
 	[GetHashKey("weapon_pistol")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_microsmg")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_smg")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_carbinerifle")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_assaultrifle")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_smg_mk2")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_minismg")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_appistol")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_combatpdw")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_assaultrifle_mk2")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_specialcarbine")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_specialcarbine_mk2")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_bullpuprifle")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_compactrifle")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_minigun")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_ceramicpistol")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_pistol_mk2")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_combatshotgun")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_assaultrifle_mk2")] =0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_musket")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_heavyshotgun")] = 0, -- ASSAULT RIFLE MK2
 	[GetHashKey("weapon_combatmg_mk2")] = 0, -- COMBATMG MK2
 	[GetHashKey("weapon_pistol50")] = 0, -- Pistol50
}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then
			local _, wep = GetCurrentPedWeapon(PlayerPedId())
			_, cAmmo = GetAmmoInClip(PlayerPedId(), wep)
			if recoils[wep] and recoils[wep] ~= 0 then
				local tv = 0
				if GetFollowPedCamViewMode() ~= 4 then
					repeat
						Wait(0)
						p = GetGameplayCamRelativePitch()
						SetGameplayCamRelativePitch(p + 0.1, 0.2)
						tv = tv + 0.1
					until tv >= recoils[wep]
				else
					repeat
						Wait(0)
						p = GetGameplayCamRelativePitch()
						if recoils[wep] > 0.1 then
							SetGameplayCamRelativePitch(p + 0.6, 1.2)
							tv = tv + 0.6
						else
							SetGameplayCamRelativePitch(p + 0.016, 0.333)
							tv = tv + 0.1
						end
					until tv >= recoils[wep]
				end
			end
		end
	end
end)
