import os, strutils, terminal
from create_venv/venv import create_venv, create_json

proc init_venv*(name_proj: string = "venv") =
  try:
    create_venv(name_proj)
  except:
    styledEcho(fgRed, "Error: Venv can't be created")

  try:
    create_json("requi.json")
    create_json("paths.json")
  except:
    styledEcho(fgRed, "Error: JSON can't be created")


proc create_bash*(compilation: string) =
  let currentPath = joinPath(getCurrentDir(), "build.bash")
  let currentPathMain = joinPath(getCurrentDir(), "main.nim")

  if not fileExists(currentPathMain):
    writeFile(currentPathMain, "# TODO: your code here:3\n")

  var parts = compilation.split(',')
  var cmds: seq[string] = @[]

  for p in parts:
    case p.strip()
    of "1":
      cmds.add("nim c -o:main main.nim")
    of "2":
      cmds.add("nim c --cc:g++ main.nim")
    of "3":
      cmds.add("nim c --cc:gcc main.nim")
    of "4":
      cmds.add("nim js -o:main.js main.nim")
    of "all":
      cmds.add("nim c -o:main main.nim")
      cmds.add("nim c --cc:g++ main.nim")
      cmds.add("nim c --cc:gcc main.nim")
      cmds.add("nim js -o:main.js main.nim")
    else:
      discard

  if cmds.len == 0:
    styledEcho(fgYellow, "Warning: empty compiler list, using default")
    cmds.add("nim c -o:main main.nim")

  writeFile(currentPath, cmds.join("\n") & "\n")
  styledEcho(fgGreen, &"build.bash created successfully ({cmds.len} command(s))")
