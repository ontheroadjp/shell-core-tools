# dirmarks

A shell utility for bookmarking directories and jumping between them with single-letter aliases.

Marks are persisted to `~/.local/share/dirmarks/` (or `$DIRMARKS_DATA_DIR` if set).

::: warning Note
`dirmarks` uses `cd` internally and must be **sourced** — it cannot run as a standalone script.
:::

## Installation

Source `dirmarks.fnc` in your `~/.zshrc` or `~/.bashrc`:

```bash
source /path/to/shell-core-tools/dirmarks/dirmarks.fnc
```

Then reload your shell:

```bash
source ~/.zshrc
```

Optionally, override the data directory:

```bash
export DIRMARKS_DATA_DIR="$HOME/.config/dirmarks"
```

## Commands

### Marking a directory

Double the letter to mark the current directory:

| Command | Registers mark |
|---------|---------------|
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

| Command | Action |
|---------|--------|
| `m` | Jump to directory marked as `m` |
| `n` | Jump to directory marked as `n` |
| `j` | Jump to directory marked as `j` |
| `k` | Jump to directory marked as `k` |
| `l` | Jump to directory marked as `l` |
| `i` | Jump to directory marked as `i` |
| `o` | Jump to directory marked as `o` |
| `u` | Jump to directory marked as `u` |

### Interactive jump

```bash
marks   # fuzzy-select from all marked directories (requires fzf)
```

## Usage

```bash
# Mark ~/Projects/myapp as 'm'
$ cd ~/Projects/myapp
$ mm
markd!

# Go somewhere else
$ cd /tmp

# Jump back
$ m
# => ~/Projects/myapp
```

## Requirements

- `fzf` — required for the `marks` interactive command
