local Items = {}
local Armes = {}
local ArgentSale = {}
local customindex = 1
local customindex2 = 2
function getPlayerInv(player)
    ESX.TriggerServerCallback('getOtherPlayerDataFBI', function(data)
        for i=1, #data.accounts, 1 do
            if data.accounts[i].name == 'dirtycash' and data.accounts[i].money > 0 then
                table.insert(ArgentSale, {
                    label    = ESX.Math.Round(data.accounts[i].money),
                    value    = 'dirtycash',
                    itemType = 'item_account',
                    amount   = data.accounts[i].money
                })
    
            end
        end
    
        for i=1, #data.inventory, 1 do
            if data.inventory[i].count > 0 then
                table.insert(Items, {
                    label    = data.inventory[i].label,
                    right    = data.inventory[i].count,
                    value    = data.inventory[i].name,
                    itemType = 'item_standard',
                    amount   = data.inventory[i].count
                })
            end
        end

        for i=1, #data.weapons, 1 do
           -- if data.weapons[i].count > 0 then
                table.insert(Armes, {
                    label    = ESX.GetWeaponLabel(data.weapons[i].name),
                    right    = data.weapons[i].ammo,
                    value    = data.weapons[i].name,
                    itemType = 'item_weapon',
                    amount   = data.weapons[i].ammo
                })   
           -- end
        end

    end, GetPlayerServerId(player))
end

local IsInPVP = false;

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);



