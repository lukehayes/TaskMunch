--- Simple CLI formatting library for creating borders and titles etc.

local colors = require('ansicolors')

local Format = {}

function Format._write(str, color)
    local color = color or "green"
    io.write(colors('%{' .. color  ..  '}' .. str))
end

--- Print a new line character to stdout.
--
-- @return void
function Format.new_line()
    Format._write("\n")
end

--- Print an app flag.
--
--  @param string    The option flag.
--  @param string    The description of what the flag does.
function Format.flag(flag, description)
    Format._write(flag .. " : " .. description .." \n")
end

function Format.heading(str, char)
    Format._write(str .. "\n")
    Format.line(str:len(), char)
end

--- Print an option for a specific flag.
--
--  @param string    The option flag.
--  @param string    The description of what the flag does.
function Format.flagOption(arg_position, description, data_type, required, default_value)

    if required then
        Format.text(arg_position .. ": " .. description .. " (" .. data_type .. "). Required.", 10)
    else
        Format.text(arg_position .. ": " .. description .. " (" .. data_type .."). Defaults to " .. tostring(default_value) .. ".", 10)
    end
end

--- Print a line of length N with '-' character.
--  
--  @param number    The length of the line - defaults to 80
--  @param string    The char to use to create the line.
function Format.line(length, char)
    
    local char = char or "-"
    local length = length or 80

    for i=1,length do
        Format._write(char)
    end

    Format.new_line()

end

--- Write a string to text to stdout with optional padding.
--  
--  @param string    The string to print
--  @param number    The padding on the left side of the text.
function Format.text(str, padding, color)

    local padding = padding or 0

    for i=1,padding do
        Format._write(" ")
    end

    Format._write(str, color)
    Format.new_line()
end

--- Create a title with a top and bottom border.
--  
--  @param string    The title string to display.
function Format.title(str)
    Format.line()
    Format.text(str)
    Format.line()
end

return Format
