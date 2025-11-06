import ./create_proj/ServiceCreate as cp
import os, strutils

proc printf(args: string) =
  stdout.write(args)
  stdout.flushFile()

proc new_proj*() =
  printf("Create...\n")
  sleep(500)

  printf("Name project: ")
  let name_proj = readLine(stdin)
  printf("\n")

  printf("Compilation (1 - binary, 2 - cpp, 3 - c, 4 - js, all - all): ")
  let comp = readLine(stdin)
  printf("\n")

  var compSplit = comp.split(",")
  echo "Selected compilation modes: ", compSplit.join(", ")

  cp.init_venv(name_proj)
  cp.create_bash(comp)
