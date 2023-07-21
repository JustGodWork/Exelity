local Blips = {
    {
        pos = vector3(473.8957, -104.5717, 63.1577),
        blip = {
            ID = 136, 
            label = "[Entreprise] 252 Entertainment label music", 
            Color = 1, 
            ZoneBlip = false
        }
    },
    {
        pos = vector3(-322.9858, -1970.9514, 66.7998),
        blip = {
            label = "[Public] Maze Bank Arena", 
            ID = 647, 
            Color = 0,
            ZoneBlip = false,
            InfoBlip = false
        },
    },
    {
        pos = vector3(2520.839, -415.0426, 94.12384),
        blip = {
            ID = 419, 
            label = "[Public] FIB", 
            Color = 0, 
            ZoneBlip = true
        }
    },
}

Citizen.CreateThread(function()
    for k,v in pairs(Blips) do
        if v.blip ~= nil then
            local blip = AddBlipForCoord(v.pos)
            SetBlipSprite(blip, v.blip.ID)
            SetBlipScale(blip, 0.6)
            SetBlipColour(blip, v.blip.Color)
            SetBlipAsShortRange(blip, true)
            SetBlipCategory(blip, 8)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.blip.label)
            EndTextCommandSetBlipName(blip)
        end
        if v.blip.ZoneBlip then
            local zoneblip = AddBlipForRadius(v.pos, 1000.0)
            SetBlipSprite(zoneblip, 1)
            SetBlipColour(zoneblip, v.blip.Color)
            SetBlipAlpha(zoneblip, 100)
        end
    end
end)