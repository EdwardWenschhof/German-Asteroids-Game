local GameBoard = {}
GameBoard.__index = GameBoard

function GameBoard:new(w, h, endY)
    local gameBoard = setmetatable({}, self)
    gameBoard.width = w
    gameBoard.height = h
    gameBoard.endY = endY
    return gameBoard
end

function GameBoard:draw()
    love.graphics.setColor(1, 1, 1)

    love.graphics.line(0, self.endY, self.width, self.endY)

    love.graphics.setColor(0, 0, 0)
end

return GameBoard