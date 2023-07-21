function MenuJetski()
    local main = RageUI.CreateMenu("", "Jetski")
    RageUI.Visible(main, not RageUI.Visible(main))
    Citizen.CreateThread(function()
        while main do
            Citizen.Wait(0)
            RageUI.IsVisible(main, function()
                RageUI.Button("Jetski", "Pour obtenir un jetski", {RightLabel = "~r~250$"}, true, {
                    onSelected = function()
                        TriggerServerEvent('h4ci:locajetski')
                        local veh = CreateVehicle("seashark",-1610.8, -1168.81, 0.59, 110.44,true,false)
                        SetPedIntoVehicle(PlayerPedId(),veh,-1)
                        RageUI.CloseAll()
                    end
                })
            end, function()
            end)
            if not RageUI.Visible(main) then
                main = RMenu:DeleteType('main', true)
            end
        end
    end)
end