--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

local identifier
local characters = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" }

function GetIdentifiers(source)
    if (source ~= nil) then
        local identifiers = {}
        local playerIdentifiers = GetPlayerIdentifiers(source)
        for k, v in pairs(playerIdentifiers) do
            local before, after = playerIdentifiers[k]:match("([^:]+):([^:]+)")
            identifiers[before] = playerIdentifiers[k]
        end
        return identifiers
    else
        error("source is nil")
    end
end

---@param playerId number
local function GetFowlmasLaPute(playerId)
  for k, v in ipairs(GetPlayerIdentifiers(playerId)) do
    if string.match(v, 'fivem:') then
      local identifier = string.gsub(v, 'fivem:', '')
      return identifier
    end
  end
  return false
end

function CreateRandomPlateTextForXP()
    local plate = ""
    math.randomseed(GetGameTimer())
    for i = 1, 4 do
        plate = plate .. characters[math.random(1, #characters)]
    end
    plate = plate .. ""
    for i = 1, 4 do
        plate = plate .. math.random(1, 9)
    end
    return plate
end

local RockstarRanks = {800, 2100, 3800, 6100, 9500, 12500, 16000, 19800, 24000, 28500, 33400, 38700, 44200, 50200,56400, 63000, 69900, 77100, 84700, 92500, 100700, 109200, 118000, 127100, 136500, 146200, 156200,166500, 177100, 188000, 199200, 210700, 222400, 234500, 246800, 259400, 272300, 285500, 299000,312700, 326800, 341000, 355600, 370500, 385600, 401000, 416600, 432600, 448800, 465200, 482000,499000, 516300, 533800, 551600, 569600, 588000, 606500, 625400, 644500, 663800, 683400, 703300,723400, 743800, 764500, 785400, 806500, 827900, 849600, 871500, 893600, 916000, 938700, 961600,984700, 1008100, 1031800, 1055700, 1079800, 1104200, 1128800, 1153700, 1178800, 1204200, 1229800,1255600, 1281700, 1308100, 1334600, 1361400, 1388500, 1415800, 1443300, 1471100, 1499100,1527300, 1555800, 1584350}

local function is_int(n)
    if type(n) == "number" then
        if math.floor(n) == n then
            return true
        end
    end
    return false
end

local function GetLevelFromXP(intXPAmount)
    if (is_int(intXPAmount)) then
        local SearchingFor = intXPAmount;
        if (SearchingFor < 0) then
            return 1;
        end
        if SearchingFor < RockstarRanks[99] then
            local CurLevelFound = -1;
            local CurrentLevelScan = 0;
            for k, v in pairs(RockstarRanks) do
                CurrentLevelScan = CurrentLevelScan + 1;
                if (SearchingFor < v) then
                    break;
                end
            end
            return CurrentLevelScan;
        else
            local BaseXP = RockstarRanks[99]
            local ExtraAddPerLevel = 50;
            local MainAddPerLevel = 28550;
            local CurXPNeeded = 0;
            local CurLevelFound = -1;
            for i = 1, 500 - 99, 1 do
                MainAddPerLevel = MainAddPerLevel + 50
                CurXPNeeded = CurXPNeeded + MainAddPerLevel;
                CurLevelFound = i;
                if SearchingFor < (BaseXP + CurXPNeeded) then
                    break;
                end
            end
            return CurLevelFound + 99;
        end
    else
        return 1;
    end
end

local levels = {

    {

        level = 5,
        gift_type = "item",
        gift = "burgerclassique",
        count = 15

    },
    {

        level = 10,
        gift_type = "item",
        gift = "fanta",
        count = 15

    },
    {

        level = 15,
        gift_type = "money",
        gift = 10000

    },
    {

        level = 20,
        gift_type = "car",
        gift = "prairie"

    },
    {

        level = 25,
        gift_type = "item",
        gift = "bandage",
        count = 5

    },
    {

        level = 30,
        gift_type = "car",
        gift = "freecrawler"

    },
    {

        level = 35,
        gift_type = "money",
        gift = 50000

    },
    {

        level = 40,
        gift_type = "coins",
        gift = 250

    },
    {

        level = 45,
        gift_type = "car",
        gift = "toros"

    },
    {

        level = 50,
        gift_type = "money",
        gift = 30000

    },
    {

        level = 55,
        gift_type = "coins",
        gift = 250

    },
    {

        level = 60,
        gift_type = "item",
        gift = "clip",
        count = 10

    },
    {

        level = 65,
        gift_type = "coins",
        gift = 250

    },
    {

        level = 70,
        gift_type = "car",
        gift = "locust"

    },
    {

        level = 75,
        gift_type = "coins",
        gift = 500

    },
    {

        level = 80,
        gift_type = "item",
        gift = "medikit",
        count = 2

    },
    {

        level = 85,
        gift_type = "car",
        gift = "asixbyv"

    },

};

local players = {};

RegisterNetEvent('Exelity:gift', function(level, message)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = GetFowlmasLaPute(source);

    if (identifier) then

        if (xPlayer) then

            if (players[xPlayer.identifier]) then

                if (players[xPlayer.identifier] > level) then 
                    return xPlayer.showNotification("Vous avez déjà reçu cette récompense");
                end

                if (players[xPlayer.identifier] <= level) then

                    local closestReward = levels[1];

                    for i = 2, #levels do
                        if math.abs(levels[i].level - level) < math.abs(closestReward.level - level) then
                            closestReward = levels[i];
                        end
                    end

                    if closestReward.gift_type == 'car' then

                        local plate = CreateRandomPlateTextForXP()
                        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, state, boutique) VALUES (@owner, @plate, @vehicle, @state, @boutique)', {
                            ['@owner']   = xPlayer.identifier,
                            ['@plate']   = plate,
                            ['@vehicle'] = json.encode({ model = GetHashKey(closestReward.gift), plate = plate }),
                            ['@state']   = 1,
                            ['@boutique']  = 1
                        }, function(rowsChange) end)
                        ESX.GiveCarKey(xPlayer, plate);

                    elseif closestReward.gift_type  == 'coins' then

                        MySQL.Async.execute('INSERT INTO tebex_players_wallet (identifiers, transaction, price, currency, points) VALUES (@identifiers, @transaction, @price, @currency, @points)', {
                            ['@identifiers'] = identifier,
                            ['@transaction'] = 'Récompense ExelityPass',
                            ['@price'] = 0,
                            ['@currency'] = 'Points',
                            ['@points'] = closestReward.gift
                        }, function(rowsChange) end)

                    elseif closestReward.gift_type  == 'money' then

                        xPlayer.addAccountMoney('cash', closestReward.gift);

                    elseif closestReward.gift_type == 'item' then

                        xPlayer.addInventoryItem(closestReward.gift, closestReward.count);

                    end

                    MySQL.Async.execute("UPDATE calendar SET palier = palier + 5 WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier}, function() end)
                    players[xPlayer.identifier] = players[xPlayer.identifier] + 5;
                    TriggerClientEvent("esx:showAdvancedNotification", xPlayer.source, "Notification", "Exelity", "Vous avez récupérer votre récompense !","CHAR_KIRINSPECTEUR", 7);

                end

            end

        end

    else
        xPlayer.showNotification("Vous n'avez pas lier votre FiveM");
    end
end)

ESX.RegisterServerCallback("Exelity:getPalier", function(source, cb)
    if source then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            cb(players[xPlayer.identifier]);
        end
    end
end)

AddEventHandler('esx:playerLoaded', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if (xPlayer) then

        MySQL.Async.fetchAll('SELECT * FROM calendar WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier,
        }, function(result)
            if #result == 0 then
                MySQL.Async.execute('INSERT INTO calendar (identifier,palier) VALUES (@identifier,@palier)', {
                    ['@identifier'] = xPlayer.identifier,
                    ['@palier'] = 0,
                });
                players[xPlayer.identifier] = 0
            else
                players[xPlayer.identifier] = tonumber(result[1].palier);
            end
        end);
        
    end
end);

AddEventHandler("esx:playerDropped", function(src)
    local xPlayer = ESX.GetPlayerFromId(src);
    if (xPlayer) then
        players[xPlayer.identifier] = nil;
    end
end);