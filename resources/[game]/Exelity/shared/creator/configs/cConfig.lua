--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

---@author Razzway
---@version 3.0
---@class CreatorConfig
CreatorConfig = {
    getESX = "esx:getSharedObject", --> Trigger de déclaration ESX | Défaut : esx:getSharedObject
    consoleLogs = true, --> Activer/Désactiver les print dans la console
    serverName = "Exelity", --> Nom de votre serveur rp
    afterMessage = true, --> Message de bienvenue après la création

    use = {calif = true}, --> Si vous utilisez la base calif : true | Sinon si ESX normal : false

    events = { --> Vos events & préfix d'events (si base calif, rajouter votre préfix | exemple : ::{korioz#0110}::
        showNotification = "esx:showNotification", --> Calif = ::{korioz#0110}::esx:showNotification
        skinchanger = "skinchanger", --> Calif = ::{korioz#0110}::skinchanger
        skin = "esx_skin", --> Calif = ::{korioz#0110}::esx_skin
    },

    starterPack = {
        enable = false, --> Activer/Désactiver le système de starterPack
        legal = { --> Configuration du pack legal
            ["cash"] = 5000,
            ["bank"] = 30000,
        },
        illegal = { --> Configuration du pack illegal
            ["bank"] = 10000,
            ["black_money"] = 5000,
            ["weapon"] = "weapon_pistol",
        },
    },

    afterSpawn = { --> Lieu de spawn possible après la création du perso
        {name = 'Ville', pos = vector3(-1018.45,-1517.09,5.58), head = 121.97},
        --{name = 'Aéroport', pos = vector3(-1037.82, -2737.85, 20.36), head = 330.81},
        --{name = 'Sandy Shores', pos = vector3(1841.15, 3669.22, 33.87), head = 208.88}
        --{name = 'Exemple', pos = vector3(0, 0, 0), head = 0.0}
    },

    firstSpawn = { --> Premier lieu de spawn du joueur lors de la création
        pos = vector3(-774.95, 318.24, 195.86-0.9),
        heading = 89.96,
    },
    cloakRoom = { --> Une fois l'identité validé, le lieu où l'on change l'apparence
        pos = vector3(-763.23, 330.84, 199.48-1),
        heading = 178.67,
    },
    kitchen = { --> Une fois le personnage validé, le lieu où l'on choisit son kit de départ
        pos = vector3(-776.85, 325.81, 196.08-1),
        heading = 308.63,
    },
    lift = { --> Lieu où l'on choisit l'endroit de spawn du personnage
        pos = vector3(-775.78, 314.45, 195.88-1),
        heading = 331.69,
    },

    outfit = { --> Configuration des tenues prédéfinies
        {label = "Tenue détente",
            clothes = {
                ["male"] = {
                    bags_1 = 0, bags_2 = 0,
                    tshirt_1 = 15, tshirt_2 = 0,
                    torso_1 = 719, torso_2 = 0,
                    arms = 1,
                    pants_1 = 278, pants_2 = 0,
                    shoes_1 = 199, shoes_2 = 0,
                    mask_1 = 0, mask_2 = 0,
                    bproof_1 = 0, bproof_2 = 0,
                    glasses_1 = 0, glasses_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 0, chain_2 = 0,
                    decals_1 = 0, decals_2 = 0,
                },
                ["female"] = {
                    bags_1 = 0, bags_2 = 0,
                    tshirt_1 = 14, tshirt_2 = 0,
                    torso_1 = 683, torso_2 = 0,
                    arms = 15,
                    pants_1 = 345, pants_2 = 0,
                    shoes_1 = 134, shoes_2 = 2,
                    mask_1 = 0, mask_2 = 0,
                    glasses_1 = 51, glasses_2 = 0,
                    bproof_1 = 0, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    watches_1 = 3, watches_2 = 0,
                    chain_1 = 173, chain_2 = 0,
                    bracelets_1 = 16, bracelets_2 = 0,
                    decals_1 = 0, decals_2 = 0,
                },
            },
        },
        {label = "Tenue sophistiquée",
            clothes = {
                ["male"] = {
                    bags_1 = 0, bags_2 = 0,
                    tshirt_1 = 150, tshirt_2 = 0,
                    torso_1 = 31, torso_2 = 0,
                    arms = 1,
                    pants_1 = 52, pants_2 = 2,
                    shoes_1 = 10, shoes_2 = 0,
                    mask_1 = 0, mask_2 = 0,
                    bproof_1 = 0, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 0, chain_2 = 0,
                    decals_1 = 0, decals_2 = 0,
                },
                ["female"] = {
                    bags_1 = 0, bags_2 = 0,
                    tshirt_1 = 14, tshirt_2 = 0,
                    torso_1 = 600, torso_2 = 1,
                    arms = 15,
                    pants_1 = 15, pants_2 = 0,
                    shoes_1 = 144, shoes_2 = 12,
                    mask_1 = 0, mask_2 = 0,
                    bproof_1 = 0, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    glasses_1 = 5, glasses_2 = 0,
                    bracelets_1 = 16, bracelets_2 = 0,
                    watches_1 = 23, watches_2 = 0,
                    chain_1 = 175, chain_2 = 1,
                    decals_1 = 0, decals_2 = 0,
                },
            },
        },
    },
}

_Client = _Client or {};
_Client.open = {};
_Prefix = "creator";
Render = {};
arrow = "~c~→~s~ ";