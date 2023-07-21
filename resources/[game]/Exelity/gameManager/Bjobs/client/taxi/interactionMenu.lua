---
--- @author Azagal
--- Create at [28/10/2022] 15:14:47
--- Current project [Exelity-V1]
--- File name [interactionMenu]
---

Taxi = Taxi or {}

function Taxi:interactionMenu()
    local mainMenu = RageUI.CreateMenu("", "Menu d'intéractions")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while (mainMenu ~= nil) do
        RageUI.IsVisible(mainMenu, function()

            RageUI.Checkbox("Mission PNJ", nil, Taxi.missionData.actived, {}, {
                onChecked = function()
                    TriggerServerEvent("Taxi:mission:retreive")
                end,
                onUnChecked = function()
                    TriggerServerEvent("Taxi:mission:stop")
                end
            });

        end)

        if not RageUI.Visible(mainMenu) then
            mainMenu = RMenu:DeleteType('mainMenu', true)
        end

        Wait(0)
    end
end

local IsInPVP = false;

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;
end);

Keys.Register('F6','taxi_interactionMenu', '[TAXI] Menu d\'intéractions', function()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'taxi' then
        if (not IsInPVP) then
            Taxi:interactionMenu()
        end
    end
end)