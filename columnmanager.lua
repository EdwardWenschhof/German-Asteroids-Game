local ColumnManager = {}
ColumnManager.__index = ColumnManager

function ColumnManager:new()
    local columnManager = setmetatable({}, self)
    return columnManager
end

return ColumnManager