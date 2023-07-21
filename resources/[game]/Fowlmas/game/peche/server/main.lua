local ESX
local fishSafety = {}

TriggerEvent(Config.ESX, function(obj)
    ESX = obj
end)

RegisterNetEvent("startFishing")
AddEventHandler("startFishing", function(fishingZoneId)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local coords = GetEntityCoords(GetPlayerPed(_src))
    local startZone = vector3(2073.23, 4554.31, 31.31)
    if not xPlayer.canCarryItem('saumon', 1) or not xPlayer.canCarryItem('cabillaud', 1) or not xPlayer.canCarryItem('sardine', 1) or not xPlayer.canCarryItem('truite', 1) or not xPlayer.canCarryItem('thon', 1) or not xPlayer.canCarryItem('brochet', 1) then
        TriggerClientEvent("stopFishing", _src, "~r~Vous n'avez pas assez de place dans votre inventaire")
        return
    end
    if xPlayer.getInventoryItem(Config.Peche.fishingRod).count <= 0 then
        TriggerClientEvent("setFishingState", _src, false, "~r~Vous n'avez pas de canne à pêche")
        return
    end
    if fishSafety[_src] == nil then
        fishSafety[_src] = {
            isDoing = false
        }
    end
    if fishSafety[_src].isDoing == true then
        xPlayer.ban(0, '(startFishing first security)');
        return
    end
    fishSafety[_src] = {
        isDoing = true
    }
	if #(coords - startZone) > 30 / 2 then
        xPlayer.ban(0, '(startFishing');
        return
    end
    TriggerClientEvent("startFishing", _src, fishingZoneId, "yes")
    Wait(1000)
    SetTimeout(math.random(1, 20000), function()
        xPlayer = ESX.GetPlayerFromId(_src)
        if not xPlayer then return end
        local reward = Config.Peche.availableFish[math.random(#Config.Peche.availableFish)]
        local rewardCount = 1
        xPlayer.addInventoryItem(reward.name, rewardCount)
        TriggerClientEvent("stopFishing", _src, "Vous avez pêché ~p~"..rewardCount.." ~p~"..reward.label.." ~w~!")
    end)
    fishSafety[_src] = {
        isDoing = false
    }
end)

RegisterNetEvent("sellfishs")
AddEventHandler("sellfishs", function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local total = 0
    for k,v in pairs(Config.Peche.availableFish) do
        local count = xPlayer.getInventoryItem(v.name).count
        if count > 0 then
            xPlayer.removeInventoryItem(v.name, count)
            total = count*(v.price)
        end
    end
    if total <= 0 then
        TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez rien vendu !")
        return
    end
    TriggerClientEvent("esx:showNotification", _src, "~g~Vous avez vendu tous vos poissons pour "..total.."$")
    xPlayer.addAccountMoney('cash', total)
end)