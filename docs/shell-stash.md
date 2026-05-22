# shell-stash

A temporary stash for files and directories in the shell. Move items into the stash from any directory and pop them back out when needed.

## Installation

Make the script executable:

```bash
chmod +x /path/to/shell-core-tools/shell-stash/shell-stash.sh
```

Optionally add to your `PATH`:

```bash
export PATH="/path/to/shell-core-tools/shell-stash:$PATH"
```

The stash directory defaults to `~/.local/share/shell-stash/`. Override with `$SHELL_STASH_DATA_DIR`:

```bash
export SHELL_STASH_DATA_DIR="$HOME/my-stash"
```

## Commands

| Command | Description |
|---------|-------------|
| `shell-stash.sh` | List contents of the stash |
| `shell-stash.sh <file>` | Move a file/directory into the stash |
| `shell-stash.sh -c <file>` | Copy a file/directory into the stash |
| `shell-stash.sh p [file]` | Pop a file/directory out of the stash |
| `shell-stash.sh -c p [file]` | Copy a file/directory out of the stash |
| `shell-stash.sh a` | Pop all items out of the stash |
| `shell-stash.sh e` | Empty (delete all contents of) the stash |

::: tip Interactive pop
Running `shell-stash.sh p` without a filename opens an interactive selector via `fzf`.
:::

## Usage

### Put a file into the stash

```bash
$ shell-stash.sh notes.txt
put: notes.txt
```

### List stash contents

```bash
$ shell-stash.sh
-rw-r--r--  notes.txt
1 item(s) in Shell Stash.
```

### Pop a file back out

```bash
# By name
$ shell-stash.sh p notes.txt
pop: notes.txt

# Interactively (requires fzf)
$ shell-stash.sh p
```

### Pop all items

```bash
$ shell-stash.sh a
pop all file/directory
```

### Empty the stash

```bash
$ shell-stash.sh e
empty shell stash.
```

### Copy instead of move

```bash
$ shell-stash.sh -c mydir    # copy into stash, original kept
$ shell-stash.sh -c p mydir  # copy out of stash, stash entry kept
```

## Duplicate handling

If a file with the same name already exists in the stash, it is automatically renamed with a numeric suffix (`file-1`, `file-2`, ...) up to 99 copies.

## Requirements

- `fzf` — required for interactive pop (`shell-stash.sh p` without a filename)
