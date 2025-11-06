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

  let compSplit = comp.split(",")
  echo "Selected compilation modes: ", compSplit.join(", ")

new_proj();