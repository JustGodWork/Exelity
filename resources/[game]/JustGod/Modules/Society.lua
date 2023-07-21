--
--Created Date: 18:31 15/12/2022
--Author: JustGod
--Made with ❤
--
--File: [Society]
--
--Copyright (c) 2022 JustGodWork, All Rights Reserved.
--This file is part of JustGodWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
--

Config["Society"] = {}; -- Don't touch this

Config["Society"]["MaxWeight"] = 1500; -- Max weight of society storage
Config["Society"]["DefaultMoney"] = 0; -- Default money of society storage
Config["Society"]["DefaultDirtyMoney"] = 0; -- Default dirty money of society storage

Config["Society"]["Pound"] = {}; -- Don't touch this
Config["Society"]["Pound"]["JobCoords"] = {}; -- Don't touch this
Config["Society"]["Pound"]["GangCoords"] = {}; -- Don't touch this
Config["Society"]["Pound"]["JobCoords"]["Blips"] = {}; -- Don't touch this
Config["Society"]["Pound"]["GangCoords"]["Blips"] = {}; -- Don't touch this

Config["Society"]["Pound"]["JobCoords"]["Blips"]["Enabled"] = true;
Config["Society"]["Pound"]["JobCoords"]["Blips"]["Label"] = "Fourrière Société";
Config["Society"]["Pound"]["JobCoords"]["Blips"]["Sprite"] = 524;
Config["Society"]["Pound"]["JobCoords"]["Blips"]["Color"] = 49;

Config["Society"]["Pound"]["GangCoords"]["Blips"]["Enabled"] = true;
Config["Society"]["Pound"]["GangCoords"]["Blips"]["Label"] = "Fourrière Gang";
Config["Society"]["Pound"]["GangCoords"]["Blips"]["Sprite"] = 524;
Config["Society"]["Pound"]["GangCoords"]["Blips"]["Color"] = 49;

Config["Society"]["Pound"]["Price"] = 500; -- Price to get vehicle from pound

Config["Society"]["Pound"]["JobCoords"]["Interact"] = vector3(-227.8229, -1172.216, 23.04406);
Config["Society"]["Pound"]["JobCoords"]["Out"] = vector4(-240.5614, -1179.947, 23.04406, 271.619);

Config["Society"]["Pound"]["GangCoords"]["Interact"] = vector3(120.3433, 6625.924, 31.95438);
Config["Society"]["Pound"]["GangCoords"]["Out"] = vector4(146.7289, 6625.81, 31.72639, 223.731);