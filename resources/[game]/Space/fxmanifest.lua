fx_version "adamant"

game "gta5"

this_is_a_map 'yes'



shared_scripts {
	'Jobs/**/shared/*.lua'
}

client_scripts {
    -- RAGEUI
    'Libs/RageUI/RMenu.lua',
    'Libs/RageUI/menu/RageUI.lua',
    'Libs/RageUI/menu/Menu.lua',
    'Libs/RageUI/menu/MenuController.lua',
    'Libs/RageUI/components/*.lua',
    'Libs/RageUI/menu/elements/*.lua',
    'Libs/RageUI/menu/items/*.lua',
    'Libs/RageUI/menu/panels/*.lua',
    'Libs/RageUI/menu/windows/*.lua',

    -- PolyZone
    'Libs/PolyZone/client.lua',
    'Libs/PolyZone/BoxZone.lua',
    'Libs/PolyZone/EntityZone.lua',
    'Libs/PolyZone/CircleZone.lua',
    'Libs/PolyZone/ComboZone.lua',
    'Libs/PolyZone/creation/client/*.lua',

    -- InitEsx
    'Libs/InitEsx/client/*.lua',

    -- Players
    'Players/**/client/*.lua',

    -- Jobs
    'Jobs/**/client/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',

    -- PolyZone
    'Libs/PolyZone/creation/server/*.lua',
    'Libs/PolyZone/server.lua',

    -- InitEsx
    'Libs/InitEsx/server/*.lua',

    -- Players
    'Players/**/server/*.lua',

    -- Jobs
    'Jobs/**/server/*.lua'
}

exports {
    'IsInStaff',
}