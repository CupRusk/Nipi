#[ Сначало создаём папку, после в нём два файла, оба json.
 один - пути в библиотеки
 второй - названия всех библиотек, для nipi list
 Что если у библиотеки есть дополнительные зависимости?

requi.json
{
  "hueglotAPI@2.2.0": ["human@1.0"],
  "human@1.0": []
  "somelib@1.0": []
}
paths.json
{
  "hueglotAPI@2.2.0": "/usr/local/nipi/libs/hueglotAPI",
  "human@1.0": "/usr/local/nipi/libs/human1.0",
  "someLib@1.0": "/usr/local/nipi/libs/someLib"
}]#
import os, strutils

from venv import create_venv, create_json

proc init_venv*(name_proj: string) =
  create_venv(name_proj)
  create_json("requi")
  create_json("paths")

proc create_bash*(compilation: string) =
  let currentPath = joinPath(getCurrentDir(), "build.bash") # <-- Path для bash
  let currentPathMain = joinPath(getCurrentDir(), "main.nim") # <-- Path для Нового nim
  let parts = compilation.split(',').mapIt(it.strip()) # <-- разделяем всё, смотрим по индексам

  writeFile(currentPathMain, "# TODO UR CODE:>")

  var cmds: seq[string] = @[]

  for p in parts:
    case p
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

  # записываем все команды в build.bash (по умолчанию перезапись)
  if cmds.len > 0:
    writeFile(currentPath, cmds.join("\n") & "\n")
  else:
    writeFile(currentPath, "nim c -o:main main.nim\n")

