--
--Created Date: 16:33 11/12/2022
--Author: JustGod
--Made with ❤
--
--File: [Load]
--
--Copyright (c) 2022 JustGodWork, All Rights Reserved.
--This file is part of JustGodWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
--

Shared.Events:OnNet(Enums.Player.Events.ReceivePlayerData, function(playerData)

    if (playerData and type(playerData) == "table") then

        Client:InitializePlayer(playerData);
        Shared.Events:Trigger(Enums.Player.Events.PlayerLoaded, playerData);
        Shared.Events:ToServer(Enums.Player.Events.PlayerLoaded);

    else

        Shared.Events:Protected(Enums.Player.Events.KickPlayer, "Les données du joueur n'ont pas pu être chargées.");

    end

end);