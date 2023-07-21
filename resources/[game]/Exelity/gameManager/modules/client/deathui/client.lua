--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local timer = Config.TimeToRespawn;
local gotpressed = false;
local noptmort = false;

RegisterNetEvent("JustGod:ReceiveDeathStatus", function(isDead)

    if (isDead) then
        openDeathMenuWlh();
    else
        RageUI.CloseAll();
    end

end);

local IsInPVP = false

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

RegisterNetEvent("esx:playerLoaded", function(xPlayer)

    ESX.PlayerLoaded = true;
    ESX.PlayerData = xPlayer;

end);

local eventHandler;

eventHandler = AddEventHandler("JustGod:playerShouldDie", function()

    RemoveEventHandler(eventHandler);
    
    if (ESX.PlayerData.isDead) then

        SetTimeout(2000, function()

            SetEntityHealth(PlayerPedId(), 0);
            ESX.ShowAdvancedNotification('Notification', 'Exelity', 'Vous avez été mis dans le coma de force, car vous avez quitté le serveur dans le coma...', 'CHAR_CALL911', 8);

        end);

    end

end);

openDeathMenuWlh = function()

    local mainMenu = RageUI.CreateMenu("", "Vous êtes mort")

    mainMenu.Closable = false

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    gotpressed = false

    noptmort = false

    CreateThread(function()

        CreateThread(function()

            while mainMenu do

                timer = timer - 1

                if (timer <= 0) then

                    timer = Config.TimeToRespawn;

                    noptmort = true;

                end

                Wait(1000)

            end

        end)

        while mainMenu do

            DisableAllControlActions();

            EnableControlAction(0, 245, true);

            RageUI.IsVisible(mainMenu, function()

                if (not gotpressed) then

                    RageUI.Button("Envoyer un signal de détresse", nil, {RightLabel = "→"}, true, {

                        onSelected = function()

                            x,y,z = table.unpack(GetEntityCoords(PlayerPedId(), true))
                            TriggerServerEvent('ambulance:sendsignal', x, y, z)
                            gotpressed = true

                        end
                    })

                else

                    ESX.SetTimeout(300000, function()

                        gotpressed = false

                    end)

                    RageUI.Button("Loading...", "Vous venez d'envoyer un signal patienter 5 minutes avant d'en envoyer un nouveau...", {RightLabel = ""}, true, {

                        onSelected = function()

                        end
                    })

                end

                if (not noptmort) then

                    RageUI.Button("Réaparition possible dans "..timer.." secondes", nil, {RightLabel = ""}, false, {

                        onSelected = function()

                        end

                    })

                else

                    RageUI.Button("Réapparaître", nil, {}, true, {

                        onSelected = function()

                            SetEntityCoords(PlayerPedId(), Config.RespawningPlace)

                            TriggerServerEvent('réanimerafterdie')

                            Wait(1000)

                            gotpressed = false

                            noptmort = false

                        end

                    })

                end

            end)

            if (not RageUI.Visible(mainMenu)) then

                mainMenu = RMenu:DeleteType(mainMenu, true)

                gotpressed = false

                noptmort = false

                timer = Config.TimeToRespawn

            end

            Wait(0)

        end

    end)

end