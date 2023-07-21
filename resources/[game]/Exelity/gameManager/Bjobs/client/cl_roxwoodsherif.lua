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
local ItemsRoxSherif = {}
local ArmesRoxSherif = {}
local ArgentSaleRoxSherif = {}
local infosvehicle = {}
local IsHandcuffed, DragStatus = false, {}
local openF6 = false
local openClothes = false
local openedGarage = false
local openPlainte = false
local openBureau = false
local isArmurerieOpened = false

DragStatus.IsDragged = false

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

-- Main
function openF6RoxSherif()
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

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openF6 do
        Wait(1)
        RageUI.IsVisible(mainMenu, function()
           if isInService then
                RageUI.Button("Intéractions citoyen", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                    end
                }, interaction)
                RageUI.Button("Intéractions véhicules", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                    end
                }, interactionveh)
                RageUI.Button("Demande de renforts", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                    end
                }, renfort)
                RageUI.Button("Casier judiciaire", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                    end
                }, casier)
                RageUI.Button("Plaintes", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                    end
                }, plaintes)
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
                        verif = KeyboardInputRoxSherif("delete", 'Voulez vous supprimer cette plainte ? (oui/non)', '', 4)
                        verified = (tostring(verif))

                        if verified == "oui" then
                            TriggerServerEvent('plaitetraiterRoxSherif', v.prenom, v.nom, v.num)
                            RageUI.GoBack()
                        else
                            ESX.ShowNotification("Suppression annulée")
                        end
                    end
                })
            end
        end)

        RageUI.IsVisible(infoamende,function()

            for k,v in pairs(PoliceConfigAAA.amende) do
            for _,i in pairs(v) do
            RageUI.Button(i.label, nil, {RightLabel = "~g~"..i.price.."$"}, true , {
                onSelected = function() 
                    local player, distance = ESX.Game.GetClosestPlayer()
                    local sID = GetPlayerServerId(player)

                    if player ~= -1 and distance <= 3.0 then
                        TriggerServerEvent("RoxSherif:SendFacture", sID, i.price)
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
                        TriggerServerEvent('RoxSherif:message', GetPlayerServerId(player))
                        getPlayerInvRoxSherif(player)
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
                        TriggerServerEvent('RoxSherif:menotter', GetPlayerServerId(closestPlayer))
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
                        TriggerServerEvent('RoxSherif:escorter', GetPlayerServerId(closestPlayer))
                    end
                end
            })
        end)

        RageUI.IsVisible(interactionveh, function()
            RageUI.Button("Informations du véhicule", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local coords  = GetEntityCoords(PlayerPedId())
                    local vehicle = ESX.Game.GetVehicleInDirection()
                    local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
                    if DoesEntityExist(vehicle) then
                        getInfosVehicle(vehicleData)
                    else
                        ESX.ShowNotification("~r~Aucun véhicule à proximité")
                    end
                end
            }, lesinfosduvehicle)

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

        RageUI.IsVisible(lesinfosduvehicle, function()
            local vehicle = ESX.Game.GetVehicleInDirection()
            if not DoesEntityExist(vehicle) then
                RageUI.GoBack()
                return
            end
            for k,v in pairs(infosvehicle) do
                RageUI.Button("Propriétaire: "..v.label, nil, {RightLabel = "→"}, true , {
                })
                RageUI.Button("Plaque: "..v.plaque, nil, {RightLabel = "→"}, true , {
                })
            end
        end)

        RageUI.IsVisible(renfort, function()
            RageUI.Button("Petite demande", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('RoxSherif:demande', coords, 'petite')
                end
            })
            RageUI.Button("Moyenne demande", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('RoxSherif:demande', coords, 'moyenne')
                end
            })
            RageUI.Button("Grande demande", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    local playerPed = PlayerPedId()
                    local coords  = GetEntityCoords(playerPed)
                    TriggerServerEvent('RoxSherif:demande', coords, 'Grande')
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
    
            RageUI.Separator("Vous Fouillez : " ..GetPlayerName(closestPlayer))

            RageUI.Separator("↓ ~r~Argent non déclaré ~s~↓")

            for k,v in pairs(ArgentSaleRoxSherif) do
                RageUI.Button("Argent non déclaré :", nil, {RightLabel = "~g~"..v.label.."$"}, true , {
                    onSelected = function()
                        local combien = KeyboardInputRoxSherif("Combien ?", 'Indiquez un nombre', '', 10)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification('~r~Montant invalide')
                        else
                            TriggerServerEvent('RoxSherif:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            RageUI.GoBack()
                        end
                    end
                })
            end

            RageUI.Separator("↓ ~r~Items du joueur ~s~↓")

            for k,v in pairs(ItemsRoxSherif) do
                RageUI.Button("Nom: "..v.label, nil, {RightLabel = "~g~"..v.right.." exemplaires"}, true , {
                    onSelected = function()
                        local combien = KeyboardInputRoxSherif("Combien ", 'Indiquez un nombre', '', 4)
                        if tonumber(combien) > v.amount then
                            ESX.ShowNotification('~r~Montant invalide')
                        else
                            TriggerServerEvent('RoxSherif:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            RageUI.GoBack()
                        end
                    end
                })
            end
            
            RageUI.Separator("↓ ~r~Armes du joueur ~s~↓")
            for k,v in pairs(ArmesRoxSherif) do
                local isPermanent = ESX.IsWeaponPermanent(v.value);
                if (not isPermanent) then
                    RageUI.Button("Arme: "..v.label, nil, {RightLabel = "→"}, true , {
                        onSelected = function()
                            local combien = KeyboardInputRoxSherif("Nombre de munitions", 'Indiquez un nombre', '', 4)
                            if tonumber(combien) > 1 then
                                ESX.ShowNotification('~r~Montant invalide')
                            else
                                TriggerServerEvent('RoxSherif:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
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
                            verif = KeyboardInputRoxSherif("delete", 'Voulez vous supprimer ce casier ? (oui/non)', '', 4)
                            verified = (tostring(verif))
                            if verified == "oui" then
                                TriggerServerEvent('RoxSherif:deletecasier', v.prenom, v.nom, v.naissance, v.raison, v.auteur)
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
                    local prenomInput = KeyboardInputRoxSherif("prenom", 'Indiquez le prenom du suspect ', '', 20)
                    if tostring(prenomInput) == nil then
                        return false
                    else
                        prenom = (tostring(prenomInput))
                    end
                end
            })
            RageUI.Button("Nom", "Indiquez le Nom de famille", {RightLabel = nom}, true , {
                onSelected = function()
                    local nomInput = KeyboardInputRoxSherif("nom", 'Indiquez le nom du suspect ', '', 20)
                    if tostring(nomInput) == nil then
                        return false
                    else
                        nom = (tostring(nomInput))
                    end
                end
            })
            RageUI.Button("Date de naissance", "Indiquez la date de naissance", {RightLabel = date}, true , {
                onSelected = function()
                    local dateInput = KeyboardInputRoxSherif("date", 'Indiquez la date de naissance du suspect ', '', 20)
                    if tostring(dateInput) == nil then
                        return false
                    else
                        date = (tostring(dateInput))
                    end
                end
            })
            RageUI.Button("Motif", "Indiquez le motif du casier", {RightLabel = raison}, true , {
                onSelected = function()
                    local raisonInput = KeyboardInputRoxSherif("raison", 'Indiquez la raison du casier ', '', 100)
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
                        TriggerServerEvent('RoxSherif:insertintocasier', nomInput, prenomInput, dateInput, raisonInput)
                        RageUI.GoBack()
                    end
                end
            })
        end)

        if not RageUI.Visible(mainMenu) and not RageUI.Visible(showDatabase) and not RageUI.Visible(plaintes) and not RageUI.Visible(infoamende) and not RageUI.Visible(infosplaintes) and not RageUI.Visible(actions) and not RageUI.Visible(infoscasier) and not RageUI.Visible(interaction) and not RageUI.Visible(casier) and not RageUI.Visible(interactionveh) and not RageUI.Visible(renfort) and not RageUI.Visible(objets) and not RageUI.Visible(fouiller) and not RageUI.Visible(lesinfosduvehicle) then
            mainMenu = RMenu:DeleteType('mainMenu', true)
            openF6 = false
        end

        if not RageUI.Visible(lesinfosduvehicle) then
            table.remove(infosvehicle, k)
        end

        if not RageUI.Visible(fouiller) then
            table.remove(ArgentSaleRoxSherif, k)
            table.remove(ItemsRoxSherif, k)
            table.remove(ArmesRoxSherif, k)
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

function openPlaintesRoxSherif()
    local mainMenu2 = RageUI.CreateMenu('', 'Faites vos actions')
    local depot = RageUI.CreateSubMenu(mainMenu2, "", "Faites vos actions")

    local nom
    local prenom
    local num
    local nom1
    local prenom1
    local num1
    local motif

    RageUI.Visible(mainMenu2, not RageUI.Visible(mainMenu2))

    while openPlainte do
        RageUI.IsVisible(mainMenu2, function()
            RageUI.Button("Déposer plainte", nil, {RightLabel = "→"}, true , {
            }, depot)
        end)
        RageUI.IsVisible(depot, function()

            RageUI.Separator("↓ ~r~Vos informations ~s~↓")

            RageUI.Button("Nom de famille", nil, {RightLabel = nom}, true , {
                onSelected = function()
                    nomInput = KeyboardInputRoxSherif("nom", 'Entrez votre nom', '', 15)
                    nom = (tostring(nomInput))
                end
            })
            RageUI.Button("Prénom", nil, {RightLabel = prenom}, true , {
                onSelected = function()
                    prenomInput = KeyboardInputRoxSherif("prenom", 'Entrez votre prenom', '', 15)
                    prenom = (tostring(prenomInput))
                end
            })
            RageUI.Button("Numéro de téléphone", nil, {RightLabel = num}, true , {
                onSelected = function()
                    numInput = KeyboardInputRoxSherif("num", 'Entrez votre numero de telephone', '', 15)
                    num = (tostring(numInput))
                end
            })

            RageUI.Separator("↓ ~r~Informations de l'accusé ~s~↓")

            RageUI.Button("Nom", nil, {RightLabel = nom1}, true , {
                onSelected = function()
                    nom1Input = KeyboardInputRoxSherif("nom1", 'Entrez le nom de l\'accuse', '', 15)
                    nom1 = (tostring(nom1Input))
                end
            })
            RageUI.Button("Prénom", nil, {RightLabel = prenom1}, true , {
                onSelected = function()
                    prenom1Input = KeyboardInputRoxSherif("prenom1", 'Entrez le prenom de l\'accuse', '', 15)
                    prenom1 = (tostring(prenom1Input))
                end
            })
            RageUI.Button("Numéro de téléphone", nil, {RightLabel = num1}, true , {
                onSelected = function()
                    num1Input = KeyboardInputRoxSherif("num1", 'Entrez le numero de telephone de l\'accuse', '', 15)
                    num1 = (tostring(num1Input))
                end
            })
            RageUI.Button("Motif de votre plainte", motif, {RightLabel = "→"}, true , {
                onSelected = function()
                    motif = KeyboardInputRoxSherif("motif", 'Entrez le motif de votre plainte', '', 80)
                end
            })

            RageUI.Separator("↓ ~r~Valider ~s~↓")

            RageUI.Button("Valider votre plainte", "~r~Aucun retour en arrière ne sera possible.", {RightLabel = "→"}, true , {
                onSelected = function()
                    if nom and prenom and num and nom1 and prenom1 and num1 and motif ~= nil then
                        TriggerServerEvent('RoxSherif:validerplainte', nom, prenom, num, nom1, prenom1, num1, motif)
                        ESX.ShowNotification("~r~Votre plainte a bien été transmise aux forces de l\'autorité")
                        RageUI.GoBack()
                    else
                        ESX.ShowNotification("~p~Merci de remplir toutes les informations")
                    end
                end
            })


        end)
        if not RageUI.Visible(mainMenu2) and not RageUI.Visible(depot) then
            mainMenu2 = RMenu:DeleteType('mainMenu', true)
            openPlainte = false
        end
        Citizen.Wait(0)
    end

end

function openArmurerieRoxSherif()
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
                            prix = 2500,
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

            elseif ESX.PlayerData.job.grade_name == 'deputytwo' then
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
                            prix = 2500,
                        })
                    end
                }, paiement)
            elseif ESX.PlayerData.job.grade_name == 'deputyone' then
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
                            prix = 2500,
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
                            prix = 2500,
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
                        TriggerServerEvent('RoxSherif:buyWeapon', v.hash)
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

