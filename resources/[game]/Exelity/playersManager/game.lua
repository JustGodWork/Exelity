--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local IsInPVP = false;

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Citizen.CreateThread(function()
	SetDiscordAppId(1018797174659764256)
	SetDiscordRichPresenceAsset('logo_exelity')
	SetRichPresence(GetPlayerName(PlayerId()) .." ["..GetPlayerServerId(PlayerId()).."]")
	SetDiscordRichPresenceAction(0, "Rejoindre le discord", "https://discord.gg/exelity")
	AddTextEntry('PM_PANE_LEAVE', '~p~Retourner sur la liste des serveurs.')
	AddTextEntry('PM_PANE_QUIT', 'Quitter ~r~Progressive')
	AddTextEntry('PM_SCR_MAP', 'CARTE')
	AddTextEntry('PM_SCR_GAM', 'DOUANE')
	AddTextEntry('PM_SCR_INF', 'LOGS DU JEU')
	AddTextEntry('PM_SCR_SET', 'CONFIG FIVEM')
	AddTextEntry('PM_SCR_STA', 'STATISTIQUES')
	AddTextEntry('PM_SCR_RPL', '~p~Éditeur ∑')
	AddTextEntry('FE_THDR_GTAO', ("~c~[~p~PUBLIC~c~] ~p~Exelity ~c~|~s~ ~p~%s~s~ ~c~[~p~%s~c~]~s~ discord.gg/~p~exelity~s~"):format(
    	GetPlayerName(PlayerId()),
    	GetPlayerServerId(PlayerId())
	));
	AddTextEntry("PM_PANE_CFX", "Exelity")
	ReplaceHudColourWithRgba(116, 130, 0, 184, 255)
	local wait = 15
	local count = 60
	local KO = false

	while true do
		if (not IsInPVP) then
			if IsPedInMeleeCombat(PlayerPedId()) then
				if GetEntityHealth(PlayerPedId()) < 115 then
					ESX.ShowNotification("Vous êtes assommé")
					wait = 15
					KO = true
					SetEntityHealth(PlayerPedId(), 116)
				end
			end

			if KO then
				SetPlayerInvincible(PlayerId(), true)
				DisablePlayerFiring(PlayerId(), true)
				SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
				ResetPedRagdollTimer(PlayerPedId())
					
				if wait >= 0 then
					count = count - 1

					if count == 0 then
						count = 60
						wait = wait - 1
						SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 4)
					end
				else
					SetPlayerInvincible(PlayerId(), false)
					KO = false
				end
			end
		end

		Citizen.Wait(0)
	end
end)