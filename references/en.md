name: terminal-abkuerzungen
description: Terminal commands, shortcuts, keyboard shortcuts, and guides for .env/.envrc — explained in English. Use this skill whenever the user asks about terminal commands, shell commands, keyboard shortcuts in the terminal, or working with .env/.envrc files. Also for questions like "how do I change directory", "how do I create a file", "what is cd/ls/mkdir" etc.

## Navigation

| Command | What it does | Example |
|---------|-------------|---------|
| `cd foldername` | Switches into a subdirectory | `cd projects` |
| `cd ..` | Go up one level | `cd ../..` for two levels |
| `cd ~` | Back to the home directory (`/Users/yourname`) | `cd ~` |
| `cd -` | Back to the last visited directory | `cd -` |
| `pwd` | Shows the current path | `/Users/andreas/projects` |

**Tip:** `~` is shorthand for your home directory. On Mac you type `~` with **Option + N**.


## Creating / deleting files & folders

| Command | What it does | Example |
|---------|-------------|---------|
| `mkdir name` | Creates a new folder | `mkdir ai-bootcamp` |
| `mkdir -p a/b/c` | Creates multiple nested folders at once | `mkdir -p src/components/ui` |
| `touch filename` | Creates an empty file | `touch .env` |
| `rm filename` | Deletes a file (irreversibly!) | `rm old-note.txt` |
| `rm -rf folder` | Deletes a folder including its contents (caution!) | `rm -rf node_modules` |
| `cp source destination` | Copies a file | `cp .env .env.backup` |
| `mv source destination` | Moves or renames | `mv old.txt new.txt` |


## Network & Web

| Command | What it does | Example |
|---------|-------------|---------|
| `curl URL` | Fetches a URL and shows the response | `curl https://omr.com/` |
| `curl -I URL` | Shows only the HTTP headers (status, content-type, etc.) | `curl -I https://omr.com/` |
| `ping domain` | Checks whether a server is reachable | `ping google.com` |


## Terminal keyboard shortcuts

| Shortcut | What it does |
|----------|-------------|
| `Tab` | Autocomplete commands and paths |
| `↑` / `↓` | Scroll through command history |
| `Ctrl + C` | Cancel a running command |
| `Ctrl + Z` | Pause a process (send to background) |
| `Ctrl + L` | Clear the terminal screen (like `clear`) |
| `Ctrl + A` | Jump cursor to beginning of line |
| `Ctrl + E` | Jump cursor to end of line |
| `Ctrl + U` | Delete from cursor to beginning of line |
| `Ctrl + W` | Delete last word |
| `Ctrl + R` | Search command history |
| `Cmd + T` | Open a new tab in the terminal (macOS) |
| `Cmd + K` | Clear the terminal (macOS Terminal & iTerm) |
| `Option + ←/→` | Move word by word through the line |
| `Option + N` | Type tilde `~` (home directory) |


## .zshrc — Shell configuration

The `.zshrc` is the configuration file for your shell (zsh). It is **automatically loaded when a new terminal window is opened** and contains aliases, functions, PATH settings, etc.

```bash
open ~/.zshrc       # open .zshrc in a text editor
code ~/.zshrc       # open .zshrc in VS Code
```

**After making changes to `.zshrc`:**
```bash
source ~/.zshrc     # load changes immediately — without restarting the terminal
```

`source` means: "Execute this file now." Every **new** terminal window loads `.zshrc` automatically — you only need `source` when you want changes to take effect in the same window immediately.


## Git — Basics

| Command | What it does | Example |
|---------|-------------|---------|
| `git init` | Initializes a new Git repository in the current folder | `git init` |
| `git clone URL` | Clones an existing repository | `git clone https://github.com/user/repo` |
| `git status` | Shows which files have been changed | `git status` |
| `git add file` | Stage a specific file for the next commit | `git add README.md` |
| `git add .` | Stage **all** changed files at once | `git add .` |
| `git commit -m "message"` | Save staged changes as a snapshot | `git commit -m "added document from nils"` |
| `git push` | Upload commits to the remote server (e.g. GitHub) | `git push` |
| `git pull` | Fetch the latest changes from the server | `git pull` |
| `git log` | Show commit history | `git log --oneline` |
| `git lg` | Compact, colored log view (only after alias setup, see below) | `git lg` |
| `git diff` | Shows what has changed since the last commit | `git diff` |

## Git — Branches

**What is a branch?**
A branch is a parallel working copy of your project. You can make changes without affecting the `main` branch (the main version). When you are done, you merge your branch back into `main`.

```
main ──────────────────────────────► (stable version)
         \
          nils-document ──────────► (your changes)
```

| Command | What it does | Example |
|---------|-------------|---------|
| `git branch` | Show all local branches — active branch has `*` | `git branch` |
| `git checkout main` | Switch to the main branch (main version) | `git checkout main` |
| `git checkout -b name` | **Create a new branch and switch to it immediately** | `git checkout -b nils-document` |
| `git push` | Upload branch to GitHub — then create a PR on GitHub | `git push` |
| `git branch -d name` | Delete a branch locally (after the merge) | `git branch -d nils-document` |

### Creating a Pull Request (the standard workflow)

In practice, branches are **not merged directly in the terminal** — instead you create a **Pull Request (PR)** on GitHub. Others can then review and comment on the code before it is merged into `main`.

**Step by step:**

```bash
# 1. Create a new branch and switch to it
git checkout -b nils-document

# 2. Edit files, then stage and save
git add .
git commit -m "added document from nils"

# 3. Upload branch to GitHub
git push
# (first push: git push --set-upstream origin nils-document)
```

**4. Open a Pull Request on GitHub:**
- Go to the repository on [github.com](https://github.com)
- GitHub automatically shows a banner at the top: *"nils-document had recent pushes — Compare & pull request"* → click it
- Enter a title and description
- Click **"Create pull request"**

**5. Merge:**
- After review: click **"Merge pull request"** on GitHub
- Optionally delete the branch afterwards (GitHub asks automatically)

## Git — Undoing changes

| Command | What it does |
|---------|-------------|
| `git restore file` | Undo changes to a file (before commit) |
| `git reset HEAD~1` | Undo the last commit (changes are kept) |
| `git stash` | Set current changes aside temporarily |
| `git stash pop` | Restore the stashed changes |

**`.gitignore`** — defines which files Git should **ignore** (not track, not commit):

```bash
touch .gitignore    # create in the project folder
open .gitignore     # edit it
```

Typical content:
```
.env                # API keys — never commit!
node_modules/       # installed packages (restored from package.json)
.DS_Store           # macOS metadata
*.log               # all log files
```

Files listed in `.gitignore` do not appear in `git status` at all.


## Claude Code commands (in the Claude terminal)

| Command | What it does |
|---------|-------------|
| `/model` | Switch the AI model being used (e.g. Opus, Sonnet, Haiku) |
| `/context` | Show current context usage |
| `/plugin` | Manage installed plugins/skills |
| `/clear` | Clear the conversation context |
| `/help` | Show all available commands |
