local File = require('taskmunch.file')
local CFG  = require('taskmunch.config')
local TM   = require('taskmunch.taskmunch')

local flag     = arg[1]
local task_str = arg[2]
local priority = arg[3]

taskmunch = TM:new()

CFG:init()

if flag == nil then
    print('Run tm -h')

elseif flag == '-p' then

    taskmunch:print()

elseif flag == '-xxx' then

    taskmunch:clear()

elseif flag == '-a' then

    taskmunch:add_task(task_str, priority)

else
    print(CFG.NO_TASK_TEXT)
end
