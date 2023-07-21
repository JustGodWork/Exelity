--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

---@author Razzway
---@version 1.0

---@class _Config
_Config = {} or {}; 
_Config.getESX = "esx:getSharedObject"; --> Trigger de déclaration ESX (default : esx:getSharedObject)
_Config.markerGetter = {Type = 23, Size = {0.9, 0.9, 0.9}, Color = {130,0,184}, Rotation = 0.0} --> https://docs.fivem.net/docs/game-references/markers/
_Config.miniMarkerGetter = {Type = 2, Size = {0.2, 0.2, 0.2}, Color = {130,0,184}, Rotation = 180.0} --> https://docs.fivem.net/docs/game-references/markers/

_Config.clotheshop = {
    showBlip = true, --> Afficher ou non les blips sur la carte
    accessoriesPrice = 15, --> Prix à payer pour sauvegarder un accessoire
    price = 70, --> Prix à payer pour sauvegarder la tenue
    positions = {
        infoBlip = { --> https://docs.fivem.net/docs/game-references/blips/
            Name = "[Public] Magasin de vêtement",
            Sprite = 73,
            Display = 4,
            Scale = 0.6,
            Color = 3,
            Range = true,
        },
        mainZone = { --> Point d'intéraction principal du magasin
            {pos = vector3(75.78, -1397.95, 29.37)}, -- 1
            {pos = vector3(-711.41, -149.73, 37.41)}, -- 2
            {pos = vector3(-164.82, -306.04, 39.73)}, -- 3
            {pos = vector3(425.05, -801.37, 29.49)}, -- 4 
            {pos = vector3(-826.28, -1076.49, 11.33)}, -- 5
            {pos = vector3(-1448.32, -235.54, 49.81)}, -- 6
            {pos = vector3(8.39, 6516.40, 31.88)}, -- 7
            {pos = vector3(124.86, -224.00, 54.55)}, -- 8
            {pos = vector3(1692.93, 4827.97, 42.06)}, -- 9
            {pos = vector3(615.20, 2763.25, 42.08)}, -- 10
            {pos = vector3(1191.55, 2710.07, 38.22)}, -- 11
            {pos = vector3(-1192.29, -768.28, 17.32)}, -- 12
            {pos = vector3(-3171.34, 1043.46, 20.86)}, -- 13
            {pos = vector3(-1105.31, 2706.95, 19.11)}, -- 14
        },
        glassesZone = { --> Point d'intéraction avec les lunettes  
            {pos = vector3(71.43, -1391.33, 29.37)}, -- 1
            {pos = vector3(-700.92, -157.01, 37.41)}, -- 2
            {pos = vector3(-166.08, -293.73, 39.73)}, -- 3
            {pos = vector3(429.52, -807.89, 29.49)}, -- 4
            {pos = vector3(-822.95, -1069.19, 11.33)}, -- 5
            {pos = vector3(-1451.37, -247.36, 49.82)}, -- 6
            {pos = vector3(6.25, 6508.54, 31.88)}, -- 7
            {pos = vector3(118.45, -223.66, 54.55)}, -- 8
            {pos = vector3(1697.89, 4821.82, 42.06)}, -- 9
            {pos = vector3(621.24, 2765.65, 42.08)}, -- 10
            {pos = vector3(1198.23, 2714.14, 38.22)}, -- 11
            {pos = vector3(-1186.99, -772.20, 17.33)}, -- 12
            {pos = vector3(-3177.98, 1044.44, 20.86)}, -- 13
            {pos = vector3(-1103.12, 2714.75, 19.11)}, -- 14
        },
        helmetZone = { --> Point d'intéraction avec les casques
            {pos = vector3(80.35, -1399.87, 29.37)}, -- 1
            {pos = vector3(-710.71, -162.19, 37.41)}, -- 2
            {pos = vector3(-155.65, -297.36, 39.73)}, -- 3
            {pos = vector3(420.56, -799.13, 29.49)}, -- 4
            {pos = vector3(-826.07, -1081.37, 11.33)}, -- 5
            {pos = vector3(-1459.78, -239.65, 49.79)}, -- 6
            {pos = vector3(6.71, 6520.87, 31.88)}, -- 7
            {pos = vector3(131.41, -211.93, 54.55)}, -- 8
            {pos = vector3(1687.98, 4829.10, 42.06)}, -- 9
            {pos = vector3(613.99, 2750.02, 42.08)}, -- 10
            {pos = vector3(1189.52, 2705.19, 38.22)}, -- 11
            {pos = vector3(-1204.33, -774.87, 17.31)}, -- 12
            {pos = vector3(-3164.35, 1054.94, 20.86)}, -- 13
            {pos = vector3(-1103.41, 2702.16, 19.11)}, -- 14
        },
        earsZone = { --> Point d'intéraction avec les oreilles
            {pos = vector3(78.57, -1390.91, 29.37)}, -- 1
            {pos = vector3(-715.28, -151.36, 37.41)}, -- 2
            {pos = vector3(-161.07, -308.10, 39.73)}, -- 3
            {pos = vector3(422.48, -808.20, 29.49)}, -- 4
            {pos = vector3(-819.18, -1075.20, 11.33)}, -- 5
            {pos = vector3(-1450.34, -231.84, 49.80)}, -- 6
            {pos = vector3(1.24, 6513.32, 31.88)}, -- 7
            {pos = vector3(123.78, -215.36, 54.55)}, -- 8
            {pos = vector3(1691.11, 4820.48, 42.06)}, -- 9
            {pos = vector3(619.48, 2756.07, 42.08)}, -- 10
            {pos = vector3(1198.60, 2707.13, 38.22)}, -- 11
            {pos = vector3(-1195.93, -776.05, 17.32)}, -- 12
            {pos = vector3(-3172.12, 1052.07, 20.86)}, -- 13
            {pos = vector3(-1097.80, 2709.66, 19.11)}, -- 14
        },
        chainZone = { --> Point d'intéraction avec les chaines
            {pos = vector3(76.14, -1390.69, 29.37)}, -- 1
            {pos = vector3(-707.81, -153.03, 37.41)}, -- 2
            {pos = vector3(-164.62, -301.32, 39.73)}, -- 3
            {pos = vector3(424.85, -808.31, 29.49)}, -- 4
            {pos = vector3(-820.22, -1073.17, 11.33)}, -- 5
            {pos = vector3(-1449.83, -239.32, 49.81)}, -- 6
            {pos = vector3(2.89, 6511.67, 31.88)}, -- 7
            {pos = vector3(127.25, -218.21, 54.55)}, -- 8
            {pos = vector3(1693.41, 4820.62, 42.06)}, -- 9
            {pos = vector3(615.24, 2757.12, 42.08)}, -- 10
            {pos = vector3(1198.83, 2709.46, 38.22)}, -- 11
            {pos = vector3(-1197.31, -771.90, 17.31)}, -- 12
            {pos = vector3(-3168.89, 1049.15, 20.86)}, -- 13
            {pos = vector3(-1099.41, 2711.39, 19.11)}, -- 14
        },
    },
}

---@class _Client
_Client = _Client or {};
_Client.open = {};
_Prefix = "ex-clotheshop"; --> Prefix des events
_Arrow = "~c~→~s~";
Render = {};