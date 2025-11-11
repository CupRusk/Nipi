import os, strutils

var lower_name* = "" 

proc create_venv*(name: string) =
  lower_name = ("." & name).toLower()
  if not dirExists(lower_name):
    createDir(lower_name)
    echo "Created directory: " & lower_name
  else:
    echo "Directory already exists: " & lower_name

  let binDir = lower_name / "bin"
  if not dirExists(binDir):
    createDir(binDir)
    echo "Created directory: " & binDir
  else:
    echo "Directory already exists: " & binDir

proc create_json*(nameFile: string) =
  if lower_name.len == 0:
    raise newException(ValueError, "Сначала вызови create_venv()!")

  var fileName = nameFile
  if not nameFile.endsWith(".json"):
    fileName = nameFile & ".json"

  let currentPath = getCurrentDir() / lower_name / "bin" / fileName

  writeFile(currentPath, "{\n}")
