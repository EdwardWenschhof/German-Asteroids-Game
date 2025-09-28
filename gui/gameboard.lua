local config = require('config')

local GameBoard = {}
GameBoard.__index = GameBoard

function GameBoard:new(endY)
    local g = setmetatable({}, self)
    g.width = config.width
    g.height = config.height
    g.endY = endY
    return g
end

function GameBoard:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.line(0, self.endY, self.width, self.endY)
    love.graphics.setColor(0, 0, 0)
end

return GameBoard