ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterServerEvent('Ouvre:avocat')
AddEventHandler('Ouvre:avocat', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Avocat', '~r~Annonce', 'Le Cabinet d\'Avocat est désormais ~g~Ouvert~s~ !', 'CHAR_AVOCAT', 8)
	end
end)

RegisterServerEvent('Avocat:annonce')
AddEventHandler('Avocat:annonce', function(annonce)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], '~r~Annonce', '~r~avocat', annonce, 'CHAR_avocat', 8)
    end
end)

RegisterServerEvent('Ferme:avocat')
AddEventHandler('Ferme:avocat', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Avocat', '~r~Annonce', 'Le Cabinet d\'Avocat est désormais ~r~Fermer~s~ !', 'CHAR_AVOCAT', 8)
	end
end)

RegisterServerEvent('Recru:avocat')
AddEventHandler('Recru:avocat', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Avocat', 'Annonce', 'Les avocats recrutent ! Rendez-vous au ~b~Cabinet d\'Avocat', 'CHAR_AVOCAT', 8)
	end
end)

local function sendToDiscordWithSpecialURL(Color, Title, Description)
	local Content = {
	        {
	            ["color"] = Color,
	            ["title"] = Title,
	            ["description"] = Description,
		        ["footer"] = {
	            ["text"] = "Johnny Avocat",
	            ["icon_url"] = nil,
	            },
	        }
	    }
	PerformHttpRequest(ConfigWebhookRendezVous, function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("Rdv:Avocat")
AddEventHandler("Rdv:Avocat", function(nomprenom, numero, heurerdv, rdvmotif)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ident = xPlayer.getIdentifier()
	local date = os.date('*t')

	if date.day < 10 then date.day = '' .. tostring(date.day) end
	if date.month < 10 then date.month = '' .. tostring(date.month) end
	if date.hour < 10 then date.hour = '' .. tostring(date.hour) end
	if date.min < 10 then date.min = '' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '' .. tostring(date.sec) end

	if ident == 'steam:11' then--Special character in username just crash the server
	else 
		sendToDiscordWithSpecialURL(16744192, "Demande de Rendez-Vous\n\n```Nom : "..nomprenom.."\n\nNuméro de Téléphone: "..numero.."\n\nHeure du Rendez Vous : " ..heurerdv.."\n\nMotif du Rendez-vous : " ..rdvmotif.. "\n\n```Date : " .. date.day .. "." .. date.month .. "." .. date.year .. " | " .. date.hour .. " h " .. date.min .. " min " .. date.sec)
	end
end)


RegisterServerEvent('Appel:avocat')
AddEventHandler('Appel:avocat', function()
    
	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'avocat' then
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Avocat', '~r~Accueil', 'Un Avocat est appelé l\'accueil !', 'CHAR_AVOCAT', 8)
        end
    end
end)

ConfigWebhookRendezVous = "https://discord.com/api/webhooks/1119323769706643538/lkSugbpe9DBeQkKbFPfdUxQD4Sz61d9u3on7pQkGLWg5ZU_04erIsR9nzbyVCc2T_YVN"