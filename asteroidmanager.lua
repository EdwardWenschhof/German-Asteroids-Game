local Asteroid = require('asteroid')
local ColumnManager = require('columnmanager')
local config = require('config')

local AsteroidManager = {}
AsteroidManager.__index = AsteroidManager

function AsteroidManager:new()
    local m = setmetatable({}, self)
    m.totalAsteroids = config.totalAsteroids
    m.width = config.width
    m.height = config.height
    m.speeds = config.speeds
    m.asteroids = {}
    m.columns = ColumnManager:new()
    m:createAsteroids()
    return m
end

function AsteroidManager:_fillUp()
    -- spawn until we reach target or run out of free columns
    while #self.asteroids < self.totalAsteroids and self.columns:hasFree() do
        self:_spawnOne()
    end
end

function AsteroidManager:_spawnOne()
    local idx = self.columns:acquire()
    if not idx then return end

    local x = self.columns:center(idx)
    local speed = self.speeds[love.math.random(#self.speeds)]

    local a = Asteroid:new(speed, self.radius, x, idx)
    table.insert(self.asteroids, a)
end

function AsteroidManager:_destroyAt(i)
    local a = table.remove(self.asteroids, i)
    if a and a.columnIndex then
        self.columns:release(a.columnIndex)
    end
end

function AsteroidManager:update(dt)
    for i = #self.asteroids, 1, -1 do
        local a = self.asteroids[i]
        a:update(dt)
        if a.currY > (self.height - self.radius) - self.typeSpace then
            self:_destroyAt(i)
        end
    end
    self:_fillUp()
end

function AsteroidManager:draw()
    for _, a in ipairs(self.asteroids) do
        a:draw()
    end
end

return AsteroidManager