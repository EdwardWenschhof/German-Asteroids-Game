local Interface = {}
Interface.__index = Interface

function Interface:new(w, h)
    local interface = setmetatable({}, self)
    interface.width = w
    interface.height = h
    interface.typeSpace = (1/8) * h
    interface.boxText = ""
    return interface
end

function Interface:drawBoard()
    love.graphics.setColor(1, 1, 1)
    local font = love.graphics.newFont(30)
    local textWidth = font:getWidth(self.boxText)

    love.graphics.line(0, self.height - self.typeSpace, self.width, self.height - self.typeSpace)
    love.graphics.line((1/3) * self.width, self.height, (1/3) * self.width, self.height - self.typeSpace)
    love.graphics.line((2/3) * self.width, self.height, (2/3) * self.width, self.height - self.typeSpace)
    love.graphics.print(self.boxText, font, math.floor(self.width / 2), math.floor(self.height - (self.typeSpace) / 2), 0, 1, 1, textWidth / 2)
    love.graphics.setColor(0, 0, 0)
end

function Interface:textinput(t)
    self.boxText = self.boxText .. t
end

return Interface