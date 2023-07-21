--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil
local prenom = nil
local nom = nil
local date = nil
local raison = nil
local isInService = false
local nomdelemploye = nil
local gradedelemploye = nil
local CasierJudiciaire = {}
local CheckPlaintes = {}
local Items = {}
local Armes = {}
local ArgentSale = {}
local infosvehicle = {}
local IsHandcuffed, DragStatus = false, {}
local openF6 = false
local openClothes = false
local openedGarage = false
local openPlainte = false
local openBureau = false
local isArmurerieOpened = false

DragStatus.IsDragged = false

-- Décla + peds/blips

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)
		Citizen.Wait(100)
    end

    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end

end)

Citizen.CreateThread(function()
    --[[for k,v in pairs(Config.Jobs.police.Blips) do
        local blip = AddBlipForCoord(v.coords)

		SetBlipSprite (blip, 60)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.6)
		SetBlipColour (blip, 29)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString("Station de police")
		EndTextCommandSetBlipName(blip)
    end]]

    for k,v in pairs(Config.Jobs.police.Peds) do
        local model = GetHashKey(v.ped[1])
		RequestModel(model)
		while not HasModelLoaded(model) do Wait(1) end
		local ped = CreatePed(4, model, v.ped[2], v.ped[3], false, true)
		FreezeEntityPosition(ped, true)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		TaskStartScenarioInPlace(ped, "WORLD_HUMAN_COP_IDLES", 0, true)
    end
end)

