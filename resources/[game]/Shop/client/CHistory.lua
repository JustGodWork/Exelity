local History = {}
function OpenHistoryMenu()
    local BoutiqueSub =  RageUI.CreateMenu("Boutique Exelity", "Bienvenue sur notre boutique")

    ESX.TriggerServerCallback('ewen:getHistory', function(result)
        History = result;
    end)
    RageUI.Visible(BoutiqueSub, not RageUI.Visible(BoutiqueSub))
    while BoutiqueSub do
        Wait(0)
        RageUI.IsVisible(BoutiqueSub, function()
            for _,v in pairs(History) do 
                if tonumber(v.price) ~= 0 then
                    RageUI.Button(v.transaction .. ' ['..v.points..']', nil, {RightLabel = v.price..'€'}, true, {
                        onSelected = function()
                        end
                    })
                else
                    RageUI.Button(v.transaction, nil, {RightLabel = v.points..''}, true, {
                        onSelected = function()
                        end
                    })
                end
            end
        end)
        if not RageUI.Visible(BoutiqueSub) then
            BoutiqueSub = RMenu:DeleteType('BoutiqueSub', true)
            Wait(100)
            OpenMenuMain()
        end
    end
end