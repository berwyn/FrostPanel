local name, addon = ...

local FrostPanel = LibStub("AceAddon-3.0"):NewAddon("FrostPanel")

--- Ace initialization hook
function FrostPanel:OnInitialize()
    local frame = addon.Frame:new("Bar1", "TOPLEFT", 0, 0, 25)
end

--- Ace enable hook
function FrostPanel:OnEnable()
end

--- Ace disable hook
function FrostPanel:OnDisable()
end