-- Main
function openF6Police()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')
    local actions = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local interaction = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local interactionveh = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local renfort = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local objets = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local casier = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local plaintes = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local fouiller = RageUI.CreateSubMenu(interaction, "", "Faites vos actions")
    local lesinfosduvehicle = RageUI.CreateSubMenu(interactionveh, "", "Faites vos actions")
    local infoscasier = RageUI.CreateSubMenu(casier, "", "Faites vos actions")
    local showDatabase = RageUI.CreateSubMenu(casier, "", "Faites vos actions")
    local infosplaintes = RageUI.CreateSubMenu(plaintes, "", "Faites vos actions")
    local infoamende = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local chien = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local anoncespolice = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openF6 do
        Wait(1)
        RageUI.IsVisible(mainMenu, function()
            if isInService then
                if ESX.PlayerData.job.grade_name == 'recruit' then
                    RageUI.Button("Intéractions citoyen", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, interaction)
                    RageUI.Button("Anonces", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, anoncespolice)
                    RageUI.Button("Intéractions véhicules", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, interactionveh)
                    RageUI.Button("Demande de renforts", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, renfort)
                    --RageUI.Button("Placer des objets", nil, {RightLabel = "→"}, true , {
                        --onSelected = function()
                        --end
                    --}, objets)
                    RageUI.Button("Casier judiciaire", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, casier)
                    RageUI.Button("Plaintes", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, plaintes)
                else
                    RageUI.Button("Intéractions citoyen", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, interaction)
                    RageUI.Button("Anonces", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, anoncespolice)
                    RageUI.Button("Intéractions véhicules", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, interactionveh)
                    RageUI.Button("Demande de renforts", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, renfort)
                    RageUI.Button("Intéraction sur un chien", nil, {RightLabel = "→"}, true , {}, chien)
                    RageUI.Button("Casier judiciaire", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, casier)
                    RageUI.Button("Plaintes", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                        end
                    }, plaintes)
                end
            else
                RageUI.Separator("~p~Vous devez être en service")
            end
        end)        

        RageUI.IsVisible(casier, function()
            RageUI.Button("Voir les casiers déjà existants", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    getData()
                end
            }, showDatabase)
            RageUI.Button("Ajouter un casier dans la base", nil, {RightLabel = "→"}, true , {
            }, infoscasier)
        end)

        RageUI.IsVisible(plaintes, function()
            RageUI.Button("Consulter les plaintes", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    getPlaintes()
                end
            }, infosplaintes)
        end)

        RageUI.IsVisible(infosplaintes,function()
            for k,v in pairs(CheckPlaintes) do
                RageUI.Button("Plainte de: "..v.prenom.. " "..v.nom.. " Num: "..v.num, "Contre: "..v.prenom1.. " "..v.nom1.. " a contacter au: "..v.num1.. " pour la raison: "..v.raison, {RightLabel = "→"}, true , {
                    onSelected = function()
                        verif = KeyboardInputPolice("delete", 'Voulez vous supprimer cette plainte ? (oui/non)', '', 4)
                        verified = (tostring(verif))

                        if verified == "oui" then
                            TriggerServerEvent('plaitetraiter', v.prenom, v.nom, v.num)
                            RageUI.GoBack()
                        else
                            ESX.ShowNotification("Suppression annulée")
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(chien,function()


            RageUI.Checkbox("Sortir/Rentrer le chien", nil, chienpolice, {}, {
                onChecked = function(index, items)
                    chienpolice = true
                    if not DoesEntityExist(policeDog) then
                    RequestModel('a_c_shepherd')
                    while not HasModelLoaded('a_c_shepherd') do Wait(0) end
                    policeDog = CreatePed(4, 'a_c_shepherd', GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -0.98), 0.0, true, false)
                    SetEntityAsMissionEntity(policeDog, true, true)
                    ESX.ShowNotification('~g~Chien Spawn')
                    end
                end,
                onUnChecked = function(index, items)
                    chienpolice = false
                    ESX.ShowNotification('~g~Chien Rentrer')
                    DeleteEntity(policeDog)
                end
            })
            
            
            RageUI.Button("Assis", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    if DoesEntityExist(policeDog) then
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policeDog), true) <= 5.0 then
                            if IsEntityPlayingAnim(policeDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 3) then
                                ClearPedTasks(policeDog)
                            else
                                loadDict('rcmnigel1c')
                                TaskPlayAnim(PlayerPedId(), 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 120, 0, false, false, false)
                                Wait(2000)
                                loadDict("creatures@rottweiler@amb@world_dog_sitting@base")
                                TaskPlayAnim(policeDog, "creatures@rottweiler@amb@world_dog_sitting@base", "base", 8.0, -8, -1, 1, 0, false, false, false)
                            end
                        else
                            ESX.ShowNotification('~g~Le chien est trop loin de vous !')
                        end
                    else
                        ESX.ShowNotification('~g~Vous n\'avez pas de chien !')
                    end
                end
                })
            
                RageUI.Button("Dire d'attaquer", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        if DoesEntityExist(policeDog) then
                            if not IsPedDeadOrDying(policeDog) then
                                if GetDistanceBetweenCoords(GetEntityCoords(policeDog), GetEntityCoords(PlayerPedId()), true) <= 3.0 then
                                    local player, distance = ESX.Game.GetClosestPlayer()
                                    if distance ~= -1 then
                                        if distance <= 3.0 then
                                            local playerPed = GetPlayerPed(player)
                                            if not IsPedInCombat(policeDog, playerPed) then
                                                if not IsPedInAnyVehicle(playerPed, true) then
                                                    TaskCombatPed(policeDog, playerPed, 0, 16)
                                                end
                                            else
                                                ClearPedTasksImmediately(policeDog)
                                            end
                                        end
                                    else
                                        ESX.ShowNotification("~g~Probleme~s~: Aucuns joueurs proche")
                                    end
                                else
                                    ESX.ShowNotification('~g~Le chien est trop loin de vous !')
                                end
                            else
                                ESX.ShowNotification('Votre chien est mort !')
                            end
                        else
                            ESX.ShowNotification('~g~Vous n\'avez pas de chien')
                        end
                    end
                    })
            
                    RageUI.Button("Monter/sortir du véhicule", nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            if DoesEntityExist(policeDog) then
                                if not IsPedInAnyVehicle(policeDog, false) then
                                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policeDog)) <= 10.0 then
                                        local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 7.5, 0, 70)
                                        print(vehicle)
                                        if DoesEntityExist(vehicle) then
                                            for i = 0, GetVehicleMaxNumberOfPassengers(vehicle) do
                                                if IsVehicleSeatFree(vehicle, i) then
                                                    TaskEnterVehicle(policeDog, vehicle, 15.0, i, 1.0, 1, 0)
                                                    break
                                                end
                                            end
                                        else
                                            ESX.ShowNotification('~g~vous n\'avez pas de véhicule !')
                                        end
                                    else
                                        ESX.ShowNotification('~g~Le chien est trop loin de vous !')
                                    end
                                else
                                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policeDog)) <= 5.0 then
                                        TaskLeaveVehicle(policeDog, GetVehiclePedIsIn(policeDog, false), 0)
                                    else
                                        ESX.ShowNotification('~g~Le chien est trop loin de vous !')
                                    end
                                end
                            else
                                ESX.ShowNotification('~g~Vous n\'avez pas de chien !')
                            end
                        end
                        })
            
                        RageUI.Button("Suis-moi", nil, {RightLabel = "→"}, true , {
                            onSelected = function()
                                local playerPed = PlayerPedId()
                                if DoesEntityExist(policeDog) then
                                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policeDog), true) <= 5.0 then
                                        TaskGoToEntity(policeDog, playerPed, -1, 1.0, 10.0, 1073741824, 1)
                                    else
                                        ESX.ShowNotification('~g~Le chien est trop loin de vous !')
                                    end
                                else
                                    ESX.ShowNotification('~g~Vous n\'avez pas de chien !')
                                end
                            end
                            })
            
                        end)

        RageUI.IsVisible(infoamende,function()


            for k,v in pairs(PoliceConfigAAA.amende) do
            for _,i in pairs(v) do
            RageUI.Button(i.label, nil, {RightLabel = "~g~"..i.price.."$"}, true , {
                onSelected = function() 
                    local player, distance = ESX.Game.GetClosestPlayer()
                    local sID = GetPlayerServerId(player)

                    if player ~= -1 and distance <= 3.0 then
                        TriggerServerEvent("police:SendFacture", sID, i.price)
                        RageUI.CloseAll()
                        open = false
                    else
                        ESX.ShowNotification("~r~Personne autour de vous")
                    end
                end
            })

        end
        end
        end)

        RageUI.IsVisible(anoncespolice, function()
            RageUI.Separator("↓ Gestion Anonces ~s~ ↓")
            RageUI.Button("Annonce", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    OpenAnnouncementMenu()
                end
            })
            RageUI.Button("Demander un ~g~[avocat]~s~", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    TriggerServerEvent('Police:avocat')
                end
            })
        end)

        function OpenAnnouncementMenu()
            local annonce = KeyboardInputPolice('Entrez votre annonce', '','', 100)
            if annonce and annonce ~= "" then
                TriggerServerEvent('Police:annonce', annonce)
            end
        end

        RageUI.IsVisible(interaction, function()
            RageUI.Button("Mettre une amende", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                end
            }, infoamende)
            RageUI.Button("Prendre la carte d'identité", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local player, distance = ESX.Game.GetClosestPlayer()
                    local getPlayerSearch = GetPlayerPed(player)
                    if IsEntityPlayingAnim(getPlayerSearch, 'random@mugging3', 'handsup_standing_base', 3) then
                        if distance ~= -1 and distance <= 3.0 then
                            RageUI.CloseAll()
                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
                        else
                            ESX.ShowNotification('~r~Personne autour de vous')
                        end
                    else
                        ESX.ShowNotification("La personne en face ne lève pas les mains")
                    end
                end
            })
            RageUI.Button("Fouiller", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local player, distance = ESX.Game.GetClosestPlayer()
                    if distance ~= -1 and distance <= 3.0 then
                        ExecuteCommand('me fouille la personne')
                        TriggerServerEvent('message', GetPlayerServerId(player))
                        getPlayerInvPolice(player)
                    else
                        ESX.ShowNotification('~r~Personne autour de vous')
                    end
                end
            }, fouiller)
            RageUI.Button("Menotter/Démenotter", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('~r~Personne autour de vous')
                    else
                        TriggerServerEvent('menotterForPolice', GetPlayerServerId(closestPlayer))
                    end
                end
            })
            RageUI.Button("Escorter", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    playerheading = GetEntityHeading(PlayerPedId())
                    playerlocation = GetEntityForwardVector(PlayerPedId())
                    playerCoords = GetEntityCoords(PlayerPedId())
                    local target_id = GetPlayerServerId(target)
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('~r~Personne autour de vous')
                    else
                        TriggerServerEvent('escorterpolice', GetPlayerServerId(closestPlayer))
                    end
                end
            })
            RageUI.Button("Jeter dans le véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('~r~Personne autour de vous')
                    else
                        TriggerServerEvent('jeter', GetPlayerServerId(closestPlayer))
                    end
                end
            })

            RageUI.Button("Sortir du véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('~r~Personne autour de vous')
                    else
                        TriggerServerEvent('sortir', GetPlayerServerId(closestPlayer))
                    end
                end
            })

            RageUI.Button('Saisir le permis d\'arme', nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer == -1 or closestDistance > 3.0 then
                        ESX.ShowNotification('~r~Personne autour de vous')
                    else
                        TriggerServerEvent("esx_license:removeLicense", sID, "weapon")
                        ESX.ShowNotification("Vous avez retiré le permis de la personne.")
                    end
                end
            })
        end)

        RageUI.IsVisible(objets, function()
            RageUI.Button("Poser un plot", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    spawnObject('prop_roadcone02a')
                   -- RageUI.GoBack()
                end
            })
            RageUI.Button("Poser un herse", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    spawnObject('p_ld_stinger_s')
                   -- RageUI.GoBack()
                end
            })
            RageUI.Button("Poser une barrière", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    spawnObject('prop_barrier_work05')
                    --RageUI.GoBack()
                end
            })
        end)

        RageUI.IsVisible(interactionveh, function()
            RageUI.Button("Rechercher une plaque", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local numplaque = KeyboardInputPolice('', '','', 10)
                    local length = string.len(numplaque)
                    if not numplaque or length < 2 or length > 8 then
                        ESX.ShowNotification("Ce n'est ~g~pas~s~ un numéro enregistré dans les fichiers de ~g~police")
                    else
                        Rechercherplaquevoiture(numplaque)
                        RageUI.CloseAll()
                    end
                end
            })
        

            RageUI.Button("Crocheter le véhicule", nil, {RightLabel = "→"}, true , {
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

            RageUI.Button("Mettre le véhicule en fourrière", nil, {}, true, {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords    = GetEntityCoords(playerPed)
                    local vehicle = nil
                    if IsPedInAnyVehicle(playerPed, false) then
                        vehicle = GetVehiclePedIsIn(playerPed, false)
                    else
                        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
                    end
                    if DoesEntityExist(vehicle) then
                        TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                        Citizen.CreateThread(function()
                            Citizen.Wait(10000)
                            ESX.Game.DeleteVehicle(vehicle)
                            ClearPedTasksImmediately(playerPed)
                            ESX.ShowNotification("Véhicule mis en fourrière")
                        end)
                    end
                end
            })
        end)

        RageUI.IsVisible(renfort, function()
            RageUI.Button("Petite demande", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('demande', coords, 'petite')
                end
            })
            RageUI.Button("Moyenne demande", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('demande', coords, 'moyenne')
                end
            })
            RageUI.Button("Grande demande", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('demande', coords, 'Grande')
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
    
            RageUI.Separator("Vous Fouillez : " ..GetPlayerName(closestPlayer))

            RageUI.Separator("↓ ~r~Argent non déclaré ~s~↓")

            for k,v in pairs(ArgentSale) do
                RageUI.Button("Argent non déclaré :", nil, {RightLabel = "~g~"..v.label.."$"}, true , {
                    onSelected = function()
                        local combien = KeyboardInputPolice("Combien ?", 'Indiquez un nombre', '', 10)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification('~r~Montant invalide')
                        else
                            TriggerServerEvent('confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            RageUI.GoBack()
                        end
                    end
                })
            end

            RageUI.Separator("↓ ~r~Items du joueur ~s~↓")

            for k,v in pairs(Items) do
                RageUI.Button("Nom: "..v.label, nil, {RightLabel = "~g~"..v.right.." exemplaires"}, true , {
                    onSelected = function()
                        local combien = KeyboardInputPolice("Combien ", 'Indiquez un nombre', '', 4)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification('~r~Montant invalide')
                        else
                            TriggerServerEvent('confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            RageUI.GoBack()
                        end
                    end
                })
            end
            
            RageUI.Separator("↓ ~r~Armes du joueur ~s~↓")
            for k,v in pairs(Armes) do
                local isPermanent = ESX.IsWeaponPermanent(v.value);
                if (not isPermanent) then
                    RageUI.Button("Arme: "..v.label, nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            local combien = KeyboardInputPolice("Nombre de munitions", 'Indiquez un nombre', '', 4)
                            if tonumber(combien) > 1 then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                                RageUI.GoBack()
                            end
                        end
                    })
                end
            end

        end)


        RageUI.IsVisible(showDatabase, function()
            for k,v in pairs(CasierJudiciaire) do
                RageUI.Separator("~p~Casier de: "..v.prenom.. " "..v.nom.."")
                RageUI.Button("~r~Informations ci-dessous:", "Date de naissance: "..v.naissance.. " Motif du casier: "..v.raison, {RightLabel = "Auteur: "..v.auteur}, true , {
                    onSelected = function()
                        local grade = ESX.PlayerData.job.grade_name
                        if grade == 'boss' then
                            verif = KeyboardInputPolice("delete", 'Voulez vous supprimer ce casier ? (oui/non)', '', 4)
                            verified = (tostring(verif))
                            if verified == "oui" then
                                TriggerServerEvent('deletecasier', v.prenom, v.nom, v.naissance, v.raison, v.auteur)
                                RageUI.GoBack()
                            else
                                ESX.ShowNotification("Suppression annulée.")
                                RageUI.GoBack()
                            end
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(infoscasier, function()
            RageUI.Button("Prénom", "Indiquez le Prénom", {RightLabel = prenom}, true , {
                onSelected = function()
                    local prenomInput = KeyboardInputPolice("prenom", 'Indiquez le prenom du suspect ', '', 20)
                    if tostring(prenomInput) == nil then
                        return false
                    else
                        prenom = (tostring(prenomInput))
                    end
                end
            })
            RageUI.Button("Nom", "Indiquez le Nom de famille", {RightLabel = nom}, true , {
                onSelected = function()
                    local nomInput = KeyboardInputPolice("nom", 'Indiquez le nom du suspect ', '', 20)
                    if tostring(nomInput) == nil then
                        return false
                    else
                        nom = (tostring(nomInput))
                    end
                end
            })
            RageUI.Button("Date de naissance", "Indiquez la date de naissance", {RightLabel = date}, true , {
                onSelected = function()
                    local dateInput = KeyboardInputPolice("date", 'Indiquez la date de naissance du suspect ', '', 20)
                    if tostring(dateInput) == nil then
                        return false
                    else
                        date = (tostring(dateInput))
                    end
                end
            })
            RageUI.Button("Motif", "Indiquez le motif du casier", {RightLabel = raison}, true , {
                onSelected = function()
                    local raisonInput = KeyboardInputPolice("raison", 'Indiquez la raison du casier ', '', 100)
                    if tostring(raisonInput) == nil then
                        return false
                    else
                        raison = (tostring(raisonInput))
                    end
                end
            })
            RageUI.Button("Valider le casier", "Appuyez pour envoyer le casier dans la base", {RightLabel = "→"}, true , {
                onSelected = function()
                    local prenomInput = prenom
                    local nomInput = nom
                    local dateInput = date
                    local raisonInput = raison

                    if not prenomInput then
                        ESX.ShowNotification("Vous n'avez pas correctement renseigné la catégorie ~r~Prénom")
                    elseif not nomInput then
                        ESX.ShowNotification("Vous n'avez pas correctement renseigné la catégorie ~r~Nom")
                    elseif not dateInput then
                        ESX.ShowNotification("Vous n'avez pas correctement renseigné la catégorie ~r~Date de naissance") 
                    elseif not raisonInput then
                        ESX.ShowNotification("Vous n'avez pas correctement renseigné la catégorie ~r~Motif")
                    else
                        TriggerServerEvent('insertintocasier', nomInput, prenomInput, dateInput, raisonInput)
                        RageUI.GoBack()
                    end
                end
            })
        end)

        if not RageUI.Visible(mainMenu) and not RageUI.Visible(showDatabase) and not RageUI.Visible(plaintes) and not RageUI.Visible(infoamende) and not RageUI.Visible(infosplaintes) and not RageUI.Visible(actions) and not RageUI.Visible(infoscasier) and not RageUI.Visible(interaction) and not RageUI.Visible(anoncespolice) and not RageUI.Visible(casier) and not RageUI.Visible(interactionveh) and not RageUI.Visible(renfort) and not RageUI.Visible(objets) and not RageUI.Visible(fouiller) and not RageUI.Visible(lesinfosduvehicle) and not RageUI.Visible(chien) then
            mainMenu = RMenu:DeleteType('mainMenu', true)
            openF6 = false
        end

        if not RageUI.Visible(lesinfosduvehicle) then
            table.remove(infosvehicle, k)
        end

        if not RageUI.Visible(fouiller) then
            table.remove(ArgentSale, k)
            table.remove(Items, k)
            table.remove(Armes, k)
        end

        if not RageUI.Visible(showDatabase) then
            table.remove(CasierJudiciaire, k)
        end

        if not RageUI.Visible(infosplaintes) then
            table.remove(CheckPlaintes, k)
        end

    end
end

function openBureau()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')
    local rc = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local vr = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local pr = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openBureau do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Recruter des employés", nil, {RightLabel = "→"}, true , {
            })
            RageUI.Button("Virer des employés", nil, {RightLabel = "→"}, true , {
            })
            RageUI.Button("Promouvoir des employés", nil, {RightLabel = "→"}, true , {
            })
        end)

        Citizen.Wait(0)
        if not RageUI.Visible(mainMenu) and not RageUI.Visible(rc) and not RageUI.Visible(vr) and not RageUI.Visible(pr) then
            mainMenu = RMenu:DeleteType('mainMenu', true)
            openBureau = false
        end
    end


end

function openPlaintes()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')
    local depot = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")

    local nom
    local prenom
    local num
    local nom1
    local prenom1
    local num1
    local motif

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openPlainte do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Déposer plainte", nil, {RightLabel = "→"}, true , {
            }, depot)
        end)
        RageUI.IsVisible(depot, function()

            RageUI.Separator("↓ ~r~Vos informations ~s~↓")

            RageUI.Button("Nom de famille", nil, {RightLabel = nom}, true , {
                onSelected = function()
                    nomInput = KeyboardInputPolice("nom", 'Entrez votre nom', '', 15)
                    nom = (tostring(nomInput))
                end
            })
            RageUI.Button("Prénom", nil, {RightLabel = prenom}, true , {
                onSelected = function()
                    prenomInput = KeyboardInputPolice("prenom", 'Entrez votre prenom', '', 15)
                    prenom = (tostring(prenomInput))
                end
            })
            RageUI.Button("Numéro de téléphone", nil, {RightLabel = num}, true , {
                onSelected = function()
                    numInput = KeyboardInputPolice("num", 'Entrez votre numero de telephone', '', 15)
                    num = (tostring(numInput))
                end
            })

            RageUI.Separator("↓ ~r~Informations de l'accusé ~s~↓")

            RageUI.Button("Nom", nil, {RightLabel = nom1}, true , {
                onSelected = function()
                    nom1Input = KeyboardInputPolice("nom1", 'Entrez le nom de l\'accuse', '', 15)
                    nom1 = (tostring(nom1Input))
                end
            })
            RageUI.Button("Prénom", nil, {RightLabel = prenom1}, true , {
                onSelected = function()
                    prenom1Input = KeyboardInputPolice("prenom1", 'Entrez le prenom de l\'accuse', '', 15)
                    prenom1 = (tostring(prenom1Input))
                end
            })
            RageUI.Button("Numéro de téléphone", nil, {RightLabel = num1}, true , {
                onSelected = function()
                    num1Input = KeyboardInputPolice("num1", 'Entrez le numero de telephone de l\'accuse', '', 15)
                    num1 = (tostring(num1Input))
                end
            })
            RageUI.Button("Motif de votre plainte", motif, {RightLabel = "→"}, true , {
                onSelected = function()
                    motif = KeyboardInputPolice("motif", 'Entrez le motif de votre plainte', '', 80)
                end
            })

            RageUI.Separator("↓ ~r~Valider ~s~↓")

            RageUI.Button("Valider votre plainte", "~r~Aucun retour en arrière ne sera possible.", {RightLabel = "→"}, true , {
                onSelected = function()
                    if nom and prenom and num and nom1 and prenom1 and num1 and motif ~= nil then
                        TriggerServerEvent('validerplainte', nom, prenom, num, nom1, prenom1, num1, motif)
                        ESX.ShowNotification("~r~Votre plainte a bien été transmise aux forces de l\'autorité")
                        RageUI.GoBack()
                    else
                        ESX.ShowNotification("~p~Merci de remplir toutes les informations")
                    end
                end
            })


        end)
        if not RageUI.Visible(mainMenu) and not RageUI.Visible(depot) then
            mainMenu = RMenu:DeleteType('mainMenu', true)
            openPlainte = false
        end
        Citizen.Wait(0)
    end

