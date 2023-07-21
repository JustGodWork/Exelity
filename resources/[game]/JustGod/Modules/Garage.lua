--
--Created Date: 21:19 12/12/2022
--Author: JustGod
--Made with ❤
--
--File: [Garage]
--
--Copyright (c) 2022 JustGodWork, All Rights Reserved.
--This file is part of JustGodWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
--

Config["Garage"] = {}; -- Don't touch this
Config["Garage"]["Blips"] = {}; -- Don't touch this
Config["Garage"]["Vehicles"] = {}; -- Don't touch this

Config["AdvancedNotification"]["GarageSellVehicle"] = {};
Config["AdvancedNotification"]["GarageSellVehicle"]["TextureName"] = "CHAR_DEFAULT";
Config["AdvancedNotification"]["GarageSellVehicle"]["IconType"] = 1;
Config["AdvancedNotification"]["GarageSellVehicle"]["flash"] = true;
Config["AdvancedNotification"]["GarageSellVehicle"]["SaveToBrief"] = false;
Config["AdvancedNotification"]["GarageSellVehicle"]["HudColorIndex"] = 140;

Config["Garage"]["Blips"]["Enabled"] = true;
Config["Garage"]["Blips"]["List"] = {

    ["default"] = {
        label = "Voitures",
        sprite = 357,
        color = 49
    },

    ["boat"] = {
        label = "Bateaux",
        sprite = 356,
        color = 3
    },

    ["plane"] = {
        label = "Avions",
        sprite = 90,
        color = 7
    }

};

Config["Garage"]["Vehicles"]["SpawnLocked"] = true;
Config["Garage"]["Vehicles"]["SpawnIn"] = true;

