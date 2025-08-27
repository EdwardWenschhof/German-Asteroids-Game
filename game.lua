local Asteroid = require('asteroid')

local Game = {}
Game.__index = Game

function Game:new()
    local game = setmetatable({}, self)
    self.asteroids = {}
    self.numAsteroids = 0
    self.asteroidSpeeds = {50, 75, 100}
    return game
end

function Game:createNewAsteroid()
    -- choose random asteroid speed
    local speedChoice = love.math.random(1, 3)
    local speed = self.asteroidSpeeds[speedChoice]

    self.numAsteroids = self.numAsteroids + 1
    local a = Asteroid:new(self.numAsteroids, speed)
    table.insert(self.asteroids, self.numAsteroids, a)
end

function Game:destroyAsteroid(asteroid)
    table.remove(asteroid.asteroidNumber)
end

return Game