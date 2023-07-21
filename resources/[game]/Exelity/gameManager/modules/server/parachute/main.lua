--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('parachute:payer')
AddEventHandler('parachute:payer', function(type)
    local price = 138
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local cbposs = xPlayer.getInventoryItem('cb')
    if type == 'cash' then
        if xPlayer.getAccount('cash').money >= price then
            if xPlayer.hasWeapon('GADGET_PARACHUTE') then
                TriggerClientEvent('esx:showNotification', source, "Vous avez déjà un parachute.")
            else               
                xPlayer.removeAccountMoney('cash', price)
                xPlayer.addWeapon('GADGET_PARACHUTE', 42)
            end
        end
    elseif type == 'bank' then
        if cbposs.count > 0 then
            if xPlayer.getAccount('bank').money >= price then
                if xPlayer.hasWeapon('GADGET_PARACHUTE') then
                    TriggerClientEvent('esx:showNotification', source, "Vous avez déjà un parachute.")
                    TriggerClientEvent('shops:removeBank', source)
                else               
                    xPlayer.removeAccountMoney('bank', price)
                    xPlayer.addWeapon('GADGET_PARACHUTE', 42)
                    TriggerClientEvent('addPara', source)
                    TriggerClientEvent('removePara', source)
                end
            end
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, '~p~Vous n\'avez pas de carte bancaire sur vous.')
            TriggerClientEvent('removePara', source)
        end
    end
end)