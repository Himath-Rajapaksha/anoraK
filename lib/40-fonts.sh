# anoraK/lib/40-fonts.sh — fonts are not redistributed here (licence).
# Drop TTF/OTF files into fonts/ and bootstrap will install them; otherwise
# we just verify the font named in the Ghostty config actually resolves.

install_fonts() {
  local src="$ANORAK_ROOT/fonts"
  local wanted="Ubuntu Mono"

  local -a files=()
  local f
  for f in "$src"/*.ttf "$src"/*.otf; do
    [[ -e "$f" ]] && files+=("$f")
  done

  if (( ${#files[@]} > 0 )); then
    local os dest
    os="$(detect_os)"
    if [[ "$os" == macos ]]; then
      dest="$TARGET_HOME/Library/Fonts"
    else
      dest="$TARGET_HOME/.local/share/fonts"
    fi

    if (( DRY )); then dry "install ${#files[@]} fonts -> $dest"; return 0; fi

    as_target mkdir -p "$dest"
    local f n=0
    for f in "${files[@]}"; do
      [[ -e "$f" ]] || continue
      as_target cp -n "$f" "$dest/" 2>/dev/null && n=$((n+1))
    done
    ok "$n font files installed into $dest"

    if [[ "$os" != macos ]] && command -v fc-cache >/dev/null 2>&1; then
      as_target fc-cache -f "$dest" >/dev/null 2>&1 || true
      ok "font cache rebuilt"
    fi
    return 0
  fi

  # Nothing bundled — check the terminal's font is actually available.
  # Note: `grep -q` under `pipefail` fails on SIGPIPE, so count instead.
  if command -v fc-list >/dev/null 2>&1; then
    local n
    n="$(fc-list 2>/dev/null | grep -ci "$wanted" || true)"
    if (( ${n:-0} > 0 )); then
      ok "font present: $wanted ($n faces)"
    else
      warn "font '$wanted' not installed — Ghostty will fall back"
      case "$(detect_os)" in
        debian) warn "  sudo apt install fonts-ubuntu" ;;
        fedora) warn "  sudo dnf install fonts-ubuntu-mono" ;;
        macos)  warn "  brew install --cask font-ubuntu-mono-nerd-font" ;;
      esac
    fi
  fi
}
