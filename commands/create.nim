import ./create_proj/ServiceCreate as cp
import os, strutils, terminal

proc print(args: string) =
  stdout.write(args)
  stdout.flushFile()

proc new_proj*() =
  print("Create...\n")
  sleep(500)

  print("Name proj: ")
  let name_proj = readLine(stdin)
  print("\n")

  if name_proj.len != 0:
    cp.init_venv(name_proj)
  else:
    cp.init_venv("venv")

  print("Compilation (1 - binary, 2 - cpp, 3 - c, 4 - js, all - all): ")
  let comp = readLine(stdin)
  print("\n")
  
  var compSplit = comp.split(",")
  if compSplit.len != 0:
    echo "Selected compilation modes: ", compSplit.join(", ")
    cp.create_bash(comp)
  else:
    styledEcho(fgRed, "Never")

