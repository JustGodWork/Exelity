ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterServerEvent('Studio:annonce')
AddEventHandler('Studio:annonce', function(annonce)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], '~r~Annonce', '~r~Rockford-Studio', annonce, 'CHAR_studio', 8)
    end
end)
