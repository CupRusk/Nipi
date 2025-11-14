import init_git, any_command, os

proc parser_git*(command: string, input: string) = 
    case command:
    of "init":
        init_git(getCurrentDir())
    else:
        any_more(input)