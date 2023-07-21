--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local filter = {
    outfit = {
        Torso1 = 1,
        Torso2 = 1,
        TShirt1 = 1,
        TShirt2 = 1,
        Arms1 = 1,
        Arms2 = 1,
        Decals1 = 1,
        Decals2 = 1,
        Bags1 = 1,
        Bags2 = 1,
        Bullet1 = 1,
        Bullet2 = 2,
        Pants1 = 1,
        Pants2 = 2,
        Shoes1 = 1,
        Shoes2 = 1,
    },
}

---@author Razzway
---@type function Render:changeMenu
function Render:changeMenu()
    RageUIClothes.Line()
    local Torso1 = {} for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 11)-1, 1 do Torso1[i] = i end
    local Torso2 = {} for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 11, filter.outfit.Torso1) - 1, 1 do Torso2[i] = i end
    local TShirt1 = {} for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 8) - 1, 1 do TShirt1[i] = i end
    local TShirt2 = {} for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 8, filter.outfit.TShirt1) - 1, 1 do TShirt2[i] = i end
    local Arms1 = {} for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 3) - 1, 1 do Arms1[i] = i end
    local Decals1 = {} for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 10) - 1, 1 do Decals1[i] = i end
    local Decals2 = {} for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 10, filter.outfit.Decals1) - 1, 1 do Decals2[i] = i end
    local Bags1 = {} for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 5) - 1, 1 do Bags1[i] = i end
    local Bags2 = {} for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 5, filter.outfit.Bags1) -1, 1 do Bags2[i] = i end
    local Bullet1 = {} for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 9) - 1, 1 do Bullet1[i] = i end
    local Bullet2 = {} for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 9, filter.outfit.Bullet1) - 1, 1 do Bullet2[i] = i end
    local Pants1 = {} for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 4) - 1, 1 do Pants1[i] = i end
    local Pants2 = {} for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 4, filter.outfit.Pants1) - 1, 1 do Pants2[i] = i end
    local Shoes1 = {} for i = 0 , GetNumberOfPedDrawableVariations(PlayerPedId(), 6) - 1, 1 do Shoes1[i] = i end
    local Shoes2 = {} for i = 0 , GetNumberOfPedTextureVariations(PlayerPedId(), 6, filter.outfit.Shoes1) - 1, 1 do Shoes2[i] = i end

    local desc = "Appuyez sur la touche ~h~ENTRER~h~ pour choisir un numéro"

    RageUIClothes.List('Torse 1', Torso1, filter.outfit.Torso1, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Torso1 = Index filter.outfit.Torso2 = 1 TriggerEvent('skinchanger:change', 'torso_1', filter.outfit.Torso1 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Torso1 = result TriggerEvent('skinchanger:change', 'torso_1', filter.outfit.Torso1 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
    RageUIClothes.List('Torse 2', Torso2, filter.outfit.Torso2, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Torso2 = Index TriggerEvent('skinchanger:change', 'torso_2', filter.outfit.Torso2 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Torso2 = result TriggerEvent('skinchanger:change', 'torso_2', filter.outfit.Torso2 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})

    RageUIClothes.List('T-Shirt 1', TShirt1, filter.outfit.TShirt1, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.TShirt1 = Index filter.outfit.TShirt2 = 1 TriggerEvent('skinchanger:change', 'tshirt_1', filter.outfit.TShirt1 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.TShirt1 = result TriggerEvent('skinchanger:change', 'tshirt_1', filter.outfit.TShirt1 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
    RageUIClothes.List('T-Shirt 2', TShirt2, filter.outfit.TShirt2, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.TShirt2 = Index TriggerEvent('skinchanger:change', 'tshirt_2', filter.outfit.TShirt2 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.TShirt2 = result TriggerEvent('skinchanger:change', 'tshirt_2', filter.outfit.TShirt2 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})

    RageUIClothes.List('Bras 1', Arms1, filter.outfit.Arms1, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Arms1 = Index filter.outfit.Arms2 = 1 TriggerEvent('skinchanger:change', 'arms', filter.outfit.Arms1 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Arms1 = result TriggerEvent('skinchanger:change', 'arms', filter.outfit.Arms1 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
    RageUIClothes.List('Bras 2', {1,2,3,4,5,6,7,8,9,10}, filter.outfit.Arms2, nil, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Arms2 = Index TriggerEvent('skinchanger:change', 'arms_2', filter.outfit.Arms2 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Arms2 = result TriggerEvent('skinchanger:change', 'arms_2', filter.outfit.Arms2 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})

    RageUIClothes.List('Calques 1', Decals1, filter.outfit.Decals1, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Decals1 = Index filter.outfit.Decals2 = 1 TriggerEvent('skinchanger:change', 'decals_1', filter.outfit.Decals1 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Decals1 = result TriggerEvent('skinchanger:change', 'decals_1', filter.outfit.Decals1 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
    RageUIClothes.List('Calques 2', Decals2, filter.outfit.Decals2, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Decals2 = Index TriggerEvent('skinchanger:change', 'decals_2', filter.outfit.Decals2 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Decals2 = result TriggerEvent('skinchanger:change', 'decals_2', filter.outfit.Decals2 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})

    RageUIClothes.List('Gilet par balle 1', Bullet1, filter.outfit.Bullet1, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Bullet1 = Index filter.outfit.Bullet2 = 1 TriggerEvent('skinchanger:change', 'bproof_1', filter.outfit.Bullet1 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Bullet1 = result TriggerEvent('skinchanger:change', 'bproof_1', filter.outfit.Bullet1 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
    RageUIClothes.List('Gilet par balle 2', Bullet2, filter.outfit.Bullet2, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Bullet2 = Index TriggerEvent('skinchanger:change', 'bproof_2', filter.outfit.Bullet2 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Bullet2 = result TriggerEvent('skinchanger:change', 'bproof_2', filter.outfit.Bullet2 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})

    RageUIClothes.List('Sac 1', Bags1, filter.outfit.Bags1, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Bags1 = Index filter.outfit.Bags2 = 1 TriggerEvent('skinchanger:change', 'bags_1', filter.outfit.Bags1 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Bags1 = result TriggerEvent('skinchanger:change', 'bags_1', filter.outfit.Bags1 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
    RageUIClothes.List('Sac 2', Bags2, filter.outfit.Bags2, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Bags2 = Index TriggerEvent('skinchanger:change', 'bags_2', filter.outfit.Bags2 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Bags2 = result TriggerEvent('skinchanger:change', 'bags_2', filter.outfit.Bags2 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
    

    RageUIClothes.List('Pantalon 1', Pants1, filter.outfit.Pants1, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Pants1 = Index filter.outfit.Pants2 = 1 TriggerEvent('skinchanger:change', 'pants_1', filter.outfit.Pants1 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Pants1 = result TriggerEvent('skinchanger:change', 'pants_1', filter.outfit.Pants1 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
    RageUIClothes.List('Pantalon 2', Pants2, filter.outfit.Pants2, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Pants2 = Index TriggerEvent('skinchanger:change', 'pants_2', filter.outfit.Pants2 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Pants2 = result TriggerEvent('skinchanger:change', 'pants_2', filter.outfit.Pants2 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})

    RageUIClothes.List('Chaussures 1', Shoes1, filter.outfit.Shoes1, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Shoes1 = Index filter.outfit.Shoes2 = 1 TriggerEvent('skinchanger:change', 'shoes_1', filter.outfit.Shoes1 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Shoes1 = result TriggerEvent('skinchanger:change', 'shoes_1', filter.outfit.Shoes1 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
    RageUIClothes.List('Chaussures 2', Shoes2, filter.outfit.Shoes2, desc, {}, true, { onActive = function() Uclothes:OnRenderCam() end, onListChange = function(Index, Item) filter.outfit.Shoes2 = Index TriggerEvent('skinchanger:change', 'shoes_2', filter.outfit.Shoes2 - 1) end, onSelected = function() local result = Uclothes:input('Indiquez le numéro que vous souhaitez sélectionner :') if result ~= "" and tonumber(result) ~= nil then filter.outfit.Shoes2 = result TriggerEvent('skinchanger:change', 'shoes_2', filter.outfit.Shoes2 - 1) else ESX.ShowNotification('~r~Il semblerait que vous n\'avez entré aucune valeur. Assurez vous qu\'il s\'agisse bel et bien d\'un chiffre/nombre.') end end})
end