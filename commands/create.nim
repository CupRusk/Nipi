import ./create_proj/ServiceCreate as cp
import os, strutils, terminal

proc writeLine(args: string) =
  stdout.write(args)
  stdout.flushFile()

proc new_proj*() =
  writeLine("Name proj: ")
  let name_proj = readLine(stdin)
  writeLine("\n")

  if name_proj.len != 0:
    cp.init_venv(name_proj)
  else:
    cp.init_venv("venv")

  writeLine("Compilation (1 - binary, 2 - cpp, 3 - c, 4 - js, all - all): ")
  let comp = readLine(stdin)
  writeLine("\n")
  
  var compSplit = comp.split(",")
  if compSplit.len != 0:
    echo "Selected compilation modes: ", compSplit.join(", ")
    cp.create_bash(comp)
  else:
    styledEcho(fgRed, "Never")

