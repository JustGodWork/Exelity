--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

Map = {

    {name="[Public] Commissariat",color=77, id=60, x=438.687, y=-981.91, z=30.68982, r= 800.0},

    {name="[Public] B.C.S.O",color=52, id=58, x=-445.31930541992, y=6008.9243164063, z=44.012222290039, r= 800.0},

    {name="[Public] R.S.D",color=36, id=58, x=-1034.002, y=6658.004, z=3.185936, r= 800.0},

    {name="[Public] Hôpital",color=2, id=61, scale=0.8,x=-822.4433, y = -1223.277, z= 7.33145, r= 800.0},

    --{name="Sherrif",color=56, id=60, x=-443.08, y = 6016.76, z = 31.4},

    {name="[Public] Benny's",color=5, id=446, x=-211.27, y = -1323.20, z= 30.89, r= 800.0},

    {name="[Public] Ls Custom",color=38, id=72, x=-331.3797, y = -109.7054, z= 39.01394, r= 800.0},
 
    --{name="Vanilla Unicorn",color=50, id=121,x=129.246, y = -1299.363, z= 29.501},

  --  {name="[Territoire] Bloods",color=1, id=378,x=-1159.92, y = -1514.06, z= 4.16},

    {name="[Public] Gouvernement",color=0, id=419,x=-551.361, y = -193.53, z= 38.57, r= 800.0},

    --{name="[Territoire] Bratva",color=0, id=484,x=1364.97, y = -578.8, z= 74.38},

    --{name="[Territoire] Madrazo",color=22, id=378,x=1387.5, y = 1141.64, z= 114.33},
    {name = "[Public] Unicorn", color=27, id=121, 12, x=129.246, y = -1300.6, z= 29.2, r= 800.0},
    {name = "[Public] Bahamas", color=7, id=121, 12, x=-1390.057, y =  -614.4379, z= 29.71992, r= 400.0},
  --  {name = "Concessionnaire Beneteau", color=3, id=410, 12, x=-735.6, y = -1321.9, z= 1.56},
  --  {name = "Concession aéronotique", color=1, id=16, 12, x=-964.3, y = -2965.4, z= 13.94},

    {name="[Territoire] Bloods",color=1, id=378,x = -1545.39, y = -407.93, z = 41.98, r= 800.0},

    {name="[Territoire] Marabunta",color=26, id=378,x=1256.80, y = -1582.10, z= 54.55, r= 800.0},

    {name="[Territoire] Vagos",color=5, id=378,x=324.73, y = -2031.74, z= 20.87, r= 800.0}, 

    {name="[Territoire] Ballas",color=27, id=378,x=88.05, y = -1925.59, z= 20.79, r= 800.0},

    {name="[Territoire] Families",color=2, id=378,x=-165.40, y = -1632.77, z= 33.65, r= 800.0},

    {name="[Activité] Zone de Chasse",color=17, id=141,x=-567.27, y = 5253.18, z= 70.46, r= 4000.0},

    {name="[Public] Boucherie",color=34, id=478, x = 960.84, y = -2111.57, z = 31.94, r= 0.0},

    {name="[Entreprise] Vigneron",color=61, id=85, x = -1890.2873535156, y = 2045.201171875, z = 140.8708190918, r= 0.0},

    {name="[Entreprise] Agence Immobilière",color=69, id=40, x = -706.3798, y = 268.9534, z = 83.10735, r= 0.0},

    --{name="Acheteur de poisson",color=51, id=480, x = 1961.89, y = 5184.36, z = 47.98, r= 0.0},

    --{name="Pêche",color=38, id=480, x = 2073.23, y = 4554.31, z = 31.31, r= 0.0},

    --{name="Hopital",color=2, id=61,x=286.6, y = -582.8, z= 43.3},

    --{name="Commissariat de Police",color=29, id=60,x=425.1, y = -979.5, z= 30.7},

    --{name="Quartier Yakuza",color=68, id=378,x=-1059.5769, y = -1028.1550, z= 30.7},

}









Citizen.CreateThread(function()

	

	for i=1, #Map, 1 do

		local blip = AddBlipForCoord(Map[i].x, Map[i].y, Map[i].z) 

    	SetBlipSprite (blip, Map[i].id)

    	SetBlipDisplay(blip, 4)

    	SetBlipScale  (blip, 0.6)

    	SetBlipColour (blip, Map[i].color)

    	SetBlipAsShortRange(blip, true)

  		BeginTextCommandSetBlipName("STRING") 

  		AddTextComponentString(Map[i].name)

		EndTextCommandSetBlipName(blip)



		local zoneblip = AddBlipForRadius(Map[i].x, Map[i].y, Map[i].z, Map[i].r)

		SetBlipSprite(zoneblip,1)

		SetBlipColour(zoneblip,Map[i].color)

		SetBlipAlpha(zoneblip,100)

	end

end)