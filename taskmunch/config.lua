local File = require('taskmunch.file')

local Config = {
    TODO_FILENAME = "tm.txt",
    NO_TASK_TEXT  = "No task available to be added.\n\nExample: taskmunch -a \"my cool task\" ",
    TASKMUNCH_VERSION = 0.1
}
Config.__index = Config

function Config:init()
    if File.not_exist(self.TODO_FILENAME) then
        print()
        print("'" .. self.TODO_FILENAME .. "' does not exist.")
        print("That file needs to be created before task much will work properly.")
        print()
        os.exit()
    end
end

return Config
