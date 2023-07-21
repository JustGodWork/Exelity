--
--Created Date: 22:29 12/12/2022
--Author: JustGod
--Made with ❤
--
--File: [Pound]
--
--Copyright (c) 2022 JustGodWork, All Rights Reserved.
--This file is part of JustGodWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
--

Config["Pound"] = {}; -- Don't touch this
Config["Pound"]["Prices"] = {}; -- Don't touch this
Config["Pound"]["Blips"] = {}; -- Don't touch this
Config["Pound"]["Vehicles"] = {}; -- Don't touch this

Config["Pound"]["Prices"]["SpawnVehicle"] = 500; -- Spawn vehicle price
Config["Pound"]["Prices"]["StoreVehicle"] = 750; -- Store vehicle price

Config["Pound"]["Blips"]["Enabled"] = true;
Config["Pound"]["Blips"]["Label"] = "Fourrières";
Config["Pound"]["Blips"]["Sprite"] = 524;
Config["Pound"]["Blips"]["Color"] = 49;

Config["Pound"]["Vehicles"]["SpawnLocked"] = true;
Config["Pound"]["Vehicles"]["SpawnIn"] = true;

Config["Pound"]["Zones"] = {

    --Pound_LosSantos
    {
        ["Menu"] = { x = 374.42, y = -1620.68, z = 29.29 },
        ["Spawn"] = { x = 391.74, y = -1619.0, z = 29.29, heading = 318.34 }
    },

    --Pound_Sandy
    {
        ["Menu"] = { x = 1644.10, y = 3808.20, z = 35.09 },
        ["Spawn"] = { x = 1627.84, y = 3788.45, z = 33.77, heading = 308.53 }
    },

    --Pound_Paleto
    {
        ["Menu"] = { x = -223.6, y = 6243.37, z = 31.49 },
        ["Spawn"] = { x = -230.88, y = 6255.89, z = 30.49, heading = 136.5 }
    },

    --Pound_Concess
    {
        ["Menu"] = { x = -152.603, y = -1175.498, z = 23.724 },
        ["Spawn"] = { x = -141.198, y = -1173.682, z = 23.76, heading = 177.66 }
    },
   
    --Pound_LifeInvader
    {
        ["Menu"] = { x = -1151.388, y = -205.2902, z = 37.95996 },
        ["Spawn"] = { x = -1148.734, y = -219.0661, z = -219.0661, heading = 198.97 }
    }

};