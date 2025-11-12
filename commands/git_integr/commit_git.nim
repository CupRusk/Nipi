import osproc, strutils, terminal

proc git_commit*(msg: string) =
  let cmd = "git add . && git commit -m \"" & msg & "\""
  let (outp, exitCode) = execCmdEx(cmd)
  
  if exitCode == 0:
    styledEcho(fgGreen, "Commit created: " & msg)
  else:
    styledEcho(fgRed, "Commit failed: " & outp)