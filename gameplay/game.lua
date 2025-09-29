local AsteroidManager = require('gameplay.asteroidmanager')
local Interface = require('gui.interface')
local config = require('config')

local Game = {}
Game.__index = Game

function Game:new()
    local game = setmetatable({}, self)
    self.text = ""
    game.asteroidManager = AsteroidManager:new()
    game.interface = Interface:new()

    return game
end

function Game:draw()
    self.interface:draw(self.text)
    self.asteroidManager:draw()
end

function Game:update(dt)
    self.asteroidManager:update(dt)
end

function Game:textinput(t)
    local newText = self.text .. t
    local textWidth = love.graphics.getFont():getWidth(newText)
    if textWidth <= (1/3) * config.width then
        self.text = newText
    end
end

return Game