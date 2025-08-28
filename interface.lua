local Interface = {}
Interface.__index = Interface

function Interface:new()
    local interface = setmetatable({}, self)
    return interface
end

return Interface