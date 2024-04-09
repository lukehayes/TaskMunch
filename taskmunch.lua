local Task = require('taskmunch.task')
local File = require('taskmunch.file')
local CFG  = require('taskmunch.config')

local task_str = arg[1]

CFG:init()

if task_str then
    t = Task:new(task_str)
else
end

local fh = io.open('taskmunch.txt','a')

fh:write("{task = \"" .. t.task .. "\", done = " .. tostring(t.done) .. ", created_at = " .. t.created_at .. "} \n")

fh:close()

print(File.exists('taskmunch.lua'))


