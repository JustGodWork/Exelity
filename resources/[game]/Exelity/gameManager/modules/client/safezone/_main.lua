---
--- @author Azagal
--- Create at [01/11/2022] 11:30:14
--- Current project [Exelity-V1]
--- File name [_main]
---

SafeZone = {}

SafeZone.Config = {
    zoneRadius = 80.0,
    zoneList = {
        vector3(-1022.3753662109, -1519.6036376953, 5.5926523208618), -- Location/Spawn
        vector3(-809.9879, -1233.844, 7.337429), -- Pillbox
        vector3(228.98168945312,-790.67102050781,30.653341293335), -- Parking central
        vector3(438.0693, -982.0328, 30.68982), -- LSPD
        vector3(-204.93988037109,-1325.7008056641,30.913440704346), -- Bennys
        vector3(-540.7065, -212.2937, 38.44693), -- Gouv
        vector3(-1145.9891357422, 2664.0676269531, 18.093925476074), -- Military Garage
        vector3(-1248.0510253906, -386.14599609375, 37.289386749268), -- Bloods Garage
        vector3(-1241.3333740234, -3384.5712890625, 13.940160751343), -- Garage Avions
        vector3(-508.57357788086, -615.86755371094, 30.298349380493), -- Garage Central
        vector3(1874.6398925781, 2604.7099609375, 45.665637969971), -- Prison
        vector3(-235.41947937012, 6196.2963867188, 31.489402770996), -- Fourriere Nord
        vector3(118.26570892334, 6612.0317382813, 31.879596710205), -- Garage Nord
        vector3(892.86, -44.15121, 78.76414), -- Garage Casino
        vector3(-949.01086425781, -2959.9016113281, 13.945072174072), -- Concess Avions
        vector3(1648.7218017578, 3800.6572265625, 34.876731872559), -- Fourriere Sandy
        vector3(1730.9228515625, 3718.5639648438, 34.079925537109), -- Garage Sandy
        vector3(409.31594848633, -1634.431640625, 29.291929244995), -- Fourriere Central
        vector3(-941.51690673828, -2449.4592285156, 13.830653190613), -- Garage Airport
        vector3(407.96, -1636.13, 29.29), -- Fouriere Ville
        vector3(1756.865, 2485.76, 45.81), -- prsion interior
        vector3(-792.03, -221.2418, 37.25197), -- Concess Voitures
        vector3(-1677.8673095703, 65.642913818359, 63.93684387207), -- Garage Tenis
        vector3(-332.5471, -109.845, 39.0139), --LS Custom
        vector3(-1388.49, -583.1382, 30.21091), --Bahamas
        { x = 4987.118, y = -5712.377, z = 19.88021 , isPVP = true, radius = 10 }, -- Cayo Perico (PVP)
    },
    disabledKeys = {
        {group = 2, key = 37, message = "~s~Il est impossible de sortir une arme dans cet endroit."},
        {group = 0, key = 24, message = "~s~Il est impossible d'engager un combat dans cet endroit."},
        {group = 0, key = 69, message = "~s~Il est impossible d'engager un combat dans cet endroit."},
        {group = 0, key = 92, message = "~s~Il est impossible d'engager un combat dans cet endroit."},
        {group = 0, key = 106, message = "~s~Il est impossible d'engager un combat dans cet endroit."},
        {group = 0, key = 168, message = "~s~Il est impossible d'engager un combat dans cet endroit."},
        {group = 0, key = 160, message = "~s~Il est impossible d'engager un combat dans cet endroit."},
        {group = 0, key = 45, message = "~s~Il est impossible d'engager un combat dans cet endroit."},
        {group = 0, key = 25, message = "~s~Il est impossible d'engager un combat dans cet endroit."},
        {group = 0, key = 80, message = "~s~Il est impossible d'engager un combat dans cet endroit."},
        {group = 0, key = 140, message = "~s~Il est impossible d'engager un combat dans cet endroit."},
        {group = 0, key = 250, message = "~s~Il est impossible d'engager un combat dans cet endroit."},
        {group = 0, key = 263, message = "~s~Il est impossible d'engager un combat dans cet endroit."},
        {group = 0, key = 310, message = "~s~Il est impossible d'engager un combat dans cet endroit."}
    },
    messages = {
        onEntered = "Vous entrez dans une zone sécurisé.",
        onExited = "Vous sortez d'une zone sécurisé."
    },
    bypassJob = {
        active = true,
        list = {
            ["police"] = true,
            ["gouv"] = true,
            ["bcso"] = true,
            ["fib"] = true,
        }
    }
}