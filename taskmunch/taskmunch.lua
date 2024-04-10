-- All of the list management functions live in this file.

local CFG  = require('taskmunch.config')

local Taskmunch = {}

function Taskmunch:print()

    local lines= io.lines(CFG.TODO_FILENAME)
    local task_count = self:task_count()

    print("---- Tasks: ----")
    print()

    local count = 1
    for line in lines do
        print(count .. " - " .. line)
        count = count + 1
    end

    print()
    print("----  ----")
--- Count the number of tasks inside the list.
--
-- @return number    The number of tasks.
function Taskmunch:task_count()

    local lines= io.lines(CFG.TODO_FILENAME)
    local count = 0

    for line in lines do
        count = count + 1
    end

    return count
end

return Taskmunch
