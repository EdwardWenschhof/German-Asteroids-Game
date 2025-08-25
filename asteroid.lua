Asteroid = {}
Asteroid.__index = Asteroid

function Asteroid:new(word)
    local asteroid = setmetatable({}, self)
    asteroid.word = word
    return asteroid
end