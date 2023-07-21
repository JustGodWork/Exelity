--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local filter = {accessories = {Oreille1 = 1, Oreille2 = 1}}

---@author
---@type function _Client.open:earsMenu
function _Client.open:earsMenu()
    local earsMenu = RageUIClothes.CreateMenu('', 'Voici les articles disponibles')

    earsMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 44, 0), [2] = "Rotation Droite"})
    earsMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 51, 0), [2] = "Rotation Gauche"})

    FreezeEntityPosition(PlayerPedId(), true)
    Uclothes:CreateHeadCam()

    RageUIClothes.Visible(earsMenu, (not RageUIClothes.Visible(earsMenu)))

    while earsMenu do
        Wait(0)
        RageUIClothes.IsVisible(earsMenu, function()
            local Oreille1 = {} for i = 0 , GetNumberOfPedPropDrawableVariations(PlayerPedId(), 1)-1, 1 do Oreille1[i] = i end
            local Oreille2 = {} for i = 0 , GetNumberOfPedPropTextureVariations(PlayerPedId(), 1, filter.accessories.Oreille1) - 1, 1 do Oreille2[i] = i end
            local desc = "Appuyez sur la touche ~h~ENTRER~h~ pour choisir un numéro"
            RageUIClothes.Line()
            RageUIClothes.List('Accessoire d\'oreille 1', Oreille1, filter.accessories.Oreille1, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.accessories.Oreille1 = Index filter.accessories.Oreille2 = 1 TriggerEvent('skinchanger:change', 'ears_1', filter.accessories.Oreille1 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.accessories.Oreille1 = result TriggerEvent('skinchanger:change', 'ears_1', filter.accessories.Oreille1 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
            RageUIClothes.List('Accessoire d\'oreille 2', Oreille2, filter.accessories.Oreille2, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.accessories.Oreille2 = Index TriggerEvent('skinchanger:change', 'ears_2', filter.accessories.Oreille2 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.accessories.Oreille2 = result TriggerEvent('skinchanger:change', 'ears_2', filter.accessories.Oreille2 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
            RageUIClothes.Button(('Valider les changements (%s$)'):format(_Config.clotheshop.accessoriesPrice), nil, { Color = { BackgroundColor = { 0, 140, 0, 160 } } }, true, {
                onActive = function() Uclothes:OnRenderCam() end,
                onSelected = function()
                    TriggerServerEvent(_Prefix..':accessories:pay')
                    Wait(180)
                    RageUIClothes.CloseAll()
                end
            })
        end)

        if not RageUIClothes.Visible(earsMenu) then
            earsMenu = RMenuClothes:DeleteType('earsMenu', true)
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
            Wait(180)
            FreezeEntityPosition(PlayerPedId(), false)
            Uclothes:KillCam()
        end
    end
end