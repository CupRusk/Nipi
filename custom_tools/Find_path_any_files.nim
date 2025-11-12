import os, strutils

proc check_name_file(fileName: string): string =
  if not fileName.startsWith('.'):
    return '.' & fileName
  else:
    return fileName


proc findAnyFiles*(path: string, ext: string): seq[string] =
  var results: seq[string] = @[]
  let checkedExt = check_name_file(ext)

  for kind, filePath in walkDir(path):
    case kind
    of pcDir:
      results.add(findAnyFiles(filePath, ext))
    of pcFile:
      if filePath.toLowerAscii().endsWith(checkedExt):
        results.add(filePath)
    else:
      discard
  return results

# Пример работы
when isMainModule:
  let nimFiles = findAnyFiles(".", ".nim")
  for f in nimFiles:
    echo "Found: ", f
