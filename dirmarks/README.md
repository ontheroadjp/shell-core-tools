# dirmarks

A shell utility for bookmarking directories and jumping between them with single-letter aliases.

Marks are persisted to `~/.local/share/dirmarks/` (or `$DIRMARKS_DATA_DIR` if set).

## Installation

Source `dirmarks.fnc` in your `~/.zshrc` or `~/.bashrc`:

```zsh
source /path/to/shell-core-tools/dirmarks/dirmarks.fnc
```

## Usage

### Marking a directory

Double the letter to mark the current directory:

| Command | Marks current directory as |
|---------|---------------------------|
| `mm` | `m` |
| `nn` | `n` |
| `jj` | `j` |
| `kk` | `k` |
| `ll` | `l` |
| `ii` | `i` |
| `oo` | `o` |
| `uu` | `u` |

### Jumping to a marked directory

Use the single letter to jump:

```zsh
m   # jump to directory marked as 'm'
n   # jump to directory marked as 'n'
# ... and so on for j, k, l, i, o, u
```

### Interactive jump (requires `fzf`)

```zsh
marks   # fuzzy-select from all marked directories and jump
```

## Examples

```zsh
$ cd ~/Projects/myapp
$ mm
markd!

$ cd /tmp
$ m
# back to ~/Projects/myapp
```

## Requirements

- `fzf` — required for the `marks` interactive command
