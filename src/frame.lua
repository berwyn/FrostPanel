local name, addon = ...

local Frame = {}
local Frame_mt = { __index = Frame }

--- Constructor
-- @param anchor Where to anchor the frame on screen
-- @param x Horizontal offset to use from the anchor
-- @param y Vertical offset to use from the anchor
-- @param height Height of the created frame
function Frame:new(name, anchor, x, y, height)
    local table = {}

    local view = CreateFrame("Frame", "FrostPanel"..name, UIParent)
    view:SetPoint(anchor, x, y)
    view:SetHeight(height)

    local tex = view:CreateTexture("FrostPanel"..name.."Background", "BACKGROUND")
    tex:SetAllPoints(view)
    tex:SetColorTexture(0, 0, 0, .8)
    tex:SetShown(true)

    table.view = view
    table.segments = {}

    return setmetatable(table, Frame_mt)
end

--- Adds a segment to the frame
-- @param segment A segment to add to the frame
function Frame:addSegment(segment)
    local len = #self.segments
    self.segments[len] = segment

    self:calculateWidth()
end

--- Removes a segment from display
-- @param segment The segment to remove
function Frame:removeSegment(segment)
    for i = #self.segments, 1, -1 do
        if self.segments[i].name == segment.name then
            table.remove(self.segments, i)
        end
    end
end

function Frame:calculateWidth()
    local width = 0
    for i = #self.segments, 1, -1 do
        width += self.segments[i].view:GetWidth()
    end
    self.view:SetWidth(width)
end

addon.Frame = Frame