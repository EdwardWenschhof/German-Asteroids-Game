local ColumnManager = {}
ColumnManager.__index = ColumnManager

function ColumnManager:new(radius, width)
    local columnManager = setmetatable({}, self)

    columnManager.radius = radius
    columnManager.width = width

    columnManager.columnCenters = {}
    columnManager.occupiedColumns = {}

    columnManager:createColumns()
    return columnManager
end

function ColumnManager:createColumns()
    local colsCreated = 0
    local currentCenter = self.radius
    while currentCenter + self.radius <= self.width do
        colsCreated = colsCreated + 1
        table.insert(self.columnCenters, colsCreated, currentCenter)
        table.insert(self.occupiedColumns, colsCreated, false)
    end
end

function ColumnManager:chooseColumnIndex()
    local columnNumber = love.math.random(#self.columnCenters)
    repeat 
        columnNumber = love.math.random(#self.columnCenters)
    until not self.occupiedColumns[columnNumber]

    self.occupiedColumns[columnNumber] = true
    return columnNumber
end

function ColumnManager:getColumnCenter()
    local index = self:chooseColumnIndex()
    return self.columnCenters[index]
end

function ColumnManager:findColumn(center)
    for i = 1, #self.columnCenters do
        if self.columnCenters[i] == center then
            return i
        end
    end
end

function ColumnManager:freeColumn(center)
    local index = self:findColumn(center)
    self.occupiedColumns[index] = false
end

return ColumnManager