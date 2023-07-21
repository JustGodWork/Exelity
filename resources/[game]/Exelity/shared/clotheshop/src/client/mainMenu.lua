--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

---@author Razzway
---@type function _Client.open:clothesMenu
function _Client.open:clothesMenu()
    local clothesMenu = RageUIClothes.CreateMenu('', 'Que souhaitez-vous faire ?')
    local myDressing = RageUIClothes.CreateSubMenu(clothesMenu, '','Mes tenues enregistrées')
    local changeMenu = RageUIClothes.CreateSubMenu(clothesMenu, '', 'Changez de style vestimentaire')
    local validChangeMenu = RageUIClothes.CreateSubMenu(changeMenu, '', 'Voulez vous enregistrer cette tenue ?')

    clothesMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 44, 0), [2] = "Rotation Droite"})
    clothesMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 51, 0), [2] = "Rotation Gauche"})

    myDressing:AddInstructionButton({[1] = GetControlInstructionalButton(0, 44, 0), [2] = "Rotation Droite"})
    myDressing:AddInstructionButton({[1] = GetControlInstructionalButton(0, 51, 0), [2] = "Rotation Gauche"})

    changeMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 44, 0), [2] = "Rotation Droite"})
    changeMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 51, 0), [2] = "Rotation Gauche"})

    validChangeMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 44, 0), [2] = "Rotation Droite"})
    validChangeMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 51, 0), [2] = "Rotation Gauche"})

    Uclothes:loadPlayerAnime()
    Uclothes:CreatePlayerCam()
    FreezeEntityPosition(PlayerPedId(), true)

    RageUIClothes.Visible(clothesMenu, (not RageUIClothes.Visible(clothesMenu)))

    while clothesMenu do
        Wait(0)
        RageUIClothes.IsVisible(clothesMenu, function()
            RageUIClothes.Line()
            RageUIClothes.Button('Mon dressing', nil, {RightLabel = "→"}, true, {
                onActive = function() Uclothes:OnRenderCam() end,
                onSelected = function()
                    _Razzway:refreshData()
                end
            }, myDressing)
            RageUIClothes.Button('Se changer', nil, {RightLabel = "→"}, true, {onActive = function() Uclothes:OnRenderCam() end}, changeMenu)
            RageUIClothes.Button(('Valider les changements (%s$)'):format(_Config.clotheshop.price), nil, { Color = { BackgroundColor = { 0, 140, 0, 160 } } }, true, {
                onActive = function() Uclothes:OnRenderCam() end,
                onSelected = function()
                    TriggerServerEvent(_Prefix..':outfit:pay')
                    Wait(180)
                end
            }, validChangeMenu)
        end)

        RageUIClothes.IsVisible(myDressing, function()
            _Razzway:refreshData()
            Render:myDressingMenu()
        end)

        RageUIClothes.IsVisible(changeMenu, function()
            Render:changeMenu()
        end)

        RageUIClothes.IsVisible(validChangeMenu, function()
            Render:validChangeMenu()
        end)

        if not RageUIClothes.Visible(clothesMenu)
            and not RageUIClothes.Visible(myDressing)
            and not RageUIClothes.Visible(changeMenu)
            and not RageUIClothes.Visible(validChangeMenu)
            then
            clothesMenu = RMenuClothes:DeleteType('clothesMenu', true)
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
            Wait(180)
            FreezeEntityPosition(PlayerPedId(), false)
            Uclothes:KillCam()
        end
    end
end