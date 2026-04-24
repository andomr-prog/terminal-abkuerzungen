# terminal-abkuerzungen

[![CI](https://github.com/andomr-prog/terminal-abkuerzungen/actions/workflows/ci.yml/badge.svg)](https://github.com/andomr-prog/terminal-abkuerzungen/actions/workflows/ci.yml)

A [Claude Code](https://claude.ai/code) skill that explains terminal commands, keyboard shortcuts, and shell configuration — in German or English. Also ships a `cheat` command you can call directly from your terminal.

## Features

- Claude Code skill: answers terminal questions automatically in German (or English)
- `cheat` command: opens the full reference sheet in your terminal
- Covers navigation, file operations, Git, `.env`/`.zshrc`/`.envrc`, keyboard shortcuts, and more

## Installation

### As a Claude Code skill

Copy the skill into your Claude skills directory:

```bash
git clone https://github.com/andomr-prog/terminal-abkuerzungen.git \
  ~/.claude/skills/terminal-abkuerzungen
```

Claude Code picks it up automatically on the next session.

### As a terminal command (`cheat`)

Add this to your `~/.zshrc`:

```bash
source ~/.claude/skills/terminal-abkuerzungen/cheat.zsh
```

Then reload your shell:

```bash
source ~/.zshrc
```

## Usage

**In Claude Code** — just ask in natural language:

> "How do I change directory?" · "What is `.env`?" · "How do I create a branch?"

**In the terminal:**

```bash
cheat              # German reference (default)
cheat en           # English reference
cheat set-lang en  # Switch default language permanently
```

Displays the reference sheet with `glow` (if installed), `bat`, or `less` as fallback.

---

## Reference

> `cheat` — German | `cheat en` — English | `cheat set-lang en` — switch permanently

### Paths & special characters

| Character | Meaning | Example |
|-----------|---------|---------|
| `/` | Root of the filesystem | `/Users/andreas/projects` |
| `~` | Your home directory — shorthand for `/Users/yourname` | `cd ~` |
| `$HOME` | Same as `~`, but as a variable | `echo $HOME` → `/Users/andreas` |
| `.` | The current directory | `open .` opens the current folder |
| `..` | One level up (parent directory) | `cd ..` or `cd ../..` |
| `./file` | File in the current directory | `./script.sh` |
| `.filename` | Leading dot = **hidden file** | `.env`, `.zshrc`, `.gitignore` |

Hidden files (leading dot) are not shown by `ls` — only by `ls -la`. They are usually config files working in the background.

**Absolute vs. relative path:**
```bash
/Users/andreas/projects/app   # absolute — works from anywhere
./app                         # relative — "app" in the current folder
../app                        # relative — "app" one level up
```

---

### Navigation

| Command | What it does | Example |
|---------|-------------|---------|
| `cd foldername` | Switch into a subdirectory | `cd projects` |
| `cd ..` | Go up one level | `cd ../..` for two levels |
| `cd ~` | Back to home directory | `cd ~` |
| `cd -` | Back to the last visited directory | `cd -` |
| `pwd` | Show the current path | `/Users/andreas/projects` |

**Tip:** On Mac, type `~` with **Option + N**.

---

### List files & folders

| Command | What it does |
|---------|-------------|
| `ls` | List all visible files and folders |
| `ls -la` | List everything including hidden files, with size, permissions, date |
| `ls -lh` | Like `-la` but file sizes in human-readable format (KB, MB) |
| `tree` | Show folder structure as a tree (`brew install tree`) |
| `tree -L 2` | Tree, max 2 levels deep |
| `open .` | Open current folder in Finder |
| `echo "text"` | Print text to the terminal (`echo "Hello"`) |
| `echo $HOME` | Print the value of a variable (`/Users/andreas`) |

---

### Create / delete files & folders

| Command | What it does | Example |
|---------|-------------|---------|
| `mkdir name` | Create a new folder | `mkdir my-project` |
| `mkdir -p a/b/c` | Create nested folders at once | `mkdir -p src/components/ui` |
| `touch filename` | Create an empty file | `touch .env` |
| `rm filename` | Delete a file (irreversible!) | `rm old-note.txt` |
| `rm -rf folder` | Delete a folder and its contents (caution!) | `rm -rf node_modules` |
| `cp source dest` | Copy a file | `cp .env .env.backup` |
| `mv source dest` | Move or rename | `mv old.txt new.txt` |

---

### Open & view files

| Command | What it does |
|---------|-------------|
| `open file` | Open file with its default app |
| `open -a "App Name" file` | Open with a specific app |
| `cat file` | Print file contents to the terminal |
| `code .` | Open current folder in VS Code |
| `cursor .` | Open current folder in Cursor |

---

### Network & web

| Command | What it does | Example |
|---------|-------------|---------|
| `curl URL` | Fetch a URL and show the response | `curl https://example.com/` |
| `curl -I URL` | Show only HTTP headers (status, content-type, etc.) | `curl -I https://example.com/` |
| `ping domain` | Check whether a server is reachable | `ping google.com` |

---

### Processes & system

| Command | What it does |
|---------|-------------|
| `ps aux` | Show all running processes |
| `kill PID` | Terminate a process (PID from `ps aux`) |
| `top` / `htop` | Live overview of all processes (`brew install htop`) |

---

### Terminal keyboard shortcuts

| Shortcut | What it does |
|----------|-------------|
| `Tab` | Autocomplete commands and paths |
| `↑` / `↓` | Scroll through command history |
| `Ctrl + C` | Cancel a running command |
| `Ctrl + Z` | Pause a process (send to background) |
| `Ctrl + L` | Clear the terminal screen |
| `Ctrl + A` | Jump to beginning of line |
| `Ctrl + E` | Jump to end of line |
| `Ctrl + U` | Delete from cursor to beginning of line |
| `Ctrl + W` | Delete last word |
| `Ctrl + R` | Search command history |
| `Cmd + T` | Open a new terminal tab (macOS) |
| `Cmd + K` | Clear the terminal (macOS Terminal & iTerm) |
| `Option + ←/→` | Move word by word |
| `Option + N` | Type tilde `~` (home directory shortcut on Mac) |

---

### .env files

A `.env` file stores **environment variables** — typically API keys and credentials that should not be in your code.

```bash
touch .env    # create a new .env file
open .env     # open it in a text editor
```

**Typical content:**
```
OPENAI_API_KEY=sk-...
GEMINI_API_KEY=AIza...
DATABASE_URL=postgresql://...
```

**Rules:**
- Never commit `.env` to Git — always add it to `.gitignore`
- Create a `.env.example` with placeholder values so others know what keys are needed
- Reference in code via `process.env.OPENAI_API_KEY` (JS) or `os.getenv("OPENAI_API_KEY")` (Python)

---

### .zshrc — Shell configuration

`.zshrc` is the config file for your zsh shell. It loads automatically when a new terminal window opens and contains aliases, functions, PATH settings, etc.

```bash
open ~/.zshrc    # open in text editor
code ~/.zshrc    # open in VS Code
```

After making changes:
```bash
source ~/.zshrc  # apply changes without restarting the terminal
```

---

### .envrc files (direnv)

`.envrc` works with [direnv](https://direnv.net/) to load variables automatically when you `cd` into a folder.

```bash
touch .envrc
echo 'export API_KEY=mykey' >> .envrc
direnv allow    # approve the file once
```

**Difference to `.env`:** `.env` must be loaded manually (e.g. via `dotenv`). `.envrc` is loaded automatically by direnv on `cd`.

---

### Git — Basics

| Command | What it does | Example |
|---------|-------------|---------|
| `git init` | Initialize a new Git repository | `git init` |
| `git clone URL` | Clone an existing repository | `git clone https://github.com/user/repo` |
| `git status` | Show changed files | `git status` |
| `git add file` | Stage a specific file | `git add README.md` |
| `git add .` | Stage all changed files | `git add .` |
| `git commit -m "msg"` | Save staged changes as a snapshot | `git commit -m "add feature"` |
| `git push` | Upload commits to GitHub | `git push` |
| `git pull` | Fetch latest changes | `git pull` |
| `git log --oneline` | Show compact commit history | |
| `git diff` | Show changes since last commit | `git diff` |

### Git — Branches

A branch is a parallel copy of your project. Make changes without affecting `main`. Merge back when done.

| Command | What it does | Example |
|---------|-------------|---------|
| `git branch` | Show all local branches | `git branch` |
| `git checkout main` | Switch to main branch | `git checkout main` |
| `git checkout -b name` | Create and switch to a new branch | `git checkout -b my-feature` |
| `git push` | Upload branch to GitHub | `git push` |
| `git branch -d name` | Delete a branch locally | `git branch -d my-feature` |

**Creating a Pull Request:**
```bash
git checkout -b my-feature
git add .
git commit -m "add my feature"
git push --set-upstream origin my-feature
# Then open a PR on github.com
```

### Git — Undoing changes

| Command | What it does |
|---------|-------------|
| `git restore file` | Discard changes to a file (before commit) |
| `git reset HEAD~1` | Undo last commit (keep changes) |
| `git stash` | Set current changes aside temporarily |
| `git stash pop` | Restore stashed changes |

**`.gitignore`** — files Git should ignore:
```
.env
node_modules/
.DS_Store
*.log
```

---

### Initialize a project

```bash
# From scratch
mkdir my-project && cd my-project
git init
touch README.md .gitignore
git add . && git commit -m "init"

# Node.js
npm init -y
npm install package-name

# Python (with uv)
uv init my-project
cd my-project
uv add package-name
uv run python main.py
```

---

### Claude Code commands

| Command | What it does |
|---------|-------------|
| `/model` | Switch the AI model (Opus, Sonnet, Haiku) |
| `/context` | Show current context usage |
| `/plugin` | Manage installed plugins/skills |
| `/clear` | Clear the conversation context |
| `/help` | Show all available commands |

**`CLAUDE.md`** — place this file in your project folder to give Claude project-specific instructions (allowed commands, coding style, context). Claude reads it automatically at the start of every session.
