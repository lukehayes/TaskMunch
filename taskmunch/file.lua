local File = {}

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

return File
