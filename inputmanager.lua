local config = require('config')

local InputManager = {}
InputManager.__index = InputManager

function InputManager:new()
    local m = setmetatable({}, self)
    self.text = ""
    return m
end

function InputManager:textinput(t)
    local newText = self.text .. t
    local textWidth = love.graphics.getFont():getWidth(newText)
    if textWidth <= (1/3) * config.width then
        self.text = newText
    end
end

function InputManager:keypressed(key)
    if key == "backspace" then
        self.text = string.sub(self.text, 1, -2)
    elseif key == "return" then

    end
end

return InputManager