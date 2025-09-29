local config = {}

function config.load()
    -- information about screen
    config.width, config.height = love.graphics.getDimensions()
    
    -- layout preferences
    config.typeSpace = (1/8) * config.height
    config.boardHeight = (7/8) * config.height

    -- asteroid preferences
    config.totalAsteroids = 5
    config.numColumns = config.totalAsteroids + 5
    config.asteroidRadius = (config.width / config.numColumns) / 2
    config.speeds = {50, 100, 200, 250, 275}

    -- word preferences
    config.wordsFile = './words.csv'
    config.prompt = 1
    config.answer = 2
end

return config