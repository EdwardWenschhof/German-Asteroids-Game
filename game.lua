local Asteroid = require('asteroid')

local Game = {}
Game.__index = Game

function Game:new()
    local game = setmetatable({}, self)
    self.asteroids = {}
    self.numAsteroids = 0
    return game
end

function Game:createNewAsteroid()
    self.numAsteroids = self.numAsteroids + 1
    local a = Asteroid:new()
    table.insert(self.asteroids, self.numAsteroids, a)
end

return Game