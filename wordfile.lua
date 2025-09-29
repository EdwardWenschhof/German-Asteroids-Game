local config = require('config')

local wordfile = {}

function wordfile.load()
    wordfile._check()
    wordfile.words = wordfile._read()
end

function wordfile._read()
    local data = {}
    local contents, size = love.filesystem.read(config.wordsFile)
    -- implement the following later after implementing word entry
    -- if not contents then
    --     return nil
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
    if not love.filesystem.getInfo(config.wordsFile) then
        love.filesystem.write("words.csv", "house,Haus\nmouse,Maus\ncup,Tasse\ntea,Tee\ncoffee,Kaffee")
    end

end

return wordfile