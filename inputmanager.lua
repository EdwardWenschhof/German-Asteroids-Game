local config = require('config')

local inputmanager = {
    text = ""
}

function inputmanager:textinput(t)
    local newText = inputmanager.text .. t
    local textWidth = love.graphics.getFont():getWidth(newText)
    if textWidth <= (1/3) * config.width then
        inputmanager.text = newText
    end
end

function inputmanager:keypressed(key)
    if key == "escape" then
        love.event.quit()
    elseif key == "backspace" then
        inputmanager.text = string.sub(inputmanager.text, 1, -2)
    elseif key == "return" then
        local t = inputmanager.text
        inputmanager.text = ""
        return t
    end
    return nil
end

return inputmanager