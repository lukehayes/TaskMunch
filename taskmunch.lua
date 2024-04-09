local colors = require('ansicolors')
local Task = require('taskmunch.task')
local cli = require('cli')
local file = require('taskmunch.file')

local task_str = arg[1]

--print(path.exists('main.lua'))
--print(not not path.exists('taskmunch.lua'))

if task_str then
    t = Task:new(task_str)
else
    print("Task string is missing...")
end

print(file.exists('taskmunch.lua'))

