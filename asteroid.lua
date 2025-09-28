local Asteroid = {}
Asteroid.__index = Asteroid

function Asteroid:new(asteroidNumber, speed, radius, center)
    local asteroid = setmetatable({}, self)
    local w, h = love.graphics.getDimensions()

    asteroid.asteroidNumber = asteroidNumber
    asteroid.speed = speed

    -- for now while using circles
    asteroid.w = w
    asteroid.h = h
    asteroid.radius = radius
    asteroid.center = center
    asteroid.currY = 0

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