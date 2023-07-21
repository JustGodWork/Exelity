ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


CreateThread(function()
    while true do
        TriggerClientEvent('ui:update', -1, GetNumPlayerIndices())
        Wait(10500)
    end
end)

RegisterServerEvent('rHud:getInfo', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    TriggerClientEvent('ui:update', -1, GetNumPlayerIndices())

    if (xPlayer) then

        local xMoney = xPlayer.getAccount('cash').money
        local xDirty = xPlayer.getAccount('dirtycash').money

        TriggerClientEvent("rHud:setInfo", _source, xMoney, xDirty)

    end
end)