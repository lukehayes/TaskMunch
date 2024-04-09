local File = require('taskmunch.file')

local Config = {
    TODO_FILENAME = "taskmunch.txt"
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
