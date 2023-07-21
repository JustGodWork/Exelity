--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

AvailableWeatherTypes = {
    'EXTRASUNNY', 
    'CLEAR', 
    'NEUTRAL', 
    'SMOG', 
    'FOGGY', 
    'OVERCAST', 
    'CLOUDS', 
    'CLEARING', 
    'RAIN', 
    'THUNDER', 
    'SNOW', 
    'BLIZZARD', 
    'SNOWLIGHT', 
    'XMAS', 
    'HALLOWEEN',
}

local CurrenWeather = nil
local BlackoutOver = false
local expiration = 0.5*60*60 -- 30 minutes
local baseTime = 0
local timeOffset = 0
local blackout = false
local wtf = os.time()+expiration

Citizen.CreateThread(function()
    SetRandomMeteo()
    while true do 
        Wait(10000)
        if wtf < os.time() then
            wtf = os.time() + expiration
            SetRandomMeteo()
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local newBaseTime = os.time(os.date("!*t"))/2 + 360
        if freezeTime then
            timeOffset = timeOffset + baseTime - newBaseTime			
        end
        baseTime = newBaseTime
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        TriggerClientEvent('sMeteo:UpdateTime', -1, baseTime, timeOffset, freezeTime)
    end
end)

function SetRandomMeteo()
    local Percentage = math.random(1,100)
    if Percentage <= 50 then
        value = 'EXTRASUNNY'
    elseif Percentage >= 55 and Percentage <= 58 then
        value = 'SMOG'
    elseif Percentage >= 58 and Percentage <= 61 then
        value = 'OVERCAST'
    elseif Percentage >= 61 and Percentage <= 64 then
        value = 'CLEAR'
    elseif Percentage >= 64 and Percentage <= 67 then
        value = 'CLOUDS'
    else
        value = 'EXTRASUNNY'
    end
    CurrenWeather = value
    TriggerClientEvent('Meteo:updateWeather', -1, CurrenWeather, blackout)
end

RegisterNetEvent('Meteo:RetrieveCurrentWeather')
AddEventHandler('Meteo:RetrieveCurrentWeather', function()
    TriggerClientEvent('Meteo:updateWeather', source, CurrenWeather, blackout)
end)

function ShiftToMinute(minute)
    timeOffset = timeOffset - ( ( (baseTime+timeOffset) % 60 ) - minute )
end

function ShiftToHour(hour)
    timeOffset = timeOffset - ( ( ((baseTime+timeOffset)/60) % 24 ) - hour ) * 60
end

function isAllowed(player)
    -- TODO : Make it
    return false
end

RegisterCommand('time', function(source, args, rawCommand)
    if source == 0 then
        if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
            local argh = tonumber(args[1])
            local argm = tonumber(args[2])
            if argh < 24 then
                ShiftToHour(argh)
            else
                ShiftToHour(0)
            end
            if argm < 60 then
                ShiftToMinute(argm)
            else
                ShiftToMinute(0)
            end
            local newtime = math.floor(((baseTime+timeOffset)/60)%24) .. ":"
            local minute = math.floor((baseTime+timeOffset)%60)
            if minute < 10 then
                newtime = newtime .. "0" .. minute
            else
                newtime = newtime .. minute
            end
            TriggerClientEvent('sMeteo:UpdateTime', -1, baseTime, timeOffset, freezeTime)
        else
        end
    elseif isAllowed(source) then
        if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
            local argh = tonumber(args[1])
            local argm = tonumber(args[2])
            if argh < 24 then
                ShiftToHour(argh)
            else
                ShiftToHour(0)
            end
            if argm < 60 then
                ShiftToMinute(argm)
            else
                ShiftToMinute(0)
            end
            local newtime = math.floor(((baseTime+timeOffset)/60)%24) .. ":"
            local minute = math.floor((baseTime+timeOffset)%60)
            if minute < 10 then
                newtime = newtime .. "0" .. minute
            else
                newtime = newtime .. minute
            end
            TriggerClientEvent('sMeteo:UpdateTime', -1, baseTime, timeOffset, freezeTime)
        end
    end
end)

RegisterCommand('blackout', function(source)
    if source == 0 then
        blackout = not blackout
        if blackout then
            --TriggerClientEvent('vSync:notify', source, 'Blackout is now ~p~enabled~s~.')
        else
            --TriggerClientEvent('vSync:notify', source, 'Blackout is now ~r~disabled~s~.')
        end
        local newtime = math.floor(((baseTime+timeOffset)/60)%24) .. ":"
        local minute = math.floor((baseTime+timeOffset)%60)
        if minute < 10 then
            newtime = newtime .. "0" .. minute
        else
            newtime = newtime .. minute
        end
        CurrenWeather = CurrenWeather
        TriggerClientEvent('Meteo:updateWeather', -1, CurrenWeather, blackout)
    end
end)

RegisterCommand('weather', function(source, args)
    if source == 0 then
        local validWeatherType = false
        if args[1] == nil then
            print("Invalid syntax, correct syntax is: /weather <weathertype> ")
            return
        else
            for i,wtype in ipairs(AvailableWeatherTypes) do
                if wtype == string.upper(args[1]) then
                    validWeatherType = true
                end
            end
            if validWeatherType then
                print("Weather has been updated.")
                CurrenWeather = string.upper(args[1])
                TriggerClientEvent('Meteo:updateWeather', -1, CurrenWeather, blackout)
            else
                print("Invalid weather type, valid weather types are: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ")
            end
        end
    else
        if isAllowed(source) then
            local validWeatherType = false
            if args[1] == nil then
                TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1Invalid syntax, use ^0/weather <weatherType> ^1instead!')
            else
                for i,wtype in ipairs(AvailableWeatherTypes) do
                    if wtype == string.upper(args[1]) then
                        validWeatherType = true
                    end
                end
                if validWeatherType then
                    --TriggerClientEvent('vSync:notify', source, 'Weather will change to: ~y~' .. string.lower(args[1]) .. "~s~.")
                    CurrenWeather = string.upper(args[1])
                    TriggerClientEvent('Meteo:updateWeather', -1, CurrenWeather, blackout)
                else
                    TriggerClientEvent('chatMessage', source, '', {255,255,255}, '^8Error: ^1Invalid weather type, valid weather types are: ^0\nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ')
                end
            end
        else
        end
    end
end, false)