end

function openArmurerie()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')
    local armes = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local paiement = RageUI.CreateSubMenu(mainMenu, "", "Faites vos actions")
    local achatArmes = {}

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
    
    while isArmurerieOpened do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Acheter des armes", motif, {RightLabel = "→"}, true , {
            }, armes)
        end)

        RageUI.IsVisible(armes, function()
            if ESX.PlayerData.job.grade_name == 'recruit' then
                RageUI.Button("Tazer", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Tazer",
                            hash = 'weapon_stungun',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Pistolet de combat", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Pistolet de combat",
                            hash = 'weapon_combatpistol',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Lampe torche", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Lampe torche",
                            hash = 'weapon_flashlight',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Matraque", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Matraque",
                            hash = 'weapon_nightstick',
                            prix = 0,
                        })
                    end
                }, paiement)

            elseif ESX.PlayerData.job.grade_name == 'officer' then
                RageUI.Button("Tazer", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Tazer",
                            hash = 'weapon_stungun',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Lampe torche", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Lampe torche",
                            hash = 'weapon_flashlight',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Matraque", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Matraque",
                            hash = 'weapon_nightstick',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Pistolet de combat", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Pistolet de combat",
                            hash = 'weapon_combatpistol',
                            prix = 0,
                        })
                    end
                }, paiement)
            else
                RageUI.Button("Tazer", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Tazer",
                            hash = 'weapon_stungun',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Lampe torche", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Lampe torche",
                            hash = 'weapon_flashlight',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Matraque", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Matraque",
                            hash = 'weapon_nightstick',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Pistolet de combat", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Pistolet de combat",
                            hash = 'weapon_combatpistol',
                            prix = 0,
                        })
                    end
                }, paiement)
                RageUI.Button("Carabine d'assault", motif, {RightLabel = "→"}, true , {
                    onSelected = function()
                        table.insert(achatArmes, {
                            label = "Carabine d'assault",
                            hash = 'weapon_carbinerifle',
                            prix = 5000,
                        })
                    end
                }, paiement)
            end
        end)

        RageUI.IsVisible(paiement, function()
            for k,v in pairs(achatArmes) do
                RageUI.Button("Arme: 1 "..v.label, nil, {RightLabel = ""}, true , {
                })
                RageUI.Button("Récupérer votre armement", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('buyWeaponForLSPD', v.hash)
                        table.remove(achatArmes, k)
                        RageUI.CloseAll()
                    end
                })
            end
        end)

        if not RageUI.Visible(mainMenu) and not RageUI.Visible(armes) and not RageUI.Visible(paiement) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            table.remove(achatArmes, k)
            isArmurerieOpened = false
        end


        Citizen.Wait(0)
    end
