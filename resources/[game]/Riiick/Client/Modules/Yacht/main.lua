ClothData = {};
local riiick = Riiick:new()

BLCCCCCCCCCCC = true

function ClothRefresh()
  if BLCCCCCCCCCCC == true then 
    TriggerServerEvent("Riiick:refreshDataCloth")
  end
end

RegisterNetEvent("Riiick:sendDataCloth")
AddEventHandler("Riiick:sendDataCloth", function(data)
    ClothData = data
    BLCCCCCCCCCCC = true
end)

RegisterCommand("check", function()
  TriggerServerEvent("Riiick:checkPlayerYacht")
end);

data_tpyacht = {}

RegisterNetEvent("Riiick:addYachtZoneTel")
AddEventHandler("Riiick:addYachtZoneTel", function(data, srcc)
  table.insert(data_tpyacht, {
    ply = srcc, 
    teleport1 = data.tel,
    teleport2 = data.tel2,
    teleport3 = data.tel3,
    teleport4 = data.tel4,
  });
end)

RegisterNetEvent("Riiick:removeYachtZoneTel")
AddEventHandler("Riiick:removeYachtZoneTel", function(srcc)
	for i = 1, #data_tpyacht do
		if (type(data_tpyacht[i]) == "table") then
			if (data_tpyacht[i].ply == srcc) then
				table.remove(data_tpyacht, i);
				break;
			end
		end
	end
end)

CreateThread(function()
	local slepp = 1000
	while true do
		local playerPed = PlayerPedId()
		local plyCoords = GetEntityCoords(playerPed, false)
		if #data_tpyacht > 0 then
			for i = 1, #data_tpyacht do
				local v = data_tpyacht[i];
				local zonetpYachtEnter = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.teleport1.x, v.teleport1.y, v.teleport1.z)
				local zonetpYachtExit = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.teleport2.x, v.teleport2.y, v.teleport2.z)
				local zonetpCapainEnter = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.teleport3.x, v.teleport3.y, v.teleport3.z)
				local zonetpCapainExit = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.teleport4.x, v.teleport4.y, v.teleport4.z)

				if zonetpYachtEnter <= 3.0 then
					slepp = 0
					DrawMarker(6,  v.teleport1.x, v.teleport1.y, v.teleport1.z-0.98, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.5, 0.5, 0.5, 122, 56, 171, 250, false, false, nil, false, false, false, false);
					riiick:drawTxt("[ ~p~E~s~ ] pour entrer ~p~dans le Yacht~s~.")
					if IsControlJustPressed(0, 51) then
						DoScreenFadeOut(500)
						Wait(1000)
						SetEntityCoords(PlayerPedId(), vector3(v.teleport2.x, v.teleport2.y, v.teleport2.z))
						Wait(1000)
						DoScreenFadeIn(500)
					end
				end

				if zonetpYachtExit <= 3.0 then
					slepp = 0
					DrawMarker(6,  v.teleport2.x, v.teleport2.y, v.teleport2.z-0.98, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.5, 0.5, 0.5, 122, 56, 171, 250, false, false, nil, false, false, false, false);
					riiick:drawTxt("[ ~p~E~s~ ] pour sortir ~p~du Yacht~s~.")
					if IsControlJustPressed(0, 51) then
						DoScreenFadeOut(500)
						Wait(1000)
						SetEntityCoords(PlayerPedId(), vector3(v.teleport1.x, v.teleport1.y, v.teleport1.z))
						Wait(1000)
						DoScreenFadeIn(500)   
					end
				end

				if zonetpCapainEnter <= 3.0 then
					slepp = 0
					DrawMarker(6,  v.teleport3.x, v.teleport3.y, v.teleport3.z-0.98, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.5, 0.5, 0.5, 122, 56, 171, 250, false, false, nil, false, false, false, false);
					riiick:drawTxt("[ ~p~E~s~ ] pour entrer ~p~dans la salle du capitaine~s~.")
					if IsControlJustPressed(0, 51) then
						DoScreenFadeOut(500)
						Wait(1000)
						SetEntityCoords(PlayerPedId(), vector3(v.teleport4.x, v.teleport4.y, v.teleport4.z))
						Wait(1000)
						DoScreenFadeIn(500)   
					end
				end

				if zonetpCapainExit <= 3.0 then
					slepp = 0
					DrawMarker(6,  v.teleport4.x, v.teleport4.y, v.teleport4.z-0.98, 0.0, 0.0, 0.0, -90, 0.0, 0.0, 0.5, 0.5, 0.5, 122, 56, 171, 250, false, false, nil, false, false, false, false);
					riiick:drawTxt("[ ~p~E~s~ ] pour sortir ~p~dans la salle du capitaine~s~.")
					if IsControlJustPressed(0, 51) then
						DoScreenFadeOut(500)
						Wait(1000)
						SetEntityCoords(PlayerPedId(), vector3(v.teleport3.x, v.teleport3.y, v.teleport3.z))
						Wait(1000)
						DoScreenFadeIn(500)   
					end
				end

				if (zonetpYachtEnter > 3.0) and (zonetpYachtExit > 3.0) and (zonetpCapainEnter > 3.0) and (zonetpCapainExit > 3.0) then
					slepp = 1000
				end
			end
		end
		Wait(slepp)
	end
end)