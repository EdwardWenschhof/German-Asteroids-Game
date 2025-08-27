local Asteroid = {}
Asteroid.__index = Asteroid

function Asteroid:new()
    local asteroid = setmetatable({}, self)
    -- asteroid.word = word
    asteroid.startX = self:getStartingPos()
    asteroid.currY = 0
    return asteroid
end

-- might replace later with sprite
function Asteroid:draw()
    love.graphics.setColor(.64, .64, .64)
    love.graphics.circle('fill', self.startX, self.currY, 50)
    love.graphics.setColor(0, 0, 0)
end

function Asteroid:update(dt, speed)
    self.currY = self.currY + (speed * dt)
end

function Asteroid:getStartingPos()
    local w, h = love.graphics.getDimensions()
    local startW = love.math.random(0, w)
    return startW
end

return Asteroid