local Asteroid = require('asteroid')
local a

function love.load()
    love.window.setTitle('German Asteroid Game')
    love.graphics.setBackgroundColor(0, 0, 0)
    love.window.setFullscreen(true)
    a = Asteroid:new('hello')
end

-- Function for debugging for now. Allows me to quit a fullscreen window
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.draw()
    a:draw()
end