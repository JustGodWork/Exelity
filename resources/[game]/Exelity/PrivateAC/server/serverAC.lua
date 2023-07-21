local webhook = 'https://discord.com/api/webhooks/1026117776676487262/n-S7wKiB9Ccb1fyHng1mHMjkucZRtqLuac9iAkY_4nrE3LUDOiBKwxQKGYyUyTj9zHeH'

ESX.RegisterServerCallback('screenshot:getwebhook', function(source, cb)
    cb('https://discord.com/api/webhooks/1026117776676487262/n-S7wKiB9Ccb1fyHng1mHMjkucZRtqLuac9iAkY_4nrE3LUDOiBKwxQKGYyUyTj9zHeH')
end)

RegisterNetEvent("Fowlmas:TakeScreen")
AddEventHandler("Fowlmas:TakeScreen", function(source)
    TriggerClientEvent('Fowlmas:GetScreen', source)
end)

exports["JustGod"]:RegisterCommand("screen", function(xPlayer, args)

    local target_player = ESX.GetPlayerFromId(tonumber(args[1]))
    if (target_player == nil) then
        return xPlayer ~= nil and xPlayer.showNotification("ID du joueur invalide.") or "ID du joueur invalide."
    elseif (xPlayer ~= nil and not exports["JustGod"]:GroupIsHigher(xPlayer.getGroup(), target_player.getGroup())) then
        return
    end

    PerformHttpRequest(webhook, function()

        for _ = 1, 5 do
            TriggerEvent('Fowlmas:TakeScreen', args[1])
            Wait(1500)
        end

        PerformHttpRequest(webhook, function() end, 'POST', json.encode({username = "Capture de jeu", content = "---- Fin des captures de jeu "..target_player.name.." demandé par "..((xPlayer ~= nil and xPlayer.getName()) or "Console").." ----"}), { ['Content-Type'] = 'application/json' })

    end, 'POST', json.encode({username = "Capture de jeu", content = "---- Début des captures de jeu du joueur "..target_player.name.." demandé par "..((xPlayer ~= nil and xPlayer.getName()) or "Console").." ----"}), { ['Content-Type'] = 'application/json' })

end, {help = "Faire une capture de jeu du joueur", params = {
    {name = "id", help = "Id du joueur"}
}}, {
    inMode = true
});