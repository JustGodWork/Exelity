ExelityClientUtils = {}

ExelityClientUtils.toServer = function(eventName, ...)
    TriggerServerEvent("Exelity:" .. Exelity.hash(eventName), ...)
end