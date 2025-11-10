import terminal
# Когда будет добавляться сервер - добавить новуб функцию для Has_new
proc check_version*(has_new: bool) = 
    if has_new:
        styledEcho(fgGreen, "Version: 0.1v")
    else: 
        styledEcho(fgYellow, "You can update:3")
        styledEcho(fgGreen, "Version: 0.1v")