local config = require('config')

local Asteroid = {}
Asteroid.__index = Asteroid

function Asteroid:new(speed, radius, center, columnIndex, word)
    local asteroid = setmetatable({}, self)

    asteroid.columnIndex = columnIndex
    asteroid.speed = speed

    -- for now while using circles
    asteroid.w = config.width
    asteroid.h = config.height
    asteroid.radius = radius
    asteroid.center = center
    asteroid.currY = 0
    asteroid.word = word

    return asteroid
end

-- might replace later with sprite
function Asteroid:draw()
    love.graphics.setColor(.64, .64, .64)
    love.graphics.circle('fill', self.center, self.currY, self.radius)
    love.graphics.setColor(0, 0, 0)
end

function Asteroid:update(dt)
    self.currY = self.currY + (self.speed * dt)
end

return Asteroid