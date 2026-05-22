# shell-stash

A temporary stash for files and directories in the shell. Move items into the stash from any directory and pop them back out when needed.

Stash location is controlled by the `$SHELL_STASH_DATA_DIR` environment variable.

## Installation

```zsh
chmod +x /path/to/shell-core-tools/shell-stash/shell-stash.sh
```

Optionally add to your `PATH`.

The stash directory defaults to `~/.local/share/shell-stash/`. Override with `$SHELL_STASH_DATA_DIR`:

## Usage

| Command | Description |
|---------|-------------|
| `ss` | List contents of the stash |
| `ss <file>` | Move a file/directory into the stash |
| `ss -c <file>` | Copy a file/directory into the stash |
| `ss p [file]` | Pop a file/directory out of the stash (interactive with fzf if no name given) |
| `ss -c p [file]` | Copy a file/directory out of the stash |
| `ss a` | Pop all items out of the stash |
| `ss e` | Empty (delete all contents of) the stash |

## Examples

```zsh
# Put a file into the stash
$ ss notes.txt
put: notes.txt

# List stash contents
$ ss
-rw-r--r--  notes.txt
1 item(s) in Shell Stash.

# Pop a file back out interactively
$ ss p
# (fzf opens to select the file)
pop: notes.txt

# Empty the stash
$ ss e
empty shell stash.
```

## Requirements

- `fzf` — required for interactive pop (`ss p` without a filename)
