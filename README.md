# shell-core-tools

A collection of lightweight shell utilities for everyday terminal workflows.

## Tools

| Tool | Description |
|------|-------------|
| [backup](./backup/) | Quick file/directory backup and restore via tar.gz |
| [dirmarks](./dirmarks/) | Bookmark directories and jump between them instantly |
| [shell-stash](./shell-stash/) | Temporary stash space for files and directories |

## Installation

`backup` and `shell-stash` are standalone scripts. `dirmarks` must be sourced because it uses `cd` internally.

### backup / shell-stash

Make the scripts executable and add them to your `PATH`:

```zsh
chmod +x /path/to/shell-core-tools/backup/backup.sh
chmod +x /path/to/shell-core-tools/shell-stash/shell-stash.sh
```

### dirmarks

Source `dirmarks.fnc` in your `~/.zshrc` (or `~/.bashrc`):

```zsh
source /path/to/shell-core-tools/dirmarks/dirmarks.fnc
```

Then reload your shell:

```zsh
source ~/.zshrc
```

## Requirements

- **zsh** or **bash**
- **fzf** — required by `dirmarks` (`marks` command)
- **peco** — required by `shell-stash` (interactive pop)