end

function openPoliceGarage()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openedGarage do
        local grade = ESX.PlayerData.job.grade_name
        RageUI.IsVisible(mainMenu, function()
            if grade == 'recruit' then
                RageUI.Button("Cruiser Police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6f");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vélo de police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdscorcher");
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'officer' then
                RageUI.Button("Cruiser Police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6f");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vélo de police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdscorcher");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Declasse Alamo 2500LS", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6h");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Police Cruiser", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdtorrence");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "policeb");
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'sergeant' then
                RageUI.Button("Cruiser Police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6f");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vélo de police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdscorcher");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Declasse Alamo 2500LS", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6h");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Police Cruiser", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdtorrence");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "policeb");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bradvado Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police2b");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Albany Washington", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdumkwash");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Dinka Versus", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdverus");
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'lieutenant' then
                RageUI.Button("Cruiser Police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6f");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vélo de police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdscorcher");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Declasse Alamo 2500LS", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6h");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Police Cruiser", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdtorrence");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "policeb");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bradvado Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police2b");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Albany Washington", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdumkwash");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Dinka Versus", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdverus");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Pinnacle 3.5z", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "pinnaclep");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coil Raiden", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdraiden");
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'capitaine' then
                RageUI.Button("Cruiser Police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6f");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vélo de police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdscorcher");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Declasse Alamo 2500LS", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6h");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Police Cruiser", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdtorrence");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "policeb");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bradvado Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police2b");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Albany Washington", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdumkwash");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Dinka Versus", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdverus");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Pinnacle 3.5z", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "pinnaclep");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coil Raiden", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdraiden");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bus Pénitentiaire", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdbus");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vapid Caracara", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdcara");
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'commander' then
                RageUI.Button("Cruiser Police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6f");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vélo de police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdscorcher");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Declasse Alamo 2500LS", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6h");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Police Cruiser", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdtorrence");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "policeb");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bradvado Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police2b");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Albany Washington", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdumkwash");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Dinka Versus", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdverus");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Pinnacle 3.5z", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "pinnaclep");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coil Raiden", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdraiden");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bus Pénitentiaire", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdbus");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vapid Caracara", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdcara");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Police Cruiser Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdumktorrence");
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'deputy' then
                RageUI.Button("Cruiser Police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6f");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vélo de police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdscorcher");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Declasse Alamo 2500LS", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6h");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Police Cruiser", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdtorrence");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "policeb");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bradvado Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police2b");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Albany Washington", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdumkwash");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Dinka Versus", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdverus");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Pinnacle 3.5z", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "pinnaclep");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coil Raiden", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdraiden");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bus Pénitentiaire", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdbus");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vapid Caracara", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdcara");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Police Cruiser Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdumktorrence");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("R.I.O.T", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "riot");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vapid Explorer", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdumkscoutgnd");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Police Taxi Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "poltaxi");
                        RageUI.CloseAll()
                    end
                })
            else
                RageUI.Button("Cruiser Police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6f");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vélo de police", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdscorcher");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Declasse Alamo 2500LS", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police6h");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Police Cruiser", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdtorrence");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Moto", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "policeb");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bradvado Buffalo", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "police2b");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Albany Washington", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdumkwash");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Dinka Versus", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdverus");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Pinnacle 3.5z", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "pinnaclep");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Coil Raiden", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdraiden");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bus Pénitentiaire", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdbus");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vapid Caracara", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdcara");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Police Cruiser Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdumktorrence");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("R.I.O.T", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "riot");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vapid Explorer", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "lspdumkscoutgnd");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Police Taxi Banalisé", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('police:spawnVehicle', "poltaxi");
                        RageUI.CloseAll()
                    end
                })
            end
        end)

        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            openedGarage = false
        end

        Citizen.Wait(0)
    end
