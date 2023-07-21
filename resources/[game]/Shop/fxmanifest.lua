fx_version "adamant"

game "gta5"

shared_scripts {

    "@Framework/locale.lua",
    "@Framework/locales/fr.lua"
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/main.js',
}

client_scripts {
    -- RAGEUI
    "vendor/RMenu.lua",
    "vendor/menu/RageUI.lua",
    "vendor/menu/Menu.lua",
    "vendor/menu/MenuController.lua",
    "vendor/components/*.lua",
    "vendor/menu/elements/*.lua",
    "vendor/menu/items/*.lua",
    "vendor/menu/panels/*.lua",
    "vendor/menu/windows/*.lua",
}


client_scripts {
    "client/*.lua",
    "shared/cl_config.lua",
    "init/shared/init.lua",
    "init/client/cl_init.lua",
    "init/client/cl_initESX.lua",
}

server_scripts {
    "@async/async.lua",
    "@mysql-async/lib/MySQL.lua",
    "server/*.lua",
    "shared/sv_config.lua",
    "vip/server/*.lua",
    "init/shared/init.lua",
    "init/server/sv_init.lua",
    "init/server/eUtils.lua",
    "init/server/sv_initESX.lua",
}

exports {
    "GetVIP",
}
