--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

---@author Razzway
---@version 3.0
---@type function _Client.open:creatoRMenuClothes
function _Client.open:creatoRMenuClothes()
    local creatoRMenuClothes = RageUIClothes.CreateMenu("", "Faites votre personnage")
    local myAppearanceMenu = RageUIClothes.CreateSubMenu(creatoRMenuClothes, "", "Mon apparence")
    local myOutfitMenu = RageUIClothes.CreateSubMenu(creatoRMenuClothes, "", "Choisir une tenue")

    creatoRMenuClothes:AddInstructionButton({[1] = GetControlInstructionalButton(0, 44, 0), [2] = __["right_rotation"]})
    creatoRMenuClothes:AddInstructionButton({[1] = GetControlInstructionalButton(0, 51, 0), [2] = __["left_rotation"]})

    myAppearanceMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 44, 0), [2] = __["right_rotation"]})
    myAppearanceMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 51, 0), [2] = __["left_rotation"]})

    myOutfitMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 44, 0), [2] = __["right_rotation"]})
    myOutfitMenu:AddInstructionButton({[1] = GetControlInstructionalButton(0, 51, 0), [2] = __["left_rotation"]})

    creatoRMenuClothes.Closable = false;
    myAppearanceMenu.EnableMouse = true;

    RageUIClothes.Visible(creatoRMenuClothes, (not RageUIClothes.Visible(creatoRMenuClothes)))
    UtilsCreator:CreatePlayerCam()
    UtilsCreator:loadPlayerAnime()

    local filter = {
        sex = {index = 1},
        face = {index = 1},
        skin= {index = 1},
    }

    while creatoRMenuClothes do
        Wait(0)

        RageUIClothes.IsVisible(creatoRMenuClothes, function()
            FreezeEntityPosition(PlayerPedId(), true)
            local Face = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46}
            local Skin = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46}
            RageUIClothes.Line()
            RageUIClothes.List(("%s"..__["sex"]):format(arrow), {
                {Name = "Homme", Value = "homme"},
                {Name = "Femme", Value = "femme"},
            }, filter.sex.index, nil, {}, nil, {
                onActive = function() UtilsCreator:OnRenderCam() end,
                onListChange = function(Index, Item)
                    filter.sex.index = Index;
                    if Item.Value == "femme" then
                        TriggerEvent(CreatorConfig.events.skinchanger..':change', 'sex', 1)
                        Citizen.Wait(100)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerEvent('skinchanger:loadClothes', skin, {['bags_1'] = 0, ['bags_2'] = 0, ['tshirt_1'] = 14, ['tshirt_2'] = 0, ['torso_1'] = 683, ['torso_2'] = 0, ['arms'] = 15, ['pants_1'] = 345, ['pants_2'] = 0, ['shoes_1'] = 134, ['shoes_2'] = 2, ['mask_1'] = 0, ['mask_2'] = 0, ['glasses_1'] = 51, ['glasses_2'] = 0, ['bproof_1'] = 0, ['bproof_2'] = 0, ['helmet_1'] = -1, ['helmet_2'] = 0, ['watches_1'] = 3, ['watches_2'] = 0, ['chain_1'] = 173, ['chain_2'] = 0, ['bracelets_1'] = 16, ['bracelets_2'] = 0, ['decals_1'] = 0, ['decals_2'] = 0})
                    end)
                    else
                        TriggerEvent(CreatorConfig.events.skinchanger..':change', 'sex', 0)
                        Citizen.Wait(100)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerEvent('skinchanger:loadClothes', skin, {['bags_1'] = 0, ['bags_2'] = 0, ['tshirt_1'] = 15, ['tshirt_2'] = 0, ['torso_1'] = 719, ['torso_2'] = 0, ['arms'] = 1, ['pants_1'] = 278, ['pants_2'] = 0, ['shoes_1'] = 199, ['shoes_2'] = 0, ['mask_1'] = 0, ['mask_2'] = 0, ['bproof_1'] = 0, ['bproof_2'] = 0, ['helmet_1'] = -1, ['helmet_2'] = 0, ['chain_1'] = 0, ['chain_2'] = 0, ['decals_1'] = 0, ['decals_2'] = 0})
                    end)
                end
            end,
        })
            RageUIClothes.List(("%s"..__["face"]):format(arrow), Face, filter.face.index, nil, {}, true, { onActive = function() UtilsCreator:OnRenderCam() end, onListChange = function(Index, Item) filter.face.index = Index TriggerEvent(CreatorConfig.events.skinchanger..':change', 'face', filter.face.index - 1) end })
            RageUIClothes.List(("%s"..__["skin"]):format(arrow), Skin, filter.skin.index, nil, {}, true, { onActive = function() UtilsCreator:OnRenderCam() end, onListChange = function(Index, Item) filter.skin.index = Index TriggerEvent(CreatorConfig.events.skinchanger..':change', 'skin', filter.skin.index - 1) end })
            RageUIClothes.Button(("%s"..__["my_appearance"]):format(arrow), nil, {}, true, {onActive = function() UtilsCreator:OnRenderCam() end}, myAppearanceMenu)
            RageUIClothes.Button(("%s"..__["my_outfit"]):format(arrow), nil, {}, true, {onActive = function() UtilsCreator:OnRenderCam() end}, myOutfitMenu)
            RageUIClothes.Button(__["valid_character"], nil, {RightBadge = RageUIClothes.BadgeStyle.Tick, Color = { HightLightColor = {39, 227, 45, 160}, BackgroundColor = {39, 227, 45, 160} }}, true, {
                onActive = function() UtilsCreator:OnRenderCam() end,
                onSelected = function()
                    if CreatorConfig.starterPack.enable then
                        TriggerEvent(CreatorConfig.events.skinchanger..':getSkin', function(skin)
                            TriggerServerEvent(CreatorConfig.events.skin..':save', skin)
                        end)
                        UtilsCreator:goKitchen()
                    else
                        TriggerEvent(CreatorConfig.events.skinchanger..':getSkin', function(skin)
                            TriggerServerEvent(CreatorConfig.events.skin..':save', skin)
                        end)
                        UtilsCreator:goLift()
                    end
                end
            })
        end)

        RageUIClothes.IsVisible(myAppearanceMenu, function()
            Render:myAppearanceMenu()
        end)

        RageUIClothes.IsVisible(myOutfitMenu, function()
            Render:myOutfitMenu()
        end)

        if not RageUIClothes.Visible(creatoRMenuClothes)
            and not RageUIClothes.Visible(myAppearanceMenu)
            and not RageUIClothes.Visible(myOutfitMenu)
            then
            creatoRMenuClothes = RMenuClothes:DeleteType("creatoRMenuClothes", true)
            FreezeEntityPosition(PlayerPedId(), false)
            UtilsCreator:KillCam()
        end
    end
end
