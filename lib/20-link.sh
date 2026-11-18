# anoraK/lib/20-link.sh — symlink a repo path into place, backing up on conflict

# link_path <source-in-repo> <absolute-destination>
link_path() {
  local src="$1" dest="$2"

  [[ -e "$src" ]] || { warn "missing in repo: $src"; return 1; }

  if (( DRY )); then dry "link $dest -> $src"; return 0; fi

  as_target mkdir -p "$(dirname "$dest")"

  if [[ -L "$dest" ]]; then
    if [[ "$(readlink -f "$dest" 2>/dev/null)" == "$(readlink -f "$src")" ]]; then
      ok "already linked: $dest"
      return 0
    fi
    as_target rm -f "$dest"
  elif [[ -e "$dest" ]]; then
    local bak="${dest}.anoraK.bak.$(date +%Y%m%d-%H%M%S)"
    as_target mv "$dest" "$bak"
    warn "backed up $dest -> $bak"
  fi

  as_target ln -s "$src" "$dest"
  ok "linked $dest -> $src"
}

# Directory variant: migrate existing content into the repo the first time,
# so nothing is lost when the repo copy does not exist yet.
link_dir() {
  local src="$1" dest="$2"

  if (( DRY )); then dry "link dir $dest -> $src"; return 0; fi

  if [[ -d "$dest" && ! -L "$dest" && ! -e "$src" ]]; then
    log "adopting existing $dest into repo"
    as_target mkdir -p "$(dirname "$src")"
    as_target mv "$dest" "$src"
    ok "moved $dest -> $src"
  fi

  link_path "$src" "$dest"
}
