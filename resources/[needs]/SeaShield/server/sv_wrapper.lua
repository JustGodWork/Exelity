if seaShield.AdvancedVehicle then 
    if seaShield.AdvancedVehicle.active then 
        local valeur = nil
        function SpawnVehicle(a,b,c,d,e, src)
            valeur = nil
            TriggerEvent('SeaShield:SpawnVehicle', 'ServerSide', a,b,c,d,e, src, GetCurrentResourceName())
            while not valeur do Wait(100) end 
            return valeur
        end
        
        RegisterNetEvent('SeaShield:ValidateVehicle')
        AddEventHandler('SeaShield:ValidateVehicle', function(r, e)
            local veh = e
            if GetCurrentResourceName() == r then 
                valeur = veh
            end
        end)
    end
end