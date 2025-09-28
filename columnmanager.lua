local config = require('config')

local ColumnManager = {}
ColumnManager.__index = ColumnManager

function ColumnManager:new()
    local m = setmetatable({}, self)
    m.width = config.width
    m.numColumns = config.numColumns
    m.radius = config.asteroidRadius
    m.centers = {}
    m.occupied = {}
    m:_create()
    return m
end

function ColumnManager:_create()
    local r = self.radius
    local x = r
    while x + r <= self.width do
        table.insert(self.centers, x)
        table.insert(self.occupied, false)
        x = x + (r * 2)
    end
end

function ColumnManager:hasFree()
    for i = 1, #self.occupied do
        if not self.occupied[i] then return true end
    end
    return false
end

function ColumnManager:acquire()
    if not self:hasFree() then return nil end
    local i
    repeat
        i = love.math.random(#self.centers)
    until not self.occupied[i]
    self.occupied[i] = true
    return i
end

function ColumnManager:center(i)
    return self.centers[i]
end

function ColumnManager:release(i)
    if i and self.occupied[i] ~= nil then
        self.occupied[i] = false
    end
end

return ColumnManager