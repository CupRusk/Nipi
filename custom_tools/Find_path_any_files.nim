import os, strutils

## Нормализует строку расширения: если нет ведущей точки — добавляет её.
##
## Параметры:
## - `fileName`: расширение (например "nim" или ".nim").
##
## Возвращает:
## - нормализованную строку расширения, всегда начинающуюся с точки (например ".nim").
proc check_name_file(fileName: string): string =
  if not fileName.startsWith('.'):
    return '.' & fileName
  else:
    return fileName


## Рекурсивно находит файлы в каталоге `path`, имена которых заканчиваются на `ext`.
##
## Параметры:
## - `path`: путь к каталогу, с которого начинается поиск.
## - `ext`: расширение файлов для поиска (например ".nim" или "nim").
##   Значение нормализуется через `check_name_file` (добавляется точка при необходимости).
##
## Возвращает:
## - `seq[string]` — последовательность путей к найденным файлам.
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
