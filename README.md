---
name: terminal-abkuerzungen
description: Terminal-Befehle, Abkürzungen, Tastenkombinationen und Anleitungen für .env/.envrc — auf Deutsch erklären. Verwende diesen Skill immer wenn der User nach Terminal-Befehlen, Shell-Kommandos, Tastenkombinationen im Terminal, oder dem Umgang mit .env/.envrc-Dateien fragt. Auch bei Fragen wie "wie wechsle ich den Ordner", "wie erstelle ich eine Datei", "was ist cd/ls/mkdir" etc.
---

# Terminal-Referenz

> `cheat` — deutsche Version | `cheat en` — English | `cheat set-lang en` — dauerhaft wechseln

## Pfade & Sonderzeichen verstehen

| Zeichen | Bedeutung | Beispiel |
|---------|-----------|---------|
| `/` | Wurzel des Systems — der oberste Ordner überhaupt | `/Users/andreas/projects` |
| `~` | Dein Home-Verzeichnis — Kurzform für `/Users/deinname` | `cd ~` |
| `$HOME` | Gleich wie `~`, aber als Variable | `echo $HOME` → `/Users/andreas` |
| `.` | Der aktuelle Ordner | `open .` öffnet den aktuellen Ordner |
| `..` | Eine Ebene nach oben (Elternordner) | `cd ..` oder `cd ../..` |
| `./datei` | Datei im aktuellen Ordner | `./script.sh` |
| `.dateiname` | Punkt am Anfang = **versteckte Datei** | `.env`, `.zshrc`, `.gitignore` |

**Versteckte Dateien** (Punkt am Anfang) werden bei normalem `ls` nicht angezeigt — nur bei `ls -la`. Das sind meistens Konfigurations-Dateien die im Hintergrund arbeiten.

**Absoluter vs. relativer Pfad:**
```bash
/Users/andreas/projects/app   # absolut — funktioniert von überall
./app                         # relativ — "app" im aktuellen Ordner
../app                        # relativ — "app" eine Ebene höher
```

---

## Navigation

| Befehl | Was er tut | Beispiel |
|--------|-----------|---------|
| `cd ordnername` | Wechselt in einen Unterordner | `cd projects` |
| `cd ..` | Eine Ebene nach oben | `cd ../..` für zwei Ebenen |
| `cd ~` | Zurück zum Home-Verzeichnis (`/Users/deinname`) | `cd ~` |
| `cd -` | Zum zuletzt besuchten Ordner zurück | `cd -` |
| `pwd` | Zeigt den aktuellen Pfad an | `/Users/andreas/projects` |

**Tipp:** `~` ist die Kurzform für dein Home-Verzeichnis. Auf dem Mac tippst du `~` mit **Option + N**.

---

## Dateien & Ordner anzeigen

| Befehl | Was er tut |
|--------|-----------|
| `ls` | Listet alle sichtbaren Dateien und Ordner auf |
| `ls -la` | Listet alles auf (inkl. versteckte Dateien), mit Größe, Rechten, Datum |
| `ls -lh` | Wie `-la`, aber Dateigrößen in lesbarem Format (KB, MB) |
| `tree` | Zeigt die gesamte Ordnerstruktur als Baum (muss ggf. installiert werden: `brew install tree`) |
| `tree -L 2` | Ordnerstruktur nur 2 Ebenen tief |
| `open .` | Öffnet den aktuellen Ordner im Finder |
| `echo "text"` | Gibt Text im Terminal aus (`echo "Hallo"`) |
| `echo $HOME` | Gibt den Wert einer Variable aus (`/Users/andreas`) |

---

## Dateien & Ordner erstellen / löschen

| Befehl | Was er tut | Beispiel |
|--------|-----------|---------|
| `mkdir name` | Erstellt einen neuen Ordner | `mkdir ai-bootcamp` |
| `mkdir -p a/b/c` | Erstellt mehrere verschachtelte Ordner auf einmal | `mkdir -p src/components/ui` |
| `touch dateiname` | Erstellt eine leere Datei | `touch .env` |
| `rm dateiname` | Löscht eine Datei (unwiderruflich!) | `rm alte-notiz.txt` |
| `rm -rf ordner` | Löscht einen Ordner inkl. Inhalt (Vorsicht!) | `rm -rf node_modules` |
| `cp quelle ziel` | Kopiert eine Datei | `cp .env .env.backup` |
| `mv quelle ziel` | Verschiebt oder benennt um | `mv alt.txt neu.txt` |

---

## Dateien öffnen & anzeigen

| Befehl | Was er tut |
|--------|-----------|
| `open datei` | Öffnet die Datei mit der Standard-App (z. B. `.env` im Texteditor) |
| `open -a "App-Name" datei` | Öffnet mit einer bestimmten App |
| `cat datei` | Zeigt den Inhalt einer Datei direkt im Terminal an |
| `code .` | Öffnet den aktuellen Ordner in VS Code |
| `cursor .` | Öffnet den aktuellen Ordner in Cursor |

---

## Netzwerk & Web

