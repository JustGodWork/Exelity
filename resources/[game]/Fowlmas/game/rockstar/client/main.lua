ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.ESX, function(obj) ESX = obj end)
        Citizen.Wait(500)
    end
end)

openUi = function()
    local mainMenu = RageUI.CreateMenu("", "Rockstar Editor")

    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

    while mainMenu do
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button("Se rendre dans le Rockstar Editor", nil, {}, true, {
                onSelected = function()
                    ActivateRockstarEditor()
                    while IsPauseMenuActive() do
                        Citizen.Wait(0)
                    end
                    DoScreenFadeIn(1)
                end
            })
            RageUI.Button("Rockstar Editor | record", nil, {}, true, {
                onSelected = function()
                    if IsRecording() then
                        ESX.ShowNotification("~r~Vous enregistrez déjà")
                    else
                        StartRecording(1)
                    end
                end
            })
            RageUI.Button("Rockstar Editor | Stop record", nil, {}, true, {
                onSelected = function()
                    if not IsRecording() then
                        ESX.ShowNotification("~r~Vous devez d'abord démarrer le record")
                    else
                        StopRecordingAndSaveClip()
                    end
                end
            })
        end)
        Citizen.Wait(0)
    end
end

Keys.Register('F4','Editor', 'Rockstar Editor', function()
    PlaySoundFrontend(-1, 'ATM_WINDOW', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 1)
    openUi()
end)