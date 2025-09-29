local StartScreen = {}
StartScreen.__index = StartScreen

function StartScreen:new()
    local s = setmetatable({}, self)
    return s
end

return StartScreen