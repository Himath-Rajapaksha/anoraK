# fonts/

No font binaries live here — they are licensed, and every OS installs them
from its own package source instead.

If you want a specific font pinned across machines, drop the `.ttf` / `.otf`
files in this directory and run:

```sh
./bootstrap.sh --only fonts
```

They will be copied into:

- Linux: `~/.local/share/fonts` then `fc-cache -f`
- macOS: `~/Library/Fonts`

Do check the font's licence allows redistribution before committing it.
Ubuntu Mono (the one the Ghostty config asks for) is under the Ubuntu Font
Licence and is available as a package on all three targets:

| OS     | Package                          |
|--------|----------------------------------|
| Debian | `fonts-ubuntu`                   |
| Fedora | `fonts-ubuntu-mono`              |
| macOS  | `font-ubuntu-mono-nerd-font`     |
