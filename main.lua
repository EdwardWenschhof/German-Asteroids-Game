local Game = require('game')
local g

function love.load()
    love.math.setRandomSeed(os.time())
    love.window.setTitle('German Asteroid Game')
    love.graphics.setBackgroundColor(0, 0, 0)
    love.window.setFullscreen(true)
    g = Game:new()
    for i=1,5 do
        g:createNewAsteroid()
    end
end

-- Function for debugging for now. Allows me to quit a fullscreen window
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.update(dt)
    g:update(dt)
end

function love.draw()
    g:draw()
end