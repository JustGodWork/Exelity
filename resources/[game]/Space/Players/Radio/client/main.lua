local pma = exports["pma-voice"]
local currentChannel = 0

local Radio = {
    TickRadio = false,
    InfosRadio = false,
    Bruitages = true,
    Statut = "~g~Allumé",
    VolumeRadio = 1,
    jobChannels = {
        {job = "police", min=1, max=15},
        {job = "bcso", min=1, max=15},
        {job = "fib", min=1, max=15},
        {job = "roxsherif", min=1, max=15},
        {job = "ambulance", min=1, max=15},
        {job = "gouv", min=1, max=15}
    },
}

local IsInPVP = false;

AddEventHandler("JustGod:exelity:pvpModeUpdated", function(inPVP)
    IsInPVP = inPVP;

    if (inPVP) then

        Radio.TickRadio = false
        pma:setRadioChannel(0)
        pma:setVoiceProperty("radioEnabled", false);

    end

end);

RegisterCommand('radio', function()

    if (IsInPVP) then return; end

    local radio = RageUI.CreateMenu("", "Menu radio")

    radio.EnableMouse = true

    RageUI.Visible(radio, not RageUI.Visible(radio))

    while radio do
        Wait(0)

        RageUI.IsVisible(radio, function()

            RageUI.Button("Allumer / Eteindre", "Vous permet d'allumer ou d'éteindre la radio", {RightLabel = ">"}, true, {
                onSelected = function()
                    if not Radio.TickRadio then 
                        Radio.TickRadio = true 
                        pma:setVoiceProperty("radioEnabled", true)
                        ESX.ShowNotification("Radio Allumé !")
                    else
                        Radio.TickRadio = false
                        pma:setRadioChannel(0)
                        pma:setVoiceProperty("radioEnabled", false)
                        ESX.ShowNotification("Radio Eteinte !")
                    end
                end
            })

            if Radio.TickRadio then
                RageUI.Separator("Radio: ~g~Allumée")

                if Radio.Bruitages then 
                    RageUI.Separator("Bruitages: ~g~Activés")
                else
                    RageUI.Separator("Bruitages: ~b~Désactivés")
                end

                if Radio.VolumeRadio*100 <= 20 then 
                    ColorRadio = "~g~" 
                elseif Radio.VolumeRadio*100 <= 45 then 
                    ColorRadio ="~b~" 
                elseif Radio.VolumeRadio*100 <= 65 then 
                    ColorRadio ="~o~" 
                elseif Radio.VolumeRadio*100 <= 100 then 
                    ColorRadio ="~b~" 
                end 

                RageUI.Separator("Volume: "..ColorRadio..ESX.Math.Round(Radio.VolumeRadio*100).."~s~ %")

                RageUI.Button("Se connecter à une fréquence ", "Choissisez votre fréquence", {RightLabel = Radio.Frequence}, true, {
                    onSelected = function()
                        local verif, Frequence = CheckQuantity(KeyboardInput("Frequence", "Frequence", "", 10))
                        local PlayerData = ESX.GetPlayerData(_source)
                        local restricted = {}
                        
                        if Frequence > 500 then
                            return
                        end
                        
                        for i,v in pairs(Radio.jobChannels) do
                            if Frequence >= v.min and Frequence <= v.max then
                                table.insert(restricted, v)
                            end
                        end
                    
                        if #restricted > 0 then
                            for i,v in pairs(restricted) do
                                if PlayerData.job.name == v.job and Frequence >= v.min and Frequence <= v.max then
                                    Radio.Frequence = tostring(Frequence)
                                    pma:setRadioChannel(Frequence)
                                    ESX.ShowNotification("Fréquence définie sur "..Frequence.." MHZ")
                                    currentChannel = Frequence
                                    break
                                elseif i == #restricted then
                                    ESX.ShowNotification('Echec de la connexion a la fréquence')
                                    break
                                end
                            end
                        else
                            Radio.Frequence = tostring(Frequence)
                            pma:setRadioChannel(Frequence)
                            ESX.ShowNotification("Fréquence définie sur "..Frequence.." MHZ")
                            currentChannel = Frequence
                        end
                    end
                })

                RageUI.Button("Se déconnecter de la fréquence", "Vous permet de déconnecter de votre fréquence actuelle", {RightLabel = ">"}, true, {
                    onSelected = function()
                        pma:setRadioChannel(0)
                        Radio.Frequence = "0"
                        ESX.ShowNotification("Vous vous êtes déconnecter de la fréquence")
                    end
                })

                RageUI.Button("Activer les bruitages", "Vous permet d'activer les bruitages'", {RightLabel = ">"}, true, {
                    onSelected = function()
                        if Radio.Bruitages then 
                            Radio.Bruitages = false
                            pma:setVoiceProperty("micClicks", false)
                            ESX.ShowNotification("Bruitages radio désactives")
                        else
                            Radio.Bruitages = true 
                            ESX.ShowNotification("Bruitages radio activés")
                            pma:setVoiceProperty("micClicks", true)
                        end
                    end
                })
            else
                RageUI.Separator("Radio: ~b~Eteinte")
            end

        end, function()
            RageUI.PercentagePanel(Radio.VolumeRadio, 'Volume', '0%', '100%', {
                onProgressChange = function(Percentage)
                    Radio.VolumeRadio = Percentage
                    pma:setRadioVolume(Percentage)
                end
            }, 5) 
        end)

        if not RageUI.Visible(radio) then
            radio = RMenu:DeleteType("radio")
        end
    end
end)

RegisterKeyMapping("radio", "Menu radio", "keyboard", "F3")