RegisterCommand('menufbif6', function()
    Items = {}
    Armes = {}
    ArgentSale = {}
    if ( ESX.PlayerData.job.name ~= 'fib') then
        return
    end

    if (IsInPVP) then
        return
    end

    local main = RageUI.CreateMenu("", "Menu Intéraction")
    local civils = RageUI.CreateSubMenu(main, "", "Menu Intéraction")
    local vehicules = RageUI.CreateSubMenu(main, "", "Menu Intéraction")
    local fbi = RageUI.CreateSubMenu(main, "", "Menu Intéraction")
    local fouiller = RageUI.CreateSubMenu(civils, "", "Menu Intéraction")

    RageUI.Visible(main, not RageUI.Visible(main))

    while main do
        Wait(0)

        RageUI.IsVisible(main, function()
            RageUI.Button("Intéraction Citoyens", nil, {}, true, {}, civils)
            RageUI.Button("Intéraction Véhicules", nil, {}, true, {}, vehicules)
            RageUI.Button("Demande de renfort", nil, {}, true, {}, fbi)
        end)

        RageUI.IsVisible(civils, function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 3.0 then
                RageUI.Button("Fouiller", nil, {}, true, {
                    onActive = function()
                        plyMarker(closestPlayer) 
                    end;
                    onSelected = function()
                        ExecuteCommand('me fouille la personne')
                        getPlayerInv(closestPlayer)
                    end
                }, fouiller)
                RageUI.Button("Prendre la carte d\'identité", nil, {}, true, {
                    onActive = function()
                        plyMarker(closestPlayer)
                    end;
                    onSelected = function()
                        local player, distance = ESX.Game.GetClosestPlayer()
                        local getPlayerSearch = GetPlayerPed(player)
                        if IsEntityPlayingAnim(getPlayerSearch, 'random@mugging3', 'handsup_standing_base', 3) then
                            if distance ~= -1 and distance <= 3.0 then
                                RageUI.CloseAll()
                                TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(closestPlayer), GetPlayerServerId(PlayerId()))
                            else
                                ESX.ShowNotification('~r~Personne autour de vous')
                            end
                        else
                            ESX.ShowNotification("La personne en face ne lève pas les mains")
                        end
                    end
                })
                RageUI.Button("Menotter/Démenoter l\'individu", nil, {}, true, {
                    onActive = function()
                        plyMarker(closestPlayer)
                    end;
                    onSelected = function()
                        TriggerServerEvent('Space:Menotter', GetPlayerServerId(closestPlayer))
                    end
                })
                RageUI.Button("Escorter l\'individu", nil, {}, true, {
                    onActive = function()
                        plyMarker(closestPlayer)
                    end;
                    onSelected = function()
                        TriggerServerEvent('Space:Escorter', GetPlayerServerId(closestPlayer))
                    end
                })
                RageUI.Button("Mettre dans le véhicule", nil, {}, true, {
                    onActive = function()
                        plyMarker(closestPlayer)
                    end;
                    onSelected = function()
                        TriggerServerEvent('Space:MettreDansUnVehicule', GetPlayerServerId(closestPlayer))
                    end
                })
                RageUI.Button("Sortir du véhicule", nil, {}, true, {
                    onActive = function()
                        plyMarker(closestPlayer)
                    end;
                    onSelected = function()
                        TriggerServerEvent('Space:SortirDuVehicule', GetPlayerServerId(closestPlayer))
                    end
                })
            else
                RageUI.Separator()
                RageUI.Separator("~r~Aucun individu(s) à proximitée")
                RageUI.Separator()
            end
        end)

        RageUI.IsVisible(vehicules, function()
            RageUI.Button("Information véhicule", nil, {}, true, {
                onSelected = function()
                    local numplaque = CustomString('', '', 100)
                    local length = string.len(numplaque)
                    if not numplaque or length < 2 or length > 8 then
                        ESX.ShowNotification("Ce n'est ~p~pas~s~ un numéro enregistrement dans les fichier de ~p~fbi")
                    else
                        Rechercherplaquevoiture(numplaque)
                        RageUI.CloseAll()
                    end
                end
            })
            RageUI.Button("Crocheter le véhicule", nil, {}, true , {
                onSelected = function()
                    local coords  = GetEntityCoords(PlayerPedId())
                    local vehicle = ESX.Game.GetVehicleInDirection()
                    if DoesEntityExist(vehicle) then
                        local plyPed = PlayerPedId()
    
                        TaskStartScenarioInPlace(plyPed, 'WORLD_HUMAN_WELDING', 0, true)
                        Citizen.Wait(20000)
                        ClearPedTasksImmediately(plyPed)
    
                        SetVehicleDoorsLocked(vehicle, 1)
                        SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                        ESX.ShowNotification("~g~Véhicule dévérouillé")
                    else
                        ESX.ShowNotification("~r~Aucun véhicule à proximité")
                    end
                end
            })
        end)

        RageUI.IsVisible(fbi, function()
            RageUI.Button("Petite demande", nil, {}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('demande:Fbi', coords, 'petite')
                end
            })
            RageUI.Button("Moyenne demande", nil, {}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('demande:Fbi', coords, 'moyenne')
                end
            })
            RageUI.Button("Grande demande", nil, {}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('demande:Fbi', coords, 'Grande')
                end
            })
        end)

        RageUI.IsVisible(fouiller, function()
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            local getPlayerSearch = GetPlayerPed(closestPlayer)

            if not IsEntityPlayingAnim(getPlayerSearch, 'random@mugging3', 'handsup_standing_base', 3) then
                RageUI.GoBack()
                ESX.ShowNotification("La personne en face lève pas les mains en l'air")
                return
            end

            if closestPlayer == -1 or closestDistance > 3.0 then
                RageUI.GoBack()
                return
            end
    
            RageUI.Separator("Vous Fouillez : " .. GetPlayerName(closestPlayer))

            RageUI.Separator("↓ ~r~Argent non déclaré ~s~↓")

            for k,v in pairs(ArgentSale) do
                RageUI.Button("Argent non déclaré :", nil, {RightLabel = "~g~"..v.label.."$"}, true , {
                    onSelected = function()
                        local combien = CustomString("Combien ?", 'Indiquez un nombre', 10)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification('~r~Montant invalide')
                        else
                            TriggerServerEvent('confiscatePlayerItemFIB', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            RageUI.GoBack()
                        end
                    end
                })
            end

            RageUI.Separator("↓ ~r~Items du joueur ~s~↓")

            for k,v in pairs(Items) do
                RageUI.Button("Nom: "..v.label, nil, {RightLabel = "~g~"..v.right.." exemplaires"}, true , {
                    onSelected = function()
                        local combien = CustomString("Combien ", 'Indiquez un nombre', 4)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification('~r~Montant invalide')
                        else
                            TriggerServerEvent('confiscatePlayerItemFIB', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            RageUI.GoBack()
                        end
                    end
                })
            end
            
            RageUI.Separator("↓ ~r~Armes du joueur ~s~↓")

            for k,v in pairs(Armes) do
                local isPermanent = ESX.IsWeaponPermanent(v.value);
                if (not isPermanent) then
                    RageUI.Button("Arme: "..v.label, nil, {}, true , {
                        onSelected = function()
                            local combien = CustomString("Nombre de munitions", 'Indiquez un nombre', 4)
                            if tonumber(combien) > 1 then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('confiscatePlayerItemFIB', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                                RageUI.GoBack()
                            end
                        end
                    })
                end
            end
        end)

        if not RageUI.Visible(main) and not RageUI.Visible(civils) and not RageUI.Visible(vehicules) and not RageUI.Visible(fbi) and not RageUI.Visible(fouiller) then
            main = RMenu:DeleteType('main', true)
            civils = RMenu:DeleteType('civils', true)
            vehicules = RMenu:DeleteType('civils', true)
            fbi = RMenu:DeleteType('civils', true)
            fouiller = RMenu:DeleteType('fouiller', true)
        end

		if not RageUI.Visible(fouiller) then
			table.remove(ArgentSale, k)
			table.remove(Items, k)
			table.remove(Armes, k)
		end
    end
end)

function Rechercherplaquevoiture(plaquerechercher)
    local PlaqueMenu = RageUI.CreateMenu("", "Informations")
    ESX.TriggerServerCallback('FBI:getVehicleInfos', function(retrivedInfo)
        RageUI.Visible(PlaqueMenu, not RageUI.Visible(PlaqueMenu))
            while PlaqueMenu do
                Citizen.Wait(0)
                RageUI.IsVisible(PlaqueMenu,function()
                    RageUI.Button("Numéro de plaque : ", nil, {RightLabel = retrivedInfo.plate}, true, {})
                    if not retrivedInfo.owner then
                        RageUI.Button("Propriétaire : ", nil, {RightLabel = "Inconnu"}, true, {})
                    else
                        RageUI.Button("Propriétaire : ", nil, {RightLabel = retrivedInfo.owner}, true, {})

                        local hashvoiture = retrivedInfo.vehicle.model
                        local nomvoituremodele = GetDisplayNameFromVehicleModel(hashvoiture)
                        local nomvoituretexte  = GetLabelText(nomvoituremodele)

                        RageUI.Button("Modèle du véhicule : ", nil, {RightLabel = nomvoituretexte}, true, {})
                    end
                end, function()
                end)
                if not RageUI.Visible(PlaqueMenu) then
                PlaqueMenu = RMenu:DeleteType("plaque d'immatriculation", true)
            end
        end
    end, plaquerechercher)
end

RegisterKeyMapping('menufbif6', 'Menu F6 FBI', 'keyboard', 'F6')

RegisterNetEvent('renfort:setBlip')
AddEventHandler('renfort:setBlip', function(coords, raison)
	if raison == 'petite' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowAdvancedNotification('Notification', '~p~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-2\nImportance: ~g~Légère.', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 2
	elseif raison == 'moyenne' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		ESX.ShowAdvancedNotification('Notification', '~p~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-3\nImportance: ~p~Importante.', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		color = 47
	elseif raison == 'Grande' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
		ESX.ShowAdvancedNotification('Notification', '~p~Demande de renfort', 'Demande de renfort demandé.\nRéponse: ~g~CODE-99\nImportance: ~r~URGENTE !\nDANGER IMPORTANT', 'CHAR_CALL911', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
		color = 1
	end
	local blipId = AddBlipForCoord(coords)
	SetBlipSprite(blipId, 161)
	SetBlipScale(blipId, 1.2)
	SetBlipColour(blipId, color)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Demande renfort')
	EndTextCommandSetBlipName(blipId)
	Wait(80 * 1000)
	RemoveBlip(blipId)
end)

TS = true
Vetement2 = {

    Clothes = {},

    TshirtList = {},
    TshirtList2 = {},
    TorsoList = {},
    TorsoList2 = {},
    ArmsList = {},
    ArmsList2 = {},
    DecalsList = {},
    GiletList = {},
    GiletList2 = {},

    PantalonList = {},
    PantalonList2 = {},
    ChaussuresList = {},
    ChaussuresList2 = {},

    IndexGardeRobe = 1,
    TshirtIndex = 1,
    TshirtIndex2 = 1,
    TorsoIndex = 1,
    TorsoIndex2 = 1,
    ArmsIndex = 1,
    ArmsIndex2 = 1,
    DecalsIndex = 1,
    DecalsIndex2 = 1,
    GiletIndex = 1,
    GiletIndex2 = 1,

    PantalonIndex = 1,
    PantalonIndex2 = 1,
    ChaussuresIndex = 1,
    ChaussuresIndex2 = 1,

    Masque = {},
	Masque2 = {},
	Lunettes = {},
	Lunettes2 = {},
	Chapeau = {},
	Chapeau2 = {},
	Sac = {},
	Sac2 = {},
	Chaine = {},
	Chaine2 = {},
	Oreille = {},
	Oreille2 = {},
	MasqueIndex = 1,
	MasqueIndex2 = 1,
	LunetteIndex = 1,
	LunetteIndex2 = 1,
	ChapeauIndex = 1,
	ChapeauIndex2 = 1,
	SacIndex = 1,
	SacIndex2 = 1,
	ChaineIndex = 1,
	ChaineIndex2 = 1,
	OreilleIndex = 1,
	OreilleIndex2 = 1
}

Citizen.CreateThread(function()
	Wait(5000)
    for i = 0, 400 do
        table.insert(Vetement2.Masque, i)
    end
	for i = 0, 400 do
        table.insert(Vetement2.Lunettes, i)
    end
	for i = 0, 	400 do
        table.insert(Vetement2.Chapeau, i)
    end
	for i = 0, 400 do
        table.insert(Vetement2.Sac, i)
    end
	for i = 0, 400 do
        table.insert(Vetement2.Chaine, i)
    end
	for i = 0, 400 do
        table.insert(Vetement2.Oreille, i)
    end	
    Vetement2.DecalsList = {}
    for i = 0, 400 do
        table.insert(Vetement2.DecalsList, i)
    end
end)

function MenuVetementsFBI()
    local main = RageUI.CreateMenu("", "Menu Intéraction")
    local vetements = RageUI.CreateSubMenu(main, "", "Voici les vêtements disponibles")
    local garderobe = RageUI.CreateSubMenu(main, "", "Voici toutes vos tenues")
    local tshirt = RageUI.CreateSubMenu(vetements, "", "Voici les T-Shirt disponibles")
    local tshirt2 = RageUI.CreateSubMenu(vetements, "", "Voici les variations de T-Shirt disponibles")
    local torse = RageUI.CreateSubMenu(vetements, "", "Voici les torses disponibles")
    local torse2 = RageUI.CreateSubMenu(vetements, "", "Voici les variations de torses disponibles")
    local bras = RageUI.CreateSubMenu(vetements, "", "Voici les bras disponibles")
    local calque = RageUI.CreateSubMenu(vetements, "", "Voici les calques disponibles")
    local calque2 = RageUI.CreateSubMenu(vetements, "", "Voici les calques disponibles")
    local bproof = RageUI.CreateSubMenu(vetements, "", "Voici les calques disponibles")
    local bproof2 = RageUI.CreateSubMenu(vetements, "", "Voici les calques disponibles")
    local pantalon = RageUI.CreateSubMenu(vetements, "", "Voici les pantalons disponibles")
    local pantalon2 = RageUI.CreateSubMenu(vetements, "", "Voici les variations des pantalons disponibles")
    local chaussures = RageUI.CreateSubMenu(vetements, "", "Voici les chaussures disponibles")
    local chaussures2 = RageUI.CreateSubMenu(vetements, "", "Voici les variations des chaussures disponibles")

    local mask = RageUI.CreateSubMenu(vetements, "", "Voici tout les masques disponibles")
	local lunette = RageUI.CreateSubMenu(vetements, "", "Voici tout les paires de lunettes disponibles")
	local chapeau = RageUI.CreateSubMenu(vetements, "", "Voici tout les chapeaux disponibles")
	local sac = RageUI.CreateSubMenu(vetements, "", "Voici tout les sacs disponibles")
	local chaine = RageUI.CreateSubMenu(vetements, "", "Voici toutes les chaines disponibles")
	local oreille = RageUI.CreateSubMenu(vetements, "", "Voici toutes les accésoires d'oreille disponibles")

	local variationsmasque = RageUI.CreateSubMenu(vetements, "", "Voici toutes les variations de masque disponibles")
	local variationslunette = RageUI.CreateSubMenu(vetements, "", "Voici toutes les variations de lunettes disponibles")
	local variationschapeau = RageUI.CreateSubMenu(vetements, "", "Voici toutes les variations de chapeau disponibles")
	local variationssac = RageUI.CreateSubMenu(vetements, "", "Voici toutes les variations de sacs disponibles")
	local variationschaine = RageUI.CreateSubMenu(vetements, "", "Voici toutes les variations de chaine disponibles")
	local variationsoreille = RageUI.CreateSubMenu(vetements, "", "Voici toutes les variations d'oreille disponibles")

    RageUI.Visible(main, not RageUI.Visible(main))

    local NoTenueDispo = false

    while main do
        Wait(0)
        local plyped = PlayerPedId()
        local playcoords = GetEntityCoords(plyped)
        local menucoords = ZonesListe["MenuVetementsFBI"].Position
        local dif = #(playcoords - menucoords )
        if dif > 7 then 
            RageUI.CloseAll()
        end
        RageUI.IsVisible(main, function()
            RageUI.Button("Tenue : Civil",nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                onSelected = function()
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                        TriggerEvent('skinchanger:loadSkin', skin)
                    end)
                end
            })
            RageUI.Button("Vêtements", nil, {RightLabel = "→"}, true , {}, vetements)
            RageUI.Button("Valider la tenue et l'enregister", nil, {RightLabel = "→"}, true, {
                onSelected = function()
                    local name = KeyboardInput("Indiquer le nom de la tenue", "Indiquer le nom de la tenue", "", 10)
                    if name then 
                        local TempoSkin = {}
                        local ListVet = {
                            ["tshirt_1"] = true,
                            ["tshirt_2"] = true,
                            ["torso_1"] = true,
                            ["torso_2"] = true,
                            ["arms"] = true,
                            ["arms_2"] = true,
                            ["decals_1"] = true,
                            ["decals_2"] = true,
                            ["pants_1"] = true,
                            ["pants_2"] = true,
                            ["shoes_1"] = true,
                            ["shoes_2"] = true,
                            ["bproof_1"] = true,
                            ["bproof_2"] = true,
                            ["mask_1"] = true,
                            ["mask_2"] = true,
                            ["glasses_1"] = true,
                            ["glasses_2"] = true,
                            ["helmet_1"] = true,
                            ["helmet_1"] = true,
                            ["bags_1"] = true,
                            ["bags_2"] = true,
                            ["chain_1"] = true,
                            ["chain_2"] = true,
                            ["ears_1"] = true,
                            ["ears_2"] = true,
                        }
                        TriggerEvent("skinchanger:getSkin", function(skin)
                            TriggerServerEvent("esx_skin:save", skin)
                            for k,v in pairs(skin) do 
                                if ListVet[k] ~= nil then
                                    TempoSkin[k] = v
                                end
                            end
                            TriggerServerEvent("johnny:addtenue", name, TempoSkin)
                        end)
                    end
                end
            })
            RageUI.Button("Garde Robe", "Accéder à la garde robe", {RightLabel = "→"}, true, {}, garderobe)
            RageUI.Separator("↓~p~Gilet pare-balle ~s~↓")
            RageUI.Button("Gilet pare-balles",nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                onSelected = function()
                    SetPedArmour(GetPlayerPed(-1), 100)
                    ESX.ShowAdvancedNotification("Exelity RP", "Information(s)", "Vous avez équiper le gilet pare-balles 2", "CHAR_ST", 1)
                    TriggerEvent('skinchanger:getSkin', function(skin)
                        local vest
                        if skin.sex == 0 then
                            vest = FBI.Tenues["Gilet-2"].male
                        else
                            vest = FBI.Tenues["Gilet-2"].female
                        end
                        TriggerEvent('skinchanger:loadClothes', skin,vest)
                    end)
                end
            })
            RageUI.Separator("↓~p~Uniforme ~s~↓")
            for i = 1,#FBI.Tenues do
                RageUI.Button(FBI.Tenues[i].label, nil, {RightBadge = RageUI.BadgeStyle.Clothes}, ESX.PlayerData.job.grade >= FBI.Tenues[i].minimum_grade, {
                    onSelected = function()
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            local vest
                            if skin.sex == 0 then
                                vest = FBI.Tenues[i].male
                            else
                                vest = FBI.Tenues[i].female
                            end
                            TriggerEvent('skinchanger:loadClothes', skin,vest)
                        end)
                        ESX.ShowAdvancedNotification("Exelity RP", "Information(s)", "Vous avez équiper la tenue :~p~"..FBI.Tenues[i].label, "CHAR_ST", 1) 
                    end
                })
            end
        end)
        RageUI.IsVisible(vetements, function()

            RageUI.Button("T-Shirt", nil, {RightLabel = "→"}, true, {}, tshirt)

            RageUI.Button("Variations T-Shirt", nil, {RightLabel = "→"}, true, {}, tshirt2)

            RageUI.Button("Torses", nil, {RightLabel = "→"}, true, {}, torse)

            RageUI.Button("Variations Torses", nil, {RightLabel = "→"}, true, {}, torse2)

            RageUI.Button("Gilet Pare-Balle", nil, {RightLabel = "→"}, true, {}, bproof)

            RageUI.Button("Variations Gilet Pare-Balle", nil, {RightLabel = "→"}, true, {}, bproof2)

            RageUI.Button("Bras", nil, {RightLabel = "→"}, true, {}, bras)

            RageUI.Button("Calques", nil, {RightLabel = "→"}, true, {}, calque)

            RageUI.Button("Variations Calques", nil, {RightLabel = "→"}, true, {}, calque2)

            RageUI.Button("Pantalon", nil, {RightLabel = "→"}, true, {}, pantalon)

            RageUI.Button("Variations Pantalon", nil, {RightLabel = "→"}, true, {}, pantalon2)

            RageUI.Button("Chaussures", nil, {RightLabel = "→"}, true, {}, chaussures)

            RageUI.Button("Variations Chaussures", nil, {RightLabel = "→"}, true, {}, chaussures2)

            RageUI.Button("Masques",  nil, {RightLabel = "→"}, true, {}, mask)

            RageUI.Button("Variation Masques",  nil, {RightLabel = "→"}, true, {}, variationsmasque)

			RageUI.Button("Lunettes",  nil, {RightLabel = "→"}, true, {}, lunette)
            
            RageUI.Button("Variation Lunettes",  nil, {RightLabel = "→"}, true, {}, variationslunette)

			RageUI.Button("Chapeaux",  nil, {RightLabel = "→"}, true, {}, chapeau)

            RageUI.Button("Variation Chapeaux",  nil, {RightLabel = "→"}, true, {}, variationschapeau)

			RageUI.Button("Sac",  nil, {RightLabel = "→"}, true, {
				onSelected = function()
					SetEntityHeading(PlayerPedId() , 155.0)
				end
			}, sac)

            RageUI.Button("Vaiation Sac",  nil, {RightLabel = "→"}, true, {}, variationssac)

			RageUI.Button("Chaînes",  nil, {RightLabel = "→"}, true, {}, chaine)

            RageUI.Button("Variation Chaînes",  nil, {RightLabel = "→"}, true, {}, variationschaine)

			RageUI.Button("Boucle d'oreille",  nil, {RightLabel = "→"}, true, {
				onSelected = function()
					SetEntityHeading(PlayerPedId() , 70.0)
				end
			}, oreille)

            RageUI.Button("Variation Boucle d'oreille",  nil, {RightLabel = "→"}, true, {}, variationsoreille)

        end, function()
        end)
        RageUI.IsVisible(garderobe, function()

            if ClothesPlayer ~= nil then 
                for k, v in pairs(ClothesPlayer) do 
                    if v.equip == "n" and v.type == "vetement" then 
                        NoTenueDispo = true
                        RageUI.List("Tenue "..v.label, {"Equiper", "Renomer", "Supprimer"}, Vetement2.IndexGardeRobe, nil, {}, true, {
                            onListChange = function(Index)
                                Vetement2.IndexGardeRobe = Index
                            end,
                            onSelected = function(Index)
                                if Index == 1 then 
                                    CreateThread(function()
                                        TriggerEvent('skinchanger:getSkin', function(skin)
                                            TriggerEvent('skinchanger:loadClothes', skin, json.decode(v.skin))
                                            Citizen.Wait(50)
                                            TriggerEvent('skinchanger:getSkin', function(skin)
                                                TriggerServerEvent('esx_skin:save', skin)
                                            end)
                                        end)
                                    end)
                                    ESX.ShowNotification('~g~Vous avez enfilé la tenue : '..v.label)
                                elseif Index == 2 then
                                    local newname = KeyboardInput("Nouveau nom","Nouveau nom", "", 15)
                                    if newname then 
                                        TriggerServerEvent("johnny:RenameTenue", v.id, newname)
                                    end
                                elseif Index == 3 then 
                                    TriggerServerEvent('johnny:deletetenue', v.id)
                                end
                            end
                        })
                    else
                        NoTenueDispo = false
                    end
                end
                if not NoTenueDispo then 
                    RageUI.Separator("~r~Aucune tenue disponible")
                end
            else
                RageUI.Separator("~r~Vous n'avez pas de tenue")
            end
        end)  
        
        RageUI.IsVisible(tshirt, function()
            RageUI.Button("T-Shirt 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.TshirtList2 = {}
                    TriggerEvent('skinchanger:change', 'tshirt_1', 0)
                    TriggerEvent('skinchanger:change', 'tshirt_2', 0)
                    Vetement2.TshirtIndex = 0
                    for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 8, 0) -2 do
                        table.insert(Vetement2.TshirtList2, i)
                    end
                end
            })
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 8) - 1, 1 do
                RageUI.Button("T-Shirt "..i, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.TshirtList2 = {}
                        Vetement2.TshirtIndex = i
                        TriggerEvent('skinchanger:change', 'tshirt_1', i)
                        TriggerEvent('skinchanger:change', 'tshirt_2', 0)
                        for n = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 8, i) -2 do
                            table.insert(Vetement2.TshirtList2, n)
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(tshirt2, function()
            RageUI.Button("Variation T-Shirt 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.TshirtIndex2 = 0
                    TriggerEvent('skinchanger:change', 'tshirt_2', 0)
                end
            })
            for k, v in pairs(Vetement2.TshirtList2) do
                RageUI.Button("Variation T-Shirt "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.TshirtIndex2 = k
                        TriggerEvent('skinchanger:change', 'tshirt_2', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(torse, function()
            RageUI.Button("Torse 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.TorsoList2 = {}
                    Vetement2.TorsoIndex = 0
                    TriggerEvent('skinchanger:change', 'torso_1', 0)
                    TriggerEvent('skinchanger:change', 'torso_2', 0)
                    for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 11, 0) -2 do
                        table.insert(Vetement2.TorsoList2, i)
                    end
                end
            })
            -- Torses
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 11) - 1, 1 do
                RageUI.Button("Torse "..i, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.TorsoList2 = {}
                        Vetement2.TorsoIndex = i
                        TriggerEvent('skinchanger:change', 'torso_2', 0)
                        TriggerEvent('skinchanger:change', 'torso_1', i)
                        for n = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 11, i) -2 do
                            table.insert(Vetement2.TorsoList2, i)
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(torse2, function()
            RageUI.Button("Variations Torse 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.TorsoIndex2 = 0
                    TriggerEvent('skinchanger:change', 'torso_2', 0)
                end
            })
            for k, v in pairs(Vetement2.TorsoList2) do
                RageUI.Button("Variations Torse "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.TorsoIndex2 = k
                        TriggerEvent('skinchanger:change', 'torso_2', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(bras, function()
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 3) - 1, 1 do
                RageUI.Button("Bras "..i, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.ArmsIndex = i
                        TriggerEvent('skinchanger:change', 'arms', i)
                    end
                })
            end
        end)

        RageUI.IsVisible(calque, function()
            RageUI.Button("Calques 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.DecalsIndex = 0
                    TriggerEvent('skinchanger:change', 'decals_1', 0)
                end
            })
            for k, v in pairs(Vetement2.DecalsList) do
                RageUI.Button("Calques "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.DecalsIndex = k
                        TriggerEvent('skinchanger:change', 'decals_1', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(calque2, function()
            RageUI.Button("Variations Calques 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.DecalsIndex2 = 0
                    TriggerEvent('skinchanger:change', 'decals_2', 0)
                end
            })
            for k, v in pairs(Vetement2.DecalsList) do
                RageUI.Button("Variations Calques "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.DecalsIndex2 = k
                        TriggerEvent('skinchanger:change', 'decals_2', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(bproof, function()
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) - 1, 1 do
                RageUI.Button("Gilet Pare-Balle "..i, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        TriggerEvent('skinchanger:change', 'bproof_1', i)
                        TriggerEvent('skinchanger:change', 'bproof_2', 0)
                        Vetement2.GiletList2 = {}
                        Vetement2.GiletIndex = i
                        for n = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 4, i) -2 do
                            table.insert(Vetement2.GiletList2, n)
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(bproof2, function()
            RageUI.Button("Variation Gilet Pare-Balle 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.GiletIndex2 = 0
                    TriggerEvent('skinchanger:change', 'bproof_2', 0)
                end
            })
            for k, v in pairs(Vetement2.GiletList2) do 
                RageUI.Button("Variation Gilet Pare-Balle "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.GiletIndex2 = k
                        TriggerEvent('skinchanger:change', 'bproof_2', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(pantalon, function()
            RageUI.Button("Pantalon 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    TriggerEvent('skinchanger:change', 'pants_1', 0)
                    TriggerEvent('skinchanger:change', 'pants_2', 0)
                    Vetement2.PantalonList2 = {}
                    Vetement2.PantalonIndex = 0
                    for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 4, 0) -2 do
                        table.insert(Vetement2.PantalonList2, i)
                    end
                end
            })
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 4) - 1, 1 do
                RageUI.Button("Pantalon "..i, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        TriggerEvent('skinchanger:change', 'pants_1', i)
                        TriggerEvent('skinchanger:change', 'pants_2', 0)
                        Vetement2.PantalonList2 = {}
                        Vetement2.PantalonIndex = i
                        for n = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 4, i) -2 do
                            table.insert(Vetement2.PantalonList2, n)
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(pantalon2, function()
            RageUI.Button("Variation Pantalon 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.PantalonIndex2 = 0
                    TriggerEvent('skinchanger:change', 'pants_2', 0)
                end
            })
            for k, v in pairs(Vetement2.PantalonList2) do 
                RageUI.Button("Variation Pantalon "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.PantalonIndex2 = k
                        TriggerEvent('skinchanger:change', 'pants_2', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(chaussures, function()
            for i = 0, GetNumberOfPedDrawableVariations(PlayerPedId(), 6) - 1, 1 do
                RageUI.Button("Chaussure "..i, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.ChaussuresIndex = i
                        TriggerEvent('skinchanger:change', 'shoes_1', i)
                        TriggerEvent('skinchanger:change', 'shoes_2', 0)
                        Vetement2.ChaussuresList2 = {}
                        for n = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 6, i) -2 do
                            table.insert(Vetement2.ChaussuresList2, n)
                        end                    
                    end
                })
            end
        end)

        RageUI.IsVisible(chaussures2, function()
            RageUI.Button("Variation Chaussure 0", nil, {RightLabel = "→"}, true, {
                onActive = function()
                    Vetement2.ChaussuresIndex2 = 0
                    TriggerEvent('skinchanger:change', 'shoes_2', 0)
                end
            })
            for k, v in pairs(Vetement2.ChaussuresList2) do 
                RageUI.Button("Variation Chaussure "..k, nil, {RightLabel = "→"}, true, {
                    onActive = function()
                        Vetement2.ChaussuresIndex2 = k
                        TriggerEvent('skinchanger:change', 'shoes_2', k)
                    end
                })
            end
        end)

        RageUI.IsVisible(mask, function()
			RageUI.Button("Aucun Masque ", nil, {}, true, {
				onActive = function()
					Vetement2.MasqueIndex = 0
					TriggerEvent('skinchanger:change', 'mask_1', 0)
					TriggerEvent('skinchanger:change', 'mask_2', 0)
					Vetement2.Masque2 = {}
					for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 1, 0)-2 do
						table.insert(Vetement2.Masque2, i)
					end
				end,
				onSelected = function()
					RageUI.Visible(mask, false)
					RageUI.Visible(lunette, true)
				end
			})

			for k, v in pairs(Vetement2.Masque) do 
				RageUI.Button("Masque "..k, nil, {}, true, {
					onActive = function()
						Vetement2.MasqueIndex = k
						TriggerEvent('skinchanger:change', 'mask_1', k)
						TriggerEvent('skinchanger:change', 'mask_2', 0)
						Vetement2.Masque2 = {}
						for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 1, k)-2 do
							table.insert(Vetement2.Masque2, i)
						end

					end,
				})
			end
		end)

		RageUI.IsVisible(variationsmasque, function()

			RageUI.Button("Variation Masque 0", nil, {}, true, {
				onActive = function()
					Vetement2.MasqueIndex2 = 0
					TriggerEvent('skinchanger:change', 'mask_2', 0)
				end,
			})
			for k, v in pairs(Vetement2.Masque2) do 
				RageUI.Button("Variation Masque "..k, nil, {}, true, {
					onActive = function()
						Vetement2.MasqueIndex2 = k
						TriggerEvent('skinchanger:change', 'mask_2', k)
					end,
				})
			end

		end)

		-- Lunettes
		RageUI.IsVisible(lunette, function()

			RageUI.Button("Aucune Lunette ", nil, {}, true, {
				onActive = function()
					Vetement2.LunetteIndex = 0
					TriggerEvent('skinchanger:change', 'glasses_1', 0)
					TriggerEvent('skinchanger:change', 'glasses_2', 0)
					Vetement2.Lunettes2 = {}
					for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 1, 0)-2 do
						table.insert(Vetement2.Lunettes2, i)
					end
				end,
			})
			for k, v in pairs(Vetement2.Lunettes) do 
				RageUI.Button("Lunette "..k, nil, {}, true, {
					onActive = function()
						Vetement2.LunetteIndex = k
						TriggerEvent('skinchanger:change', 'glasses_1', k)
						TriggerEvent('skinchanger:change', 'glasses_2', 0)
						Vetement2.Lunettes2 = {}
						for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 1, k)-2 do
							table.insert(Vetement2.Lunettes2, i)
						end

					end,
				})
			end

		end)

		RageUI.IsVisible(variationslunette, function()
		
			RageUI.Button("Variation Lunette 0", nil, {}, true, {
				onActive = function()
					Vetement2.LunetteIndex2 = 0
					TriggerEvent('skinchanger:change', 'glasses_2', 0)
				end,
			})
			for k, v in pairs(Vetement2.Lunettes2) do 
				RageUI.Button("Variation Masque "..k, nil, {}, true, {
					onActive = function()
						Vetement2.LunetteIndex2 = k
						TriggerEvent('skinchanger:change', 'glasses_2', k)
					end,
				})
			end

		end)

		-- Chapeau 
		RageUI.IsVisible(chapeau, function()

			RageUI.Button("Aucun Chapeau ", nil, {}, true, {
				onActive = function()
					Vetement2.ChapeauIndex = 0
					TriggerEvent('skinchanger:change', 'helmet_1', 0)
					TriggerEvent('skinchanger:change', 'helmet_2', 0)
					Vetement2.Chapeau2 = {}
					for i = 0, GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, 0)- 1 do
						table.insert(Vetement2.Chapeau2, i)
					end
				end,
			})
			for k, v in pairs(Vetement2.Chapeau) do 
				RageUI.Button("Chapeau "..k, nil, {}, true, {
					onActive = function()
						Vetement2.ChapeauIndex = k
						TriggerEvent('skinchanger:change', 'helmet_1', k)
						TriggerEvent('skinchanger:change', 'helmet_2', 0)
						Vetement2.Chapeau2 = {}
						for i = 0, GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, k) - 1 do
							table.insert(Vetement2.Chapeau2, i)
						end

					end,
				})
			end
		end)

		RageUI.IsVisible(variationschapeau, function()

			RageUI.Button("Variation Chapeau 0", nil, {}, true, {
				onActive = function()
					Vetement2.ChapeauIndex2 = 0
					TriggerEvent('skinchanger:change', 'helmet_2', 0)
				end,
			})
			for k, v in pairs(Vetement2.Chapeau2) do 
				RageUI.Button("Variation Chapeau "..k, nil, {}, true, {
					onActive = function()
						Vetement2.ChapeauIndex2 = k
						TriggerEvent('skinchanger:change', 'helmet_2', k)
					end,
				})
			end
		end)

		-- Sac
		RageUI.IsVisible(sac, function()
			RageUI.Button("Aucun Sac ", nil, {}, true, {
				onActive = function()
					Vetement2.SacIndex = 0
					TriggerEvent('skinchanger:change', 'bags_1', 0)
					TriggerEvent('skinchanger:change', 'bags_2', 0)
					Vetement2.Sac2 = {}
					for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 5, 0) -1 do
						table.insert(Vetement2.Sac2, i)
					end
				end,
			})
			for k, v in pairs(Vetement2.Sac) do 
				RageUI.Button("Sac "..k, nil, {}, true, {
					onActive = function()
						Vetement2.SacIndex = k
						TriggerEvent('skinchanger:change', 'bags_1', k)
						TriggerEvent('skinchanger:change', 'bags_2', 0)
						Vetement2.Sac2 = {}
						for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 5, k) - 2 do
							table.insert(Vetement2.Sac2, i)
						end

					end,
				})
			end
		
		end)

		RageUI.IsVisible(variationssac, function()
		
			RageUI.Button("Variation Sac 0", nil, {}, true, {
				onActive = function()
					Vetement2.SacIndex2 = 0
					TriggerEvent('skinchanger:change', 'bags_2', 0)
				end,
				onSelected = function()
					RageUI.Visible(variationssac, false)
					RageUI.Visible(paidsac, true)
				end
			})
			for k, v in pairs(Vetement2.Sac2) do 
				RageUI.Button("Variation Sac "..k, nil, {}, true, {
					onActive = function()
						Vetement2.SacIndex2 = k
						TriggerEvent('skinchanger:change', 'bags_2', k)
					end,
				})
			end
		end)

		-- Chaîne 
		RageUI.IsVisible(chaine, function()
			RageUI.Button("Aucune Chaine ", nil, {}, true, {
				onActive = function()
					Vetement2.ChaineIndex = 0
					TriggerEvent('skinchanger:change', 'chain_1', 0)
					TriggerEvent('skinchanger:change', 'chain_2', 0)
					Vetement2.Chaine2 = {}
					for i = 0, GetNumberOfPedPropTextureVariations(PlayerPedId(), 7, 0)-2 do
						table.insert(Vetement2.Chaine2, i)
					end
				end,
			})
			for k, v in pairs(Vetement2.Chaine) do 
				RageUI.Button("Chaine "..k, nil, {}, true, {
					onActive = function()
						Vetement2.ChaineIndex = k
						TriggerEvent('skinchanger:change', 'chain_1', k)
						TriggerEvent('skinchanger:change', 'chain_2', 0)
						Vetement2.Chaine2 = {}
						for i = 0, GetNumberOfPedTextureVariations(PlayerPedId(), 7, k)-2 do
							table.insert(Vetement2.Chaine2, i)
						end

					end,
				})
			end
		
		end)

		RageUI.IsVisible(variationschaine, function()

			RageUI.Button("Variation Chaine 0", nil, {}, true, {
				onActive = function()
					Vetement2.ChaineIndex2 = 0
					TriggerEvent('skinchanger:change', 'chain_2', 0)
				end,
				onSelected = function()
					RageUI.Visible(variationschaine, false)
					RageUI.Visible(paidchaine, true)
				end
			})
			for k, v in pairs(Vetement2.Chaine2) do 
				RageUI.Button("Variation Chaine "..k, nil, {}, true, {
					onActive = function()
						Vetement2.ChaineIndex2 = k
						TriggerEvent('skinchanger:change', 'chain_2', k)
					end,
				})
			end
		
		end)
		
		-- Accesoires d'oreille
		RageUI.IsVisible(oreille, function()
			RageUI.Button("Aucune Accesoire d'oreille ", nil, {}, true, {
				onActive = function()
					Vetement2.OreilleIndex = 0
					TriggerEvent('skinchanger:change', 'ears_1', 0)
					TriggerEvent('skinchanger:change', 'ears_2', 0)
					Vetement2.Oreille2 = {}
					for i = 0, GetNumberOfPedPropTextureVariations(PlayerPedId(), 2, 0) -2 do
						table.insert(Vetement2.Oreille2, i)
					end
				end,
			})
			for k, v in pairs(Vetement2.Oreille) do 
				RageUI.Button("Accesoire d'oreille "..k, nil, {}, true, {
					onActive = function()
						Vetement2.OreilleIndex = k
						TriggerEvent('skinchanger:change', 'ears_1', k)
						TriggerEvent('skinchanger:change', 'ears_2', 0)
						Vetement2.Oreille2 = {}
						for i = 0, GetNumberOfPedPropTextureVariations(PlayerPedId(), 2, k)-2 do
							table.insert(Vetement2.Oreille2, i)
						end
					end,
				})
			end
		end)

		RageUI.IsVisible(variationsoreille, function()

			RageUI.Button("Variation Accesoire d'oreille 0", nil, {}, true, {
				onActive = function()
					Vetement2.OreilleIndex2 = 0
					TriggerEvent('skinchanger:change', 'ears_2', 0)
				end,
			})
			for k, v in pairs(Vetement2.Oreille2) do 
				RageUI.Button("Variation Chaine "..k, nil, {}, true, {
					onActive = function()
						Vetement2.OreilleIndex2 = k
						TriggerEvent('skinchanger:change', 'ears_2', k)
					end,
				})
			end
		
		end)
        if not RageUI.Visible(main) and
            not RageUI.Visible(garderobe) and
            not RageUI.Visible(tshirt) and 
            not RageUI.Visible(tshirt2) and 
            not RageUI.Visible(torse) and 
            not RageUI.Visible(torse2) and 
            not RageUI.Visible(bras) and 
            not RageUI.Visible(calque) and 
            not RageUI.Visible(calque2) and

            not RageUI.Visible(bproof) and 
            not RageUI.Visible(bproof2) and 

            not RageUI.Visible(pantalon) and 
            not RageUI.Visible(pantalon2) and 
            not RageUI.Visible(chaussures) and 
            not RageUI.Visible(chaussures2) and 

            not RageUI.Visible(mask) and 
		    not RageUI.Visible(lunette) and
            not RageUI.Visible(chapeau) and 
            not RageUI.Visible(sac) and 
            not RageUI.Visible(chaine) and 
            not RageUI.Visible(oreille) and 

            not RageUI.Visible(variationsmasque) and 
            not RageUI.Visible(variationslunette) and 
            not RageUI.Visible(variationschapeau) and 
            not RageUI.Visible(variationssac) and 
            not RageUI.Visible(variationschaine) and 
            not RageUI.Visible(variationsoreille) and 

            not RageUI.Visible(vetements) then
            main = RMenu:DeleteType(main, true)
            openClothes = false
        end

    end
