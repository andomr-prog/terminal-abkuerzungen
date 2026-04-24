cheat() {
  local skill_dir="$HOME/.claude/skills/terminal-abkuerzungen"
  local lang_file="$skill_dir/.lang"
  local lang="${CHEAT_LANG:-de}"

  # Gespeicherte Sprache laden
  [[ -f "$lang_file" ]] && lang=$(cat "$lang_file")

  # Argumente auswerten
  case "$1" in
    en|de)
      lang="$1"
      ;;
    set-lang)
      echo "$2" > "$lang_file"
      echo "Sprache gesetzt: $2 (dauerhaft)"
      return
      ;;
  esac

  # Sprachdatei wählen, Fallback auf de
  local file="$skill_dir/references/${lang}.md"
  [[ ! -f "$file" ]] && file="$skill_dir/references/de.md"

  if command -v glow &>/dev/null; then
    glow "$file"
  elif command -v bat &>/dev/null; then
    bat --language=md --style=plain "$file"
  else
    less -R "$file"
  fi
}
