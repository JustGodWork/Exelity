Config["Shops"] = {};
Config["Shops"].list = {
    {
        label = "Supérette",
        categories = {
            ["food"] = { label = "Nourriture", placement = 1 },
            ["drink"] = { label = "Boisson", placement = 2 },
            ["objects"] = { label = "Objets", placement = 3 }

        },
        items = {
            ["bread"] = {
                cat = "food",
                label = "Pain",
                price = 15
            },

            ["water"] = {
                cat = "drink",
                label = "Bouteille d'eau",
                price = 8
            },

            ["phone"] = {
                cat = "objects",
                label = "Téléphone",
                price = 1200
            },

            ["fishingrod"] = {
                cat = "objects",
                label = "Canne à pêche",
                price = 300
            },

            ["cofee"] = {
                cat = "vip",
                label = "Café",
                price = 150
            },

            ["donuts"] = {
                cat = "vip",
                label = "Donuts",
                price = 200
            }
        },
        positions = {
            vector3(373.87, 325.89, 103.36),
            vector3(2557.45, 382.28, 108.42),
            vector3(-3038.93, 585.95, 7.7),
            vector3(-3241.92, 1001.46, 12.63),
            vector3(547.43, 2671.71, 41.95),
            vector3(1961.46, 3740.67, 32.14),
            vector3(1729.21, 6414.13, 34.83),
            vector3(2678.91, 3280.67, 55.04),
            vector3(1135.8, -982.28, 46.21),
            vector3(-1222.91, -906.98, 12.12),
            vector3(-1487.55, -379.10, 39.96),
            vector3(-707.5, -914.26, 19.01),
            vector3(-1820.52, 792.51, 137.91),
            vector3(1698.38, 4924.40, 41.86),
            vector3(26.57, -1347.26, 29.49),
            vector3(-48.58, -1756.82, 29.42)
        }
    },
    {
        label = "Ammu-Nation",
        blip = {
            sprite = 110,
            display = 4,
            scale = 0.6,
            color = 1,
            range = true
        },
        categories = {
            ["letal"] = { label = "Létale", placement = 1, licenses = { "weapon" } },
            ["melee"] = { label = "Mêlée", placement = 2 },
            ["accessories"] = { label = "Accessoires", placement = 3 }
        },
        items = {

            ["weapon"] = {
                type = "license",
                label = "Permis port d'armes",
                price = 150000
            },

            ["weapon_knife"] = {
                type = "weapon",
                cat = "melee",
                label = "Couteau",
                price = 5000
            },
            ["weapon_bat"] = {
                type = "weapon",
                cat = "melee",
                label = "Batte de baseball",
                price = 7500
            },
            ["weapon_machete"] = {
                type = "weapon",
                cat = "melee",
                label = "Machette",
                price = 10000
            },

            ["weapon_snspistol"] = {
                type = "weapon",
                cat = "letal",
                label = "Pétoire",
                price = 130000
            },
            ["weapon_pistol"] = {
                type = "weapon",
                cat = "letal",
                label = "Pistolet",
                price = 180000
            },

            ["clip"] = {
                cat = "accessories",
                label = "Chargeur",
                price = 2500
            }

        },
        positions = {
            vector3(-662.4192, -935.4647, 21.82921),
            vector3(810.5966, -2157.017, 29.61898),
            vector3(1693.578, 3759.426, 34.7053),
            vector3(-330.4556, 6083.456, 31.45476),
            vector3(251.9472, -49.86555, 69.94102),
            vector3(21.82369, -1107.19, 29.797),
            vector3(2568.004, 294.5252, 108.7348),
            vector3(-1117.884, 2698.496, 18.55412),
            vector3(842.4682, -1033.3, 28.19486),
            vector3(-1305.939, -394.0775, 36.69574)
        }
    }
}