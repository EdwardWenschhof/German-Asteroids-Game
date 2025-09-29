local config = require('config')

local wordfile = {}

function wordfile.load()
    if not wordfile._check() then
        wordfile._default()
    end
    wordfile.words = wordfile._read()
end

function wordfile._read()
    local data = {}
    local contents, size = love.filesystem.read(config.wordsFile)
    -- implement the following later after implementing word entry
    -- if not contents then
    --     return nil -- eventually if nil then prompt to add words
    -- end

    for line in contents:gmatch("[^\r\n]+") do
        -- split on comma, trim whitespace
        local field1, field2 = line:match("([^,]+),([^,]+)")
        if field1 and field2 then
            field1 = field1:match("^%s*(.-)%s*$") -- trim spaces
            field2 = field2:match("^%s*(.-)%s*$") -- trim spaces
        end
        table.insert(data, {field1, field2})
    end
    return data
end

function wordfile._check()
    return love.filesystem.getInfo(config.wordsFile)

end

-- will eventually be defunct
function wordfile._default()
    love.filesystem.write("words.csv", "house,Haus\nmouse,Maus\ncup,Tasse\ntea,Tee\ncoffee,Kaffee")
end

function wordfile.createFile(data)
    local prepped = wordfile._prepData(data)
    love.filesystem.write("words.csv", prepped)
end

-- data here has to be a table containing table with word pairs
function wordfile._prepData(data)
    local lines = {}
    for _, pair in ipairs(data) do
        local prompt = tostring(pair[1] or "")
        local answer = tostring(pair[2] or "")
        table.insert(lines, prompt .. "," .. answer)
    end
    return table.concat(lines, "\n")
end

function wordfile.appendPair(prompt, answer)
    local line = tostring(prompt) .. "," ..tostring(answer) .. "\n"
    love.filesystem.append(config.wordsFile, line)
end

return wordfile