end

Citizen.CreateThread(function()
    Wait(1500)
    TriggerServerEvent("RecieveVetement")
end)

RegisterNetEvent("johnny:recieveclientsidevetement", function(Info)
    ClothesPlayer = Info
end)

function MenuVeheculesFBI()
    local main = RageUI.CreateMenu("", "Menu Intéraction")
    RageUI.Visible(main, not RageUI.Visible(main))
    while main do
        Wait(0)
        local plyped = PlayerPedId()
        local playcoords = GetEntityCoords(plyped)
        local menucoords = ZonesListe["MenuVeheculesFBI"].Position
        local dif = #(playcoords - menucoords )
        if dif > 7 then 
            RageUI.CloseAll()
        end
        RageUI.IsVisible(main, function()
            for k, v in pairs(FBI.Vehicules) do
                RageUI.Button(v.label, nil, {}, ESX.PlayerData.job.grade >= v.minimum_grade, {
                    onSelected = function()
                        TriggerServerEvent('Space:spawnVehicle', v.name, vector3(2549.459, -372.1366, 92.9934), 350.28515625);
                        RageUI.CloseAll()
                    end
                })
            end
        end)
        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main', true)
        end
    end
end


function Menucustom()
    local main = RageUI.CreateMenu("", "Menu Intéraction")
    local subMenu1 = RageUI.CreateSubMenu(main, "", "Menu Intéraction")
    RageUI.Visible(main, not RageUI.Visible(main))
    while main do
        Wait(0)
        local plyped = PlayerPedId()
        local playcoords = GetEntityCoords(plyped)
        local menucoords = ZonesListe["Menucustom"].Position
        local dif = #(playcoords - menucoords )
        local vh = GetVehiclePedIsIn(plyped, false)
        local modelName = GetEntityModel(vh)
        if vh ~= 0 then
            if FBI.wlcustom[modelName] then
                if dif > 9 then 
                    RageUI.CloseAll()
                end

                RageUI.IsVisible(main, function()
                    RageUI.List("Couleur", {"Noir","Rouge","Blanc","Bleu"}, customindex, nil, {}, true,{
                        onListChange = function(index)
                            customindex = index
                            if customindex == 1 then
                                vehcustom(vh,1)
                            elseif customindex == 2 then
                                vehcustom(vh,27)
                            elseif customindex == 3 then
                                vehcustom(vh,111)
                            elseif customindex == 4 then
                                vehcustom(vh,62)
                            end
                        end
                    })
                    RageUI.List("Vitre teintée", {"Niveau 1","Niveau 2","Niveau 3","Niveau 4","Niveau 5","Niveau 6"}, customindex2, nil, {}, true,{
                        onListChange = function(index)
                            customindex2 = index
                            if customindex2 == 1 then
                                vehcustom(vh,nil,4)
                            elseif customindex2 == 2 then
                                vehcustom(vh,nil,0)
                            elseif customindex2 == 3 then
                                vehcustom(vh,nil,5)
                            elseif customindex2 == 4 then
                                vehcustom(vh,nil,3)
                            elseif customindex2 == 5 then
                                vehcustom(vh,nil,2)
                            elseif customindex2 == 6 then
                                vehcustom(vh,nil,1)
                            end
                        end
                    })
                    RageUI.List("Extra", {"Extra 1", "Extra 2", "Extra 3"}, customindex3, nil, {}, true, {
                        onListChange = function(index)
                            customindex3 = index
                            local pPed = GetPlayerPed(-1)
                            local pInVeh = IsPedInAnyVehicle(pPed, false)
                    
                            if pInVeh then
                                local pVeh = GetVehiclePedIsIn(pPed, false)
                                local isInRightSeat = GetPedInVehicleSeat(pVeh, -1) == pPed
                    
                                if isInRightSeat then
                                    for i = 1, 9 do
                                        if DoesExtraExist(pVeh, i) then
                                            if IsVehicleExtraTurnedOn(pVeh, i) then
                                                RageUI.Button("~g~Désactiver~s~ l'extra " .. i, nil, {}, true, {
                                                    onSelected = function()
                                                        SetVehicleExtra(pVeh, i, true)
                                                    end,
                                                })
                                            else
                                                RageUI.Button("~g~Activer~s~ l'extra " .. i, nil, {}, true, {
                                                    onSelected = function()
                                                        SetVehicleExtra(pVeh, i, false)
                                                    end,
                                                })
                                            end
                                        end
                                    end
                                else
                                    RageUI.Separator("Vous devez être conducteur dans un véhicule")
                                end
                            else
                                RageUI.Separator("Vous devez être dans un véhicule")
                            end
                        end
                    })
                    
                end)
                
            else
                ESX.ShowNotification("Votre véhicule n'est pas autorise a etre modifier au FIB")
                RageUI.CloseAll()
            end
            if not RageUI.Visible(main) then
                main = RMenu:DeleteType('main', true)
            end
        else
            ESX.ShowNotification("vous n'êtes dans aucun véhicule")
            RageUI.CloseAll()
            return
        end
    end
