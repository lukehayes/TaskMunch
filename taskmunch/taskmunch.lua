local CFG  = require('taskmunch.config')


local Taskmunch = {}

function Taskmunch:print()

    local lines= io.lines(CFG.TODO_FILENAME)

    print("---- Tasks: ----")
    print()

    local count = 1
    for line in lines do
        print(count .. " - " .. line)
        count = count + 1
    end

    print()
    print("----  ----")
end

return Taskmunch
