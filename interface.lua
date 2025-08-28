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
    love.graphics.line(0, self.height - self.typeSpace, self.width, self.height - self.typeSpace)
    love.graphics.line((1/3) * self.width, self.height, (1/3) * self.width, self.height - self.typeSpace)
    love.graphics.line((2/3) * self.width, self.height, (2/3) * self.width, self.height - self.typeSpace)
    love.graphics.print(self.boxText, math.floor((1/3) * self.width), math.floor(self.height - (self.typeSpace) / 2))
    love.graphics.setColor(0, 0, 0)
end

function Interface:textinput(t)
    self.boxText = self.boxText .. t
end

return Interface