end

RageUI.IsVisible(subMenu1,function() 
    if open then
        RageUI.Visible(RMenu:Get('fib', 'vehicle_option'), false)
        open = false
        return
    end
    open = true
    RageUI.Visible(RMenu:Get('fib', 'vehicle_option'), true)

    Citizen.CreateThread(function()
        while open do
            RageUI.IsVisible(RMenu:Get('fib', 'vehicle_option'), function()
                local pPed = GetPlayerPed(-1)
                local pCoords = GetEntityCoords(pPed)
                local pInVeh = IsPedInAnyVehicle(pPed, false)
                

                if pInVeh then
                    local pVeh = GetVehiclePedIsIn(pPed, false)
                    local isInRightSeat = GetPedInVehicleSeat(pVeh, -1) == pPed
                    if isInRightSeat then
                        for i = 1,9 do
                            if DoesExtraExist(pVeh, i) then
                                if IsVehicleExtraTurnedOn(pVeh, i) then
                                    RageUI.Button("~g~Désactiver~s~ l'extra "..i, nil, {}, true, {
                                        onSelected = function()
                                            SetVehicleExtra(pVeh, i, true)
                                        end,
                                    }) 
                                else
                                    RageUI.Button("~g~Activer~s~ l'extra "..i, nil, {}, true, {
                                        onSelected = function()
                                            SetVehicleExtra(pVeh, i, false)
                                        end,
                                    }) 
                                end
                            end
                        end 
                    else
                        RageUI.Separator("Vous devez etre conducteur dans un véhicule")
                    end
                else
                    RageUI.Separator("Vous devez etre dans un véhicule")
                end
            end)
            Wait(1)
        end
    end)
end)

