---
--- @author Kadir#6666
--- Create at [21/04/2023] 14:00:11
--- Current project [Exelity-V1]
--- File name [Staff]
---

Shared.Events:OnNet(Enums.Administration.Server.StaffChangeState, function(xPlayer, currentState)

    if (xPlayer == nil) then
        return
    end

    if (not JG.AdminManager:PlayerIsStaff(xPlayer)) then
        return
    end

    local player_ped = GetPlayerPed(xPlayer.source)
    if (currentState == true and not JG.AdminManager:GroupHasPermission(xPlayer.getGroup(), "player_use_personnal_ped")) then
        xPlayer.triggerEvent(Enums.Player.Events.LoadSkin, GetEntityModel(player_ped) == GetHashKey("mp_m_freemode_01") and "s_m_y_casino_01" or "u_f_m_casinocash_01")
    else
        xPlayer.triggerEvent(Enums.Player.Events.LoadSkin, "default")
    end

    JG.AdminManager:StaffSetValue(xPlayer.source, "state", currentState)
    JG.Discord:SendMessage(
            "Admin:StaffMode",
            ("***%s*** vient de ___%s___ son service."):format(xPlayer.getName(), (currentState == true and "prendre" or "quitter")),
            {

                {
                    name = "Identifiant du STAFF",
                    value = xPlayer.getIdentifier(),
                    inline = true
                },
                {
                    name = "ID session du STAFF",
                    value = xPlayer.source,
                    inline = true
                },
                {
                    name = "Pseudo du STAFF",
                    value = xPlayer.getName(),
                    inline = true
                },

            }
    );

    JG.AdminManager:StaffActionForAll(function(staff_player_source)

        TriggerClientEvent("esx:showAdvancedNotification", staff_player_source, "Administration", "Exelity", ("Le staff (~p~%s~s~ - ~p~%s~s~) vient de %s son service."):format(xPlayer.source, xPlayer.getName(), currentState == true and "prendre" or "quitter"))

    end, true)

end);