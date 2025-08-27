local Asteroid = require('asteroid')

local Game = {}
Game.__index = Game

function Game:new()
    local game = setmetatable({}, self)
    self.asteroids = {}
    self.numAsteroids = 0
    self.asteroidSpeed = 50
    return game
end

function Game:createNewAsteroid()
    self.numAsteroids = self.numAsteroids + 1
    local a = Asteroid:new(self.numAsteroids)
    table.insert(self.asteroids, self.numAsteroids, a)
end

function Game:destroyAsteroid(asteroid)
    table.remove(asteroid.asteroidNumber)
end

return Game