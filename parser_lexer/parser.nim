import os
import terminal

# Команды
import ../commands/help
import ../commands/create

proc parse*(arr_input: seq[string]) =
  case arr_input.len
  of 0:
    styledEcho(fgRed, "Операция не существует :3")
    sleep(1000)
    help(false)
  else:
    case arr_input[0]
    of "help":
      if arr_input.len > 1 and arr_input[1] == "-s":
        help(true)
      else:
        help(false)
    of "create":
      new_proj()
    else:
      styledEcho(fgRed, "Операция не существует :3")
      sleep(1000)
      help(false)
