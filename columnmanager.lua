local ColumnManager = {}
ColumnManager.__index = ColumnManager

function ColumnManager:new(width, totalAsteroids)
    local columnManager = setmetatable({}, self)

    columnManager.width = width

    columnManager.numColumns = totalAsteroids + 5
    columnManager.radius = (columnManager.width / (columnManager.numColumns)) / 2

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
        currentCenter = currentCenter + (self.radius * 2)
    end
end

function ColumnManager:chooseFreeColumn()
    local columnNumber = love.math.random(#self.columnCenters)
    repeat 
        columnNumber = love.math.random(#self.columnCenters)
    until not self.occupiedColumns[columnNumber]

    self.occupiedColumns[columnNumber] = true
    return columnNumber
end

function ColumnManager:getFreeCenter()
    local index = self:chooseFreeColumn()
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