# anoraK/lib/50-render.sh — render ${VAR} templates from secrets/.env
#
# Written with sed only, so it behaves identically on GNU and BSD userland.
# Two passes: secrets/.env first, then the live environment. Anything still
# unresolved is blanked, never left as a literal ${VAR} inside JSON.

_esc() { printf '%s' "$1" | sed -e 's/[\/&|]/\\&/g'; }

render_template() {
  local tmpl="$1" out="$2" envfile="$ANORAK_ROOT/secrets/.env"

  [[ -r "$tmpl" ]] || { warn "no template: $tmpl"; return 1; }

  if (( DRY )); then dry "render $tmpl -> $out"; return 0; fi

  local tmp; tmp="$(mktemp)"
  cp "$tmpl" "$tmp"

  # --- pass 1: secrets/.env ---------------------------------------------
  if [[ -r "$envfile" ]]; then
    local line key val
    while IFS= read -r line || [[ -n "$line" ]]; do
      line="${line%%#*}"
      [[ "$line" == *=* ]] || continue
      key="${line%%=*}"; val="${line#*=}"
      key="${key//[[:space:]]/}"
      [[ "$key" =~ ^[A-Z_][A-Z0-9_]*$ ]] || continue
      val="${val%\"}"; val="${val#\"}"
      val="${val%\'}"; val="${val#\'}"
      sed -i.bak "s|\${$key}|$(_esc "$val")|g" "$tmp"
    done < "$envfile"
  else
    warn "no secrets/.env — using the live environment only"
  fi

  # --- pass 2: anything left takes its value from the environment --------
  local name
  while IFS= read -r name; do
    [[ -n "$name" ]] || continue
    val="${!name:-}"
    [[ -n "$val" ]] || warn "no value for \${$name} — rendering as empty"
    sed -i.bak "s|\${$name}|$(_esc "$val")|g" "$tmp"
  done < <(grep -o '\${[A-Z_][A-Z0-9_]*}' "$tmp" 2>/dev/null \
             | sort -u | sed -e 's/^\${//' -e 's/}$//')

  rm -f "$tmp.bak"
  as_target mkdir -p "$(dirname "$out")"
  as_target cp "$tmp" "$out"
  rm -f "$tmp"
  ok "rendered $(basename "$out")"
}

# Create secrets/.env from the example on first run, mode 600.
ensure_env_file() {
  local envfile="$ANORAK_ROOT/secrets/.env" example="$ANORAK_ROOT/secrets/.env.example"

  if (( DRY )); then dry "ensure $envfile"; return 0; fi

  if [[ ! -f "$envfile" ]]; then
    as_target mkdir -p "$ANORAK_ROOT/secrets"
    as_target cp "$example" "$envfile" 2>/dev/null || : > "$envfile"
    as_target chmod 600 "$envfile"
    warn "created $envfile — fill in your real values, it is gitignored"
  fi
  as_target chmod 600 "$envfile" 2>/dev/null || true
}