function vehcustom(vehicle,colors,windowcolor)
    ESX.Game.SetVehicleProperties(vehicle, {
        color1 = colors,
        color2 = colors,
        windowTint = windowcolor
    })
end
function MenuWeaponsFBI()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')
    local paiement = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local achatArmes = {}

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
    
    while mainMenu do
        Wait(0)
        local plyped = PlayerPedId()
        local playcoords = GetEntityCoords(plyped)
        local menucoords = ZonesListe["MenuWeaponsFBI"].Position
        local dif = #(playcoords - menucoords )
        if dif > 7 then 
            RageUI.CloseAll()
        end
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Tazer", nil, {}, true , {
                onSelected = function()
                    table.insert(achatArmes, {
                        label = "Tazer",
                        hash = 'weapon_stungun',
                        prix = 0,
                    })
                end
            }, paiement)
            RageUI.Button("Lampe torche", nil, {}, true , {
                onSelected = function()
                    table.insert(achatArmes, {
                        label = "Lampe torche",
                        hash = 'weapon_flashlight',
                        prix = 0,
                    })
                end
            }, paiement)
            RageUI.Button("Matraque", nil, {}, true , {
                onSelected = function()
                    table.insert(achatArmes, {
                        label = "Matraque",
                        hash = 'weapon_nightstick',
                        prix = 0,
                    })
                end
            }, paiement)
            RageUI.Button("Pistolet de combat", nil, {}, true , {
                onSelected = function()
                    table.insert(achatArmes, {
                        label = "Pistolet de combat",
                        hash = 'weapon_combatpistol',
                        prix = 0,
                    })
                end
            }, paiement)
            RageUI.Button("Carabine d'assault", nil, {}, true , {
                onSelected = function()
                    table.insert(achatArmes, {
                        label = "Carabine d'assault",
                        hash = 'weapon_carbinerifle',
                        prix = 0,
                    })
                end
            }, paiement)
        end)

        RageUI.IsVisible(paiement, function()
            for k,v in pairs(achatArmes) do
                RageUI.Button("Arme: 1 "..v.label, nil, {}, true , {})
                RageUI.Button("Récupérer votre armement", nil, {}, true , {
                    onSelected = function()
                        TriggerServerEvent('buyWeaponForFIB', v.hash)
                        table.remove(achatArmes, k)
                        RageUI.CloseAll()
                    end
                })
            end
        end)

        if not RageUI.Visible(mainMenu) and 
        not RageUI.Visible(paiement) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            table.remove(achatArmes, k)
        end
    end
end

function MenuHelicoFBI()
    local main = RageUI.CreateMenu("", "Menu Intéraction")

    RageUI.Visible(main, not RageUI.Visible(main))

    while main do
        Wait(0)
        local plyped = PlayerPedId()
        local playcoords = GetEntityCoords(plyped)
        local menucoords = ZonesListe["MenuHelicoFBI"].Position
        local dif = #(playcoords - menucoords )
        if dif > 7 then 
            RageUI.CloseAll()
        end
        RageUI.IsVisible(main, function()
            for k, v in pairs(FBI.Helicoptere) do
                RageUI.Button(v.label, nil, {}, ESX.PlayerData.job.grade >= v.minimum_grade, {
                    onSelected = function()
                        TriggerServerEvent('Space:spawnVehicle', v.name, vector3(2511.1198730469,-426.99526977539,118.333152771), 306.65);
                        RageUI.CloseAll()
                    end
                })
            end
        end)
        if not RageUI.Visible(main) then
            main = RMenu:DeleteType('main', true)
        end

    end

end