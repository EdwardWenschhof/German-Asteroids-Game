local InputManager = {}
InputManager.__index = InputManager

function InputManager:new()
    local m = setmetatable({}, self)
    return m
end

return InputManager