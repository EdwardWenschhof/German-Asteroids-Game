local Game = require('game')
local g

function love.load()
    love.math.setRandomSeed(os.time())
    love.window.setTitle('German Asteroid Game')
    love.graphics.setBackgroundColor(0, 0, 0)
    love.window.setFullscreen(true)
    local font = love.graphics.newFont(30)
    love.graphics.setFont(font)
    g = Game:new(5)
end

-- Function for debugging for now. Allows me to quit a fullscreen window
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.textinput(t)
    g:textinput(t)
end

function love.update(dt)
    g:update(dt)
end

function love.draw()
    g:draw()
end