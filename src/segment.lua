local name, addon = ...

local Segment = {}
local Segment_mt = { __index = Segment }

--- Constructor
-- @param text The text to display
-- @param icon An optional icon to show
-- @param name The name of this segment
function Segment:new(text, icon, name)
    local table = {}

    table.text = text;
    table.icon = icon;
    table.name = name;
    
    return setmetatable(table, Segment_mt)
end

addon.Segment = Segment