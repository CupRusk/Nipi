import osproc, strutils, terminal, os
from ../../custom_tools/Find_path_any_files import findAnyFiles

proc has_venv(): bool =
  let paths = findAnyFiles(getCurrentDir(), ".json")
  return paths.len > 0

proc init_git*(path: string) = 
  if has_venv():
    let command = "git init " & path
    let (outp, exitCode) = execCmdEx(cmd)
    if exitCode == 0:
        styledEcho(fgGreen, "Git initialized in: " & path)
    else:
        styledEcho(fgRed, "Error: " & outp)
  else: 
    styledEcho(fgRed, "Bro, 'nipi create' please")