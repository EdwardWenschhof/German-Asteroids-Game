local config = require('config')

local EntryBox = {}
EntryBox.__index = EntryBox

function EntryBox:new(startY)
    local entryBox = setmetatable({}, self)
    entryBox.width = config.width
    entryBox.height = config.height
    entryBox.startY = startY
    return entryBox
end

function EntryBox:drawLines()
    love.graphics.setColor(1, 1, 1)

    love.graphics.line((1/3) * self.width, self.height, (1/3) * self.width, self.startY)
    love.graphics.line((2/3) * self.width, self.height, (2/3) * self.width, self.startY)

    love.graphics.setColor(0, 0, 0)
end

function EntryBox:drawText(text)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(config.entryFont)
    local textY = self.height - ((self.height - self.startY) / 2)
    love.graphics.printf(text, math.floor((1/3) * self.width), textY, self.width * (1/3), "center")
    love.graphics.setColor(0, 0, 0)
end

function EntryBox:draw(text)
    self:drawLines()
    self:drawText(text)
end

return EntryBox