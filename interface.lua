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
    love.graphics.printf(self.boxText, math.floor((1/3) * self.width), math.floor(self.height - (self.typeSpace) / 2), self.width * (1/3), "center")
    love.graphics.setColor(0, 0, 0)
end

function Interface:textinput(t)
    local newText = self.boxText .. t
    local textWidth = love.graphics.getFont():getWidth(newText)
    if textWidth <= (1/3) * self.width then
        self.boxText = newText
    end
end

return Interface