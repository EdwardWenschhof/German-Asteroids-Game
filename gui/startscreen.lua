local config = require('config')
local Button = require('gui.button')

local startscreen = {}
startscreen.buttons = {}

function startscreen:load()
    local bw, bh = 200, 50 -- button width/height
    local cx = config.width / 2 - bw / 2
    local startY = config.height * (2/3)

    table.insert(self.buttons, Button:new("Play", cx, startY, bw, bh, function()
        CurrentState = "game"
    end))

    table.insert(self.buttons, Button:new("Options", cx, startY + 70, bw, bh, function()
        print("Options clicked")
    end))

    table.insert(self.buttons, Button:new("Exit", cx, startY + 140, bw, bh, function()
        love.event.quit()
    end))
end

function startscreen:update(dt)
    local mx, my = love.mouse.getPosition()
    for _, b in ipairs(self.buttons) do
        b:update(mx, my)
    end
end

function startscreen:draw()
    love.graphics.setFont(config.titleFont)
    love.graphics.printf("German Asteroids Game", 0, config.height/6, config.width, "center")
    for _, b in ipairs(self.buttons) do
        b:draw()
    end
end

function startscreen:mousepressed(x, y, button)
    for _, b in ipairs(self.buttons) do
        b:mousepressed(x, y, button)
    end
end

return startscreen