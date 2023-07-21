Exelity = {}
Exelity.newThread = Citizen.CreateThread
Exelity.newWaitingThread = Citizen.SetTimeout
--Citizen.CreateThread, CreateThread, Citizen.SetTimeout, SetTimeout, InvokeNative = nil, nil, nil, nil, nil

Job = nil
Jobs = {}
Jobs.list = {}

ExelityPrefixes = {
    zones = "^1ZONE",
    err = "^1ERREUR",
    blips = "^1BLIPS",
    npcs = "^1NPCS",
    dev = "^6INFOS",
    sync = "^6SYNC",
    jobs = "^6JOBS",
    succes = "^2SUCCÈS"
}

Exelity.hash = function(notHashedModel)
    return GetHashKey(notHashedModel)
end

Exelity.prefix = function(title, message)
    return ("[^5Exelity^0] (%s^0) %s" .. "^0"):format(title, message)
end

local registredEvents = {}
local function isEventRegistred(eventName)
    for k,v in pairs(registredEvents) do
        if v == eventName then return true end
    end
    return false
end

Exelity.netRegisterAndHandle = function(eventName, handler)
    print('REGISTER DE l\'EVENT '..eventName)
    local event = "Exelity:" .. Exelity.hash(eventName)
    if not isEventRegistred(event) then
        RegisterNetEvent(event)
        table.insert(registredEvents, event)
    end
    AddEventHandler(event, handler)
end


Exelity.netRegister = function(eventName)
    local event = "Exelity:" .. Exelity.hash(eventName)
    RegisterNetEvent(event)
end


Exelity.netHandle = function(eventName, handler)
    local event = "Exelity:" .. Exelity.hash(eventName)
    AddEventHandler(event, handler)
end


Exelity.netHandleBasic = function(eventName, handler)
    AddEventHandler(eventName, handler)
end

Exelity.second = function(from)
    return from*1000
end

Exelity.toInternal = function(eventName, ...)
    TriggerEvent("Exelity:" .. Exelity.hash(eventName), ...)
end