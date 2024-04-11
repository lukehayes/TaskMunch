local File = require('taskmunch.file')

local Config = {
    TODO_FILENAME = "tm.txt",
    NO_TASK_TEXT  = "Flag was not recognised.\n\nExample: taskmunch -a \"my cool task\" ",
    TASKMUNCH_VERSION = 0.1
}
Config.__index = Config

function Config:init()
    if File.not_exist(self.TODO_FILENAME) then
        print()
        print("'" .. self.TODO_FILENAME .. "' does not exist.")
        print("That file needs to be created before task much will work properly.")

        print("Do you want to create it? [Y/n].")
        local choice = io.read()

        if choice == 'Y' then
            os.execute("touch " .. Config.TODO_FILENAME)
            print(Config.TODO_FILENAME .. " created.")
        else
            print("Closing...")
            os.exit()
        end

        print()
        os.exit()
    end
end

return Config
