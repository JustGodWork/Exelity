---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Dylan Malandain.
--- DateTime: 29/10/2019 02:40
---

---@class RageUIClothes
RageUIClothes = {}

---@class Item
RageUIClothes.Item = {}

---@class Panel
RageUIClothes.Panel = {}

---@class Window
RageUIClothes.Window = {}

---@class RMenuClothes
RMenuClothes = setmetatable({}, RMenuClothes)

---@type table
local TotalMenus = {}

---Add
---@param Type string
---@param Name string
---@param Menu table
---@return RMenuClothes
---@public
function RMenuClothes.Add(Type, Name, Menu)
    if RMenuClothes[Type] ~= nil then
        RMenuClothes[Type][Name] = {
            Menu = Menu
        }
    else
        RMenuClothes[Type] = {}
        RMenuClothes[Type][Name] = {
            Menu = Menu
        }
    end
    return table.insert(TotalMenus, Menu)
end

---Get
---@param Type string
---@param Name string
---@return table
---@public
function RMenuClothes:Get(Type, Name)
    if self[Type] ~= nil and self[Type][Name] ~= nil then
        return self[Type][Name].Menu
    end
end

---GetType
---@param Type string
---@return table
---@public
function RMenuClothes:GetType(Type)
    if self[Type] ~= nil then
        return self[Type]
    end
end

---Settings
---@param Type string
---@param Name string
---@param Settings string
---@param Value any optional
---@return void
---@public
function RMenuClothes:Settings(Type, Name, Settings, Value)
    if Value ~= nil then
        self[Type][Name][Settings] = Value
    else
        return self[Type][Name][Settings]
    end
end

---Delete
---@param Type string
---@param Name string
---@return void
---@public
function RMenuClothes:Delete(Type, Name)
    self[Type][Name] = nil
    collectgarbage()
end

---DeleteType
---@param Type string
---@return void
---@public
function RMenuClothes:DeleteType(Type)
    self[Type] = nil
    collectgarbage()
end