end

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
	for i = 0, 100 do
        table.insert(Vetement2.Lunettes, i)
    end
	for i = 0, 	300 do
        table.insert(Vetement2.Chapeau, i)
    end
	for i = 0, 200 do
        table.insert(Vetement2.Sac, i)
    end
	for i = 0, 400 do
        table.insert(Vetement2.Chaine, i)
    end
	for i = 0, 100 do
        table.insert(Vetement2.Oreille, i)
    end	
    Vetement2.DecalsList = {}
    for i = 0, 200 do
        table.insert(Vetement2.DecalsList, i)
    end
end)

function openPoliceCloathroom()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')
    local vetements = RageUI.CreateSubMenu(mainMenu, "", "Voici les vêtements disponibles")
    local garderobe = RageUI.CreateSubMenu(mainMenu, "", "Voici toutes vos tenues")
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

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    local NoTenueDispo = false

    while openClothes do
        local playerPed = PlayerPedId()
        local grade = ESX.PlayerData.job.grade_name
        RageUI.IsVisible(mainMenu, function()
            if grade == 'recruit' then
                -- RageUI.Checkbox("Prendre son service", nil, isInService, {}, {
                --     onChecked = function(index, items)
                --         isInService = true
                --         TriggerServerEvent('annonce:servicePolice', 'prise')
                --     end,
                --     onUnChecked = function(index, items)
                --         isInService = false
                --         TriggerServerEvent('annonce:servicePolice', 'fin')
                --     end
                -- })
                RageUI.Button("Vêtements", nil, {RightLabel = "→"}, true , {}, vetements)
                RageUI.Button("Enfiler sa tenue", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        local name = KeyboardInputPolice("Indiquer le nom de la tenue", "Indiquer le nom de la tenue", "", 10)
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
           
                RageUI.Button("Garde Robe", nil, {RightLabel = "→"}, true, {}, garderobe)

                RageUI.Separator("↓ ------------ ↓")

                RageUI.Button("Enfiler sa tenue", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        if grade == 'recruit' then
                            setUniform('recruit_wear', playerPed)
                            isInService = true
                        elseif grade == 'officer' then
                            setUniform('officer_wear', playerPed)
                            isInService = true
                        elseif grade == 'sergeant' then
                            setUniform('sergeant_wear', playerPed)
                            isInService = true
                        elseif grade == 'lieutenant' then
                            setUniform('lieutenant_wear', playerPed)
                            isInService = true
                        elseif grade == 'capitaine' then
                            setUniform('capitaine_wear', playerPed)
                            isInService = true
                        elseif grade == 'commander' then
                            setUniform('commander_wear', playerPed)
                            isInService = true
                        elseif grade == 'deputy' then
                            setUniform('deputy_wear', playerPed)
                            isInService = true
                        elseif grade == 'assistantboss' then
                            setUniform('sassistantboss_wear', playerPed)
                            isInService = true
                        elseif grade == 'boss' then
                            setUniform('boss_wear', playerPed)
                            isInService = true
                        end
                        TriggerServerEvent('annonce:servicePolice', 'prise')
                    end
                })
                RageUI.Button("Reprendre ses vêtements", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                        end)
                        isInService = false
                        TriggerServerEvent('annonce:servicePolice', 'fin')
                    end
                })
            else
                RageUI.Checkbox("Prendre son service", nil, isInService, {}, {
                    onChecked = function(index, items)
                        isInService = true
                        TriggerServerEvent('annonce:servicePolice', 'prise')
                    end,
                    onUnChecked = function(index, items)
                        isInService = false
                        TriggerServerEvent('annonce:servicePolice', 'fin')
                    end
                })
                RageUI.Button("Vêtements", nil, {RightLabel = "→"}, true , {}, vetements)
                RageUI.Button("Valider la tenue sans l'enregister", nil, {RightLabel = "→"}, true, {
                    onSelected = function()  
                        TriggerEvent("skinchanger:getSkin", function(skin)
                            TriggerServerEvent("esx_skin:save", skin)
                        end)
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Valider la tenue et l'enregister", nil, {RightLabel = "→"}, true, {
                    onSelected = function()
                        local name = KeyboardInputPolice("Indiquer le nom de la tenue", "Indiquer le nom de la tenue", "", 10)
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

                RageUI.Separator("↓ ------------ ~s~ ↓")

                RageUI.Button("Mettre un gilet pare-balles", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        setUniform('bullet_wear', playerPed)
                    end
                })
                RageUI.Button("Enfiler sa tenue", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        if grade == 'recruit' then
                            setUniform('recruit_wear', playerPed)
                            isInService = true
                        elseif grade == 'officer' then
                            setUniform('officer_wear', playerPed)
                            isInService = true
                        elseif grade == 'sergeant' then
                            setUniform('sergeant_wear', playerPed)
                            isInService = true
                        elseif grade == 'lieutenant' then
                            setUniform('lieutenant_wear', playerPed)
                            isInService = true
                        elseif grade == 'capitaine' then
                            setUniform('capitaine_wear', playerPed)
                            isInService = true
                        elseif grade == 'commander' then
                            setUniform('commander_wear', playerPed)
                            isInService = true
                        elseif grade == 'deputy' then
                            setUniform('deputy_wear', playerPed)
                            isInService = true
                        elseif grade == 'assistantboss' then
                            setUniform('sassistantboss_wear', playerPed)
                            isInService = true
                        elseif grade == 'boss' then
                            setUniform('boss_wear', playerPed)
                            isInService = true
                        end
                        TriggerServerEvent('annonce:servicePolice', 'prise')
                    end
                })
                RageUI.Button("Reprendre ses vêtements", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                        end)
                        isInService = false
                        TriggerServerEvent('annonce:servicePolice', 'fin')
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
                                    local newname = KeyboardInputPolice("Nouveau nom","Nouveau nom", "", 15)
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

        if not RageUI.Visible(mainMenu) and
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
            mainMenu = RMenu:DeleteType(mainMenu, true)
            openClothes = false
        end
        Citizen.Wait(0)
    end
