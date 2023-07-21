--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local filter = {accessories = {Chapeau1 = 1, Chapeau2 = 1}}

---@author
---@type function _Client.open:helmetMenu
function _Client.open:helmetMenu()
    local helmetMenu = RageUIClothes.CreateMenu('', 'Voici les articles disponibles')

    helmetMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 44, 0), [2] = "Rotation Droite"})
    helmetMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 51, 0), [2] = "Rotation Gauche"})

    FreezeEntityPosition(PlayerPedId(), true)
    Uclothes:CreateHeadCam()

    RageUIClothes.Visible(helmetMenu, (not RageUIClothes.Visible(helmetMenu)))

    while helmetMenu do
        Wait(0)
        RageUIClothes.IsVisible(helmetMenu, function()
            local Chapeau1 = {} for i = 0 , GetNumberOfPedPropDrawableVariations(PlayerPedId(), 0)-1, 1 do Chapeau1[i] = i end
            local Chapeau2 = {} for i = 0 , GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, filter.accessories.Chapeau1) - 1, 1 do Chapeau2[i] = i end
            local desc = "Appuyez sur la touche ~h~ENTRER~h~ pour choisir un numéro"
            RageUIClothes.Line()
            RageUIClothes.List('Casque 1', Chapeau1, filter.accessories.Chapeau1, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.accessories.Chapeau1 = Index filter.accessories.Chapeau2 = 1 TriggerEvent('skinchanger:change', 'helmet_1', filter.accessories.Chapeau1 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.accessories.Chapeau1 = result TriggerEvent('skinchanger:change', 'helmet_1', filter.accessories.Chapeau1 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
            RageUIClothes.List('Casque 2', Chapeau2, filter.accessories.Chapeau2, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.accessories.Chapeau2 = Index TriggerEvent('skinchanger:change', 'helmet_2', filter.accessories.Chapeau2 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.accessories.Chapeau2 = result TriggerEvent('skinchanger:change', 'helmet_2', filter.accessories.Chapeau2 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
            RageUIClothes.Button(('Valider les changements (%s$)'):format(_Config.clotheshop.accessoriesPrice), nil, { Color = { BackgroundColor = { 0, 140, 0, 160 } } }, true, {
                onActive = function() Uclothes:OnRenderCam() end,
                onSelected = function()
                    TriggerServerEvent(_Prefix..':accessories:pay')
                    Wait(180)
                    RageUIClothes.CloseAll()
                end
            })
        end)

        if not RageUIClothes.Visible(helmetMenu) then
            helmetMenu = RMenuClothes:DeleteType('helmetMenu', true)
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
            Wait(180)
            FreezeEntityPosition(PlayerPedId(), false)
            Uclothes:KillCam()
        end
    end
end