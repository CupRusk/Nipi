import osproc, strutils, terminal
from ../create_proj/serviceCreate/ import venv_create # <-- просто переменная, что-бы подтвердить что venv сущесвтует. Пока единтсвенная защита

proc has_venv(): bool =
  # поиск - ищет по папкам с точкой, ищет в них /bin/meta.json
  


proc init_git*(path: string) = 
  if has_venv():
    let command = "git init" & path
    let (outp, exitCode) = execCmdEx(cmd)
    if exitCode == 0:
        styledEcho(fgGreen, "Git initialized in: " & path)
    else:
        styledEcho(fgRed, "Error: " & outp)
  else: 
    styledEcho(fgRed, "Bro, 'nipi create venv' please")