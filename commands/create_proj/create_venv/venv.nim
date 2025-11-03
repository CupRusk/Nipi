import os, unicode

proc create_venv(name: string) =
  var name_folder = "."
  name_folder = name_folder & name
  let lower_name = name_folder.toLower()
  createDir(lower_name)
  

# create_venv("Венв") Тест
