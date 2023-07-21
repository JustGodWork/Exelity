---
--- @author Azagal
--- Create at [01/11/2022] 20:15:54
--- Current project [Exelity-V1]
--- File name [_main]
---

Helipad = {}
Helipad.Config = {
    ["ambulance"] = {
        menuPosition = vector3(-791.3054, -1191.515, 53.02703),
        spawnPosition = vector4(-791.3054, -1191.515, 53.02703, 310.385),
        deletePosition = vector3(-791.3054, -1191.515, 53.02703),
        models = {
            "emsswift"
        }
    },
    ["police"] = {
        menuPosition = vector3(623.5468, -1.534391, 99.42089),
        spawnPosition = vector4(631.2805, 3.550975, 99.42099, 247.823),
        deletePosition = vector3(631.2805, 3.550975, 99.42099),
        models = {
            "polmav2"
        }
    },
    ["bcso"] = {
        menuPosition = vector3(-493.2645, 5993.802, 31.29724),
        spawnPosition = vector4(-475.8103, 5987.935, 31.33647, 313.043),
        deletePosition = vector3(-475.8103, 5987.935, 31.33647),
        models = {
            "polmav"
        }
    },
    ["roxsherif"] = {
        menuPosition = vector3(-1006.055, 6659.674, 3.174594),
        spawnPosition = vector4(-1015.121, 6655.747, 3.166682, 76.450),
        deletePosition = vector3(-1015.121, 6655.747, 3.166682),
        models = {
            "roxpolmav"
        }
    },
    playerLoad = {}
}

RegisterNetEvent("Helipad:Request:LoadConfig", function()
    local _src = source

    local xPlayer = ESX.GetPlayerFromId(_src)
    if (xPlayer ~= nil) then
        if (Helipad.Config.playerLoad[_src] == nil) then
            Helipad.Config.playerLoad[_src] = true
        else
            return
        end

        xPlayer.triggerEvent("Helipad:ClientReturn:Config", Helipad.Config)
    end
end)