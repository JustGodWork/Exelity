Config = {}

Config.Timeout          = 7500          -- Overridden by the `timeout` param
Config.Position         = GetResourceKvpString("notif_position") or "bottomleft"
Config.Progress         = true          -- Overridden by the `progress` param
Config.Theme            = "default"     -- Overridden by the `theme` param
Config.Queue            = 5             -- No. of notifications to show before queueing
Config.Stacking         = true
Config.ShowStackedCount = true
Config.AnimationIn      = "fadeIn";     -- Enter animation - 'fadeOut', 'fadeOutLeft', 'flipOutX', 'flipOutY', 'bounceOutLeft', 'backOutLeft', 'slideOutLeft', 'zoomOut', 'zoomOutLeft'
Config.AnimationOut     = "fadeOut";    -- Exit animation - 'fadeOut', 'fadeOutLeft', 'flipOutX', 'flipOutY', 'bounceOutLeft', 'backOutLeft', 'slideOutLeft', 'zoomOut', 'zoomOutLeft'
Config.AnimationTime    = 350           -- Entry / exit animation interval
Config.SoundFile        = false         -- Sound file stored in ui/audio used for notification sound. Leave as false to disable.
Config.SoundVolume      = 0.4           -- 0.0 - 1.0

-- Pictures for advanced notifications
--
-- You can add custom icons by uploading a 64x64 jpeg image to the ui/images directory then adding the code and filename here
--
-- e.g. MY_CUSTOM_ICON_CODE = "my_custom_icon_image.png"
--
-- ShowAdvancedNotification(message, title, subject, "MY_CUSTOM_ICON_CODE")
--

Config.Icons = {
    info = "info.png",
    error = "error.png",
    check = "check.png",
    alynia = "alynia.png",
    message = "message.png",
}

Config.Pictures = {
    CHAR_247BANHAM                   = "CHAR_247BANHAM.png",
    CHAR_247HAWICK                   = "CHAR_247HAWICK.png",
    CHAR_247LITTLESEOUL              = "CHAR_247LITTLESEOUL.png",
    CHAR_247MONTCHILIAD              = "CHAR_247MONTCHILIAD.png",
    CHAR_247MORNINGWOOD              = "CHAR_247MORNINGWOOD.png",
    CHAR_247MURRIETA                 = "CHAR_247MURRIETA.png",
    CHAR_247STRAWBERRY               = "CHAR_247STRAWBERRY.png",
    CHAR_247VESPUCCI                 = "CHAR_247VESPUCCI.png",
    CHAR_AUTOREPAIRS                 = "CHAR_AUTOREPAIRS.png",
    CHAR_BCSD                        = "CHAR_BCSD.png",
    CHAR_CONCESSIONNAIRE             = "CHAR_CONCESSIONNAIRE.png",
    CHAR_FOURRIERE                   = "CHAR_FOURRIERE.png",
    CHAR_GRUPPE6                     = "CHAR_GRUPPE6.png",
    CHAR_GSMECHANIC                  = "CHAR_GSMECHANIC.png",
    CHAR_INFORMATEUR                 = "char_informateur.png",
    CHAR_JODYS                       = "char_jodys.png",
    CHAR_LOSTMCBAR                   = "char_lostmcbar.png",
    CHAR_LOTTERY                     = "CHAR_LOTTERY.png",
    CHAR_LSPD                        = "CHAR_LSPD.png",
    CHAR_EMS                         = "CHAR_EMS.png",
    CHAR_MECANO                      = "CHAR_MECANO.png",
    CHAR_MOSLEY                      = "CHAR_MOSLEY.png",
    CHAR_PREF                        = "CHAR_PREF.png",
    CHAR_WEAZELNEWS                  = "CHAR_WEAZELNEWS.png",
    LAURENT                          = "LAURENT.gif",
    ALYNIALOGO                       = "ALYNIALOGO.png",
    BILLING                          = "BILLING.png",
    CONCESSIONNAIREBATEAU            = "concessionnairebateau.png",
    NOTIF_Pepite_argent              = "RECOLTEOR.png",
    NOTIF_Pepite_cuivre              = "RECOLTEOR.png",
    NOTIF_Pepite_or                  = "RECOLTEOR.png",
    RECOLTEOR                        = "RECOLTEOR.png",
    ANONYMOUS                        = "ANONYMOUS.png",
    K9DOG                            = "K9DOG.png",
    CHAR_BAHAMAMAMAS                 = "CHAR_BAHAMA.png",
    CHAR_AMMUPILLBOX                 = "CHAR_AMMUPILLBOX.png",
    CHAR_AMMUPALETO                  = "CHAR_AMMUPALETO.png",
    CHAR_AMMUHAWICK                  = "CHAR_AMMUHAWICK.png",
    CHAR_AMMUSANDYSHORES             = "CHAR_AMMUSANDYSHORES.png",
    CHAR_AMMUPOPULARSTREET           = "CHAR_AMMUPOPULARSTREET.png",
    FUCK08                           = "fuck08.png",
    CHAR_BIKESHOP                    = "CHAR_BIKESHOP.png",
    CHAR_247SANDYSHORES              = "CHAR_247SANDYSHORES.png",
    CHAR_GALAXY                      = "CHAR_GALAXY.png",
    CHAR_FISH                        = "CHAR_FISH.png",
    CHAR_KIWI                        = "CHAR_KIWI.png",
    CHAR_HANDCUFF                    = "CHAR_HANDCUFF.png",
    CHAR_MEXICANOS                   = "CHAR_MEXICANOS.png",
    CHAR_TABAC                       = "CHAR_TABAC.png",
    CHAR_BURGERSHOT                  = "CHAR_BURGERSHOT.png",
    CHAR_PUMPKIN                     = "CHAR_PUMPKIN.png",
    CHAR_CANDYGREEN                  = "candygreen.png",
    CHAR_CANDYPURPLE                 = "candypurple.png",
    CHAR_CANDYRED                    = "candyred.png",
    CHAR_AMERICANGAMES               = "CHAR_AMERICANGAMES.png",
    CHAR_AIRMECANO                   = "CHAR_AIRMECANO.png",
    CHAR_BOATMECANO                  = "CHAR_BOATMECANO.png",
    CHAR_SNOWMEN                     = "CHAR_SNOWMEN.png",
    CHAR_247GROVESTREET              = "CHAR_247GROVESTREET.png",
    CHAR_YELLOWJACK                  = "CHAR_YELLOWJACK.png",
    CHAR_VIGNERONS                   = "CHAR_VIGNERONS.png",
    CHAR_IMMO                        = "CHAR_IMMO.png",
    CHAR_KIWI                        = "CHAR_KIWI.png",
    CHAR_SHOTSALERT                  = "CHAR_SHOTSALERT.png",
    CHAR_ARCADEBAR                   = "CHAR_ARCADEBAR.png",
    PIECESDARMES                     = "PIECESDARMES.png",
    CHAR_PECHELEGALE                 = "CHAR_PECHELEGALE.png",
    CHAR_LIVRAISONVOITURE            = "CHAR_LIVRAISONVOITURE.png",
    CHAR_CAMBRIOLAGE                 = "CHAR_CAMBRIOLAGE.png",
    CHAR_LUCKYWHEEL                  = "CHAR_LUCKYWHEEL.png",
    CHAR_REZURRECTION                = "CHAR_REZURRECTION.png",
    SALARY                           = "SALARY.png",
    CHAR_FACEBOOK = "CHAR_FACEBOOK.png",
    CHAR_GOUV = "CHAR_GOUV.png",
    CHAR_TWITTER = "CHAR_TWITTER.png",
}