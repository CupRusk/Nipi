import osproc, strutils, terminal

proc any_more*(args: string) = 
    let (outp, exitCode) = execCmdEx(args)
    
    if exitCode == 0:
        styledEcho(fgGreen, "Any command created: " & msg)
    else:
        styledEcho(fgRed, "Any command failed: " & outp)