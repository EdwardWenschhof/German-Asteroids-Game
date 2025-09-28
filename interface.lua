local EntryBox = require('gui.entrybox')
local config = require('config')

local Interface = {}
Interface.__index = Interface

function Interface:new()
    local i = setmetatable({}, self)
    i.width = config.width
    i.height = config.height
    i.typeSpace = config.typeSpace
    i.entryBox = EntryBox:new(i.height * (7/8))
    return i
end

function Interface:draw()
    self:drawBoard()
end

-- move this function to GameBoard
function Interface:drawBoard()
    love.graphics.setColor(1, 1, 1)
    love.graphics.line(0, self.height - self.typeSpace, self.width, self.height - self.typeSpace)
    self.entryBox:drawText()
    self.entryBox:drawLines()
    love.graphics.setColor(0, 0, 0)
end

function Interface:textinput(t)
    self.entryBox:textinput(t)
end

return Interface