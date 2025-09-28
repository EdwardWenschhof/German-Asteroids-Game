local AsteroidManager = require('asteroidmanager')
local Column = require('column')
local Interface = require('interface')

local Game = {}
Game.__index = Game

function Game:new(totalAsteroids)
    local game = setmetatable({}, self)

    game.asteroidManager = AsteroidManager:new(totalAsteroids)

    -- reevaluate
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


function Game:draw()
    self.interface:draw()
    self.asteroidManager:draw()

    -- delete/move to asteroidManager
    if self.numAsteroids >= 1 then
        for i=1,self.numAsteroids do
            self.asteroids[i]:draw()
        end
    end
end

function Game:update(dt)
    self.asteroidManager:update(dt)
end

function Game:textinput(t)
    self.interface:textinput(t)
end

return Game