Config["Garage"]["Zones"] = {

    -- [VEHICLE]

        -- Bennys
        {
            ["Spawn"] = { x = -161.51, y = -1310.45, z = 31.37 },
            ["Out"] = { x = -155.45, y = -1307.8, z = 31.27, heading = 90.71 },
            ["Delete"] = { x = -154.51, y = -1304.22, z = 31.29 }
        },

        -- Central LS
        {
            ["Spawn"] = { x = 215.800, y = -810.057, z = 30.727 },
            ["Out"] = { x = 229.700, y = -800.1149, z = 30.5722, heading = 157.84 },
            ["Delete"] = { x = 223.797, y = -760.415, z = 30.80 }
        },

        -- Sandy
        {
            ["Spawn"] = { x = 1737.59, y = 3710.2, z = 33.14 },
            ["Out"] = { x = 1737.84, y = 3719.28, z = 33.04, heading = 21.22 },
            ["Delete"] = { x = 1722.66, y = 3713.74, z = 33.21 }
        },

        -- Paleto
        {
            ["Spawn"] = { x = 105.359, y = 6613.586, z = 31.3973 },
            ["Out"] = { x = 128.7822, y = 6622.9965, z = 30.7828, heading = 315.01 },
            ["Delete"] = { x = 126.3572, y = 6608.4150, z = 30.8565 }
        },

        -- Prison
        {
            ["Spawn"] = { x = 1846.56, y = 2585.86, z = 44.67 },
            ["Out"] = { x = 1855.11, y = 2592.72, z = 44.67, heading = 274.8 },
            ["Delete"] = { x = 1855.21, y = 2615.3, z = 34.67 }
        },

        -- Cayo Perico
        {
            ["Spawn"] = {x = 4519.7934570312, y = -4515.0595703125, z = 4.4937744140625},
            ["Out"] = {x = 4512.3427734375, y = -4517.1826171875, z = 4.123046875, heading = 22.677164077759},
            ["Delete"] = {x = 4512.3427734375, y = -4517.1826171875, z = 4.123046875}
        },

        -- Richman
        {
            ["Spawn"] = { x = -1677.4064941406, y = 66.392608642578, z = 63.912300109863 },
            ["Out"] = { x = -1670.0708007813, y = 65.420959472656, z = 63.912300109863, heading = 289.063232421875 },
            ["Delete"] = { x = -1679.3759765625, y = 73.71312713623, z = 64.101188659668 }
        },

        -- Vagos
        {
            ["Spawn"] = { x = 722.18328857422, y = -2016.3392333984, z = 29.292125701904 },
            ["Out"] = { x = 725.47436523438, y = -2031.9857177734, z = 29.292125701904, heading = 29.28413772583 },
            ["Delete"] = { x = 717.09851074219, y = -2023.1691894531, z = 29.292053222656 }
        },

        -- Bloods
        {
            ["Spawn"] = { x = -1250.502, y = -396.3816, z = 37.28932 },
            ["Out"] = { x = -1245.31, y = -388.0357, z = 37.28932, heading = 295.95599365234 },
            ["Delete"] = { x = -1254.78, y = -389.3844, z = 37.28938 }
        },

        -- Hospital Ocean
        {
            ["Spawn"] = { x = -1904.457, y = -333.8412, z = 49.4283 },
            ["Out"] = { x = -1896.798, y = -335.5756, z = 49.23235, heading = 321.17831420898 },
            ["Delete"] = { x = -1890.75, y = -340.5831, z = 49.26398 }
        },

        -- Military
        {
            ["Spawn"] = { x = -1148.959, y = 2682.05, z = 18.09392 },
            ["Out"] = { x = -1150.694, y = 2675.76, z = 18.09392, heading = 132.23852539063 },
            ["Delete"] = { x = -1161.74, y = 2671.946, z = 18.09392 }
        },

        -- Garage Rouge
        {
            ["Spawn"] = { x = -505.5041, y = -611.7568, z = 30.29809 },
            ["Out"] = { x = -511.6546, y = -610.9404, z = 30.29809, heading = 351.77667236328 },
            ["Delete"] = { x = -510.2338, y = -596.5022, z = 30.29809 }
        },

        -- Casino
        {
            ["Spawn"] = { x = 892.86, y = -44.15121, z = 78.76414 },
            ["Out"] = { x = 885.0427, y = -40.03032, z = 78.76414, heading = 323.74569702148 },
            ["Delete"] = { x = 897.8321, y = -33.32176, z = 78.76414 }
        },

        -- Airport
        {
            ["Spawn"] = { x = -936.238, y = -2433.057, z = 13.83647 },
            ["Out"] = { x = -924.486, y = -2441.069, z = 13.84149, heading = 122.51920318604 },
            ["Delete"] = { x = -949.6402, y = -2442.867, z = 13.83086 }
        },

        -- Roxwood
        {
            ["Spawn"] = { x = -467.3941, y = 6987.972, z = 24.61792 },
            ["Out"] = { x = -474.5862, y = 6988.146, z = 24.45619, heading = 60.8771 },
            ["Delete"] = { x = -470.2744, y = 6994.675, z =  24.45776 }
        },

        -- Hospital
        {
            ["Spawn"] = { x = -821.34, y = -1267.75, z = 5.150578 },
            ["Out"] = { x = -817.4161, y = -1281.129, z = 5.00039, heading = 256.4479 },
            ["Delete"] = { x = -828.0484, y = -1263.913, z =  5.000388 }
        },

        -- Gouv
        {
            ["Spawn"] = {x = -582.6383, y = -172.3038, z = 37.81154},
            ["Out"] = {x = -573.9974, y = -168.2229, z = 37.35837, heading = 292.87},
            ["Delete"] = {x = -549.5462, y = -157.9245, z = 38.27}
        },

    -- [BOAT]

        -- LS Dock
        {
            ["Type"] = "boat",
            ["Spawn"] = { x = -800.690125, y = -1494.606567, z = 1.578735 },
            ["Out"] = {x = -795.072509765625, y = -1502.3209228515626, z = -0.4263916015625, heading = 104.88188934326},
            ["Delete"] = {x = -795.072509765625, y = -1502.3209228515626, z = -0.4263916015625}
        },

        -- Sandy Dock
        {
            ["Type"] = "boat",
            ["Spawn"] = {x = 1333.3187255859, y = 4270.4702148438, z = 31.487182617188},
            ["Out"] = {x = 1334.61, y = 4264.68, z = 29.86, heading = 87.0},
            ["Delete"] = {x = 1334.61, y = 4264.68, z = 29.86}
        },

        -- Paleto Dock
        {
            ["Type"] = "boat",
            ["Spawn"] = {x = -284.26812744141, y = 6629.0639648438, z = 7.2572021484375},
            ["Out"] = {x = -290.46, y = 6622.72, z = -0.47477427124977, heading = 52.0},
            ["Delete"] = {x = -290.46, y = 6622.72, z = -0.47477427124977}
        },

        -- Cayo Perico Dock
        {
            ["Type"] = "boat",
            ["Spawn"] = {x = 4898.2153320312, y = -5168.9799804688, z = 2.4549560546875},
            ["Out"] = {x = 4893.5341796875, y = -5168.3471679688, z = -0.4263916015625, heading = 337.32284545898},
            ["Delete"] = {x = 4893.5341796875, y = -5168.3471679688, z = -0.4263916015625}
        },

        -- Roxwood Dock
        {
            ["Type"] = "boat",
            ["Spawn"] = {x = -973.2856, y = 6543.582, z = 1.887694},
            ["Out"] = {x = -985.0256, y = 6548.688, z =  -0.3190742, heading = 91.48},
            ["Delete"] = {x = -985.0256, y = 6548.688, z =  -0.3190742,}
        },

    -- [PLANE]

        -- LS
        {
            ["Type"] = "plane",
            ["Spawn"] = {x = -1242.2901611328, y = -3393.1252441406, z = 13.9296875},
            ["Out"] = {x = -1275.4285888672, y = -3388.3779296875, z = 13.9296875, heading = 331.65353393555},
            ["Delete"] = {x = -1275.4285888672, y = -3388.3779296875, z = 13.9296875}
        },

        -- Sandy
        {
            ["Type"] = "plane",
            ["Spawn"] = {x = 1726.6153564453, y = 3291.3361816406, z = 41.17578125},
            ["Out"] = {x = 1707.7846679688, y = 3254.2680664062, z = 41.024169921875, heading = 102.04724884033},
            ["Delete"] = {x = 1707.7846679688, y = 3254.2680664062, z = 41.024169921875}
        },


    -- Cayo Perico
        {
            ["Type"] = "plane",
            ["Spawn"] = {x = 4462.2329101562, y = -4468.6943359375, z = 4.240966796875},
            ["Out"] = {x = 4483.8989257812, y = -4493.419921875, z = 4.1904296875, heading = 102.04724884033},
            ["Delete"] = {x = 4483.8989257812, y = -4493.419921875, z = 4.1904296875}
        }
    

};