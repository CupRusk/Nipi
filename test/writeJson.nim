import ../custom_tools/Find_path_any_files
import strutils, osproc, os

proc writeTo_json(args: varargs[string]) = 
    let path = execCmdEx("pwd").output.strip
    let pathsTo_json = findAnyFiles(path, ".json")

    for filePath in pathsTo_json:
        if filePath.endsWith(".json"):
            let content = readFile(filePath)
            let lines = content.splitLines()
            if len(lines) > 0 and lines[0].contains("nipi-json"):
                discard # В будущем будем что-то писать 

