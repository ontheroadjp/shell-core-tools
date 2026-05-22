# backup

ファイルやディレクトリをタイムスタンプ付きの `.tar.gz` アーカイブとしてバックアップ・リストアするシェルスクリプトです。

バックアップファイル名は自動的に `bk_YYYYMMDD_<名前>.tar.gz` の形式になります。

## インストール

スクリプトに実行権限を付与し、`PATH` に追加します。

```bash
chmod +x /path/to/shell-core-tools/backup/backup.sh
```

`~/.zshrc` または `~/.bashrc` に追加：

```bash
export PATH="/path/to/shell-core-tools/backup:$PATH"
```

## コマンド

| コマンド | 説明 |
|---------|------|
| `backup.sh bk <ファイル>` | バックアップアーカイブを作成 |
| `backup.sh bkrm <ファイル>` | バックアップを作成し、元ファイルを削除 |
| `backup.sh kb <ファイル>` | バックアップからリストア |
| `backup.sh kbrm <ファイル>` | リストア後、アーカイブを削除 |

## 使い方

### ファイル・ディレクトリをバックアップ

```bash
backup.sh bk mydir
# => bk_20260522_mydir.tar.gz が作成される
```

### バックアップして元ファイルを削除

```bash
backup.sh bkrm config.json
# アーカイブ作成後、config.json を削除
```

### バックアップからリストア

```bash
backup.sh kb bk_20260522_mydir.tar.gz
# => mydir がリストアされる
```

### リストアしてアーカイブを削除

```bash
backup.sh kbrm bk_20260522_mydir.tar.gz
# mydir をリストアし、アーカイブを削除
```
