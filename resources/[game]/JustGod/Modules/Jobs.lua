---
--- @author Kadir#6666
--- Create at [19/05/2023] 09:53:57
--- Current project [Exelity-V1]
--- File name [Jobs]
---

Config["Jobs"] = {}; -- Don't touch this

Config["Jobs"]["Center"] = {

    label = "Centre d'emploi",
    pos = vector3(-267.45495605469, -959.06372070312, 31.217529296875)

};

Config["Jobs"]["List"] = {

    {

        data = {
            name = "taxi",
            label = "Taxi",
            free_access = true
        }

    },

    {

        data = {
            name = "jardinier",
            label = "Jardinier",
            free_access = true
        },

        farm = {

            blip = {
                sprite = 385,
                color = 2
            },

            interact = {

                ped = GetHashKey("s_m_m_gardener_01"),
                coords = vector4(-1348.4703369141, 142.64175415039, 55.424926757812, 124.72441101074)

            },

            pay = {
                min = 180,
                max = 317
            },

            points = {

                help = {

                    blip = {
                        sprite = 11,
                        color = 25,
                        name = "Mauvaise herbe"
                    },

                    text = "arracher les mauvaises herbes"

                },

                action = {
                    timer = 3000,
                    animation = {"missarmenian3_gardener", "idle_a"}
                },

                list = {

                    vector3(-1317.5208740234, 124.50988769531, 57.18310546875),
                    vector3(-1315.5428466797, 125.52527618408, 57.317993164062),
                    vector3(-1311.5736083984, 120.17143249512, 57.11572265625),
                    vector3(-1283.5384521484, 134.24176025391, 57.806640625),
                    vector3(-1280.8483886719, 147.29670715332, 58.328979492188),
                    vector3(-1280.8483886719, 147.29670715332, 58.328979492188)

                }

            }

        }

    },

    {

        data = {
            name = "tacos",
            label = "Tacos",
            free_access = true
        },

        farm = {

            blip = {
                sprite = 208,
                color = 5
            },

            interact = {

                ped = GetHashKey("a_m_m_afriamer_01"),
                coords = vector4(12.76483631134, -1605.6131591797, 28.380981445312, 136.06298828125)

            },

            pay = {
                min = 225,
                max = 400
            },

            points = {

                help = {

                    blip = {
                        sprite = 11,
                        color = 5,
                        name = "Livraison Tacos"
                    },

                    text = "livrer le tacos"

                },

                action = {
                    timer = 2800,
                    animation = {"pickup_object", "pickup_low"}
                },

                list = {

                    vector3(349.64117431641, -1027.8193359375, 29.330722808838),
                    vector3(278.5244140625, -1071.6163330078, 29.439785003662),
                    vector3(72.981979370117, -1027.3178710938, 29.475648880005),
                    vector3(-116.84878540039, -603.35675048828, 36.281078338623),
                    vector3(-58.918254852295, -616.38940429688, 37.356781005859),
                    vector3(-277.68121337891, 282.68505859375, 89.886909484863),
                    vector3(-668.21020507813, -971.59313964844, 22.340837478638),
                    vector3(-569.76446533203, -1047.814453125, 22.326824188232),
                    vector3(114.60526275635, -1038.7124023438, 29.287015914917),
                    vector3(223.19284057617, 372.78314208984, 106.36162567139)

                }

            }

        }

    },

    {

        data = {
            name = "chantier",
            label = "Chantier",
            free_access = true
        },

        farm = {

            blip = {
                sprite = 566,
                color = 44
            },

            interact = {

                ped = GetHashKey("s_m_y_construct_01"),
                coords = vector4(-509.40658569336, -1001.6967163086, 22.534057617188, 79.370079040527)

            },

            pay = {
                min = 275,
                max = 450
            },

            points = {

                help = {

                    blip = {
                        sprite = 11,
                        color = 44,
                        name = "Travail sur chantier"
                    }

                },

                action = {
                    timer = 3500,
                    animation = { "amb@world_human_hammering@male@base", "base" }
                },

                list = {

                    vector3(-492.5294, -1005.513, 28.13171),
                    vector3(-449.08, -998.68, 22.96),
                    vector3(-464.5076, -1000.148, 22.71595),
                    vector3(-465.889, -998.6741, 22.69423),
                    vector3(-464.4124, -997.1024, 22.71765),
                    vector3(-447.649, -997.1122, 22.98477),
                    vector3(-446.2953, -998.5501, 22.00837),
                    vector3(-447.7392, -1000.15, 22.98311)

                }

            }

        }

    }

};