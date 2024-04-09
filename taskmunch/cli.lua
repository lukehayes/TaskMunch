cli.locale "en_US"
cli.program {
    "Task Munch todo list cli application.",

    cli.flag "a,add" {
        "Add a new task",
        type = cli.string
    },
    
    cli.flag "the-other" {
       "The second option",
       type = cli.number,
       default = 17
    },
    
    --cli.positional "file" {
        --"The input file",
        --type = cli.string
    --},
    
    function(args)
        print(args)
        --print(string.format("One: %s.", args.one))
        --print(string.format("Two plus 1: %d.", args.the_other + 1))
        --print(string.format("File: %s.", args.file))
    end
}

