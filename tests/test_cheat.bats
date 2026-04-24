#!/usr/bin/env bats

SKILL_DIR="$(cd "$BATS_TEST_DIRNAME/.." && pwd)"

setup() {
  TEST_HOME="$(mktemp -d)"
  MOCK_BIN="$(mktemp -d)"

  mkdir -p "$TEST_HOME/.claude/skills/terminal-abkuerzungen/references"
  cp "$SKILL_DIR/references/de.md" "$TEST_HOME/.claude/skills/terminal-abkuerzungen/references/"
  cp "$SKILL_DIR/references/en.md" "$TEST_HOME/.claude/skills/terminal-abkuerzungen/references/"

  # glow is checked first in cheat.zsh — mock it to echo the file path
  printf '#!/bin/sh\necho "DISPLAY:$1"\n' > "$MOCK_BIN/glow"
  chmod +x "$MOCK_BIN/glow"
}

teardown() {
  rm -rf "$TEST_HOME" "$MOCK_BIN"
}

run_cheat() {
  HOME="$TEST_HOME" PATH="$MOCK_BIN:$PATH" zsh -c "source '$SKILL_DIR/cheat.zsh'; cheat $*"
}

@test "default language loads de.md" {
  run run_cheat
  [ "$status" -eq 0 ]
  [[ "$output" == *"de.md"* ]]
}

@test "'cheat de' explicitly loads de.md" {
  run run_cheat de
  [ "$status" -eq 0 ]
  [[ "$output" == *"de.md"* ]]
}

@test "'cheat en' loads en.md" {
  run run_cheat en
  [ "$status" -eq 0 ]
  [[ "$output" == *"en.md"* ]]
}

@test "'cheat set-lang en' writes en to .lang file" {
  run_cheat set-lang en
  [ "$(cat "$TEST_HOME/.claude/skills/terminal-abkuerzungen/.lang")" = "en" ]
}

@test "'cheat set-lang' prints confirmation message" {
  run run_cheat set-lang de
  [ "$status" -eq 0 ]
  [[ "$output" == *"gesetzt"* ]]
}

@test "reads language preference from .lang file" {
  echo "en" > "$TEST_HOME/.claude/skills/terminal-abkuerzungen/.lang"
  run run_cheat
  [ "$status" -eq 0 ]
  [[ "$output" == *"en.md"* ]]
}

@test "falls back to de.md if .lang contains unknown language" {
  echo "fr" > "$TEST_HOME/.claude/skills/terminal-abkuerzungen/.lang"
  run run_cheat
  [ "$status" -eq 0 ]
  [[ "$output" == *"de.md"* ]]
}
