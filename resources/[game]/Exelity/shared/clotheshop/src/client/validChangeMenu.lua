--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local level = 10;
local msg = "Votre garde-robe est pleine, veuillez vous procurer le VIP ~y~GOLD~w~ ou ~b~Diamond~w~ pour l'agrandir."

RegisterNetEvent('shops:setStatVip', function(call)

    if (call == 0) or (call == 1) then 
        level = 10;
    elseif (call == 2) then
        level = 20;
        msg = "Votre garde-robe est pleine, veuillez vous procurer le VIP ~b~Diamond~w~ pour l'agrandir."
    elseif (call == 3) then
        level = 35;
        msg = "Votre garde-robe est pleine."
    end

end);

---@author Razzway
---@type function Render:validChangeMenu
function Render:validChangeMenu()
    RageUIClothes.Line()
    RageUIClothes.Button('Oui', nil, {}, true, {
        onActive = function() Uclothes:OnRenderCam() end,
        onSelected = function()

            if (#_Razzway.Data < level) then 
                
                local nameTenue = Uclothes:input('Spécifiez le nom de la tenue :');

                if (nameTenue == "" or nameTenue == nil) then
                    ESX.ShowNotification("~r~Attention !~s~\nVous devez attitré un nom à votre tenue pour pouvoir la sauvegarder")
                else

                    TriggerEvent('skinchanger:getSkin', function(saveAppearance)
                        TriggerServerEvent(_Prefix..":saveData", "outfit", nameTenue, saveAppearance)
                        ESX.ShowNotification('~p~Vêtement~s~\nVous avez ~g~enregistré~s~ une nouvelle tenue : ~p~'..nameTenue)
                    end);
                    _Razzway:refreshData();
                    RageUIClothes.CloseAll();

                end

            else
                ESX.ShowNotification(msg)
            end

        end
    })
    RageUIClothes.Button('Non', nil, {}, true, {
        onActive = function() Uclothes:OnRenderCam() end,
        onSelected = function()
            RageUIClothes.CloseAll()
        end
    })
end