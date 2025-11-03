import os
import terminal

# Импорты команд
from ../commands/help import help

proc parse*(arr_input: seq[string]) =
  if arr_input.len > 0 and arr_input[0] == "help":
    if arr_input.len > 1 and arr_input[1] == "-s":
      help(true)
    else:
      help(false)
  else:
    styledEcho(fgRed, "Операция не существует :3")
    sleep(1000)
    help(false)
