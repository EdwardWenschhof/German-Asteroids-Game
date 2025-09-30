local AsteroidManager = require('gameplay.asteroidmanager')
local Interface = require('gui.interface')
local inputmanager = require('inputmanager')

local Game = {}
Game.__index = Game

function Game:new()
    local game = setmetatable({}, self)
    game.asteroidManager = AsteroidManager:new()
    game.interface = Interface:new()
    return game
end

function Game:draw()
    self.interface:draw(inputmanager.text)
    self.asteroidManager:draw()
end

function Game:update(dt)
    self.asteroidManager:update(dt)
end

function Game:textinput(t)
    inputmanager:textinput(t)
end

function Game:keypressed(key)
    local o = inputmanager:keypressed(key)
    if o ~= nil then
        self.asteroidManager:update(0, o)
    end
end

return Game