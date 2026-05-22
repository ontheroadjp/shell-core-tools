# backup

A minimal shell utility for backing up and restoring files/directories as `.tar.gz` archives.

Backup filenames are automatically timestamped: `bk_YYYYMMDD_<name>.tar.gz`.

## Installation

Make the script executable and add it to your `PATH`:

```bash
chmod +x /path/to/shell-core-tools/backup/backup.sh
```

Add to `PATH` (add this line to your `~/.zshrc` or `~/.bashrc`):

```bash
export PATH="/path/to/shell-core-tools/backup:$PATH"
```

## Commands

| Command | Description |
|---------|-------------|
| `backup.sh bk <file>` | Create a backup archive |
| `backup.sh bkrm <file>` | Create a backup archive, then remove the original |
| `backup.sh kb <file>` | Restore from a backup archive |
| `backup.sh kbrm <file>` | Restore from a backup archive, then remove the archive |

## Usage

### Backup a file or directory

```bash
backup.sh bk mydir
# => bk_20260522_mydir.tar.gz
```

### Backup and remove the original

```bash
backup.sh bkrm config.json
# config.json is archived and then deleted
```

### Restore from a backup

```bash
backup.sh kb bk_20260522_mydir.tar.gz
# => mydir is restored
```

### Restore and remove the archive

```bash
backup.sh kbrm bk_20260522_mydir.tar.gz
# mydir is restored, archive is deleted
```