function openRoxSherifGarage()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openedGarage do
        local grade = ESX.PlayerData.job.grade_name
        RageUI.IsVisible(mainMenu, function()
            if grade == 'recruit' then
                RageUI.Button("Vapid Landa", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff")
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'deputytwo' then
                RageUI.Button("Vapid Landa", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff")
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'deputyone' then
                RageUI.Button("Vapid Landa", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bravado Bison", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff2")
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'senior' then
                RageUI.Button("Vapid Landa", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bravado Bison", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff2")
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'sergent' then
                RageUI.Button("Vapid Landa", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bravado Bison", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff2")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Manchez", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff")
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'lieutenant' then
                RageUI.Button("Vapid Landa", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bravado Bison", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff2")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Manchez", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriffb")
                        RageUI.CloseAll()
                    end
                })
            elseif grade == 'major' then
                RageUI.Button("Vapid Landa", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bravado Bison", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff2")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Manchez", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriffb")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Patriot", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_swat")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vapid Explorer", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "LSPDumkscoutgnd");
                        RageUI.CloseAll()
                    end
                })
            else
                RageUI.Button("Vapid Landa", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Bravado Bison", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriff2")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Manchez", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_sheriffb")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Patriot", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "amb_rox_swat")
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Vapid Explorer", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "LSPDumkscoutgnd");
                        RageUI.CloseAll()
                    end
                })
                RageUI.Button("Buffalo STX", nil, {RightLabel = "→"}, true , {
                    onSelected = function()
                        TriggerServerEvent('RoxSherif:spawnVehicle', "lspdbuffalostxum");
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

function openRoxSherifCloathroom()
    local mainMenu = RageUI.CreateMenu('', 'Faites vos actions')

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while openClothes do
        
        local playerPed = PlayerPedId()
        local grade = ESX.PlayerData.job.grade_name
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Reprendre ses vêtements", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                        TriggerEvent('skinchanger:loadSkin', skin)
                    end)
                    isInService = false
                    TriggerServerEvent('annonce:serviceRoxSherif', 'fin')
                end
            })
            RageUI.Button("Mettre un gilet pare-balles", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    setUniformRoxSherif('bullet_wear', playerPed)
                end
            })
            RageUI.Button("Enfiler sa tenue", nil, {RightLabel = "→"}, true , {
                onSelected = function()
                    if grade == 'recruit' then
                        setUniformRoxSherif('recruit_wear', playerPed)
                        isInService = true
                    elseif grade == 'deputytwo' then
                        setUniformRoxSherif('officer_wear', playerPed)
                        isInService = true
                    elseif grade == 'deputyone' then
                        setUniformRoxSherif('sergeant_wear', playerPed)
                        isInService = true
                    elseif grade == 'senior' then
                        setUniformRoxSherif('sergeantchief_wear', playerPed)
                        isInService = true
                    elseif grade == 'sergent' then
                        setUniformRoxSherif('intendent_wear', playerPed)
                        isInService = true
                    elseif grade == 'lieutenant' then
                        setUniformRoxSherif('lieutenant_wear', playerPed)
                        isInService = true
                    elseif grade == 'major' then
                        setUniformRoxSherif('chef_wear', playerPed)
                        isInService = true
                    elseif grade == 'adjoint' then
                        setUniformRoxSherif('boss_wear', playerPed)
                        isInService = true
                    elseif grade == 'boss' then
                        setUniformRoxSherif('boss_wear', playerPed)
                        isInService = true
                    end
                    TriggerServerEvent('annonce:serviceRoxSherif', 'prise')
                end
            })
        end)
        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType(mainMenu, true)
            openClothes = false
        end
        Citizen.Wait(0)
    end
