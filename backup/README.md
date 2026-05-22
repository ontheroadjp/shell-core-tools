# backup

A minimal shell utility for backing up and restoring files/directories as `.tar.gz` archives.

Backup filenames are automatically timestamped: `bk_YYYYMMDD_<name>.tar.gz`.

## Installation

```zsh
chmod +x /path/to/shell-core-tools/backup/backup.sh
```

Optionally add to your `PATH`.

## Usage

```zsh
backup.sh bk   <file>   # backup
backup.sh bkrm <file>   # backup then remove original
backup.sh kb   <file>   # restore from backup
backup.sh kbrm <file>   # restore then remove backup
```

## Examples

```zsh
$ bk mydir
backed up. (mydir >>> bk_20260522_mydir.tar.gz)

$ bkrm config.json
backed up. (config.json >>> bk_20260522_config.json.tar.gz)

$ kb bk_20260522_mydir.tar.gz
Restored. (bk_20260522_mydir.tar.gz)
```
