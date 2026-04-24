#!/usr/bin/env bats

SKILL_DIR="$(cd "$BATS_TEST_DIRNAME/.." && pwd)"

@test "cheat.zsh has valid zsh syntax" {
  run zsh -n "$SKILL_DIR/cheat.zsh"
  [ "$status" -eq 0 ]
}

@test "SKILL.md exists" {
  [ -f "$SKILL_DIR/SKILL.md" ]
}

@test "SKILL.md has name in frontmatter" {
  run grep -E "^name:" "$SKILL_DIR/SKILL.md"
  [ "$status" -eq 0 ]
}

@test "SKILL.md has description in frontmatter" {
  run grep -E "^description:" "$SKILL_DIR/SKILL.md"
  [ "$status" -eq 0 ]
}

@test "references/de.md exists and is non-empty" {
  [ -s "$SKILL_DIR/references/de.md" ]
}

@test "references/en.md exists and is non-empty" {
  [ -s "$SKILL_DIR/references/en.md" ]
}

@test "de.md and en.md have the same number of sections" {
  de_count=$(grep -c "^## " "$SKILL_DIR/references/de.md")
  en_count=$(grep -c "^## " "$SKILL_DIR/references/en.md")
  [ "$de_count" -eq "$en_count" ]
}

@test "de.md contains a Navigation section" {
  run grep -q "^## " "$SKILL_DIR/references/de.md"
  [ "$status" -eq 0 ]
}

@test "en.md contains a Navigation section" {
  run grep -q "^## " "$SKILL_DIR/references/en.md"
  [ "$status" -eq 0 ]
}
