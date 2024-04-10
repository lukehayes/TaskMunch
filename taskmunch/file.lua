local File = {}

function File:new(filename)

    local f = setmetatable({}, {__index = File})

    f.filename = filename

    return f
end

--- Check if a file exists.
--
-- @param file    string    The name of the file.
--
-- @return boolean    True if exists, false otherwise.
function File.exists(file)

    local fh = io.open(file)

    if fh then
        io.close(fh)
        return true
    else
        return false
    end
end

--- Check if a file doesn't exist.
--
-- @param file    string    The name of the file.
--
-- @return boolean    True if file doesn't exist, false otherwise.
function File.not_exist(file)
    return not File.exists(file)
end

return File
