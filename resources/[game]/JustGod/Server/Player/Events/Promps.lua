--[[
----
----Created Date: 11:52 Wednesday December 21st 2022
----Author: JustGod
----Made with ❤
----
----File: [Promps]
----
----Copyright (c) 2022 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

Shared.Events:OnNet(Enums.Prompt.RequestCanceled, function(_, targetId)

    local xPlayer = Server:ConvertToPlayer(targetId);

    if (xPlayer) then

        xPlayer.showNotification(Shared.Lang:Translate("prompt_canceled"));

    end

end);