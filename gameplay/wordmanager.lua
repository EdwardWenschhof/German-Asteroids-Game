local WordManager = {}
WordManager.__index = WordManager

function WordManager:new(words)
    local m = setmetatable({}, self)
    m.words = words
    return m
end

function WordManager:choose()
end

return WordManager