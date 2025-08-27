local Column = {}
Column.__index = Column

function Column:new(center, radius)
    local column = setmetatable({}, self)
    column.center = center
    column.radius = radius
    column.occupied = false
    return column
end

return Column