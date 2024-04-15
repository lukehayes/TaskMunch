local File = require('taskmunch.file')
local FM   = require('taskmunch.format')

local Config = {
    TODO_FILENAME = "tm.txt",
    NO_TASK_TEXT  = "Flag was not recognised.\n\nExample: taskmunch -a \"my cool task\" ",
    TASKMUNCH_VERSION = 0.1
}
Config.__index = Config

function Config:init()
    if File.not_exist(self.TODO_FILENAME) then

        FM.new_line()
        FM.text("The file '" .. self.TODO_FILENAME .. "' does not exist and needs to be created before Taskmunch will work", 0, 'red')
        FM.new_line()
        FM.text("Do you want to create it? [Y/n].", 0, 'yellow')

        local choice = io.read()

        if choice == 'Y' then
            os.execute("touch " .. Config.TODO_FILENAME)
            FM.new_line()
            FM.text('The file ' .. Config.TODO_FILENAME .. " has been created!", 0, 'green')
        else
            FM.new_line()
            FM.text("Closing...",0, 'red')
            os.exit()
        end

        FM.new_line()
        os.exit()
    end
end

return Config
