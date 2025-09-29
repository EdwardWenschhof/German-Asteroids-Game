local Game = require('gameplay.game')
local config = require('config')
local wordfile = require('wordfile')
local startscreen = require('gui.startscreen')

local g
CurrentState = "menu"

function love.load()
    love.math.setRandomSeed(os.time())
    love.window.setTitle('German Asteroid Game')
    love.graphics.setBackgroundColor(0, 0, 0)
    love.window.setFullscreen(true)
    local font = love.graphics.newFont(30)
    love.graphics.setFont(font)
    config.load()
    wordfile.load()
    startscreen:load()
    g = Game:new()
end

-- Function for debugging for now. Allows me to quit a fullscreen window
function love.keypressed(key)
    if CurrentState == "game" then
        g:keypressed(key) 
    end
end

function love.textinput(t)
    if CurrentState == "game" then
        g:textinput(t)  
    end
end

function love.update(dt)
    if CurrentState == "menu" then
        startscreen:update(dt)
    elseif CurrentState == "game" then
        g:update(dt)
    end
end

function love.draw()
    if CurrentState == "menu" then
        startscreen:draw()
    elseif CurrentState == "game" then
        g:draw()
    end
end

function love.mousepressed(x, y, button)
    if CurrentState == "menu" then
        startscreen:mousepressed(x, y, button)
    end
end