local config = {}

function config.load()
    -- information about screen
    config.width, config.height = love.graphics.getDimensions()
    
    -- layout preferences
    config.typeSpace = (1/8) * config.height

    -- asteroid preferences
    config.totalAsteroids = 5
    config.speeds = {50, 100, 200, 250, 275}
end

return config