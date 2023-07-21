---
--- @author Azagal
--- Create at [23/10/2022] 20:25:30
--- Current project [Exelity-V1]
--- File name [addMoney]
---

RegisterNetEvent("Bank:addMoney", function(money)
    local playerSrc = source

    local xPlayer = ESX.GetPlayerFromId(playerSrc)
    if (not xPlayer) then
        return
    end

    if (xPlayer.getAccount("cash").money >= money) then
        xPlayer.removeAccountMoney("cash", money)
        xPlayer.addAccountMoney("bank", money)
        xPlayer.showNotification("Vous avez déposé "..money.."~g~$~s~.")
    else
        xPlayer.showNotification("~r~Vous n'avez pas cette somme sur vous.")
    end
end)