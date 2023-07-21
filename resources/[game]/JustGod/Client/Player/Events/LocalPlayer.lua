---
--- @author Kadir#6666
--- Create at [26/04/2023] 00:26:31
--- Current project [Exelity-V1]
--- File name [LocalPlayer]
---

Shared.Events:OnNet(Enums.Player.Events.LoadSkin, function(skin)

    if (skin == nil) then
        return
    end

    return Client.Player:LoadSkin(skin)

end)

Shared.Events:OnNet(Enums.Player.Events.SetWaypoint, function(position)

    if (type(position) ~= "vector3") then
        return
    end

    SetNewWaypoint(position.x, position.y)
    ESX.ShowNotification("Votre GPS a été actualisé.")

end)