local Task = require('taskmunch.task')
local File = require('taskmunch.file')
local CFG  = require('taskmunch.config')
local TM   = require('taskmunch.taskmunch')

local flag     = arg[1]
local task_str = arg[2]
local priority = arg[3]

CFG:init()
fh = File:new(CFG.TODO_FILENAME)


if flag == nil then
    print('Run tm -h')

elseif flag == '-p' then
    TM:print()

elseif flag == '-xxx' then
    fh:clear()

elseif flag == '-a' then
    if task_str == nil then
        print(CFG.NO_TASK_TEXT)
    else
        t = Task:new(task_str)

        if priority then
            t.priority = priority
        end

        fh:writeTask(t, task_str)
    end

else
    print(CFG.NO_TASK_TEXT)
end

