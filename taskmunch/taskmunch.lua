-- All of the list management functions live in this file.

local CFG  = require('taskmunch.config')
local Task = require('taskmunch.task')
local File = require('taskmunch.file')

local Taskmunch = {}

function Taskmunch:new()
    local tm = setmetatable({}, {__index = Taskmunch})

    tm.file = File:new(CFG.TODO_FILENAME)
    tm.task_count = 0

    return tm
end

function Taskmunch:print()

    local lines= io.lines(CFG.TODO_FILENAME)
    local task_count = self.task_count

    print("----------------------------------------")
    print("Tasks (".. task_count..")")
    print("----------------------------------------")
    print()

    for line in lines do
        print(line)
    end

    print()
    print("----------------------------------------")
end

function Taskmunch:add_task(task_str, priority)

    if task_str == nil then
        print(CFG.NO_TASK_TEXT)
    else
        t = Task:new(task_str)

        if priority then
            t.priority = priority
        end

        self.file:writeTask(t, task_str)

        self.task_count = self.task_count + 1
    end
end

function Taskmunch:clear()
    self.file:clear()
end

--- Count the number of tasks inside the list.
--
-- @return number    The number of tasks.
function Taskmunch:task_count()

    local lines= io.lines(CFG.TODO_FILENAME)
    local count = 0

    for line in lines do
        count = count + 1
    end

    self.task_count = count

    return self.task_count
end

return Taskmunch
