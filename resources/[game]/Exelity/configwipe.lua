--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ConfigWipe = {
    ESX = "",
    MessageWipe = "Vous avez été wipe, pattientez quelques minutes avant de relancer votre jeu !",
    Autorized = {
        ['founder'] = true,
        ['main_team'] = true,
        ['responsable_staff'] = true,
        ['responsable'] = true,
    },

    Logs = {
        WebHook = "https://discord.com/api/webhooks/1019894843356483586/7nhedLjpgiSiwG2v03qN-Y44dSGw2HfTSXBylcM9hYTNB-37Qg3yXbQJkf-Rojau9-Yn"
    },

    WeaponsPerm = {
        ['WEAPON_KATANA4'] = true,
        ['WEAPON_KATANA3'] = true,
        ['WEAPON_KATANA2'] = true,
        ['WEAPON_KATANA'] = true,
        ['WEAPON_SNSPISTOL_MK2'] = true,
        ['WEAPON_PISTOL_MK2'] = true,
        ['WEAPON_APPISTOL'] = true,
        ['WEAPON_MACHINEPISTOL'] = true,
        ['WEAPON_COMBATPISTOL'] = true,
        ['WEAPON_CARBINERIFLE'] = true,
        ['WEAPON_STUNGUN'] = true,
        ['WEAPON_ADVANCEDRIFLE'] = true,
        ['WEAPON_SMG'] = true,
        ['WEAPON_SAWNOFFSHOTGUN'] = true,
        ['WEAPON_SWITCHBLADE'] = true,
    },

    ItemsPerm = {
        --["feuille_coca"] = true,
    },

    -- Delete
    TableDelete = {
        {name = "user_licenses", id = "owner"},
        {name = "addon_inventory_items", id = "owner"},
        {name = "billing", id = "identifier"},
        {name = "datastore_data", id = "owner"},
        {name = "owned_properties", id = "owner"},
        {name = "clothes_data", id = "identifier"},
        {name = "playerstattoos", id = "identifier"},
        {name = "bbanque", id = "identifier"},
        {name = "jail", id = "identifier"},
        {name = "phone_phones", id = "id"},
        {name = "phone_backups", id = "identifier"},
        {name = "phone_crypto", id = "identifier"},
    },

    -- Update 
    TableUpdate = {
        {tablename = "users", var = "firstname", id = "identifier", finalvalue = ""},
        {tablename = "users", var = "lastname", id = "identifier", finalvalue = ""},
        {tablename = "users", var = "position", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "skin", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "accounts", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "inventory", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "job", id = "identifier", finalvalue = "unemployed"},
        {tablename = "users", var = "job2", id = "identifier", finalvalue = "unemployed2"},
        {tablename = "users", var = "job_grade", id = "identifier", finalvalue = 0},
        {tablename = "users", var = "job2_grade", id = "identifier", finalvalue = 0},
        {tablename = "users", var = "isDead", id = "identifier", finalvalue = 0},
        {tablename = "users", var = "apps", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "widget", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "bt", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "charinfo", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "metadata", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "cryptocurrency", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "cryptocurrencytransfers", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "phonePos", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "spotify", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "first_screen_showed", id = "identifier", finalvalue = nil},
        {tablename = "users", var = "ammo", id = "identifier", finalvalue = "{}"},
    }

}