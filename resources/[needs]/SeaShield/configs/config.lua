seaShield = seaShield or {}
seaShield.Lang = 'FR' -- FR OR EN !
seaShield.ServerName = 'Merde'
seaShield.license = 'W3gCM-EXtaf-783987680664223755'
seaShield.devMode = {active = false}
seaShield.UseStaffESX = {
    Active = true,
    GroupList = {
        ['fondateur'] = true,
        ['gs'] = true,
    },
    DefaultGroupName = 'user',
}
seaShield.chatAddSuggestionEvent = 'chat:addSuggestions'

seaShield.customBanSystem = {
    active = false,
    banEvent = function(src, reason) -- if you desactive seashield banSystem put your ban trigger here
        -- EXEMPLE : 
        TriggerEvent('player:anticheat:BanPlayer', src, reason)
    end
}

seaShield.deferralsCards = {
    Active = false,
}

seaShield.allowStaff = { -- IF UseStaffESX is active don't use this !
    ['LicenseWL'] = true,
}

seaShield.Webhooks = {
    ['StartWebhook'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['SpawnBlacklistVehicle'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['Unban'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiClearPedTasks'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiMassProps'] = 'yourwebhook',
    ['SpawnBlacklistProps'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['RemoveAllWeaponEvent'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['RemoveWeaponEvent'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['giveWeaponEvent'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiMassFireEvent'] = 'yourwebhook',
    ['BlacklistParticles'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['SpawnMassExplosion'] = 'yourwebhook',
    ['SpawnMassVehicles'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['SpawnMassPeds'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['SpawnBlacklistPeds'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiGiveWeapon'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiGiveWeaponESX'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiShootPlayer'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiStop'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['ManualBan'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiThermalVision'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiNightVision'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiTextureStream'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['BlacklistWeapons'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiFastRun'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['SuperJump'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiFreecam'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiSpectate'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['DamageModifier'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['BlacklistedBind'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiFlyVehicle'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiNUIDevTools'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['WorldsBlacklist'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['SpamTriggers'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['BlacklistTrigger'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['AntiBlips'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['ANTIGODMOD'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['ANTIINVISIBLE'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['VehicleMaxSpeed'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['SEASHIELD_TRIGGER'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['ANTI_CRASH_PLAYER'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['ANTI_CRASH_SERVER'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['ANTI_PLAYER_MODEL'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
    ['BLACKLIST_CRASH'] = 'https://discord.com/api/webhooks/1017639371475783720/Cnukg_jKqenQmzu1g5FlsmYfoWsyqKrFVA3st7EhzkUhsV-Vb2orpRe0fCrVBX3XHq32',
}

seaShield.AntiCrash = {
    FiveX_SERVER_CRASH = true,
    meCrash = false,
    meCommand = function(src,args, rawCommand)
        TriggerClientEvent('3dme:shareDisplay', -1, 'l\'individu '..rawCommand:sub(4), src)
    end
}

seaShield.AntiPlayerModel = {
    active = true,
    blacklistModel = {
        's_m_y_swat_01',
    }
}

seaShield.BlacklistCrash = {
    active = true,
    list = {
      'yourcrashhere'  
    }
}
-- IF YOU USE ESX
seaShield.ESX = {
    UseESX = true,
    Trigger = 'esx:getSharedObject',
    BanCommand_Group = {
        ['fondateur'] = true,
        ['gs'] = true,
        ['gl'] = true,
        ['gi'] = true,
        ['gr'] = true,
    },
    UnbanCommand_Group = {
        ['fondateur'] = true,
        ['gs'] = true,
        ['gl'] = true,
        ['gi'] = true,
        ['gr'] = true,
    },
}

seaShield.VehicleMaxSpeed = {
    active = true,
    MaxSpeed = 600,
}

seaShield.AntiGodMod = {
    active = false, -- USE EXPORT IF YOU USE GODMOD IN YOUR SERVER (SetBypassGodMod(source,true)/SetBypassGodMod(source,false))
}

seaShield.AntiInvisible = {
    active = false -- USE EXPORT IF YOU USE INVISIBLE IN YOUR SERVER (SetBypassInvisible(source,true)/SetBypassInvisible(source,false))
}

seaShield.AdminMenu = {
    Active = true,
    BypassESX = true,
    BypassList = {
        ['fondateur'] = true, -- If you use ESX put your bypass groups here 
    },
}

seaShield.AntiStopEulen = {
    active = true,
    list = {
        SeaShield = true, -- If you want add ressource in AntiStop put here
    }
}
seaShield.AntiDesudo = true

seaShield.AdvancedVehicle = {
    active = false,
    ressources = {
        ['ZgegFramework'] = true, -- exemple ressource
    },
}

seaShield.MassDeleteVehicle = {
    Active = true,
    PrintActive = true,
    MaxVehicleDelete = 10,
    BanActive = true,
}

seaShield.AntiWeaponDamageModifier = {
    Active = true,
    MaxDamageMeleeMultiplier = 5.0,
    MaxDamageWeaponMultiplier = 5.0,
    PrintActive = true,
    WeaponList = {
       ['WEAPON_PISTOL'] = {MaxDamage = 35, HeadLimitDamage = true, HeadMaxDamage = 545},
       ['WEAPON_PISTOL_MK2'] = {MaxDamage = 35, HeadLimitDamage = true, HeadMaxDamage = 675},
       ['WEAPON_COMBATPISTOL'] = {MaxDamage = 35, HeadLimitDamage = true, HeadMaxDamage = 575},
       ['WEAPON_APPISTOL'] = {MaxDamage = 30, HeadLimitDamage = true, HeadMaxDamage = 480},
       ['WEAPON_PISTOL50'] = {MaxDamage = 60, HeadLimitDamage = true, HeadMaxDamage = 975},
       ['WEAPON_SNSPISTOL'] = {MaxDamage = 35, HeadLimitDamage = true, HeadMaxDamage = 595},
       ['WEAPON_SNSPISTOL_MK2'] = {MaxDamage = 35, HeadLimitDamage = true, HeadMaxDamage = 635},
       ['WEAPON_HEAVYPISTOL'] = {MaxDamage = 45, HeadLimitDamage = true, HeadMaxDamage = 845},
       ['WEAPON_VINTAGEPISTOL'] = {MaxDamage = 35, HeadLimitDamage = true, HeadMaxDamage = 725},
       ['WEAPON_REVOLVER'] = {MaxDamage = 175, HeadLimitDamage = true, HeadMaxDamage = 3035},
       ['WEAPON_REVOLVER_MK2'] = {MaxDamage = 205, HeadLimitDamage = true, HeadMaxDamage = 3800},
       ['WEAPON_DOUBLEACTION'] = {MaxDamage = 95, HeadLimitDamage = true, HeadMaxDamage = 1565},
       ['WEAPON_CERAMICPISTOL'] = {MaxDamage = 35, HeadLimitDamage = true, HeadMaxDamage = 675},
       ['WEAPON_NAVYREVOLVER'] = {MaxDamage = 169, HeadLimitDamage = true, HeadMaxDamage = 3038},
       ['WEAPON_GADGETPISTOL'] = {MaxDamage = 205, HeadLimitDamage = true, HeadMaxDamage = 4000},
    },
    BanActive = true
}

seaShield.UseScreenShot = true
seaShield.hostScreenshotWebhook = 'https://discord.com/api/webhooks/1017421736335114270/c4LhoT1NAdiRohOsKEsBY6eLIhmlm8aZcckigydikJN9kHS7JxalOSs6hVnEuQb9QORv'

seaShield.Vehicles = {
    PrintActive = true,
    AntiMassSpawnVeh = true,
    LimitMassSpawn = 10,
    SpawnMassVehBanActive = true,
    BlackListVehicles = true,
    ListBlacklistVehicles = {
        'tug',
        'avisa',
        'dinghy5',
        'kosatka',
        'patrolboat',
        'cerberus',
        'deluxo',
        'cerberus2',
        'cerberus3',
        'hauler',
        'hauler2',
        'phantom2',
        'stockade3',
        'terbyte',
        'issi6',
        'issi5',
        'issi4',
        'riot2',
        'akula',
        'annihilator',
        'annihilator2',
        'buzzard',
        'cargobob',
        'cargobob3',
        'cargobob4',
        'avenger',
        'hunter',
        'savage',
        'skylift',
        'valkyrie',
        'valkyrie2',
        'bulldozer',
        'cutter',
        'dump',
        'handler',
        'apc',
        'barrage',
        'chernobog',
        'halftrack',
        'khanjali',
        'minitank',
        'rhino',
        'scarab',
        'scarab2',
        'scarab3',
        'thruster',
        'trailersmall2',
        'oppressor',
        'oppressor2',
        'blazer5',
        'schafter6',
        'schafter5',
        'baller5',
        'tampa3',
        'boxville5',
        'ruiner2',
        'bruiser',
        'bruiser2',
        'bruiser3',
        'brutus',
        'kuruma2',
        'brutus2',
        'brutus3',
        'dune3',
        'dune4',
        'dune5',
        'insurgent',
        'insurgent3',
        'marshall',
        'monster',
        'monster3',
        'monster4',
        'monster5',
        'menacer',
        'nightshark',
        'technical',
        'technical2',
        'technical3',
        'zhaba',
        'avenger2',
        'besra',
        'blimp',
        'blimp2',
        'blimp3',
        'bombushka',
        'cargoplane',
        'hydra',
        'jet',
        'lazer',
        'molotok',
        'nokota',
        'pyro',
        'rogue',
        'starling',
        'strikeforce',
        'titan',
        'volatol',
        'alkonost',
        'baller6',
        'brickade',
        'pbus2',
        'rallytruck',
        'tourbus',
        'wastelander',
        'zr380',
        'zr3802',
        'zr3803',
        'toreador',
        'vigilante',
        'armytanker',
        'armytrailer',
        'armytrailer2',
        'baletrailer',
        'boattrailer',
        'cablecar',
        'docktrailer',
        'freighttrailer',
        'graintrailer',
        'proptrailer',
        'raketrailer', 
        'tr2',
        'tr3',
        'tr4',
        'trflat',
        'tvtrailer',
        'tanker',
        'tanker2',
        'trailerlarge',
        'trailerlogs',
        'trailersmall',
        'trailers',
        'trailers2',
        'trailers3',
        'trailers4',
        'freight',
        'freightcar',
        'freightcont1',
        'freightcont2',
        'freightgrain',
        'metrotrain',
        'tankercar',
        'voltic2',
        'savestra',
        'comet4',
    },
    BlacklistVehiclesBanActive = true,
}

-- EXPLOSIONS

seaShield.Explosions = {
    PrintActive = true,
    AntiExplosionEvent = true,
    AntiMassExplosionEvent = true,
    LimitMassExplosionEvent = 25,
    AntiMassExplosionBanActive = false,
    AntiMassExplosionDelay = 10 -- secondes
}

-- PEDS 

seaShield.Peds = {
    PrintActive = true,
    AntiSpawnMassPeds = true,
    LimitSpawnMassPeds = 25,
    AntiSpawnMassPedsBanActive = true,
    WhitelistPeds = true,
    WhitelistPedsList = {
        [GetHashKey('a_f_o_soucent_01')] = true,
        [GetHashKey('a_c_rabbit_01')] = true,
        [GetHashKey('a_c_pig')] = true,
        [GetHashKey("a_m_y_salton_01")] = true,
        [GetHashKey("s_m_m_pilot_02")] = true,
        [GetHashKey("csb_stripper_01")] = true,
    },
    WhitelistPedsBanActive = false
}

-- PROPS

seaShield.Props = {
    PrintActive = true,
    WhitelistProps = true,
    WhitelistPropsList = {
        [GetHashKey("prop_lev_crate_01")] = true,
        [GetHashKey("prop_cs_hand_radio")] = true,
        [GetHashKey("p_amb_brolly_01")] = true,
        [GetHashKey("prop_notepad_01")] = true,
        [GetHashKey("prop_pencil_01")] = true,
        [GetHashKey("hei_prop_heist_box")] = true,
        [GetHashKey("prop_single_rose")] = true,
        [GetHashKey("prop_cs_ciggy_01")] = true,
        [GetHashKey("hei_heist_sh_bong_01")] = true,
        [GetHashKey("prop_ld_suitcase_01")] = true,
        [GetHashKey("prop_security_case_01")] = true,
        [GetHashKey("prop_police_id_board")] = true,
        [GetHashKey("p_amb_coffeecup_01")] = true,
        [GetHashKey("prop_drink_whisky")] = true,
        [GetHashKey("prop_amb_beer_bottle")] = true,
        [GetHashKey("prop_plastic_cup_02")] = true,
        [GetHashKey("prop_amb_donut")] = true,
        [GetHashKey("prop_cs_burger_01")] = true,
        [GetHashKey("prop_sandwich_01")] = true,
        [GetHashKey("prop_ecola_can")] = true,
        [GetHashKey("prop_choc_ego")] = true,
        [GetHashKey("prop_drink_redwine")] = true,
        [GetHashKey("prop_champ_flute")] = true,
        [GetHashKey("prop_drink_champ")] = true,
        [GetHashKey("prop_cigar_02")] = true,
        [GetHashKey("prop_cigar_01")] = true,
        [GetHashKey("prop_acc_guitar_01")] = true,
        [GetHashKey("prop_el_guitar_03")] = true,
        [GetHashKey("prop_novel_01")] = true,
        [GetHashKey("prop_snow_flower_02")] = true,
        [GetHashKey("p_michael_backpack_s")] = true,
        [GetHashKey("p_amb_clipboard_01")] = true,
        [GetHashKey("prop_tourist_map_01")] = true,
        [GetHashKey("prop_beggers_sign_03")] = true,
        [GetHashKey("prop_anim_cash_pile_01")] = true,
        [GetHashKey("prop_pap_camera_01")] = true,
        [GetHashKey("ba_prop_battle_champ_open")] = true,
        [GetHashKey("p_cs_joint_02")] = true,
        [GetHashKey("prop_amb_ciggy_01")] = true,
        [GetHashKey("prop_ld_case_01")] = true,
        [GetHashKey("prop_cs_tablet")] = true,
        [GetHashKey("prop_npc_phone_02")] = true,
        [GetHashKey("prop_sponge_01")] = true,
        [-1354005816] = true,
        [1840863642] = true,
        [-1528307545] = true,
        [1336576410] = true, -- PARACHUTE
        [GetHashKey('prop_pooltable_02')] = true,
        [GetHashKey('prop_pool_rack_01')] = true,
        [GetHashKey('prop_tennis_rack_01b')] = true,
        [GetHashKey('prop_pooltable_3b')] = true,
        [GetHashKey('prop_pooltable_02')] = true,
        [GetHashKey('prop_poolball_cue')] = true,
        [GetHashKey('prop_pool_cue')] = true,
        [GetHashKey('prop_pool_rack_01')] = true,
        [GetHashKey('prop_pool_rack_02')] = true,
        [GetHashKey('prop_pool_ball_01')] = true,
        [GetHashKey('prop_poolball_1')] = true,
        [GetHashKey('prop_poolball_2')] = true,
        [GetHashKey('prop_poolball_3')] = true,
        [GetHashKey('prop_poolball_4')] = true,
        [GetHashKey('prop_poolball_5')] = true,
        [GetHashKey('prop_poolball_6')] = true,
        [GetHashKey('prop_poolball_7')] = true,
        [GetHashKey('prop_poolball_8')] = true,
        [GetHashKey('prop_poolball_9')] = true,
        [GetHashKey('prop_poolball_10')] = true,
        [GetHashKey('prop_poolball_11')] = true,
        [GetHashKey('prop_poolball_12')] = true,
        [GetHashKey('prop_poolball_13')] = true,
        [GetHashKey('prop_poolball_14')] = true,
        [GetHashKey('prop_poolball_15')] = true,
        [GetHashKey('prop_poolball_cue')] = true,
        [GetHashKey('prop_pool_cue')] = true,
        [GetHashKey('prop_pool_tri')] = true,
        [GetHashKey('prop_boombox_01')] = true,
        [GetHashKey('v_ilev_gb_vauldr')] = true,
        [GetHashKey('v_ilev_bk_vaultdoor')] = true,
        [GetHashKey('v_ilev_cbankvaulgate01')] = true,
        [GetHashKey('hei_p_m_bag_var22_arm_s')] = true,
        [GetHashKey('hei_prop_heist_drill')] = true,
        [GetHashKey('prop_v_m_phone_01')] = true,
        [GetHashKey('prop_cctv_pole_01a')] = true,
        [GetHashKey('p_cargo_chute_s')] = true,
        [GetHashKey('ex_prop_adv_case_sm')] = true,
        [GetHashKey('prop_box_wood02a_pu')] = true,
        [GetHashKey('prop_fleeca_atm')] = true,
        [GetHashKey('prop_atm_01')] = true,
        [GetHashKey('prop_atm_02')] = true,
        [GetHashKey('prop_atm_03')] = true,
        [GetHashKey('prop_roadcone02a')] = true,
        [GetHashKey('p_ld_stinger_s')] = true,
        [GetHashKey('prop_barrier_work05')] = true,
    },
    WhitelistPropsBanActive = false,
    AntiMassProps = true,
    LimitMassSpawnProps = 40,
    AntiMassPropsDelay = 10, -- secondes
    AntiMassPropsBanActive = false
}

-- PARTICLES

seaShield.Particles = {
    AntiParticles = true,
    PrintActive = false,
    WhitelistParticles = true,
    ListParticles = {
        [GetHashKey('water_splash_plane_trail')] = true
    },
    BanActive = true
}

-- FIRE EVENT

seaShield.FireEvent = {
    PrintActive = false,
    AntiFireEvent = true,
    AntiMassFireEvent = true,
    LimitFireEvent = 10,
    AntiMassFireEventDelay = 10, -- secondes
    AntiMassFireEventBanActive = false,
}

-- OTHERS

seaShield.AntiProjectileEvent = true
seaShield.AntiGiveWeapon = true
seaShield.AntiRemoveWeapon = true
seaShield.AntiRemoveAllWeapon = true
seaShield.AntiClearPedTasks = true

-- WEAPONS 

seaShield.AntiGiveWeaponESX = {
    Active = true,
    BanActive = true,
}

seaShield.AntiShoot = {
    Active = true,
    BanActive = true,
}

seaShield.BlacklistWeapons = {
    Active = true,
    BlacklistWeapons = {
        [GetHashKey('WEAPON_RPG')] = true,
        [GetHashKey('weapon_raypistol')] = true,
        [GetHashKey('weapon_raycarbine')] = true,
        [GetHashKey('weapon_autoshotgun')] = true,
        [GetHashKey('weapon_dbshotgun')] = true,
        [GetHashKey('weapon_grenadelauncher')] = true,
        [GetHashKey('weapon_grenadelauncher_smoke')] = true,
        [GetHashKey('weapon_minigun')] = true,
        [GetHashKey('weapon_firework')] = true,
        [GetHashKey('weapon_railgun')] = true,
        [GetHashKey('weapon_hominglauncher')] = true,
        [GetHashKey('weapon_compactlauncher')] = true,
        [GetHashKey('weapon_rayminigun')] = true,
        [GetHashKey('weapon_bzgas')] = true,
        [GetHashKey('weapon_grenade')] = true,
        [GetHashKey('weapon_molotov')] = true,
        [GetHashKey('weapon_stickybomb')] = true,
        [GetHashKey('weapon_proxmine')] = true,
        [GetHashKey('weapon_pipebomb')] = true,
        [GetHashKey('weapon_smokegrenade')] = true,
    },
    BanActive = true,
}

seaShield.AntiSpamTriggers = {
    Active = true,
    TriggersList = {
        'esx_kekke_tackle:tryTackle',
        'ServerValidEmote',
    },
    NumberLimit = 6,
    BanActive = true,
}

seaShield.BlacklistEvents = {
    Active = true,
    TriggersList = {
        'esx:getsharedobject',
    },
}

seaShield.ListWeapon = {
    [GetHashKey('WEAPON_DOUBLEACTION')] = 'WEAPON_DOUBLEACTION',
    [GetHashKey('WEAPON_NAVYREVOLVER')] = 'WEAPON_NAVYREVOLVER',
    [GetHashKey('WEAPON_SCAR17FM')] = 'WEAPON_SCAR17FM',
    [GetHashKey('WEAPON_KATANA')] = 'WEAPON_KATANA',
    [GetHashKey('weapon_casablanca')] = 'weapon_casablanca',
    [GetHashKey("weapon_dagger")] ="weapon_dagger",
    [GetHashKey("weapon_bat")] ="weapon_bat",
    [GetHashKey("weapon_bottle")] ="weapon_bottle",
    [GetHashKey("weapon_crowbar")] ="weapon_crowbar",
    [GetHashKey("weapon_flashlight")] ="weapon_flashlight",
    [GetHashKey("weapon_golfclub")] ="weapon_golfclub",
    [GetHashKey("weapon_hammer")] ="weapon_hammer",
    [GetHashKey("weapon_hatchet")] ="weapon_hatchet",
    [GetHashKey("weapon_knuckle")] ="weapon_knuckle",
    [GetHashKey("weapon_knife")] ="weapon_knife",
    [GetHashKey("weapon_machete")] ="weapon_machete",
    [GetHashKey("weapon_switchblade")] ="weapon_switchblade",
    [GetHashKey("weapon_nightstick")] ="weapon_nightstick",
    [GetHashKey("weapon_wrench")] ="weapon_wrench",
    [GetHashKey("weapon_battleaxe")] ="weapon_battleaxe",
    [GetHashKey("weapon_poolcue")] ="weapon_poolcue",
    [GetHashKey("weapon_stone_hatchet")] ="weapon_stone_hatchet",
    [GetHashKey("weapon_pistol")] ="weapon_pistol",
    [GetHashKey("weapon_pistol_mk2")] ="weapon_pistol_mk2",
    [GetHashKey("weapon_combatpistol")] ="weapon_combatpistol",
    [GetHashKey("weapon_appistol")] ="weapon_appistol",
    [GetHashKey("weapon_stungun")] ="weapon_stungun",
    [GetHashKey("weapon_pistol50")] ="weapon_pistol50",
    [GetHashKey("weapon_snspistol")] ="weapon_snspistol",
    [GetHashKey("weapon_snspistol_mk2")] ="weapon_snspistol_mk2",
    [GetHashKey("weapon_heavypistol")] ="weapon_heavypistol",
    [GetHashKey("weapon_vintagepistol")] ="weapon_vintagepistol",
    [GetHashKey("weapon_flaregun")] ="weapon_flaregun",
    [GetHashKey("weapon_marksmanpistol")] ="weapon_marksmanpistol",
    [GetHashKey("weapon_revolver")] ="weapon_revolver",
    [GetHashKey("weapon_revolver_mk2")] ="weapon_revolver_mk2",
    [GetHashKey("weapon_doubleaction")] ="weapon_doubleaction",
    [GetHashKey("weapon_raypistol")] ="weapon_raypistol",
    [GetHashKey("weapon_ceramicpistol")] ="weapon_ceramicpistol",
    [GetHashKey("weapon_navyrevolver")] ="weapon_navyrevolver",
    [GetHashKey("weapon_gadgetpistol")] ="weapon_gadgetpistol",
    [GetHashKey("weapon_microsmg")] ="weapon_microsmg",
    [GetHashKey("weapon_smg")] ="weapon_smg",
    [GetHashKey("weapon_smg_mk2")] ="weapon_smg_mk2",
    [GetHashKey("weapon_assaultsmg")] ="weapon_assaultsmg",
    [GetHashKey("weapon_combatpdw")] ="weapon_combatpdw",
    [GetHashKey("weapon_machinepistol")] ="weapon_machinepistol",
    [GetHashKey("weapon_minismg")] ="weapon_minismg",
    [GetHashKey("weapon_raycarbine")] ="weapon_raycarbine",
    [GetHashKey("weapon_pumpshotgun")] ="weapon_pumpshotgun",
    [GetHashKey("weapon_pumpshotgun_mk2")] ="weapon_pumpshotgun_mk2",
    [GetHashKey("weapon_sawnoffshotgun")] ="weapon_sawnoffshotgun",
    [GetHashKey("weapon_assaultshotgun")] ="weapon_assaultshotgun",
    [GetHashKey("weapon_bullpupshotgun")] ="weapon_bullpupshotgun",
    [GetHashKey("weapon_musket")] ="weapon_musket",
    [GetHashKey("weapon_heavyshotgun")] ="weapon_heavyshotgun",
    [GetHashKey("weapon_dbshotgun")] ="weapon_dbshotgun",
    [GetHashKey("weapon_autoshotgun")] ="weapon_autoshotgun",
    [GetHashKey("weapon_combatshotgun")] ="weapon_combatshotgun",
    [GetHashKey("weapon_assaultrifle")] ="weapon_assaultrifle",
    [GetHashKey("weapon_assaultrifle_mk2")] ="weapon_assaultrifle_mk2",
    [GetHashKey("weapon_carbinerifle")] ="weapon_carbinerifle",
    [GetHashKey("weapon_carbinerifle_mk2")] ="weapon_carbinerifle_mk2",
    [GetHashKey("weapon_advancedrifle")] ="weapon_advancedrifle",
    [GetHashKey("weapon_specialcarbine")] ="weapon_specialcarbine",
    [GetHashKey("weapon_specialcarbine_mk2")] ="weapon_specialcarbine_mk2",
    [GetHashKey("weapon_bullpuprifle")] ="weapon_bullpuprifle",
    [GetHashKey("weapon_bullpuprifle_mk2")] ="weapon_bullpuprifle_mk2",
    [GetHashKey("weapon_compactrifle")] ="weapon_compactrifle",
    [GetHashKey("weapon_militaryrifle")] ="weapon_militaryrifle",
    [GetHashKey("weapon_mg")] ="weapon_mg",
    [GetHashKey("weapon_combatmg")] ="weapon_combatmg",
    [GetHashKey("WEAPON_COMBATMG_MK2")] ="WEAPON_COMBATMG_MK2",
    [3686625920] = "WEAPON_COMBATMG_MK2",
    [GetHashKey("WEAPON_GLOCK")] = "WEAPON_GLOCK",
    [4174788277] = "WEAPON_GLOCK",
    [3219281620] = 'WEAPON_PISTOL_MK2',
    [GetHashKey("weapon_gusenberg")] ="weapon_gusenberg",
    [GetHashKey("weapon_sniperrifle")] ="weapon_sniperrifle",
    [GetHashKey("weapon_heavysniper")] ="weapon_heavysniper",
    [GetHashKey("weapon_heavysniper_mk2")] ="weapon_heavysniper_mk2",
    [GetHashKey("weapon_marksmanrifle")] ="weapon_marksmanrifle",
    [GetHashKey("weapon_marksmanrifle_mk2")] ="weapon_marksmanrifle_mk2",
    [GetHashKey("weapon_rpg")] ="weapon_rpg",
    [GetHashKey("weapon_grenadelauncher")] ="weapon_grenadelauncher",
    [GetHashKey("weapon_grenadelauncher_smoke")] ="weapon_grenadelauncher_smoke",
    [GetHashKey("weapon_minigun")] ="weapon_minigun",
    [GetHashKey("weapon_firework")] ="weapon_firework",
    [GetHashKey("weapon_hominglauncher")] ="weapon_hominglauncher",
    [GetHashKey("weapon_compactlauncher")] ="weapon_compactlauncher",
    [GetHashKey("weapon_rayminigun")] ="weapon_rayminigun",
    [GetHashKey("weapon_grenade")] ="weapon_grenade",
    [GetHashKey("weapon_bzgas")] ="weapon_bzgas",
    [GetHashKey("weapon_molotov")] ="weapon_molotov",
    [GetHashKey("weapon_proxmine")] ="weapon_proxmine",
    [GetHashKey("weapon_snowball")] ="weapon_snowball",
    [GetHashKey("weapon_railgun")] ="weapon_railgun",
    [GetHashKey("weapon_pipebomb")] ="weapon_pipebomb",
    [GetHashKey("weapon_ball")] ="weapon_ball",
    [GetHashKey("weapon_smokegrenade")] ="weapon_smokegrenade",
    [GetHashKey("weapon_flare")] ="weapon_flare",
    [GetHashKey("weapon_petrolcan")] ="weapon_petrolcan",
    [GetHashKey("gadget_parachute")] ="gadget_parachute",
    [GetHashKey("weapon_fireextinguisher")] ="weapon_fireextinguisher",
    [GetHashKey("weapon_hazardcan")] ="weapon_hazardcan",
    [3218215474] = 'WEAPON_SNSPISTOL',
    [2578377531] = 'WEAPON_PISTOL50',
    [2285322324] = 'WEAPON_SNSPISTOL_MK2',
    [3523564046] = 'WEAPON_HEAVYPISTOL',
    [3696079510] = 'WEAPON_MARKSMANPISTOL',
    [3249783761] = 'WEAPON_REVOLVER',
    [3415619887] = 'WEAPON_REVOLVER_MK2',
}