end

Citizen.CreateThread(function()
    Wait(1500)
    TriggerServerEvent("RecieveVetement")
end)

RegisterNetEvent("johnny:recieveclientsidevetement", function(Info)
    ClothesPlayer = Info
end)

function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.police.Uniforms[job].male)

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		else
			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.police.Uniforms[job].female)

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		end
	end)
end

function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.police.Uniforms[job].male)

			if job == 'bullet_swat' then
				SetPedArmour(playerPed, 100)
			end
		else
			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.police.Uniforms[job].female)

			if job == 'bullet_swat' then
				SetPedArmour(playerPed, 100)
			end
		end
	end)
end

function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.police.Uniforms[job].male)

			if job == 'bullet_ne' then
				SetPedArmour(playerPed, 100)
			end
		else
			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.police.Uniforms[job].female)

			if job == 'bullet_ne' then
				SetPedArmour(playerPed, 100)
			end
		end
	end)
end

function getData()
    ESX.TriggerServerCallback('getData', function(cb)
        if not cb then return end
    
        for i = 1, #cb, 1 do
            local d = cb[i]
    
            table.insert(CasierJudiciaire, {
                prenom = d.Prenom,
                nom = d.Nom,
                naissance = d.naissance,
                raison = d.raison,
                auteur = d.auteur
                -- bla bla ...
            })
        end
    end)
end

function getPlaintes()
    ESX.TriggerServerCallback('getPlaintes', function(cb)
        if not cb then return end

        for i = 1, #cb, 1 do
            local d = cb[i]

            table.insert(CheckPlaintes, {
                prenom = d.Prenom,
                nom = d.Nom,
                num = d.Num,
                prenom1 = d.Prenom1,
                nom1 = d.Nom1,
                num1 = d.Num1,
                raison = d.raison,
                auteur = d.auteur
            })
        end
    end)
end

RegisterNetEvent('addTransactions')
AddEventHandler('addTransactions', function(source)
    for k,v in pairs(tableachat) do
        table.remove(achatArmes, k)
    end
end)

RegisterNetEvent('updateinfos')
AddEventHandler('updateinfos', function(xPlayers)
    getData()
end)

RegisterNetEvent('checkplaintes')
AddEventHandler('checkplaintes', function(xPlayers)
    getPlaintes()
end)

