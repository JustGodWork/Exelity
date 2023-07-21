--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)

RegisterNetEvent('esx_billing:sendBill', function(playerId, sharedAccountName, label, amount)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(playerId)
	amount        = ESX.Math.Round(amount)

	local society = ESX.DoesSocietyExist(sharedAccountName);

	if amount < 0 then
		print(('esx_billing: %s attempted to send a negative bill!'):format(xPlayer.identifier))
	elseif (not society) then

		if (xTarget) then
			MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @a', {
				['@a'] = xTarget.identifier
			}, function(r)

				if #r > 0 then
					xPlayer.showNotification("La personne sélectionner a déjà une ou plusieurs factures impayées.")
					xTarget.showNotification("Vous avez déjà une ou plusieurs factures impayées.");
					return;
				end

				MySQL.Async.execute('INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (@identifier, @sender, @target_type, @target, @label, @amount)',
				{
					['@identifier']  = xTarget.identifier,
					['@sender']      = xPlayer.identifier,
					['@target_type'] = 'player',
					['@target']      = xPlayer.identifier,
					['@label']       = label,
					['@amount']      = amount,
				}, function(rowsChanged)
					TriggerClientEvent('esx:showNotification', xPlayer.source, "vous avez envoyé une facture de : "..amount.."~g~$~w~")
					TriggerClientEvent('esx:showNotification', xTarget.source, "vous avez ~r~reçu~s~ une facture")
					SendLogs("Facture", "Exelity | Facture", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) vient d'envoyer une facture de "..amount.."$ au joueur **"..xTarget.name.."** (***"..xTarget.identifier.."***) pour l'entreprise **"..label.."** ", "https://discord.com/api/webhooks/1060516689344741396/ND9GdygiHYb8E7mR7jMlpf3epTBIli4YeFnNpLG_cZ_i498WvOfVunmEaYNaC5XVrfvz")
				end);

			end)
		end
	elseif (society) then

		if xTarget ~= nil then
			MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @a', {
				['@a'] = xTarget.identifier
			}, function(r)

				if #r > 0 then
					xPlayer.showNotification("La personne sélectionner a déjà une ou plusieurs factures impayées.")
					xTarget.showNotification("Vous avez déjà une ou plusieurs factures impayées.");
					return;
				end

				MySQL.Async.execute('INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (@identifier, @sender, @target_type, @target, @label, @amount)',
				{
					['@identifier']  = xTarget.identifier,
					['@sender']      = xPlayer.identifier,
					['@target_type'] = 'society',
					['@target']      = sharedAccountName,
					['@label']       = label,
					['@amount']      = amount,
				}, function(rowsChanged)
					TriggerClientEvent('esx:showNotification', xTarget.source, "vous avez ~r~reçu~s~ une facture")
					SendLogs("Facture", "Exelity | Facture", "Le joueur **"..xPlayer.name.."** (***"..xPlayer.identifier.."***) vient d'envoyer une facture de "..amount.."$ au joueur **"..xTarget.name.."** (***"..xTarget.identifier.."***) pour l'entreprise **"..label.."** ", "https://discord.com/api/webhooks/1060516689344741396/ND9GdygiHYb8E7mR7jMlpf3epTBIli4YeFnNpLG_cZ_i498WvOfVunmEaYNaC5XVrfvz")
				end);

			end)
		end
	end
end)

AddEventHandler("esx:SendBillFromServer", function(source, playerId, sharedAccountName, label, amount)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(playerId)
	amount        = ESX.Math.Round(amount)

	local society = ESX.DoesSocietyExist(sharedAccountName);

	if amount < 0 then
		print(('esx_billing: %s attempted to send a negative bill!'):format(xPlayer.identifier))
	elseif (not society) then

		if (xTarget) then
			MySQL.Async.execute('INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (@identifier, @sender, @target_type, @target, @label, @amount)',
				{
					['@identifier']  = xTarget.identifier,
					['@sender']      = xPlayer.identifier,
					['@target_type'] = 'player',
					['@target']      = xPlayer.identifier,
					['@label']       = label,
					['@amount']      = amount,
				}, function(rowsChanged)
					TriggerClientEvent('esx:showNotification', xTarget.source, "vous avez ~r~reçu~s~ une facture")
				end)
		end

	elseif (society) then

		if xTarget ~= nil then
			MySQL.Async.execute('INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (@identifier, @sender, @target_type, @target, @label, @amount)',
				{
					['@identifier']  = xTarget.identifier,
					['@sender']      = xPlayer.identifier,
					['@target_type'] = 'society',
					['@target']      = sharedAccountName,
					['@label']       = label,
					['@amount']      = amount,
				}, function(rowsChanged)
					TriggerClientEvent('esx:showNotification', xTarget.source, "vous avez ~r~reçu~s~ une facture")
				end)
		end

	end

end);

ESX.RegisterServerCallback('esx_billing:getBills', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local bills = {}
		for i=1, #result, 1 do
			table.insert(bills, {
				id         = result[i].id,
				identifier = result[i].identifier,
				sender     = result[i].sender,
				targetType = result[i].target_type,
				target     = result[i].target,
				label      = result[i].label,
				amount     = result[i].amount
			})
		end
		cb(bills)
	end)
