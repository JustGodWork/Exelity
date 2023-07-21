--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

pSocietyCFG = {

    --[[ Script  ]]

    Language = "fr",

    ESX = Config.Get.ESX,
    AddonAccount = "esx_addonaccount:getSharedAccount",
    BlackMoney = "dirtycash",

    --[[ Menu  ]]

    Title = "",

    SubTitle = "~p~Gestion de votre entreprise",

    Banner = {
        Display = true,
        Texture = nil,
        Name = nil,
    },

    Marker = {
        Type = 6,
        Scale = {0.9, 0.9, 0.9},
        Color = {243, 255, 0},
    },

    --[[ Zone ]]

    Zone = {

        {
            pos = vector3(463.1193, -985.3953, 30.72808),
            name = "police",
            label = "Los Santos Police Departement",
            salary_max = 10000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-432.9886, 6006.41, 36.99565),
            name = "bcso",
            label = "Blaine County Sheriff Office",
            salary_max = 10000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-784.8987, -1244.977, 7.33743),
            name = "ambulance",
            label = "Los Santos EMS",
            salary_max = 10000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-797.7018, -198.8625, 37.47291),
            name = "cardealer",
            label = "Los Santos Concessionaire",
            percent = 20,
            salary_max = 10000,
            options = {
                money = true, 
                wash = true, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-900.6223, 6684.6, 3.229779),
            name = "boatseller",
            label = "Los Santos Concessionaire Beneteau",
            salary_max = 10000,
            percent = 20,
            options = {
                money = true, 
                wash = true, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-948.5, -2935.2, 13.9),
            name = "planeseller",
            label = "Los Santos Concession Aéronautique",
            salary_max = 10000,
            percent = 20,
            options = {
                money = true, 
                wash = true, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(4.085346, -659.9034, 33.45057),
            name = "brinks",
            label = "Group 6",
            salary_max = 10000,
            percent = 20,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-194.5972, -1314.95, 31.30048),
            name = "mecano",
            label = "Mécano",
            salary_max = 10000,
            percent = 20,
            options = {
                money = true, 
                wash = true, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(94.299179077148, -1293.2200927734, 29.263526916504),
            name = "unicorn",
            label = "Vanilla Unicorn",
            percent = 20,
            salary_max = 10000,
            options = {
                money = true, 
                wash = true, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-1192.176, -903.399, 13.99895),
            name = "burgershot",
            label = "BurgerShot",
            percent = 20,
            salary_max = 10000,
            options = {
                money = true, 
                wash = true, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-1602.101, -838.1042, 10.27275),
            name = "taxi",
            label = "Taxi",
            percent = 20,
            salary_max = 10000,
            options = {
                money = true,
                wash = true,
                employees = true,
                grades = true
            },
        },

        {
            pos = vector3(-1900.308, 2068.858, 141.0207),
            name = "vigneron",
            label = "Vigneron",
            percent = 20,
            salary_max = 10000,
            options = {
                money = true, 
                wash = true, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-350.9336, -129.7019, 43.13554),
            name = "mecano2",
            label = "LS Custom",
            percent = 20,
            salary_max = 10000,
            options = {
                money = true, 
                wash = true, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-586.7568, -209.5399, 42.83656),
            name = "gouv",
            label = "Gouvernement",
            percent = 20,
            salary_max = 10000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-773.3972, -627.298, 30.26001),
            name = "avocat",
            label = "Avocat",
            percent = 20,
            salary_max = 10000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-510.0521, 278.413, 83.30597),
            name = "gophone",
            label = "GoPhone",
            percent = 20,
            salary_max = 10000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(2831.494, 2798.841, 57.5326),
            name = "mine_dlcx",
            label = "Mine DLCX",
            percent = 20,
            salary_max = 10000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-2010.8, 591.6393, 117.9069),
            name = "nvidia",
            label = "Nvidia",
            percent = 20,
            salary_max = 10000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-1029.534, 6660.872, 5.679898),
            name = "roxsherif",
            label = "Rockwood Sheriff Department",
            salary_max = 10000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },

        {
            pos = vector3(-1371.083, -627.97, 30.35842),
            name = "bahamas",
            label = "Bahamas",
            salary_max = 10000,
            options = {
                money = true, 
                wash = false, 
                employees = true, 
                grades = true
            },
        },
        
    },
}