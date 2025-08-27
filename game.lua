local Game = {}
Game.__index = Game

function Game:new()
    local game = setmetatable({}, self)
    return game
end

return Game