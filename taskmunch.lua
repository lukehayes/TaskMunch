local colors = require('ansicolors')

local Task = require('taskmunch.task')

local task_str = arg[1]

if task_str then
    t = Task:new(task_str)
else
    print("Task string is missing...")
end

