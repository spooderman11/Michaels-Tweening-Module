--// Services
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

--// Module stack
local module = {}

--// Module functions

--// Function: module:Tween
function module:Tween(type, infotable)
    type = type or "Smooth"
    infotable = infotable or {}
    infotable.Object = infotable.Object or nil
    infotable.Time = infotable.Time or 1
    infotable.Properties = infotable.Properties or {}

    if type == "Smooth" then --// special kind of smooth tweening
        local tifo = TweenInfo.new(infotable.Time, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        local Tween = TweenService:Create(infotable.Object, tifo, infotable.Properties):Play()
    elseif type == "Linear" then --// Linear tweening is the default tweening type, so we can include it here
        local ttifo = TweenInfo.new(infotable.Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        local Tween = TweenService:Create(infotable.Object, ttifo, infotable.Properties):Play()
    end
end

function module:CustomTwee(ifoTable)
    ifoTable = ifoTable or {}
    ifoTable.Object = ifoTable.Object or nil
    ifoTable.Properties = ifoTable.Properties or {}
    --// Tweening Info
    local TweenInfo = TweenInfo.new(ifoTable.Time, ifoTable.EasingStyle, ifoTable.EasingDirection)
    local Tween = TweenService:Create(ifoTable.Object, TweenInfo, ifoTable.Properties):Play()
end

--// return the module
return module

