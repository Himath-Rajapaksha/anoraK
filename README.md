# anoraK

One repo that rebuilds my whole terminal environment — shell, terminal,
git, and the OpenCode/LLM setup — on Debian, Fedora, or macOS.

Not a backup. A recipe.

```sh
git clone git@github.com:Himath-Rajapaksha/anoraK.git ~/Works/anoraK
cd ~/Works/anoraK
./bootstrap.sh --dry-run     # see what it would do
./bootstrap.sh               # do it
exec zsh -l
```

## What it covers

| Layer | Source | Lands at |
|---|---|---|
| Shell | `config/zsh/` | `~/.zshrc`, `~/.zshenv` |
| Zsh plugins | `config/zsh/custom-plugins.txt` | `~/.oh-my-zsh/custom/plugins/` (cloned) |
| Prompt theme | `config/zsh/custom-themes.txt` | `~/.oh-my-zsh/custom/themes/` (cloned) |
| Terminal | `config/ghostty/` | `~/.config/ghostty/` |
| Git | `config/git/gitconfig` | `~/.gitconfig` |
| OpenCode | `config/opencode/` | `~/.config/opencode/` |
| Packages | `packages/<os>.txt` | apt / dnf / brew |

## The three rules that make it portable

**1. Everything is guarded.**
No alias, PATH entry, or tool-init runs unless its binary or directory
actually exists. A bare Fedora box with no `eza`, `atuin`, or `broot`
sources every file without a single error.

**2. Secrets are rendered, never stored.**
`config/opencode/opencode.json` is generated from `opencode.json.tmpl` at
bootstrap time, substituting values from `secrets/.env` (gitignored,
`chmod 600`). The template holds `${PLACEHOLDER}` only. Nothing in git has
ever contained a token.

**3. Machine-specific things have one home.**
`config/zsh/zshrc.d/90-local.zsh` is gitignored. Work VPN paths, per-host
helpers, hardware quirks — that file, and nowhere else.

## Layout

```
bootstrap.sh              single entry point, idempotent
lib/                      bootstrap internals (log, detect, link, packages, fonts, render, opencode)
packages/{debian,fedora,macos}.txt
config/
  zsh/
    .zshrc                entrypoint: loads zshrc.d/*.zsh in order
    .zshenv               tiny, runs for every zsh
    custom-plugins.txt    upstream clones, never edited here
    custom-themes.txt
    zshrc.d/
      00-omz.zsh          oh-my-zsh, optional
      10-env.zsh          editor, pager, locale
      20-paths.zsh        PATH, brew, go, nvm, sdkman, ghidra
      30-tools.zsh        zoxide, atuin, broot, direnv (guarded)
      40-aliases.zsh      universal aliases
      45-aliases-modern.zsh  eza/bat/rg aliases — only if installed
      50-distro-debian.zsh
      51-distro-fedora.zsh
      52-distro-macos.zsh
      54-linux-system.zsh systemd, kernel modules
      56-macos-system.zsh launch/mDNS/pmset
      90-local.zsh        machine-only (gitignored)
  ghostty/
  git/
  opencode/
secrets/.env.example
fonts/
```

## Phases

```sh
./bootstrap.sh --only shell       # just relink zsh
./bootstrap.sh --only opencode    # re-render opencode.json
./bootstrap.sh --no-packages      # skip apt/dnf/brew
sudo ./bootstrap.sh --user anorak # install for another user
```

Every phase is safe to re-run. Existing files are moved to
`<name>.anoraK.bak.<timestamp>` — never deleted.

## Editing config

The real files *are* the repo files (they are symlinked into place), so
edit `config/zsh/zshrc.d/40-aliases.zsh` and run `exec zsh -l`.

The one exception is `config/opencode/opencode.json`. It is generated.
Edit `config/opencode/opencode.json.tmpl`, then:

```sh
./bootstrap.sh --only opencode
```

## After a fresh install

1. `cp secrets/.env.example secrets/.env` — already done by bootstrap; fill it in
2. `gh auth login` (the git credential helper uses `gh`)
3. `exec zsh -l`
4. Add anything host-specific to `config/zsh/zshrc.d/90-local.zsh`

## Deliberate non-goals

- No Nix, no chezmoi, no dotfile framework. Plain git and `ln -s`.
  It has to run on a machine with nothing installed.
- No font binaries (licensing).
- No `node_modules`, build output, or install state.
- No editor configs beyond what the shell needs. nvim/VS Code stay their
  own repos.
