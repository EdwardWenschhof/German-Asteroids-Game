local Asteroid = require('gameplay.asteroid')
local ColumnManager = require('gameplay.columnmanager')
local wordfile = require('wordfile')
local config = require('config')

local AsteroidManager = {}
AsteroidManager.__index = AsteroidManager

function AsteroidManager:new()
    local m = setmetatable({}, self)
    m.totalAsteroids = config.totalAsteroids
    m.width = config.width
    m.height = config.height - config.typeSpace
    m.asteroids = {}
    m.columns = ColumnManager:new()
    m:_fillUp()
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
    local speed = config.speeds[love.math.random(#config.speeds)]
    local prompt, answer = self:_choosePair()
    
    local a = Asteroid:new(speed, config.asteroidRadius, x, idx, prompt, answer)
    table.insert(self.asteroids, a)
end

function AsteroidManager:_destroyAt(i)
    local a = table.remove(self.asteroids, i)
    if a and a.columnIndex then
        self.columns:release(a.columnIndex)
    end
end

function AsteroidManager:_choosePair()
    local pair = wordfile.words[love.math.random(#wordfile.words)]
    return pair[config.prompt], pair[config.answer]
end

-- Iterate backwards to safely remove asteroids in place
function AsteroidManager:update(dt, text)
    for i = #self.asteroids, 1, -1 do
        local a = self.asteroids[i]
        a:update(dt)
        if a.currY > self.height - config.asteroidRadius or a.answer == text then
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