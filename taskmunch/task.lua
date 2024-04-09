local Task = {}

function Task:new(task)
    local t = setmetatable({},  {
        __index = Task
    })

    t.task       = task
    t.done       = false
    t.created_at = tostring(os.time())

    return t
end

function Task:tostring()
    return "** " .. self.task .. " created at: " .. self.created_at
end

function Task:getTask()
    return self.task
end

function Task:created()
    return self.created_at
end

return Task
