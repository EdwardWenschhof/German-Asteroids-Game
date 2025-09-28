local Asteroid = require('asteroid')
local ColumnManager = require('columnmanager')

local AsteroidManager = {}
AsteroidManager.__index = AsteroidManager

function AsteroidManager:new(totalAsteroids, width, height)
    local asteroidManager = setmetatable({}, self)

    asteroidManager.totalAsteroids = totalAsteroids
    asteroidManager.width = width
    asteroidManager.height = height

    asteroidManager.asteroids = {}
    asteroidManager.numAsteroids = 0
    asteroidManager.asteroidSpeeds = {50, 100, 200, 250, 275}

    asteroidManager.columnManager = ColumnManager:new(asteroidManager.width, asteroidManager.totalAsteroids)

    asteroidManager:createAsteroids()
    return asteroidManager
end

function AsteroidManager:createAsteroids()
    while self.numAsteroids < self.totalAsteroids do
        self:createNewAsteroid()
    end
end

function AsteroidManager:createNewAsteroid()
    -- choose random asteroid speed
    local speedChoice = love.math.random(#self.asteroidSpeeds)
    local speed = self.asteroidSpeeds[speedChoice]

    self.numAsteroids = self.numAsteroids + 1

    local center = self.columnManager:getFreeCenter()
    
    local a = Asteroid:new(self.numAsteroids, speed, self.radius, center)
    table.insert(self.asteroids, self.numAsteroids, a)
end

function AsteroidManager:destroyAsteroid(asteroid)
    if asteroid and asteroid.asteroidNumber then
        self.columnManager:freeColumn(asteroid.center)
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

function AsteroidManager:update(dt)
    for i=1,self.numAsteroids do
        local a = self.asteroids[i]
        if a then
            a:update(dt)
            if a.currY > (self.height - self.radius) - self.interface.typeSpace then
                self:destroyAsteroid(a)
            end
        end
    end
    self:createAsteroids()
end

return AsteroidManager