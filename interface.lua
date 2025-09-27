local EntryBox = require('gui.entrybox')

local Interface = {}
Interface.__index = Interface

function Interface:new(w, h)
    local interface = setmetatable({}, self)
    interface.width = w
    interface.height = h
    interface.typeSpace = (1/8) * h
    interface.entryBox = EntryBox:new(w, h, h * (7/8))
    return interface
end

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