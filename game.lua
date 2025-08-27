local Asteroid = require('asteroid')

local Game = {}
Game.__index = Game

function Game:new()
    local game = setmetatable({}, self)
    self.asteroids = {}
    self.numAsteroids = 0
    self.asteroidSpeeds = {50, 75, 100}
    local w, h = love.graphics.getDimensions()
    self.height = h
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

function Game:draw()
    if self.numAsteroids >= 1 then
        for i=1,self.numAsteroids do
            self.asteroids[i]:draw()
        end
    end
end

function Game:update(dt)
        if self.numAsteroids >= 1 then
        for i=1,self.numAsteroids do
            self.asteroids[i]:update(dt)
            if self.asteroids[i].currY > self.height then
                self:destroyAsteroid(self.asteroids[i])
            end
        end
    end
end

return Game