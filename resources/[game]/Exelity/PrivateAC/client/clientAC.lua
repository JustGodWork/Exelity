ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(500)
	end
	ESX.TriggerServerCallback('screenshot:getwebhook', function(aaa)
        WebHook = aaa
    end)
end)

RegisterNetEvent("Fowlmas:GetScreen")
AddEventHandler("Fowlmas:GetScreen", function()
    exports['screenshot-basic']:requestScreenshotUpload(WebHook, "files[]", function(data)
    end)
end)