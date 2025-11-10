import os
import terminal

proc help*(show_slow: bool) =
  # Определяем данные как обычный массив строк
  let operations = @[
    "   1. list - All installed",
    "   2. create - Create project",
    "   3. help - All commands"
  ]

  styledEcho fgBlue, "Все возможные операции:"
  if show_slow:
    os.sleep(1000)
  for line in operations:
    styledEcho fgWhite, line
    if show_slow:
      os.sleep(1000)