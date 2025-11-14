import osproc, strutils, terminal

"""
Дальше оно создаёт сертификаты, если есть has_venv.
Да, пока не будет. С криптографией я быстро выгорю.
"""

proc git_commit*(msg: string) =
  let safeMsg = msg.replace("\"", "\\\"")
  let cmd = "git add . && git commit -m \"" & safeMsg & "\""
  let (outp, exitCode) = execCmdEx(cmd)
  
  if exitCode == 0:
    styledEcho(fgGreen, "Commit created: " & msg)
  else:
    styledEcho(fgRed, "Commit failed: " & outp)