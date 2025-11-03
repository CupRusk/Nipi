# `nipi` — Mini CLI Utility in Nim

`nipi` is a lightweight command-line utility written in Nim for managing mini-projects through simple CLI commands.

---

## 🔹 Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/nipi.git
cd nipi
```

2. Make sure Nim is installed:

```bash
nim -v
```

3. Compile and run:

```bash
nim c -r nipi.nim
```

> The `-r` flag compiles and immediately runs the program.

---

## 🔹 Usage

The program supports the following commands:

| Command         | Description                                       |
| --------------- | ------------------------------------------------- |
| `list`          | Display all installed projects/operations         |
| `create <name>` | Create a new project with the name `<name>`       |
| `help`          | Show help with available commands                 |
| `help -s`       | Show help step by step with a delay between lines |

### Examples

```bash
./nipi
# Output: Operation does not exist :3
```

```bash
./nipi help
# Output:
# All available operations:
#    1. list - Display all installed items
#    2. create <name> - Create a new project
```

```bash
./nipi help -s
# Output with 2-second delay between lines
```

---

## 🔹 Features

* **Colorful output** using `terminal.styledEcho`
* Minimal CLI with argument parsing
* Simple structure, easy to extend with new commands

---

## 🔹 Project Structure

```
nipi/
├─ Lexer.nim       # Module for tokenizing commands
├─ main.nim        # Main executable file
├─ README.md       # Documentation
```

---

## 🔹 Dependencies

* Nim (latest version recommended)
* `terminal` module (part of Nim standard library)
* `os` module (for file system operations and delays)


