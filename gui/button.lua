local config = require('config')

local Button = {}
Button.__index = Button

function Button:new(text, x, y, w, h, onClick)
    local b = setmetatable({}, self)
    b.text = text
    b.x = x
    b.y = y
    b.w = w
    b.h = h
    b.onClick = onClick
    return b
end

function Button:update(mx, my)
    self.hovered = mx >= self.x and mx <= self.x + self.w and my >= self.y and my <= self.y + self.h
end

function Button:draw()
    if self.hovered then
        love.graphics.setColor(0.8, 0.8, 0.8)
    else
        love.graphics.setColor(0.6, 0.6, 0.6)
    end
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h, 8, 8)

    -- text
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(config.entryFont)
    love.graphics.printf(self.text, self.x, self.y + self.h/4, self.w, "center")

    love.graphics.setColor(1, 1, 1)
end

function Button:mousepressed(mx, my, button)
    if button == 1 and self.hovered and self.onClick then
        self.onClick()
    end
end

return Button