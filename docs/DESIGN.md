# anoraK — design

**Date:** 2026-11-18
**Status:** approved, implemented

## Intent

A single git repo that reproduces the working environment — shell, terminal,
git, and the OpenCode/LLM configuration — on Debian, Fedora, or macOS, without
per-machine hand-editing.

The trigger case: a fresh OS install, or a second machine, where the current
setup would otherwise be rebuilt from memory over a weekend.

## Goals

- One command bootstraps a working environment on a bare machine.
- The same repo works unchanged on Debian, Fedora, and macOS.
- Nothing breaks when a tool is missing — it degrades, silently.
- No secret ever enters git history.
- A container of machine-specific settings exists and is obviously the right
  place for them.
- A human can read every line that executes.

## Non-goals

- Not a full system image. No kernel, no drivers, no desktop environment.
- Not a package-version lockfile. Package lists are "install if missing",
  not "pin to version X".
- Not a backup tool for personal files.
- Not an editor-config manager. nvim and VS Code stay in their own repos.
- Not a Nix/chezmoi wrapper. No framework dependency.

## Anti-goals

Things that would make this a failure even if it technically runs:

- Bootstrap requires a framework installed first (defeats the bare-machine case).
- Config files drift away from the repo because something regenerates them
  in place.
- A new tool needs adding in three places instead of one.
- Secrets end up in a commit "just this once".
- The shell prints errors on a machine with a partial toolset.

## Decisions

### Plain git + symlinks (mine, overrulable)

Rejected chezmoi and Nix Home Manager. Both are better at templating and
reproduction; both require being installed before anything works, which
breaks the bare-machine requirement. Symlinks mean one source of truth and
no sync step.

Cost accepted: no per-host value interpolation in plain files. Mitigated by
one gitignored fragment and one rendered template.

### Fragments over one big file

`.zshrc` sources `zshrc.d/*.zsh` in lexical order. Numbering carries intent:
`00` bootstrap, `10-30` environment, `40-45` aliases, `50-56` OS-specific,
`90` local. A new tool is added once, in the file for its concern.

### Guard, never assume

- Aliases for optional binaries are defined inside `command -v` tests.
- The `plugins=(...)` array only lists plugins whose directory exists.
- OS fragments `return 0` unless `/etc/os-release` matches.
- Tool initialisers (`zoxide`, `atuin`, `broot`) are conditional.
- `brew shellenv` probes Linuxbrew, Apple Silicon, and Intel prefixes.

### Secrets are rendered

`config/opencode/opencode.json.tmpl` holds `${PLACEHOLDER}` tokens.
Bootstrap substitutes from `secrets/.env` (gitignored, mode 600) into the
generated `opencode.json` (also gitignored). Rendering uses `sed` only, so
GNU and BSD userland behave the same.

Consequence: `opencode.json` is not editable in place. Documented in the
README; `./bootstrap.sh --only opencode` regenerates.

### Symlink the directory, not the files

`~/.config/opencode` and `~/.config/ghostty` are directory symlinks, not
per-file links. `node_modules`, shaders, and future subdirectories come along
for free. The repo carries a `.gitignore` for the parts that must not be
tracked.

### Machine-local escape hatch

`config/zsh/zshrc.d/90-local.zsh` — gitignored, created by bootstrap from an
example. Everything that only makes sense on one box goes there.

## Left to the builder

- Exact package names per distro (they drift; the installer tolerates misses).
- Whether to bundle fonts (decided: no, licensing; documented instead).
- Which OpenCode skills are worth carrying (decided: all of `skills/`).
- Adding further OSes: write `packages/<os>.txt`, add a `50-distro-<os>.zsh`,
  extend `detect_os`.

## Fidelity: the original config is the specification

The baseline is `~/.zshrc.anoraK.bak.20261118-083135` (317 lines). The
fragments reproduce it rather than improve it. Verified byte-equal against a
shell loading the original: `PATH` (after dedup), `setopt`, `bindkey`,
`zstyle`, the `plugins` array, and 380 of 387 `alias` entries.

Six deltas remain. Each is deliberate; none should be "tidied up" later
without asking.

| Item | Original | Now | Why |
|---|---|---|---|
| `spf` | `alias spf='spf'` | not defined | self-recursive; expanded to itself forever |
| `aptfix` | alias, one long line | function, same steps | readable; identical effect |
| `mkdirp` | `mkdir -p && cd` | function that makes the dir, then cds | original created nothing |
| `cpuinfo` | `lscpu \| head -20` | `lscpu … \|\| sysctl …` | `lscpu` absent on macOS |
| `diskinfo` | `lsblk -f` | `lsblk … \|\| df -h` | `lsblk` absent on macOS |
| `meminfo` | `free -h` | `free … \|\| vm_stat` | `free` absent on macOS |
| `listening` / `ports` | `ss -…` | `ss … \|\| netstat` / `lsof` | `ss` absent on macOS |

On Linux the `||` branch never runs, so the visible behaviour is unchanged
apart from suppressed stderr when the primary command is missing.

Deliberately *not* reproduced: `GHIDRA_INSTALL_DIR` pointed at
`/opt/ghidra/ghidra_12.1.4_PUBLIC`, a path that does not exist. It is now
set only when a build is actually found. `GHIDRA_HOME` is unchanged.

## Known sharp edges

- `alias grep='rg'` — this is the original's behaviour, reproduced on
  purpose. `rg` is not a drop-in replacement for GNU grep; flags such as
  `-P`, `-r`, and some `-o` combinations differ. Use `\grep` for the real
  binary.
- `alias cat='bat --paging=never'` only exists when `bat`/`batcat` is present.
- Third-party zsh plugins and the prompt theme are **cloned, never edited**.
  `macos-zsh-theme` is upstream `alejandromume/macos-zsh-theme` (MIT) and is
  left byte-identical so `git pull` inside it stays clean. Its `last -1 -R`
  banner mis-parses fields and prints a stray line on Debian, and the
  `export PS1` line is a no-op in zsh — both are upstream bugs, deliberately
  not patched. If fixed, they belong in a `zshrc.d/` override, not in the
  theme checkout.
- `opencode.json` regeneration overwrites in-place edits. Edit the `.tmpl`.