Citizen.CreateThread(function()
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    while true do
        local interval = 500
        --for k,v in pairs(Config.Jobs.police.Bureau) do
          --  local coords = GetEntityCoords(PlayerPedId(), false)
            --local dist = Vdist(coords.x, coords.y, coords.z, v.Bureau)
           -- if #(coords - v.Bureau) <= 10 then
              --  DrawMarker(Config.Get.Marker.Type, v.Bureau, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                --if #(coords - v.Bureau) <= 3 then
                   -- if ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade_name == 'boss' then
                      --  interval = 0
                     --   if IsControlJustPressed(0, 51) then
                       --     openBureau = true
                       --     openBureau()
                       -- end
                      --  ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~  pour intéragir")
                        --DrawMarker(Config.Get.Marker.Type, v.Bureau, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                  --  end
               -- end
              --  interval = 1
           -- end
        --end
        for k,v in pairs(Config.Jobs.police.RangerVehicule) do
            local coords = GetEntityCoords(PlayerPedId())
            if #(coords - v.pos) <= 10 then
                interval = 1
                DrawMarker(Config.Get.Marker.Type, v.pos, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                if #(coords - v.pos) <= 3 then
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule")
                    if IsControlJustPressed(0, 51) then
                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                        ESX.Game.DeleteVehicle(vehicle)
                    end
                end
            end
        end
        for k,v in pairs(Config.Jobs.police.Plainte) do
            local coords = GetEntityCoords(PlayerPedId(), false)
            --local dist = Vdist(coords.x, coords.y, coords.z, v.Plainte)
            if #(coords - v.Plainte) <= 10 then
                DrawMarker(Config.Get.Marker.Type, v.Plainte, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                if #(coords - v.Plainte) <= 3 then
                   -- interval = 0
                    if IsControlJustPressed(0, 51) then
                        openPlainte = true
                        openPlaintes()
                    end
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour déposer plainte")
                   -- DrawMarker(Config.Get.Marker.Type, v.Plainte, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                end
                interval = 1
            end
        end
        for k,v in pairs(Config.Jobs.police.Zones) do
            local coords = GetEntityCoords(PlayerPedId(), false)
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' then
                if #(coords - v.Armurerie) <= 10 then
                    if isInService then
                        interval = 1
                        DrawMarker(Config.Get.Marker.Type, v.Armurerie, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                        if #(coords - v.Armurerie) <= 3 then
                            if IsControlJustPressed(0, 51) then
                                isArmurerieOpened = true
                                openArmurerie()
                            end
                            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder à l'armurerie")
                        end
                    end
                elseif #(coords - v.Vestiaire) <= 10 then
                    interval = 1
                    DrawMarker(Config.Get.Marker.Type, v.Vestiaire, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                    if #(coords - v.Vestiaire) <= 3 then
                        if IsControlJustPressed(0, 51) then
                            openClothes = true
                            openPoliceCloathroom()
                        end
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder aux vestiaires")
                    end
                elseif #(coords - v.PosGarage) <= 10 then
                    if isInService then
                        interval = 1
                        DrawMarker(Config.Get.Marker.Type, v.PosGarage, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                        if #(coords - v.PosGarage) <= 3 then
                            if IsControlJustPressed(0, 51) then
                                openedGarage = true
                                openPoliceGarage()
                            end
                            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au garage")
                        end
                    end
                end
            end
        end
        --for k,v in pairs(Config.Jobs.police.Garage) do
        --end
        Citizen.Wait(interval)
    end
end)


function getPlayerInvPolice(player)
    
    ESX.TriggerServerCallback('getOtherPlayerDataPolice', function(data)
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

function getInfosVehicle(vehicleData)
    ESX.TriggerServerCallback('getVehicleInfos', function(retrivedInfo)
        if retrivedInfo.owner == nil then
            table.insert(infosvehicle, {
                label = "inconnu",
                plaque = vehicleData.plate
            })
        else
            table.insert(infosvehicle, {
                label = retrivedInfo.owner,
                plaque = retrivedInfo.plate
            })
        end
    end)
end


function KeyboardInputPolice(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
  
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
      Citizen.Wait(0)
    end
  
    if UpdateOnscreenKeyboard() ~= 2 then
      local result = GetOnscreenKeyboardResult()
      return result
    else
      return nil
    end
end

function spawnObject(name)
	local plyPed = PlayerPedId()
	local coords = GetEntityCoords(plyPed, false) + (GetEntityForwardVector(plyPed) * 1.0)

    ESX.Game.SpawnObject(name, coords, function(obj)
        SetEntityHeading(obj, GetEntityPhysicsHeading(plyPed))
        PlaceObjectOnGroundProperly(obj)
    end)

end


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

RegisterNetEvent('police:InfoService')
AddEventHandler('police:InfoService', function(service, nom)
	if service == 'prise' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Notification', '~p~Prise de service', 'Agent : ~p~'..nom..'\n~r~Code : ~p~10-8\n~r~Information : ~p~Prise de service.', 'CHAR_KIRINSPECTEUR', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'fin' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Notification', '~p~Fin de service', 'Agent : ~p~'..nom..'\n~r~Code : ~p~10-10\n~r~Information : ~p~Fin de service.', 'CHAR_KIRINSPECTEUR', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'pause' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Notification', '~p~Pause de service', 'Agent : ~g~'..nom..'\nCode : ~g~10-6\nInformation : ~g~Pause de service.', 'CHAR_KIRINSPECTEUR', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'standby' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Notification', '~p~Mise en standby', 'Agent : ~g~'..nom..'\nCode : ~g~10-12\nInformation : ~g~Standby, en attente de dispatch.', 'CHAR_KIRINSPECTEUR', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'control' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Notification', '~p~Control routier', 'Agent : ~g~'..nom..'\nCode : ~g~10-48\nInformation : ~g~Control routier en cours.', 'CHAR_KIRINSPECTEUR', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'refus' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Notification', '~p~Refus d\'obtemperer', 'Agent : ~g~'..nom..'\nCode : ~g~10-30\nInformation : ~g~Refus d\'obtemperer / Delit de fuite en cours.', 'CHAR_KIRINSPECTEUR', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	elseif service == 'crime' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		ESX.ShowAdvancedNotification('Notification', '~p~Crime en cours', 'Agent : ~g~'..nom..'\nCode : ~g~10-31\nInformation : ~g~Crime en cours / poursuite en cours.', 'CHAR_KIRINSPECTEUR', 8)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	end
end)

RegisterNetEvent('menotterlejoueur')
AddEventHandler('menotterlejoueur', function()
    IsHandcuffed    = not IsHandcuffed;
    local playerPed = PlayerPedId()
  
    Citizen.CreateThread(function()
        if IsHandcuffed then
            RequestAnimDict('mp_arresting')
            while not HasAnimDictLoaded('mp_arresting') do
                Citizen.Wait(100)
            end
  
            TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
            DisableControlAction(2, 37, true)
            SetEnableHandcuffs(playerPed, true)
            SetPedCanPlayGestureAnims(playerPed, false)
            FreezeEntityPosition(playerPed,  true)
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 263, true) -- Melee Attack 1
            DisableControlAction(0, 37, true) -- Select Weapon
            DisableControlAction(0, 47, true)  -- Disable weapon
        else
            ClearPedSecondaryTask(playerPed)
            SetEnableHandcuffs(playerPed, false)
            SetPedCanPlayGestureAnims(playerPed,  true)
            FreezeEntityPosition(playerPed, false)
        end
    end)
end)

IsInMenotte = function()
	if IsHandcuffed == true then
		return true
	else
		return false
	end
end

RegisterNetEvent('actionescorter')
AddEventHandler('actionescorter', function(cop)
  IsDragged = not IsDragged
  CopPed = tonumber(cop)
end)

Citizen.CreateThread(function()
  while true do
    Wait(0)
    if IsHandcuffed then
      if IsDragged then
        local ped = GetPlayerPed(GetPlayerFromServerId(CopPed))
        local myped = PlayerPedId()
        AttachEntityToEntity(myped, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
      else
        DetachEntity(PlayerPedId(), true, false)
      end
    end
  end
end)

local IsInPVP = false;

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register('F6','InteractionsJobPolice', 'Menu job Police', function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' then
        
        if (not IsInPVP) then
            PlaySoundFrontend(-1, 'ATM_WINDOW', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
            openF6= true
            openF6Police()
        end

    end
end)

local function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

function Coffrepolice()
    local Cpolice = RageUIPolice.CreateMenu("", "Los Santos Police Departement")
        RageUIPolice.Visible(Cpolice, not RageUIPolice.Visible(Cpolice))
            while Cpolice do
            Citizen.Wait(0)
            RageUIPolice.IsVisible(Cpolice, true, true, true, function()

                RageUIPolice.Separator("↓ ~p~Objet(s)~s~ ↓")

                if  ESX.PlayerData.job.grade >= 6 then
                    RageUIPolice.ButtonWithStyle("Retirer Objet(s)",nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            FRetirerobjet()
                            RageUIPolice.CloseAll()
                        end
                    end)
                end
                    

                if ESX.PlayerData.job.grade >= 0 then
                    RageUIPolice.ButtonWithStyle("Déposer Objet(s)",nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            ADeposerobjet()
                            RageUIPolice.CloseAll()
                        end
                    end)
                end

					RageUIPolice.Separator("↓ ~p~Arme(s)~s~ ↓")

                   if ESX.PlayerData.job.grade >= 6 then

                    RageUIPolice.ButtonWithStyle("Prendre Arme(s)",nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            PCoffreRetirerWeapon()
                            RageUIPolice.CloseAll()
                        end
                    end)

                end
                    
                if ESX.PlayerData.job.grade >= 0 then
                    RageUIPolice.ButtonWithStyle("Déposer Arme(s)",nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            PCoffreDeposerWeapon()
                            RageUIPolice.CloseAll()
                        end
                    end)
                end

                end, function()
                end)

            if not RageUIPolice.Visible(Cpolice) then
            Cpolice = RMenu:DeleteType("Coffre", true)
        end
    end
end

Citizen.CreateThread(function()
	while true do
		local Timer = 800
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade >= 0 then
		local plycrdjob = GetEntityCoords(PlayerPedId(), false)
		local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, 474.9987, -995.0345, 26.27394)
        if isInService then
            if jobdist <= 20 then
                Timer = 0
                --DrawMarker(6, 449.91, -996.77, 30.68-0.99, nil, nil, nil, -90, nil, nil, 1.0, 1.0, 1.0, 130, 0, 184 , 255)
                DrawMarker(Config.Get.Marker.Type, 474.9987, -995.0345, 26.27394, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
            end
                if jobdist <= 3.0 then
                    Timer = 0
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le coffre")
                    if IsControlJustPressed(1,51) then
                        Coffrepolice()
                    end
                end
            end
        end
        Citizen.Wait(Timer)
    end
end)

---------------------------------------------------------------------------------------------------------------------------------------

itemstock = {}
function FRetirerobjet()
    local Stockpolice = RageUIPolice.CreateMenu("", "Los Santos Police Departement")
    ESX.TriggerServerCallback('fpolice:getStockItems', function(items) 
    itemstock = items
   
    RageUIPolice.Visible(Stockpolice, not RageUIPolice.Visible(Stockpolice))
        while Stockpolice do
            Citizen.Wait(0)
                RageUIPolice.IsVisible(Stockpolice, true, true, true, function()
                        for k,v in pairs(itemstock) do 
                            if v.count > 0 then
                            RageUIPolice.ButtonWithStyle(v.label, nil, {RightLabel = v.count}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local count = KeyboardInput("Combien ?", "", 2)
                                    TriggerServerEvent('fpolice:getStockItem', v.name, tonumber(count))
                                    FRetirerobjet()
                                end
                            end)
                        end
                    end
                end, function()
                end)
            if not RageUIPolice.Visible(Stockpolice) then
            Stockpolice = RMenu:DeleteType("Coffre", true)
        end
    end
     end)
end

local PlayersItem = {}
function ADeposerobjet()
    local StockPlayer = RageUIPolice.CreateMenu("", "Los Santos Police Departement")

    ESX.TriggerServerCallback('fpolice:getPlayerInventory', function(inventory)
        RageUIPolice.Visible(StockPlayer, not RageUIPolice.Visible(StockPlayer))
    while StockPlayer do
        Citizen.Wait(0)
            RageUIPolice.IsVisible(StockPlayer, true, true, true, function()
                for i=1, #inventory.items, 1 do
                    if inventory ~= nil then
                         local item = inventory.items[i]
                            if item.count > 0 then
                                        RageUIPolice.ButtonWithStyle(item.label, nil, {RightLabel = item.count}, true, function(Hovered, Active, Selected)
                                            if Selected then
                                            local count = KeyboardInput("Combien ?", '' , 8)
                                            TriggerServerEvent('fpolice:putStockItems', item.name, tonumber(count))
                                            ADeposerobjet()
                                        end
                                    end)
                                end
                            else
                                RageUIPolice.Separator('Chargement en cours')
                            end
                        end
                    end, function()
                    end)
                if not RageUIPolice.Visible(StockPlayer) then
                StockPlayer = RMenu:DeleteType("Coffre", true)
            end
        end
    end)
end


Weaponstock = {}
function PCoffreRetirerWeapon()
    local StockCoffreWeapon = RageUIPolice.CreateMenu("", 'Los Santos Police Departement')
    ESX.TriggerServerCallback('policejob:getArmoryWeapons', function(weapons)
    Weaponstock = weapons
    RageUIPolice.Visible(StockCoffreWeapon, not RageUIPolice.Visible(StockCoffreWeapon))
        while StockCoffreWeapon do
            Citizen.Wait(0)
                RageUIPolice.IsVisible(StockCoffreWeapon, true, true, true, function()
                        for k,v in pairs(Weaponstock) do 
                            if v.count > 0 then
                            RageUIPolice.ButtonWithStyle(""..ESX.GetWeaponLabel(v.name), nil, {RightLabel = v.count}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    ESX.TriggerServerCallback('policejob:removeArmoryWeapon', function()
                                        PCoffreRetirerWeapon()
                                    end, v.name)
                                end
                            end)
                        end
                    end
                end, function()
                end)
            if not RageUIPolice.Visible(StockCoffreWeapon) then
            StockCoffreWeapon = RMenu:DeleteType("Coffre", true)
        end
    end
    end)
end

function PCoffreDeposerWeapon()
    local StockPlayerWeapon = RageUIPolice.CreateMenu("", "Los Santos Police Departement")
    RageUIPolice.Visible(StockPlayerWeapon, not RageUIPolice.Visible(StockPlayerWeapon))
    while StockPlayerWeapon do
        Citizen.Wait(0)
            RageUIPolice.IsVisible(StockPlayerWeapon, true, true, true, function()
                
                local weaponList = ESX.GetWeaponList()

                for i=1, #weaponList, 1 do
                    local weaponHash = GetHashKey(weaponList[i].name)
                    local isPermanent = ESX.IsWeaponPermanent(weaponList[i].name)
                    if not isPermanent and HasPedGotWeapon(PlayerPedId(), weaponHash, false) and weaponList[i].name ~= 'WEAPON_SPECIALCARBINE' then
                        RageUIPolice.ButtonWithStyle(""..weaponList[i].label, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                            if Selected then
                                ESX.TriggerServerCallback('policejob:addArmoryWeapon', function()
                                    PCoffreDeposerWeapon()
                                end, weaponList[i].name, true)
                            end
                        end)
                    end
                end
            end, function()
            end)
            if not RageUIPolice.Visible(StockPlayerWeapon) then
            StockPlayerWeapon = RMenu:DeleteType("Coffre", true)
        end
    end
end

function Rechercherplaquevoiture(plaquerechercher)
    local PlaqueMenu = RageUI.CreateMenu("", "Informations")
    ESX.TriggerServerCallback('johnny:getVehicleInfos', function(retrivedInfo)
    RageUI.Visible(PlaqueMenu, not RageUI.Visible(PlaqueMenu))
        while PlaqueMenu do
            Citizen.Wait(0)
					RageUI.IsVisible(PlaqueMenu,function()
                            RageUI.Button("Numéro de plaque : ", nil, {RightLabel = retrivedInfo.plate}, true, {
                                	onSelected = function()
                                    end
                                })
						
                            if not retrivedInfo.owner then
                                RageUI.Button("Propriétaire : ", nil, {RightLabel = "Inconnu"}, true, {
                                    	onSelected = function()
                                		end
                                    })
                            else
                                RageUI.Button("Propriétaire : ", nil, {RightLabel = retrivedInfo.owner}, true, {
                                    	onSelected = function()
										end
                                    })

								local hashvoiture = retrivedInfo.vehicle.model
								local nomvoituremodele = GetDisplayNameFromVehicleModel(hashvoiture)
								local nomvoituretexte  = GetLabelText(nomvoituremodele)

                                RageUI.Button("Modèle du véhicule : ", nil, {RightLabel = nomvoituretexte}, true, {
                                    	onSelected = function()
										end
                                    })
                            end
                end, function()
                end)
            if not RageUI.Visible(PlaqueMenu) then
            PlaqueMenu = RMenu:DeleteType("plaque d'immatriculation", true)
        end
    end
end, plaquerechercher)
end