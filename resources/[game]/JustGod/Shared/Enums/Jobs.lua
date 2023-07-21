---
--- @author Kadir#6666
--- Create at [19/05/2023] 10:09:26
--- Current project [Exelity-V1]
--- File name [Jobs]
---

Enums.Jobs = {

    Center = {

        Events = {

            Server = {

                Join = "justgod:exelity:jobs:center:join",
                Quit = "justgod:exelity:jobs:center:quit"

            }

        }

    },

    Farm = {

        Events = {

            Server = {

                TakeService = "justgod:exelity:jobs:farm:takeService",
                FinishMission = "justgod:exelity:jobs:farm:finishMission",

            },

            Client = {

                ServiceUpdate = "justgod:exelity:jobs:farm:serviceUpdate"

            }

        }

    }

}