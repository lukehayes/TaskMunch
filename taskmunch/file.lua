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

function File:writeTask(taskObj, task)
    print(self.filename)
    local fh = io.open(self.filename,'a')

    fh:write(
        taskObj.task .. " " ..
        tostring(taskObj.done).. " " ..
        tostring(taskObj.priority).. " " ..
        taskObj.created_at .. "\n"
    )

    fh:close()
end

--- Completely clear the list of todos from file.
--
-- @return nil
function File:clear()
    local fh = io.open(self.filename, "w+")
    fh:close()
    print(self.filename .. " cleared!")
end


return File
