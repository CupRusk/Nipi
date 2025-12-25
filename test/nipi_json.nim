import ../custom_tools/Find_path_any_files
import json, os, osproc
import strutils, terminal

proc check_json(pathToNp: string): bool =
  let pathsTo_json = findAnyFiles(pathToNp, ".json")

  for filePath in pathsTo_json:

    if filePath.endsWith(".json"):

      let content = readFile(filePath)
      let lines = content.splitLines()

      if len(lines) > 0 and lines[0].contains("nipi-json"): 
        return true
      else: 
        return false
    else: 
      echo "Not found nipi .venv Return False"
      return false

# proc write_json(nameFile: string, args: varargs[string]): bool = 
proc read_json(nameFile: string, path: string): JsonNode =
  let content = readFile(path / nameFile)
  let lines = content.splitLines()

  if check_json(path):
    styledEcho(fgGreen, "[LOG]:" & " json meta find")
  else:
    styledEcho(fgYellow, "[WARN]: json meta not find")
    

  let jsonBody = lines[2..^1].join("\n")
  result = parseJson(jsonBody)
  return result

echo read_json("create.json", "/home/cupruska/Documents/nim/Nipi/test") # test
      