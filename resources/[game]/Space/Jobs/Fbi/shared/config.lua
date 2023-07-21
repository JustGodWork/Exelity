FBI = {
    Vehicules = {
        {name = "fibp2", label = "FIB 2", minimum_grade = 0},
        {name = "fibp3", label = "FIB 3", minimum_grade = 1},
        {name = "lspdbuffsumk", label = "Buffalo banalisé", minimum_grade = 1},--
        {name = "fibp4", label = "FIB 4", minimum_grade = 2},
        {name = "lspdbuffalostxum", label = "Buffalo banalisé 2", minimum_grade = 2},--
        {name = "fibp5", label = "FIB 5", minimum_grade = 3},
        {name = "fibgrangerrto", label = "Grange banalisé", minimum_grade = 3},--
        {name = "fibp6", label = "FIB 6", minimum_grade = 4},
        {name = "fibp1a", label = "Victorya", minimum_grade = 4},
        {name = "fibp7", label = "FIB 7", minimum_grade = 5},
        {name = "LSPDumkscoutgnd", label = "Explorer", minimum_grade = 5},--
    },
    wlcustom = {
        [GetHashKey("fbi")] = true,
        [GetHashKey("lspdbuffalostxum")] = true,
        [GetHashKey("fibgrangerrto")] = true,
        [GetHashKey("LSPDumkscoutgnd")] = true
    },
    Helicoptere = {
        {name = "fibfrogger", label = "Helicoptère", minimum_grade = 4},
    },

    Tenues = {
        ["Gilet-2"] = {
            male = {
                ['bproof_1'] = 90,   ['bproof_2'] = 3,
            },
            female = {
                ['bproof_1'] = 91,   ['bproof_2'] = 3,
            }
        },
        [1] = {
            label = "S'équiper de la tenue :~p~Consultant Fédéral",
            minimum_grade = 0,
            male = {
                ['tshirt_1'] = 255,  ['tshirt_2'] = 0,
                ['torso_1'] = 811,   ['torso_2'] = 0,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 171,
                ['pants_1'] = 309,   ['pants_2'] = 0,
                ['shoes_1'] = 25,   ['shoes_2'] = 0,
                ['chain_1'] = 351,    ['chain_2'] = 0,
                ['bags_1'] = 138,     ['bags_2'] = 0,
                ['bproof_1'] = 0,   ['bproof_2'] = 0,
                ['helmet_1'] = -1, ['helmet_2'] = 0,
            },
            female = {
                ['tshirt_1'] = 340,  ['tshirt_2'] = 0,
                ['torso_1'] = 865,   ['torso_2'] = 0,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 223,
                ['pants_1'] = 309,   ['pants_2'] = 0,
                ['shoes_1'] = 25,   ['shoes_2'] = 0,
                ['chain_1'] = 216,    ['chain_2'] = 0,
                ['bags_1'] = 120,     ['bags_2'] = 0,
            }
        },
        [2] = {
            label = "S'équiper de la tenue :~p~Agent Aspirant",
            minimum_grade = 1,
            male = {
                ['tshirt_1'] = 96,  ['tshirt_2'] = 4,
                ['torso_1'] = 32,   ['torso_2'] = 0,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 223,
                ['pants_1'] = 292,   ['pants_2'] = 0,
                ['shoes_1'] = 25,   ['shoes_2'] = 0,
                ['chain_1'] = 0,    ['chain_2'] = 0,
                ['bags_1'] = 139,     ['bags_2'] = 0,
                ['bproof_1'] = 0,   ['bproof_2'] = 0,
            },
            female = {
                ['tshirt_1'] = 216,  ['tshirt_2'] = 0,
                ['torso_1'] = 92,   ['torso_2'] = 2,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 223,
                ['pants_1'] = 287,   ['pants_2'] = 12,
                ['shoes_1'] = 8,   ['shoes_2'] = 0,
                ['chain_1'] = 0,    ['chain_2'] = 0,
                ['bags_1'] = 119,     ['bags_2'] = 0,
            }
        },
        [3] = {
            label = "S'équiper de la tenue :~p~Agent Fédéral",
            minimum_grade = 2,
            male = {
                ['tshirt_1'] = 255,  ['tshirt_2'] = 0,
                ['torso_1'] = 811,   ['torso_2'] = 1,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 171,
                ['pants_1'] = 309,   ['pants_2'] = 0,
                ['shoes_1'] = 25,   ['shoes_2'] = 0,
                ['chain_1'] = 351,    ['chain_2'] = 0,
                ['bags_1'] = 138,     ['bags_2'] = 0,
                ['bproof_1'] = 0,   ['bproof_2'] = 0,
                ['helmet_1'] = -1, ['helmet_2'] = 0,
            },
            female = {
                ['tshirt_1'] = 340,  ['tshirt_2'] = 0,
                ['torso_1'] = 865,   ['torso_2'] = 1,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 223,
                ['pants_1'] = 309,   ['pants_2'] = 0,
                ['shoes_1'] = 25,   ['shoes_2'] = 0,
                ['chain_1'] = 216,    ['chain_2'] = 0,
                ['bags_1'] = 120,     ['bags_2'] = 0,
            }
        },
        [4] = {
            label = "S'équiper de la tenue :~p~Agent Spécial",
            minimum_grade = 3,
            male = {
                ['tshirt_1'] = 286,  ['tshirt_2'] = 0,
                ['torso_1'] = 773,   ['torso_2'] = 5,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 210,
                ['pants_1'] = 295,   ['pants_2'] = 1,
                ['shoes_1'] = 25,   ['shoes_2'] = 0,
                ['chain_1'] = 351,    ['chain_2'] = 0,
                ['bags_1'] = 0,     ['bags_2'] = 0,
                ['bproof_1'] = 0,   ['bproof_2'] = 0,
            },
            female = {
                ['tshirt_1'] = 344,  ['tshirt_2'] = 0,
                ['torso_1'] = 861,   ['torso_2'] = 5,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 215,
                ['pants_1'] = 323,   ['pants_2'] = 1,
                ['shoes_1'] = 25,   ['shoes_2'] = 0,
                ['chain_1'] = 216,    ['chain_2'] = 0,
                ['bags_1'] = 0,     ['bags_2'] = 0,
            }
        },
    },
}

