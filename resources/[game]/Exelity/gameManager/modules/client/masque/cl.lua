--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]


--- todo ajouter tout les masque disponible dans gta et changer RageUI.SliderProgress par une liste

ESX	= nil
local HasAlreadyEnteredMarker, isDead = false, false
local LastZone, CurrentAction, CurrentActionMsg
local CurrentActionData	= {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function KillCam()
    RenderScriptCams(0, 1, 1500, 0, 0)
    SetCamActive(cam, false)
    ClearPedTasks(PlayerPedId())
    DestroyAllCams(true)
end

Citizen.CreateThread(function()
	pos = vector3(-1338.129, -1278.200, 4.872)
	local blip = AddBlipForCoord(pos)

	SetBlipSprite(blip, 362)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 17)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("[Public] Magasin de Masque")
	EndTextCommandSetBlipName(blip)

	while true do
		local interval = 500
		local pCoords = GetEntityCoords(PlayerPedId())
		if #(pCoords - pos) <= 10 then
			interval = 1
			--DrawMarker(Config.Get.Marker.Type, pos, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
			if #(pCoords - pos) <= 3 then
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le magasin de masques")
				if IsControlJustPressed(0, 51) then
                    openCategorieMask()
				end
			end
		end
		Citizen.Wait(interval)
	end
end)

CatMask = RageUIMasques.CreateMenu("", "Vespucci Beach")
CatMask.EnableMouse = true
CatMask.Closed = function()
    RageUIMasques.CloseAll()
    RenderScriptCams(0, 1, 1000, 0, 0)
    SetCamActive(CreatCam, 0)
    SetCamActive(cam2, 0)
    ClearPedTasks(PlayerPedId())
    MenuIsOpen = false
    SetTimeout(1000, function()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
        FreezeEntityPosition(PlayerPedId(), false)
    end)
end

SliderPanel = { -- NE PAS TOUCHER 
Config = {Min = 0, Torso = 0, Tshirt = 0, Pants = 0, Shoes = 0, Helmet = 0, Chains = 0, Glasses = 0, Bags = 0, Max = 64},
Torso = {Index = 1},
Tshirt = {Index = 1},
Pants = {Index = 1},
Shoes = {Index = 1}
}

ClothesIndex = {Torse = 0, Tshirt = 0, Bas = 0, Shoes = 0, Helmet = 0, Chains = 0, Glasses = 0, Bags = 0, Arms = 0, Mask1 = 0} -- NE PAS TOUCHER 

openCategorieMask = function()
    local pPed = PlayerPedId()
    local offset = GetCamOffset("default_face")
    local pos = GetOffsetFromEntityInWorldCoords(pPed, offset.cam[1], offset.cam[2], offset.cam[3])
    local posLook = GetOffsetFromEntityInWorldCoords(pPed, offset.lookAt[1], offset.lookAt[2], offset.lookAt[3])

    CreatorCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    
    SetCamActive(CreatorCam, 1)
    SetCamCoord(CreatorCam, pos.x, pos.y, pos.z)
    SetCamFov(CreatorCam, offset.fov)
    PointCamAtCoord(CreatorCam, posLook.x, posLook.y, posLook.z)

    RenderScriptCams(1, 1, 1000, 0, 0)
    if MenuIsOpen then 
        MenuIsOpen = false 
        RageUIMasques.Visible(CatMask, false)
    else
        MenuIsOpen = true 
        RageUIMasques.Visible(CatMask, true)
        CreateThread(function()
            while MenuIsOpen do 
                FreezeEntityPosition(PlayerPedId(), true)
                RageUIMasques.IsVisible(CatMask, function()
                    RageUIMasques.SliderProgress('Masques', ClothesIndex.Mask1, 240, false, {
                        ProgressBackgroundColor = { R = 0, G = 0, B = 0, A = 200 },
                        ProgressColor = { R = 167, G = 167, B = 167, A = 255 },
                    }, true, {
                        onSliderChange = function(Index)
                            ClothesIndex.Mask1 = Index
                            TriggerEvent('skinchanger:change', 'mask_1', Index)
                           -- TriggerEvent('skinchanger:getSkin', function(skin)
                            --    TriggerServerEvent('esx_skin:save', skin)                                    
                          --  end)
                            SliderPanel.Mask = 0
                        end
                    })
                    RageUIMasques.Button("Retirer votre masque", nil, {}, true, {
                        onSelected = function()
                            TriggerEvent('skinchanger:change', 'mask_1', 0)
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                TriggerServerEvent('esx_skin:save', skin)                                    
                            end)
                        end
                    })
                    RageUIMasques.Button('Payer votre masque', false, { Color = { BackgroundColor = { 0, 140, 0, 160 } } }, true, {
                        onSelected = function()
                           -- local label = KeyboardInput("ChooseNameForYourMask", "Choisir un nom pour votre masque :", "", 30)
                            --if label:gsub("%s+", "") == "" then 
                           --     return ESX.ShowNotification("~r~Nom non-défini.")
                          --  end
                          ESX.TriggerServerCallback('esx_clotheshop:checkMoney', function(hasEnoughMoney)
                            if hasEnoughMoney then
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    TriggerServerEvent('esx_skin:save', skin)                                    
                                end)
                                TriggerServerEvent('esx_clotheshop:pay')
                            else
                                ESX.ShowNotification("Vous n'avez pas assez d'argent.")
                            end
                          end)
                            --AddMask["mask_1"] = ClothesIndex.Mask1
                           -- AddMask["mask_2"] = SliderPanel.Mask
                           -- TriggerServerEvent('ClotheShop:addClothes', label, AddMask, "Masque", ClothesPrice["masque"])
                           -- TriggerEvent('skinchanger:getSkin', function(skin)
                            --    TriggerServerEvent('esx_skin:save', skin)                                    
                            --end)
                            AddMask = {}
                            RenderScriptCams(0, 1, 1000, 0, 0)
                            SetCamActive(CreatCam, 0)
                            SetCamActive(cam2, 0)
                            ClearPedTasks(PlayerPedId())
                            MenuIsOpen = false
                            SetTimeout(1000, function()
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                    TriggerEvent('skinchanger:loadSkin', skin)
                                end)
                                FreezeEntityPosition(PlayerPedId(), false)
                            end)
                            RageUIMasques.CloseAll()
                        end
                    })
                    RageUIMasques.Separator("Prix du masque: 65$")
                    RageUIMasques.SliderPanel(SliderPanel.Config.Mask, SliderPanel.Config.Min, "Variations", GetNumberOfPedTextureVariations(PlayerPedId(), 1, ClothesIndex.Mask1)-1, {
                        onSliderChange = function(Index)
                            SliderPanel.Config.Mask = Index
                            TriggerEvent('skinchanger:change', 'mask_2', Index)
                        end
                    }, 1)
                end)
                Wait(1)
            end
        end)
    end
end