
ConfigDj = {}
Translation = {}

Translation = {
    ['de'] = {
        ['DJ_interact'] = 'Drücke ~g~E~s~, um auf das DJ Pult zuzugreifen',
        ['title_does_not_exist'] = '~r~Dieser Titel existiert nicht!',
    },

    ['en'] = {
        ['DJ_interact'] = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder à la table DJ.',
        ['title_does_not_exist'] = '~r~Ce titre n\'existe pas !',
    }
}

ConfigDj.Locale = 'en'

ConfigDj.useESX = true
ConfigDj.enableCommand = false

ConfigDj.enableMarker = true

ConfigDj.DJPositions = {
    {
        name = 'unicorn',
        pos = vector3(116.5707, -1281.374, 28.26896),
        requiredJob = 'unicorn', 
        song = vector3(112.8892, -1286.789, 28.45868),
        range = 25.0, 
        volume = 1.0
    },
    {
        name = 'bahamas',
        pos = vector3(-1375.994, -607.1489, 31.31988),
        song = vector3(-1390.925, -616.5145, 30.70289),
        requiredJob = 'bahamas',
        range = 45.0,
        volume = 1.0,
    }
}