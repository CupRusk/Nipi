## 🧠 Nipi — Command-line Utility for Developers
[![Join the Discord server][badge-nipi-discord]][nipi-discord]

[badge-nipi-discord]: https://img.shields.io/discord/1437733240931745874?label=Discord&logo=discord&color=2C2F33
[nipi-discord]: https://discord.gg/aKJepyne

> *"Every great tool starts with a simple command."*

Nipi is a modular, evolving command-line interface (CLI) written in **Nim**, designed to automate project creation, environment setup, and provide a foundation for future developer tools.
It’s not just a utility — it’s the beginning of a system that grows with the coder.

---

### ⚙️ Version

**Nipi 2.0.8**
Platform: Linux `amd64`
Language: Nim 2.x

---

### 📦 Features

* **Project Creation:** quickly generate project skeletons and structures.
* **Virtual Environments:** simple integration with Nim `venv` creation.
* **Parser + Lexer:** custom-built parsing core — the foundation for scripting or configuration support.
* **Command System:** modular architecture — each command is its own Nim module.
* **Readable, Extendable, Lightweight.**

---

### 🧩 Project Structure

```
Nipi/
 ├─ Nipi.nim                # main CLI entry
 ├─ commands/
 │   ├─ create.nim          # create project command
 │   ├─ help.nim            # help and usage info
 │   ├─ version.nim         # version display
 │   └─ create_proj/
 │       ├─ ServiceCreate.nim
 │       └─ create_venv/
 │           └─ venv.nim
 └─ parser_lexer/
     ├─ Lexer.nim           # tokenizer
     └─ parser.nim          # syntax parser
```

---

### 🚀 Usage

Compile and run directly with **Nim**:

```bash
nim c -r Nipi.nim help
nim c -r Nipi.nim create myproject
nim c -r Nipi.nim version
```

To create a project with virtual environment:

```bash
nim c -r Nipi.nim create
```

---

### 🧰 Requirements

* **Nim compiler:** v2.0.8 or higher
* Linux `amd64` environment *(Windows support planned)*

---

### 🧩 Philosophy

Nipi started as a small developer utility — but the goal is larger:
to create a **unified environment for coding, automating, and experimenting**.

Each module in Nipi represents a concept: *creation*, *help*, *versioning*, *interpretation*.
Together, they’re the skeleton of a future system that could evolve into a **package manager**, a **local dev shell**, or something entirely new.

> The first line of every project is not just code — it’s intent.
> Nipi captures that intent and gives it structure.

---

### 🔧 Future Plans

* Add install, delete, certificate commands
* Add support for Git repositories (for now, no custom servers)
* Windows compatibility and packaging system
---

### 📄 License

GPL License - used open-source software licenses that grant users the freedom to run, study, share, and modify softwar
