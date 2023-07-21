ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

ESX.RegisterServerCallback('Menu-Props:getUsergroup', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    print(GetPlayerName(source).." - "..group)
    cb(group)
end)

RegisterServerEvent('Menu-Props:SpawnObject')
AddEventHandler('Menu-Props:SpawnObject', function(model)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.getGroup() == 'founder' or xPlayer.getGroup() == 'founder' then
        TriggerClientEvent('Menu-Props:SpawnObject', src, model)
    else
        xPlayer.ban(0, 'Menu-Props')
    end
end)

