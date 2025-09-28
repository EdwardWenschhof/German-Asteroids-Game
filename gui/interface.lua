local EntryBox = require('gui.entrybox')
local GameBoard = require('gui.gameboard')

local config = require('config')

local Interface = {}
Interface.__index = Interface

function Interface:new()
    local i = setmetatable({}, self)
    i.width = config.width
    i.height = config.height
    i.entryBox = EntryBox:new(config.boardHeight)
    i.gameBoard = GameBoard:new(config.boardHeight)
    return i
end

function Interface:draw()
    self.entryBox:draw()
    self.gameBoard:draw()
end

function Interface:textinput(t)
    self.entryBox:textinput(t)
end

return Interface