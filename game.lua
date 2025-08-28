local Asteroid = require('asteroid')
local Column = require('column')
local Interface = require('interface')

local Game = {}
Game.__index = Game

function Game:new(totalAsteroids)
    local game = setmetatable({}, self)

    local w, h = love.graphics.getDimensions()
    game.height = h
    game.width = w

    game.asteroids = {}
    game.cols = {}
    game.interface = Interface:new(w, h)

    game.numColumns = totalAsteroids + 5
    game.radius = (w / (game.numColumns)) / 2
    game.numAsteroids = 0
    game.totalAsteroids = totalAsteroids
    game.asteroidSpeeds = {50, 100, 200, 250, 275}

    game:createColumns(w)
    game:createAsteroids()

    return game
end

function Game:createColumns(w)
    local rad = self.radius
    local colsCreated = 0

    local currCenter = rad

    while currCenter + rad <= w do
        colsCreated = colsCreated + 1
        local currCol = Column:new(currCenter, rad)
        table.insert(self.cols, colsCreated, currCol)
        currCenter = currCenter + (rad * 2)
    end
end

function Game:createAsteroids()
    while self.numAsteroids < self.totalAsteroids do
        self:createNewAsteroid()
    end
end

function Game:chooseColumn()
    local colNum = love.math.random(#self.cols)
    local col = self.cols[colNum]
    repeat
        colNum = love.math.random(#self.cols)
        col = self.cols[colNum]
    until not col.occupied

    col.occupied = true
    return col
end

function Game:createNewAsteroid()
    -- choose random asteroid speed
    local speedChoice = love.math.random(#self.asteroidSpeeds)
    local speed = self.asteroidSpeeds[speedChoice]

    self.numAsteroids = self.numAsteroids + 1

    local col = self:chooseColumn()
    
    local a = Asteroid:new(self.numAsteroids, speed, self.radius, col.center)
    a.column = col
    table.insert(self.asteroids, self.numAsteroids, a)
end

function Game:destroyAsteroid(asteroid)
    if asteroid and asteroid.asteroidNumber then
        if asteroid.column then
            asteroid.column.occupied = false
        end
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
    self.interface:drawBoard()
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
            if a.currY > (self.height - self.radius) - self.interface.typeSpace then
                self:destroyAsteroid(a)
            end
        end
    end
    self:createAsteroids()
end

function Game:keypressed(key)
    self.interface:keypressed(key)
end

function Game:textinput(t)
    self.interface:textinput(t)
end

return Game