end

function setUniformRoxSherif(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.RoxWoodSherif.Uniforms[job].male)

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		else
			TriggerEvent('skinchanger:loadClothes', skin, Config.Jobs.RoxWoodSherif.Uniforms[job].female)

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		end
	end)
end

function getData()
    ESX.TriggerServerCallback('RoxSherif:getData', function(cb)
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
    ESX.TriggerServerCallback('RoxSherif:getPlaintes', function(cb)
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
        for k,v in pairs(Config.Jobs.RoxWoodSherif.RangerVehicule) do
            local coords = GetEntityCoords(PlayerPedId())
            if #(coords - v.pos) <= 10 then
                if isInService then
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

        end
        for k,v in pairs(Config.Jobs.RoxWoodSherif.Plainte) do
            local coords = GetEntityCoords(PlayerPedId(), false)
            --local dist = Vdist(coords.x, coords.y, coords.z, v.Plainte)
            if #(coords - v.Plainte) <= 5 then
                DrawMarker(Config.Get.Marker.Type, v.Plainte, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                if #(coords - v.Plainte) <= 2 then
                   -- interval = 0
                    if IsControlJustPressed(0, 51) then
                        openPlainte = true
                        openPlaintesRoxSherif()
                    end
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour déposer plainte")
                   -- DrawMarker(Config.Get.Marker.Type, v.Plainte, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                end
                interval = 1
            end
        end
        for k,v in pairs(Config.Jobs.RoxWoodSherif.Zones) do
            local coords = GetEntityCoords(PlayerPedId(), false)
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'roxsherif' then
                if #(coords - v.Armurerie) <= 5 then
                    if isInService then
                        interval = 1
                        DrawMarker(Config.Get.Marker.Type, v.Armurerie, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                        if #(coords - v.Armurerie) <= 3 then
                            if IsControlJustPressed(0, 51) then
                                isArmurerieOpened = true
                                openArmurerieRoxSherif()
                            end
                            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder à l'armurerie")
                        end
                    end
                elseif #(coords - v.Vestiaire) <= 6 then
                    interval = 1
                    DrawMarker(Config.Get.Marker.Type, v.Vestiaire, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
                    if #(coords - v.Vestiaire) <= 2 then
                        if IsControlJustPressed(0, 51) then
                            openClothes = true
                            openRoxSherifCloathroom()
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
                                openRoxSherifGarage()
                            end
                            ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder au garage")
                        end
                    end
                end
            end
        end
        Citizen.Wait(interval)
    end
end)

function getPlayerInvRoxSherif(player)
    
    ESX.TriggerServerCallback('getOtherPlayerDataRoxSherif', function(data)
        for i=1, #data.accounts, 1 do
            if data.accounts[i].name == 'dirtycash' and data.accounts[i].money > 0 then
                table.insert(ArgentSaleRoxSherif, {
                    label    = ESX.Math.Round(data.accounts[i].money),
                    value    = 'dirtycash',
                    itemType = 'item_account',
                    amount   = data.accounts[i].money
                })
    
            end
        end
    
        for i=1, #data.inventory, 1 do
            if data.inventory[i].count > 0 then
                table.insert(ItemsRoxSherif, {
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
                table.insert(ArmesRoxSherif, {
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


function KeyboardInputRoxSherif(entryTitle, textEntry, inputText, maxLength)
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

RegisterNetEvent('RoxSherif:InfoService')
AddEventHandler('RoxSherif:InfoService', function(service, nom)
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

Keys.Register('F6','InteractionsJobRoxSherif', 'Menu job R.S.D', function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'roxsherif' then

        if (not IsInPVP) then
            PlaySoundFrontend(-1, 'ATM_WINDOW', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
            openF6= true
            openF6RoxSherif()
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

function CoffreRoxSherif()
    local Cpolice = RageUIPolice.CreateMenu("", "Roxwood Sherif Département")
        RageUIPolice.Visible(Cpolice, not RageUIPolice.Visible(Cpolice))
            while Cpolice do
            Citizen.Wait(0)
            RageUIPolice.IsVisible(Cpolice, true, true, true, function()

                RageUIPolice.Separator("↓ ~p~Objet(s)~s~ ↓")

                if  ESX.PlayerData.job.grade >= 5 then
                    RageUIPolice.ButtonWithStyle("Retirer Objet(s)",nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            FRetirerobjetRoxSherif()
                            RageUIPolice.CloseAll()
                        end
                    end)
                end
                    

                if ESX.PlayerData.job.grade >= 0 then
                    RageUIPolice.ButtonWithStyle("Déposer Objet(s)",nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            ADeposerobjetRoxSherif()
                            RageUIPolice.CloseAll()
                        end
                    end)
                end

					RageUIPolice.Separator("↓ ~p~Arme(s)~s~ ↓")

                   if ESX.PlayerData.job.grade >= 5 then

                    RageUIPolice.ButtonWithStyle("Prendre Arme(s)",nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            PCoffreRetirerWeaponRoxSherif()
                            RageUIPolice.CloseAll()
                        end
                    end)

                end
                    
                if ESX.PlayerData.job.grade >= 0 then
                    RageUIPolice.ButtonWithStyle("Déposer Arme(s)",nil, {RightLabel = "→→"}, true, function(Hovered, Active, Selected)
                        if Selected then
                            PCoffreDeposerWeaponRoxSherif()
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
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'roxsherif' and ESX.PlayerData.job.grade >= 0 then
		local plycrdjob = GetEntityCoords(PlayerPedId(), false)
		local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, -1014.133, 6651.785, 0.3574324) 
        if isInService then
            if jobdist <= 20 then
                Timer = 0
                --DrawMarker(6, 449.91, -996.77, 30.68-0.99, nil, nil, nil, -90, nil, nil, 1.0, 1.0, 1.0, 130, 0, 184 , 255)
                DrawMarker(Config.Get.Marker.Type, -1014.133, 6651.785, 0.3574324, 0, 0, 0, Config.Get.Marker.Rotation, nil, nil, Config.Get.Marker.Size[1], Config.Get.Marker.Size[2], Config.Get.Marker.Size[3], Config.Get.Marker.Color[1], Config.Get.Marker.Color[2], Config.Get.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
            end
                if jobdist <= 1.0 then
                    Timer = 0
                    ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le coffre")
                        if IsControlJustPressed(1,51) then
                        CoffreRoxSherif()
                    end   
                end
            end
        end 
        Citizen.Wait(Timer)   
    end
end)
---------------------------------------------------------------------------------------------------------------------------------------

itemstock = {}
function FRetirerobjetRoxSherif()
    local Stockpolice = RageUIPolice.CreateMenu("", "Roxwood Sherif Département")
    ESX.TriggerServerCallback('RoxSherif:getStockItems', function(items) 
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
                                    TriggerServerEvent('RoxSherif:getStockItem', v.name, tonumber(count))
                                    FRetirerobjetRoxSherif()
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

function ADeposerobjetRoxSherif()
    local StockPlayer = RageUIPolice.CreateMenu("", "Roxwood Sherif Département")

    ESX.TriggerServerCallback('RoxSherif:getPlayerInventory', function(inventory)
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
                                            TriggerServerEvent('RoxSherif:putStockItems', item.name, tonumber(count))
                                            ADeposerobjetRoxSherif()
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
function PCoffreRetirerWeaponRoxSherif()
    local StockCoffreWeapon = RageUIPolice.CreateMenu("", 'Roxwood Sherif Département')
    ESX.TriggerServerCallback('RoxSherif:getArmoryWeapons', function(weapons)
    Weaponstock = weapons
    RageUIPolice.Visible(StockCoffreWeapon, not RageUIPolice.Visible(StockCoffreWeapon))
        while StockCoffreWeapon do
            Citizen.Wait(0)
                RageUIPolice.IsVisible(StockCoffreWeapon, true, true, true, function()
                        for k,v in pairs(Weaponstock) do 
                            if v.count > 0 then
                            RageUIPolice.ButtonWithStyle(""..ESX.GetWeaponLabel(v.name), nil, {RightLabel = v.count}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    ESX.TriggerServerCallback('RoxSherif:removeArmoryWeapon', function()
                                        PCoffreRetirerWeaponRoxSherif()
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

function PCoffreDeposerWeaponRoxSherif()
    local StockPlayerWeapon = RageUIPolice.CreateMenu("", "Roxwood Sherif Département")
    RageUIPolice.Visible(StockPlayerWeapon, not RageUIPolice.Visible(StockPlayerWeapon))
    while StockPlayerWeapon do
        Citizen.Wait(0)
            RageUIPolice.IsVisible(StockPlayerWeapon, true, true, true, function()
                
                local weaponList = ESX.GetWeaponList()

                for i=1, #weaponList, 1 do
                    local weaponHash = GetHashKey(weaponList[i].name);
                    local isPermanent = ESX.IsWeaponPermanent(weaponList[i].name);
                    if not isPermanent and HasPedGotWeapon(PlayerPedId(), weaponHash, false) and weaponList[i].name ~= 'WEAPON_SPECIALCARBINE' then
                        RageUIPolice.ButtonWithStyle(""..weaponList[i].label, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                            if Selected then
                                ESX.TriggerServerCallback('RoxSherif:addArmoryWeapon', function()
                                    PCoffreDeposerWeaponRoxSherif()
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