| Befehl | Was er tut | Beispiel |
|--------|-----------|---------|
| `curl URL` | Ruft eine URL auf und zeigt die Antwort | `curl https://omr.com/` |
| `curl -I URL` | Zeigt nur die HTTP-Header (Status, Content-Type etc.) | `curl -I https://omr.com/` |
| `ping domain` | Prüft ob ein Server erreichbar ist | `ping google.com` |

---

## Prozesse & System

| Befehl | Was er tut |
|--------|-----------|
| `ps aux` | Zeigt alle laufenden Prozesse |
| `kill PID` | Beendet einen Prozess (PID aus `ps aux`) |
| `top` / `htop` | Live-Übersicht aller Prozesse (htop schöner, `brew install htop`) |

---

## Tastenkombinationen im Terminal

| Kürzel | Was es tut |
|--------|-----------|
| `Tab` | Autovervollständigung von Befehlen und Pfaden |
| `↑` / `↓` | Durch die Befehlshistorie blättern |
| `Ctrl + C` | Laufenden Befehl abbrechen |
| `Ctrl + Z` | Prozess pausieren (in Hintergrund schicken) |
| `Ctrl + L` | Terminal-Bildschirm leeren (wie `clear`) |
| `Ctrl + A` | Cursor an den Zeilenanfang springen |
| `Ctrl + E` | Cursor ans Zeilenende springen |
| `Ctrl + U` | Zeile von Cursor bis Anfang löschen |
| `Ctrl + W` | Letztes Wort löschen |
| `Ctrl + R` | Befehlshistorie durchsuchen |
| `Cmd + T` | Neuen Tab im Terminal öffnen (macOS) |
| `Cmd + K` | Terminal leeren (macOS Terminal & iTerm) |
| `Option + ←/→` | Wortweise durch die Zeile springen |
| `Option + N` | Tilde `~` eingeben (Home-Verzeichnis) |

---

## .env-Dateien

Eine `.env`-Datei speichert **Umgebungsvariablen** — typischerweise API-Keys und Zugangsdaten, die nicht im Code stehen sollen.

```bash
touch .env          # Erstellt eine neue .env-Datei
open .env           # Öffnet sie im Texteditor
```

**Typischer Inhalt einer `.env`:**
```
OPENAI_API_KEY=sk-...
GEMINI_API_KEY=AIza...
DATABASE_URL=postgresql://...
```

**Wichtige Regeln:**
- `.env` **niemals** in Git commiten — immer in `.gitignore` eintragen
- Eine `.env.example` mit Platzhaltern anlegen, damit andere wissen welche Keys gebraucht werden
- In Code immer per Variable referenzieren: `process.env.OPENAI_API_KEY` (JS) oder `os.getenv("OPENAI_API_KEY")` (Python)

---

## .zshrc — Shell-Konfiguration

Die `.zshrc` ist die Konfigurations-Datei deiner Shell (zsh). Sie wird **automatisch beim Öffnen eines neuen Terminal-Fensters** geladen und enthält Aliases, Funktionen, PATH-Einstellungen etc.

```bash
open ~/.zshrc       # .zshrc im Texteditor öffnen
code ~/.zshrc       # .zshrc in VS Code öffnen
```

**Nach Änderungen an der `.zshrc`:**
```bash
source ~/.zshrc     # Änderungen sofort laden — ohne Terminal neu starten
```

`source` bedeutet: "Führe diese Datei jetzt aus." Jedes **neue** Terminal-Fenster lädt die `.zshrc` automatisch — `source` brauchst du nur, wenn du Änderungen im gleichen Fenster sofort aktiv haben willst.

---

## .envrc-Dateien (direnv)

