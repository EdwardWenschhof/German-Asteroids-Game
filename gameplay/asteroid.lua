local config = require('config')

local Asteroid = {}
Asteroid.__index = Asteroid

function Asteroid:new(speed, radius, center, columnIndex, prompt, answer)
    local asteroid = setmetatable({}, self)

    asteroid.columnIndex = columnIndex
    asteroid.speed = speed

    -- for now while using circles
    asteroid.w = config.width
    asteroid.h = config.height
    asteroid.radius = radius
    asteroid.center = center
    asteroid.currY = 0
    asteroid.prompt = prompt
    asteroid.answer = answer

    return asteroid
end

-- might replace later with sprite
function Asteroid:draw()
    love.graphics.setFont(config.entryFont)
    love.graphics.setColor(.64, .64, .64)
    love.graphics.circle('fill', self.center, self.currY, self.radius)
    local textHeight = config.entryFont:getHeight()

    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(
        self.prompt,
        self.center - self.radius,          -- x: left edge of the box
        self.currY - textHeight / 2,        -- y: vertically centered
        self.radius * 2,                    -- width: diameter of circle
        "center"
    )
    love.graphics.setColor(0, 0, 0)
end

function Asteroid:update(dt)
    self.currY = self.currY + (self.speed * dt)
end

return Asteroid