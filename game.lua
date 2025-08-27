local Asteroid = require('asteroid')

local Game = {}
Game.__index = Game

function Game:new()
    local game = setmetatable({}, self)
    game.asteroids = {}
    game.numAsteroids = 0
    game.asteroidSpeeds = {50, 100, 200, 250, 275}
    local w, h = love.graphics.getDimensions()
    game.height = h
    return game
end

function Game:createNewAsteroid()
    -- choose random asteroid speed
    local speedChoice = love.math.random(#self.asteroidSpeeds)
    local speed = self.asteroidSpeeds[speedChoice]

    self.numAsteroids = self.numAsteroids + 1
    local a = Asteroid:new(self.numAsteroids, speed)
    table.insert(self.asteroids, self.numAsteroids, a)
end

function Game:destroyAsteroid(asteroid)
    if asteroid and asteroid.asteroidNumber then
        table.remove(self.asteroids, asteroid.asteroidNumber)
        self.numAsteroids = math.max(0, self.numAsteroids - 1)
        -- reindex remaining asteroids so they start at 1
        for i = 1, self.numAsteroids do
            if self.asteroids[i] then
                self.asteroids[i].asteroidNumber = i
            end
        end
    end
end

function Game:draw()
    if self.numAsteroids >= 1 then
        for i=1,self.numAsteroids do
            self.asteroids[i]:draw()
        end
    end
end

function Game:update(dt)
    for i=1,self.numAsteroids do
        local a = self.asteroids[i]
        if a then
            a:update(dt)
            if a.currY > self.height then
                self:destroyAsteroid(a)
            end
        end

    end
end


return Game