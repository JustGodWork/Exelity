--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

local lang = Languages[dmeC.language]

local function onMeCommand(source, args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source) 
    local text = "* " .. lang.prefix .. table.concat(args, " ") .. " *"
    if (string.find(text, "<img src")) then
      xPlayer.ban(0, 'Use /me usebug LOL');
      return
    end
    TriggerClientEvent('3dme:shareDisplay', -1, text, source)
end

local function onMeCommand2(source, args)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local text = "* " .. lang.prefix .. ""..args .. " *"
    if (string.find(text, "<img src")) then
      xPlayer.ban(0, 'Use /me usebug LOL');
      return
    end
    TriggerClientEvent('3dme:shareDisplay', -1, text, source)
end

RegisterCommand(lang.commandName, onMeCommand)