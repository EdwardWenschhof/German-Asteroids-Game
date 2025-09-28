local config = {}

function config.load()
    config.width, config.height = love.graphics.getDimensions()
    config.typeSpace = (1/8) * config.height
end

return config