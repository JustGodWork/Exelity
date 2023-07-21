--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

---@author Razzway
---@version 3.0
---@type function Render:myOutfitMenu
function Render:myOutfitMenu()
    RageUIClothes.Line()
    for _,outfit in pairs(CreatorConfig.outfit) do
        RageUIClothes.Button(outfit.label, nil, {}, true, {
            onActive = function() UtilsCreator:OnRenderCam() end,
            onSelected = function()
                UtilsCreator:applySkinSpecific(outfit)
            end
        })
    end
end