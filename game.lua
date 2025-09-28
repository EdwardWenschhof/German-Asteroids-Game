local AsteroidManager = require('asteroidmanager')
local Interface = require('interface')

local Game = {}
Game.__index = Game

function Game:new()
    local game = setmetatable({}, self)
    
    game.asteroidManager = AsteroidManager:new()
    game.interface = Interface:new()

    return game
end

function Game:draw()
    self.interface:draw()
    self.asteroidManager:draw()
end

function Game:update(dt)
    self.asteroidManager:update(dt)
end

function Game:textinput(t)
    self.interface:textinput(t)
end

return Game