end)

ESX.RegisterServerCallback('esx_billing:getTargetBills', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local bills = {}
		for i=1, #result, 1 do
			table.insert(bills, {
				id         = result[i].id,
				identifier = result[i].identifier,
				sender     = result[i].sender,
				targetType = result[i].target_type,
				target     = result[i].target,
				label      = result[i].label,
				amount     = result[i].amount
			})
		end
		cb(bills)
	end)
end)

ESX.RegisterServerCallback('esx_billing:payBill', function(source, cb, id)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE id = @id', {
		['@id'] = id
	}, function(result)

		local sender     = result[1].sender
		local targetType = result[1].target_type
		local target     = result[1].target
		local amount     = result[1].amount

		local xTarget = ESX.GetPlayerFromIdentifier(sender)

		if targetType == 'player' then

			if xTarget ~= nil then

				if xPlayer.getMoney() >= amount then

					MySQL.Async.execute('DELETE FROM billing WHERE id = @id', {
						['@id'] = id
					}, function()
						xPlayer.removeMoney(amount)
						xTarget.addAccountMoney('bank', amount)
						TriggerClientEvent('esx:showNotification', xPlayer.source, "vous avez ~g~payé~s~ une facture de ~r~"..ESX.Math.GroupDigits(amount))
						TriggerClientEvent('esx:showNotification', xTarget.source, "vous avez ~g~reçu~s~ un paiement de ~g~"..ESX.Math.GroupDigits(amount))

						cb()
					end)

				elseif xPlayer.getBank() >= amount then
					MySQL.Async.execute('DELETE FROM billing WHERE id = @id', {
						['@id'] = id
					}, function(rowsChanged)
						MySQL.Async.fetchAll('SELECT * FROM billing WHERE id = @id', {
							['@id'] = id
						}, function(result)
							if result[1].split == true then
								print('Society paid invoice with split')
								local percent = 0.05
								xPlayer.removeMoney('bank', amount)
								xTarget.addAccountMoney('bank', amount*(1-percent))
								local worker = ESX.GetPlayerFromIdentifier(result[1].sender)
								worker.addAccountMoney('bank', amount*percent)
							else
								xPlayer.removeAccountMoney('bank', amount)
								xTarget.addAccountMoney('bank', amount)
							end
						end)


						TriggerClientEvent('esx:showNotification', xPlayer.source, "vous avez ~g~payé~s~ une facture de ~r~"..ESX.Math.GroupDigits(amount))
						TriggerClientEvent('esx:showNotification', xTarget.source, "vous avez ~g~reçu~s~ un paiement de ~g~"..ESX.Math.GroupDigits(amount))

						cb()
					end)

				else
					TriggerClientEvent('esx:showNotification', xTarget.source, "La personne n'a pas assez d'argent sur son compte")
					TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'avez pas assez d'argent")

					cb()
				end

			else
				TriggerClientEvent('esx:showNotification', xPlayer.source, "La personne n'est pas en ville")
				cb()
			end

		else

			local society = ESX.DoesSocietyExist(target);

			if (society) then

				if xPlayer.getAccount('cash').money >= amount then
					MySQL.Async.execute('DELETE FROM billing WHERE id = @id', {
						['@id'] = id
					}, function(rowsChanged)
						MySQL.Async.fetchAll('SELECT * FROM billing WHERE id = @id', {
							['@id'] = id
						}, function(result)
							xPlayer.removeAccountMoney('cash', amount)
							ESX.AddSocietyMoney(target, amount);
						end)
						TriggerClientEvent('esx:showNotification', xPlayer.source, "vous avez ~g~payé~s~ une facture de ~r~"..ESX.Math.GroupDigits(amount))
						if xTarget ~= nil then
							TriggerClientEvent('esx:showNotification', xTarget.source, "vous avez ~g~reçu~s~ un paiement de ~g~"..ESX.Math.GroupDigits(amount))
						end

						cb()
					end)

				elseif xPlayer.getAccount('bank').money >= amount then
					MySQL.Async.execute('DELETE FROM billing WHERE id = @id', {
						['@id'] = id
					}, function(rowsChanged)
						MySQL.Async.fetchAll('SELECT * FROM billing WHERE id = @id', {
							['@id'] = id
						}, function(result)
							xPlayer.removeAccountMoney('bank', amount)
							ESX.AddSocietyMoney(target, amount);
						end)

						TriggerClientEvent('esx:showNotification', xPlayer.source, "vous avez ~g~payé~s~ une facture de ~r~"..ESX.Math.GroupDigits(amount))
						if xTarget ~= nil then
							TriggerClientEvent('esx:showNotification', xTarget.source, "vous avez ~g~reçu~s~ un paiement de ~g~"..ESX.Math.GroupDigits(amount))
						end

						cb()
					end)

				else
					TriggerClientEvent('esx:showNotification', xPlayer.source, "La personne n'a pas assez d'argent sur son compte")

					if xTarget ~= nil then
						TriggerClientEvent('esx:showNotification', xTarget.source, "Vous n'avez pas assez d'argent")
					end

					cb()
				end
			end

		end

	end)
end)

function dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end