`.envrc` ist eine Erweiterung für Nutzer von [direnv](https://direnv.net/). Die Variablen werden **automatisch geladen**, sobald man in den Ordner wechselt.

```bash
touch .envrc
echo 'export API_KEY=meinkey' >> .envrc
direnv allow    # Einmalig genehmigen, damit direnv die Datei lädt
```

**Unterschied zu `.env`:**
- `.env` muss manuell geladen werden (z. B. von Node.js via `dotenv`)
- `.envrc` wird von direnv automatisch beim `cd` geladen — praktisch für lokale Entwicklung

---

## Git — Grundlagen

| Befehl | Was er tut | Beispiel |
|--------|-----------|---------|
| `git init` | Initialisiert ein neues Git-Repository im aktuellen Ordner | `git init` |
| `git clone URL` | Klont ein bestehendes Repository | `git clone https://github.com/user/repo` |
| `git status` | Zeigt welche Dateien geändert wurden | `git status` |
| `git add datei` | Eine bestimmte Datei für den nächsten Commit vormerken | `git add README.md` |
| `git add .` | **Alle** geänderten Dateien auf einmal vormerken | `git add .` |
| `git commit -m "nachricht"` | Vorgemerkte Änderungen als Snapshot speichern | `git commit -m "dokument von nils hinzugefügt"` |
| `git push` | Commits zum Remote-Server (z. B. GitHub) hochladen | `git push` |
| `git pull` | Neueste Änderungen vom Server holen | `git pull` |
| `git log` | Commit-Historie anzeigen | `git log --oneline` |
| `git lg` | Kompakte, farbige Log-Ansicht (nur nach Alias-Setup, s. u.) | `git lg` |
| `git diff` | Zeigt was sich seit dem letzten Commit geändert hat | `git diff` |

## Git — Branches

**Was ist ein Branch?**
Ein Branch ist eine parallele Arbeitskopie deines Projekts. Du kannst Änderungen machen, ohne den `main`-Branch (die Hauptversion) zu beeinflussen. Wenn du fertig bist, mergst du deinen Branch zurück in `main`.

```
main ──────────────────────────────► (stabile Version)
         \
          nils-dokument ──────────► (deine Änderungen)
```

| Befehl | Was er tut | Beispiel |
|--------|-----------|---------|
| `git branch` | Alle lokalen Branches anzeigen — aktiver Branch hat `*` | `git branch` |
| `git checkout main` | Zum main-Branch (Hauptversion) wechseln | `git checkout main` |
| `git checkout -b name` | **Neuen Branch erstellen und direkt wechseln** | `git checkout -b nils-dokument` |
| `git push` | Branch auf GitHub hochladen — danach PR auf GitHub erstellen | `git push` |
| `git branch -d name` | Branch lokal löschen (nach dem Merge) | `git branch -d nils-dokument` |

### Pull Request erstellen (der normale Weg)

In der Praxis merged man Branches **nicht direkt im Terminal** — man erstellt stattdessen einen **Pull Request (PR)** auf GitHub. Andere können den Code dann reviewen und kommentieren, bevor er in `main` übernommen wird.

**Schritt-für-Schritt:**

```bash
# 1. Neuen Branch erstellen und wechseln
git checkout -b nils-dokument

# 2. Dateien bearbeiten, dann vormerken und speichern
git add .
git commit -m "dokument von nils hinzugefügt"

# 3. Branch auf GitHub hochladen
git push
# (beim ersten Push: git push --set-upstream origin nils-dokument)
```

**4. Pull Request auf GitHub öffnen:**
- Auf [github.com](https://github.com) das Repository aufrufen
- GitHub zeigt oben automatisch einen Banner: *"nils-dokument had recent pushes — Compare & pull request"* → klicken
- Titel und Beschreibung eingeben
- **"Create pull request"** klicken

**5. Merge:**
- Nach dem Review: **"Merge pull request"** auf GitHub klicken
- Branch danach optional löschen (GitHub fragt automatisch)

## Git — Rückgängig machen

| Befehl | Was er tut |
|--------|-----------|
| `git restore datei` | Änderungen an einer Datei rückgängig machen (vor Commit) |
| `git reset HEAD~1` | Letzten Commit rückgängig machen (Änderungen bleiben) |
| `git stash` | Aktuelle Änderungen kurz zur Seite legen |
| `git stash pop` | Zur Seite gelegte Änderungen wiederherstellen |

**`.gitignore`** — legt fest, welche Dateien Git **ignorieren** soll (nicht tracken, nicht commiten):

```bash
touch .gitignore    # im Projektordner anlegen
open .gitignore     # bearbeiten
```

Typischer Inhalt:
```
.env                # API Keys — niemals commiten!
node_modules/       # installierte Pakete (werden aus package.json wiederhergestellt)
.DS_Store           # macOS-Metadaten
*.log               # alle Log-Dateien
```

Dateien in `.gitignore` tauchen bei `git status` gar nicht erst auf.

---

## Projekt initialisieren (init)

### Neues Projekt von Grund auf

```bash
mkdir mein-projekt && cd mein-projekt
git init                    # Git starten
touch README.md .gitignore  # Basis-Dateien anlegen
git add . && git commit -m "init"
```

### Node.js / JavaScript-Projekt

```bash
npm init -y         # package.json erstellen
npm install paket   # Abhängigkeit installieren
npm run dev         # Entwicklungsserver starten (falls konfiguriert)
```

### Python-Projekt (mit uv)

```bash
uv init mein-projekt   # Projekt anlegen
cd mein-projekt
uv add paket           # Abhängigkeit hinzufügen
uv run python main.py  # Code ausführen
```

---

## Claude Code-Befehle (im Claude-Terminal)

| Befehl | Was er tut |
|--------|-----------|
| `/model` | Wechselt das verwendete KI-Modell (z. B. Opus, Sonnet, Haiku) |
| `/context` | Zeigt den aktuellen Kontext-Verbrauch an |
| `/plugin` | Verwaltet installierte Plugins/Skills |
| `/clear` | Leert den Konversations-Kontext |
| `/help` | Zeigt alle verfügbaren Befehle |

---

## CLAUDE.md

Eine `CLAUDE.md`-Datei im Projektordner (oder in `~/.claude/`) enthält **Regeln und Handlungsempfehlungen für Claude**. Claude liest sie automatisch bei jeder Session.

```bash
touch CLAUDE.md     # Im Projektordner anlegen
open CLAUDE.md      # Bearbeiten
```

Typische Inhalte:
- Welche Befehle erlaubt/verboten sind
- Code-Stil-Regeln
- Projektspezifischer Kontext
- Verhaltensregeln für Claude in diesem Projekt
