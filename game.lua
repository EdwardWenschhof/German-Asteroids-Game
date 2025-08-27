local Asteroid = require('asteroid')

local Game = {}
Game.__index = Game

function Game:new(totalAsteroids)
    local game = setmetatable({}, self)
    local w, h = love.graphics.getDimensions()
    
    game.numColumns = totalAsteroids + 5
    game.radius = (w / (game.numColumns)) / 2
    game.asteroids = {}
    game.numAsteroids = 0
    game.totalAsteroids = totalAsteroids
    game.asteroidSpeeds = {50, 100, 200, 250, 275}
    game:createAsteroids()

    game.height = h
    return game
end

function Game:createAsteroids()
    while self.numAsteroids < self.totalAsteroids do
        self:createNewAsteroid()
    end
end

function Game:createNewAsteroid()
    -- choose random asteroid speed
    local speedChoice = love.math.random(#self.asteroidSpeeds)
    local speed = self.asteroidSpeeds[speedChoice]

    self.numAsteroids = self.numAsteroids + 1
    local a = Asteroid:new(self.numAsteroids, speed, self.radius)
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
    self:createAsteroids()
end


return Game