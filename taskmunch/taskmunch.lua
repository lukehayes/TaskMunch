-- All of the list management functions live in this file.

local CFG  = require('taskmunch.config')
local Task = require('taskmunch.task')
local File = require('taskmunch.file')
local FM   = require('taskmunch.format')

local Taskmunch = {}

function Taskmunch:new()
    local tm = setmetatable({}, {__index = Taskmunch})

    tm.file = File:new(CFG.TODO_FILENAME)
    tm.task_count = tm.file:task_count()

    return tm
end

function Taskmunch:printHelp()
    FM.new_line()
    FM.text("TaskMunch - v" .. tostring(CFG.TASKMUNCH_VERSION) .. " \n")
    FM.heading("Flags:")
    FM.new_line()
    FM.flag("-a", "Add a new task to the list.")
    FM.new_line()
    FM.text("Options:", 5)
    FM.flagOption(1,"The name of the task", "string", true, 1)
    FM.flagOption(2,"Priority of the task", "number", false, 1)
    FM.new_line()
    FM.flag("-p", "Print all of the items in the list.")
    FM.new_line()
    FM.flag("-xxx", "Completely wipe the list. This action cannot be undone!")
    FM.new_line()
end

function Taskmunch:print()

    local lines= io.lines(CFG.TODO_FILENAME)

    FM.line(40, "-")
    FM.text("Tasks (".. self.task_count ..")")
    FM.line(40, "-")
    FM.new_line()

    for line in lines do
        FM.text(line, 0, "blue")
    end

    FM.new_line()
    FM.line(40, "-")
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
        print("New task count: " .. tostring(self.task_count) )
    end
end

function Taskmunch:clear()

    FM.new_line()
    FM.text("Are you sure you want to clear the todolist? [Y/n].", 0, "yellow")
    FM.text("...", 0, "yellow")
    FM.new_line()
    local choice = io.read()

    if choice == 'Y' then
        self.file:clear()
        FM.new_line()
        FM.text("Todolist cleared!", 0, "green")
        FM.new_line()
    else
        FM.new_line()
        FM.new_line()
        FM.text("Todolist has not been deleted.", 0, "yellow")
        FM.new_line()
        os.exit()
    end
end

--- Count the number of tasks inside the list.
--
-- @return number    The number of tasks.
function Taskmunch:task_count()
    return self.file:task_count()
end

return Taskmunch
