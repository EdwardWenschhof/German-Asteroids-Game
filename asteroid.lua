Asteroid = {}
Asteroid.__index = Asteroid

function Asteroid:new(word)
    local asteroid = setmetatable({}, self)
    asteroid.word = word
    return asteroid
end

-- might replace later with sprite
function Asteroid:draw()
    local width, height = love.graphics.getDimensions()
    love.graphics.setColor(220, 220, 220)
    love.graphics.circle('fill', width/2, 0, 50)
end