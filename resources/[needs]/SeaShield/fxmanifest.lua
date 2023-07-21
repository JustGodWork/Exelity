fx_version 'cerulean'
game 'gta5'

author 'Sea Collective'
description 'The performant anticheat for FiveM'
version '1.4.2'

lua54 'yes'

shared_scripts {
    'configs/sh_utils.lua',
}

client_scripts {
    "configs/cl_config.lua",
    "vendor/RageUI/RMenu.lua",
    "vendor/RageUI/menu/RageUI.lua",
    "vendor/RageUI/menu/Menu.lua",
    "vendor/RageUI/menu/MenuController.lua",
    "vendor/RageUI/components/*.lua",
    "vendor/RageUI/menu/elements/*.lua",
    "vendor/RageUI/menu/items/*.lua",
    "vendor/RageUI/menu/panels/*.lua",
    "vendor/RageUI/menu/windows/*.lua",
    "client/cl_init.lua",
    "client/cl_seashield.lua",
    "client/cl_adminmenu.lua",
    "client/cl_antistop.lua",
    "client/cl_wrapper.lua",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "configs/sv_config.lua",
    "server/sv_seashield.lua",
    "server/sv_banSystem.lua",
    "server/sv_adminmenu.lua",
    "server/sv_wrapper.lua",
}

exports {
    'SetBypassGodMod',
    'SetBypassInvisible',
    'BypassFreecam',
    'setBypassNoclip',
}

server_exports {
    'BanPlayer',
}

escrow_ignore {
    'configs/*.lua',
    'server/cl_wrapper.lua',
    'server/sv_wrapper.lua',
}
dependency '/assetpacks'