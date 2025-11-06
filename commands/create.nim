from create_proj/serviceCreate import init_venv, create_bash
import os, strutils

proc printf(args: string) =
  stdout.write(args)
  stdout.flushFile()

proc new_proj*() =
  printf("Create...\n")
  os.sleep(500)

  printf("Name project: ")
  let name_proj = readLine(stdin)
  printf("\n")

  printf("Compilation (1 - binary, 2 - cpp, 3 - c, 4 - js, all - all): ")
  let comp = readLine(stdin)
  printf("\n")

  var compSplit = comp.split(",")
  echo "Selected compilation modes: ", compSplit.join(", ")

  init_venv(name_proj); create_bash(comp);