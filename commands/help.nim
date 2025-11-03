import os
import terminal

proc help*(show_slow: bool) =
  # Определяем данные как обычный массив строк
  let operations = @[
    "   1. list - Вывод всего, что вы установили",
    "   2. create <name> - Создание проекта",
    "   3. help - вывод всех возможных комманд"
  ]

  styledEcho fgBlue, "Все возможные операции:"
  if show_slow:
    os.sleep(1000)
  for line in operations:
    styledEcho fgWhite, line
    if show_slow:
      os.sleep(1000)