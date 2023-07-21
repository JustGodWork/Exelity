DrugConfig = {
    log = false,
    --[[

        RewardType:
        0 : Argent propre
        1 : Argent sale

    ]]
    rewardType = 1,
    delayBetweenActions = 2000, -- 2 secondes
    allowedLicense = {
        ["license:edc8648bf9564be4ca0453c0df6b582a86bee79f"] = true -- Fowlmas
    },

    messages = {
        harvest = {
            enable = false,
            message = "~y~+1 ~p~%s ~y~!"
        },

        transform = {
            onNoEnough = "~s~Vous n'avez pas assez de ~p~%s ~s~pour faire la transformation !",
            onDone = "~s~Vous avez transformé ~p~x%i %s ~s~en ~p~x%i %s"
        },

        sell = {
            onNoEnough = "~s~Vous n'avez pas de ~p~%s ~s~sur vous !",
            onDone = "~s~Vous avez vendu ~p~x%i %s ~s~pour ~g~%i$"
        }
    }
}