--[[
----
----Created Date: 11:45 Sunday December 11th 2022
----Author: JustGod
----Made with ❤
----
----File: [death]
----
----Copyright (c) 2022 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

Shared.Events:OnProtectedNet(Enums.Player.Events.onDeath, function(player, deathData)
    local data = deathData;
    local isInPVP = ESX.GetPlayerInPVPMode(player.identifier);

    if (not Config["DeathLogs"]["onDeath"]) then
        return;
    end

    if (data.killedByPlayer) then

        local killer = Server:ConvertToPlayer(data.killerServerId);

        if (not ESX.GetPlayerInPVPMode(killer.identifier)) then

            Shared.Log:Info(
                Shared.Lang:Translate(
                    "player_killed_by_player",
                    player.source,
                    player.identifier,
                    player.name,
                    killer.source,
                    killer.identifier,
                    killer.name
                )
            );

            player.showNotification(("~b~AntiCheat:~s~\n Vous avez été tué par le joueur ~c~(~b~%s~c~)"):format(killer.source));
            
        else

            killer.showNotification(("Vous avez tué ~b~%s~s~"):format(player.name));
            player.showNotification(("Vous avez été tué par ~b~%s~s~"):format(killer.name));
            killer.triggerEvent("JustGod:exelity:pvp:onKill");
            exports["Framework"]:AddKill(killer.source);
            exports["Framework"]:AddDeath(player.source);

        end

    else

        if (not ESX.GetPlayerInPVPMode(player.identifier)) then

            Shared.Log:Info(
                Shared.Lang:Translate(
                    "player_die",
                    player.source,
                    player.identifier,
                    player.name
                )
            );

        else

            player.showNotification("Vous avez succombé.");

        end

    end

    if (isInPVP) then

        SetTimeout(2000, function()
            player.triggerEvent('ambulance:revive');
        end);

    else
        player.setDead(true);
        TriggerEvent("JustGod:exelity:playerDied", player.source);
    end

end);

Shared.Events:OnProtectedNet(Enums.Player.Events.onRevive, function(player)

    local isInPVP = ESX.GetPlayerInPVPMode(player.identifier);

    if (not isInPVP) then

        TriggerEvent("JustGod:exelity:playerRevived", player.source);
        player.setDead(false);

        if (not Config["DeathLogs"]["onRevive"]) then
            return;
        end

        Shared.Log:Info(Shared.Lang:Translate("player_revived", player.source, player.identifier, player.name));

    end

end);