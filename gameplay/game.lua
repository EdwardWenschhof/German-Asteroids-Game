local AsteroidManager = require('gameplay.asteroidmanager')
local Interface = require('gui.interface')
local InputManager = require('inputmanager')

local Game = {}
Game.__index = Game

function Game:new()
    local game = setmetatable({}, self)
    game.asteroidManager = AsteroidManager:new()
    game.interface = Interface:new()
    game.inputManager = InputManager:new()
    return game
end

function Game:draw()
    self.interface:draw(self.inputManager.text)
    self.asteroidManager:draw()
end

function Game:update(dt)
    self.asteroidManager:update(dt)
end

function Game:textinput(t)
    self.inputManager:textinput(t)
end

function Game:keypressed(key)
    local o = self.inputManager:keypressed(key)
    if o ~= nil then
        
    end
end

return Game