import terminal, strutils, os

# Команды
import ../commands/help
import ../commands/create
import ../commands/version
import ../commands/git_integr/parser_for_git

proc parse*(arr_input: seq[string]) =
  case arr_input.len
  of 0:
    styledEcho(fgRed, "Операция не существует :3")
    sleep(1000)
    help(false)
  else:
    case arr_input[0]
    of "--help":
      if arr_input.len > 1 and arr_input[1] == "-s":
        help(true)
      else:
        help(false)
    of "create_venv":
        new_proj()
    of "--version":
      check_version(true)
    of "--git":
      var input: string = ""
      if arr_input.len > 2:
        input = arr_input[2..^1].join(" ")
      else:
        input = ""

      let command = arr_input[1]
      parser_git(command, input)
    else:
      styledEcho(fgRed, "Операция не существует :3")
      sleep(1000)
      help(false)
