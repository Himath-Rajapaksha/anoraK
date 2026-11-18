# anoraK/lib/60-opencode.sh — OpenCode config wiring
#
# The paths are resolved inside the function: this file is sourced before
# the target user's home directory is known.

wire_opencode() {
  local repo="$ANORAK_ROOT/config/opencode"
  local dest="$TARGET_HOME/.config/opencode"

  link_dir "$repo" "$dest"

  # opencode.json is generated, never tracked: it can contain an MCP token.
  render_template "$repo/opencode.json.tmpl" "$repo/opencode.json"

  # MCP servers are npm packages; they need node_modules.
  if [[ -f "$repo/package.json" ]]; then
    if [[ ! -d "$repo/node_modules" ]]; then
      if (( DRY )); then
        dry "npm install in $repo"
      else
        log "installing OpenCode MCP dependencies (npm)"
        ( cd "$repo" && as_target npm install --silent >/dev/null 2>&1 ) \
          && ok "node_modules ready" \
          || warn "npm install failed — run it manually in $repo"
      fi
    else
      log "node_modules present"
    fi
  fi

  if [[ -f "$repo/service.json" ]]; then
    warn "service.json exists — gitignored; it holds a local server password"
  fi
}
