local Column = {}
Column.__index = Column

function Column:new(center, radius)
    local column = setmetatable({}, self)
    column.center = center
    column.radius = radius
    column.leftExtent = center - radius
    column.rightExtent = center + radius
    return column
end

return Column