import os, strutils

var lower_name* = "" 

proc create_venv*(name: string) =
  lower_name = ("." & name).toLower()
  if not dirExists(lower_name):
    createDir(lower_name)
    echo "Created directory: " & lower_name
  else:
    echo "Directory already exists: " & lower_name

proc create_json*(nameFile: string) =
  if lower_name.len == 0:
    raise newException(ValueError, "Сначала вызови create_venv()!")

  let currentPath = currentDir() / lower_name / (nameFile & ".json")
  writeFile(currentPath, "{\n}")
  echo "Created file: " & currentPath

