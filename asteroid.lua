local Asteroid = {}
Asteroid.__index = Asteroid

function Asteroid:new(asteroidNumber, speed)
    local asteroid = setmetatable({}, self)
    local w, h = love.graphics.getDimensions()

    asteroid.asteroidNumber = asteroidNumber
    asteroid.speed = speed

    asteroid.w = w
    asteroid.h = h
    asteroid.radius = asteroid.w * .04
    asteroid.startX = asteroid:getStartingPos()
    asteroid.currY = 0

    return asteroid
end

-- might replace later with sprite
function Asteroid:draw()
    love.graphics.setColor(.64, .64, .64)
    love.graphics.circle('fill', self.startX, self.currY, self.radius)
    love.graphics.setColor(0, 0, 0)
end

function Asteroid:update(dt)
    self.currY = self.currY + (self.speed * dt)
end

function Asteroid:getStartingPos()
    local startW = love.math.random(0 + self.radius, self.w - self.radius)
    return startW
end

return Asteroid