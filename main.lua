local Task = require('taskmunch.task')
local File = require('taskmunch.file')
local CFG  = require('taskmunch.config')
local TM   = require('taskmunch.taskmunch')

local flag     = arg[1]
local task_str = arg[2]

CFG:init()
fh = File:new(CFG.TODO_FILENAME)

if flag == 'p' then
    TM:print()

elseif flag == 'xxx' then
    fh:clear()

elseif flag == 'a' then
    t = Task:new(task_str)
    fh:writeTask(t, task_str)

else
    print(CFG.NO_TASK_TEXT)
end
