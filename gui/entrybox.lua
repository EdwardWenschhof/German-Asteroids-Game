local config = require('config')

local EntryBox = {}
EntryBox.__index = EntryBox

function EntryBox:new(startY)
    local entryBox = setmetatable({}, self)
    entryBox.text = ""
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

function EntryBox:drawText()
    love.graphics.setColor(1, 1, 1)
    local textY = self.height - ((self.height - self.startY) / 2)
    love.graphics.printf(self.text, math.floor((1/3) * self.width), textY, self.width * (1/3), "center")
    love.graphics.setColor(0, 0, 0)
end

function EntryBox:draw()
    self:drawLines()
    self:drawText()
end

function EntryBox:textinput(t)
    local newText = self.text .. t
    local textWidth = love.graphics.getFont():getWidth(newText)
    if textWidth <= (1/3) * self.width then
        self.text = newText
    end
end

return EntryBox