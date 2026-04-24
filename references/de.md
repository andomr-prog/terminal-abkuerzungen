## Navigation

| Befehl | Was er tut | Beispiel |
|--------|-----------|---------|
| `cd ordnername` | Wechselt in einen Unterordner | `cd projects` |
| `cd ..` | Eine Ebene nach oben | `cd ../..` für zwei Ebenen |
| `cd ~` | Zurück zum Home-Verzeichnis (`/Users/deinname`) | `cd ~` |
| `cd -` | Zum zuletzt besuchten Ordner zurück | `cd -` |
| `pwd` | Zeigt den aktuellen Pfad an | `/Users/andreas/projects` |

**Tipp:** `~` ist die Kurzform für dein Home-Verzeichnis. Auf dem Mac tippst du `~` mit **Option + N**.


## Dateien & Ordner anzeigen

| Befehl | Was er tut |
|--------|-----------|
| `ls` | Listet alle sichtbaren Dateien und Ordner auf |
| `ls -la` | Alles inkl. versteckte Dateien, mit Größe, Rechten, Datum |
| `ls -lh` | Wie `-la`, aber Dateigrößen lesbar (KB, MB) |
| `tree` | Ordnerstruktur als Baum (`brew install tree`) |
| `tree -L 2` | Baum, nur 2 Ebenen tief |
| `open .` | Aktuellen Ordner im Finder öffnen |


## Dateien & Ordner erstellen / löschen

| Befehl | Was er tut | Beispiel |
|--------|-----------|---------|
| `mkdir name` | Erstellt einen neuen Ordner | `mkdir ai-bootcamp` |
| `mkdir -p a/b/c` | Erstellt mehrere verschachtelte Ordner auf einmal | `mkdir -p src/components/ui` |
| `touch dateiname` | Erstellt eine leere Datei | `touch .env` |
| `rm dateiname` | Löscht eine Datei (unwiderruflich!) | `rm alte-notiz.txt` |
| `rm -rf ordner` | Löscht einen Ordner inkl. Inhalt (Vorsicht!) | `rm -rf node_modules` |
| `cp quelle ziel` | Kopiert eine Datei | `cp .env .env.backup` |
| `cp -r quelle ziel` | Kopiert einen Ordner rekursiv | `cp -r src backup/` |
| `mv quelle ziel` | Verschiebt oder benennt um | `mv alt.txt neu.txt` |

> ⚠️ `rm` und `rm -rf` löschen **ohne Papierkorb** — es gibt kein Rückgängig!


## Dateien ansehen

| Befehl | Was er tut |
|--------|-----------|
| `cat datei` | Gesamten Inhalt einer Datei ausgeben |
| `less datei` | Datei seitenweise lesen — `q` beendet |
| `head -20 datei` | Erste 20 Zeilen anzeigen |
| `tail -20 datei` | Letzte 20 Zeilen anzeigen |
| `tail -f log` | Datei live mitlesen — nützlich für Logs |
| `open datei` | Datei in der Standard-App öffnen |
| `code .` | Aktuellen Ordner in VS Code öffnen |
| `cursor .` | Aktuellen Ordner in Cursor öffnen |


## Suchen

| Befehl | Was er tut | Beispiel |
|--------|-----------|---------|
| `grep wort datei` | In einer Datei nach Text suchen | `grep "error" app.log` |
| `grep -r wort .` | Rekursiv im aktuellen Ordner suchen | `grep -r "API_KEY" .` |
| `find . -name "*.txt"` | Dateien per Muster finden | `find . -name "*.env"` |
| `which befehl` | Zeigt wo ein Befehl liegt | `which python` |
| `man befehl` | Handbuch aufrufen — `q` beendet | `man ls` |
| `history` | Zuletzt eingegebene Befehle anzeigen | |


## Prozesse & System

| Befehl | Was er tut |
|--------|-----------|
| `ps aux` | Alle laufenden Prozesse anzeigen |
| `kill PID` | Prozess per ID beenden (PID aus `ps aux`) |
| `top` / `htop` | Live-Übersicht aller Prozesse (`brew install htop`) |
| `df -h` | Festplatten-Auslastung anzeigen |
| `du -sh *` | Größe der Unterordner im aktuellen Verzeichnis |
| `echo $PATH` | Aktuelle PATH-Variable anzeigen |


## Netzwerk & Web

| Befehl | Was er tut | Beispiel |
|--------|-----------|---------|
| `curl URL` | Ruft eine URL auf und zeigt die Antwort | `curl https://omr.com/` |
| `curl -I URL` | Zeigt nur die HTTP-Header (Status, Content-Type etc.) | `curl -I https://omr.com/` |
| `ping domain` | Prüft ob ein Server erreichbar ist | `ping google.com` |


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


## Claude Code-Befehle (im Claude-Terminal)

| Befehl | Was er tut |
|--------|-----------|
| `/model` | Wechselt das verwendete KI-Modell (z. B. Opus, Sonnet, Haiku) |
| `/context` | Zeigt den aktuellen Kontext-Verbrauch an |
| `/plugin` | Verwaltet installierte Plugins/Skills |
| `/clear` | Leert den Konversations-Kontext |
| `/help` | Zeigt alle verfügbaren Befehle |

