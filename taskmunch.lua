local Task = require('taskmunch.task')
local CFG  = require('taskmunch.config')

local task_str = arg[1]

CFG:init()

if task_str then
    t = Task:new(task_str)
else
    print("Task string is missing...")
end

print(file.exists('taskmunch.lua'))

