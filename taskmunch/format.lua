--- Simple CLI formatting library for creating borders and titles etc.

local Format = {}

function Format.new_line()
    io.write("\n")
end

--- Print a line of length N with '-' character.
--  
--  @param number    The length of the line - defaults to 80
--  @param string    The char to use to create the line.
function Format.line(length, char)
    
    local char = char or "-"
    local length = length or 80

    for i=1,length do
        io.write(char)
    end

    Format.new_line()

end

--- Write a string to text to stdout with optional padding.
--  
--  @param string    The string to print
--  @param number    The padding on the left side of the text.
function Format.text(str, padding)
    local padding = padding or (40 -#str)

    for i=1,padding do
        io.write(" ")
    end

    io.write(str)
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
