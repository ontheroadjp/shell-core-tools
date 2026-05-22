# shell-stash

シェル上のファイル・ディレクトリ用一時スタッシュです。どのディレクトリからでもスタッシュに放り込み、必要なときに取り出せます。

## インストール

スクリプトに実行権限を付与します。

```bash
chmod +x /path/to/shell-core-tools/shell-stash/shell-stash.sh
```

`PATH` に追加（`~/.zshrc` または `~/.bashrc`）：

```bash
export PATH="/path/to/shell-core-tools/shell-stash:$PATH"
```

スタッシュディレクトリはデフォルトで `~/.local/share/shell-stash/` です。変更する場合：

```bash
export SHELL_STASH_DATA_DIR="$HOME/my-stash"
```

## コマンド

| コマンド | 説明 |
|---------|------|
| `shell-stash.sh` | スタッシュの内容を一覧表示 |
| `shell-stash.sh <ファイル>` | ファイル/ディレクトリをスタッシュに移動 |
| `shell-stash.sh -c <ファイル>` | ファイル/ディレクトリをスタッシュにコピー |
| `shell-stash.sh p [ファイル]` | スタッシュからファイルを取り出す |
| `shell-stash.sh -c p [ファイル]` | スタッシュからファイルをコピーで取り出す |
| `shell-stash.sh a` | スタッシュ内の全ファイルを取り出す |
| `shell-stash.sh e` | スタッシュを空にする（全削除） |

::: tip インタラクティブ取り出し
ファイル名なしで `shell-stash.sh p` を実行すると、`peco` でインタラクティブに選択できます。
:::

## 使用例

### スタッシュにファイルを入れる

```bash
$ shell-stash.sh notes.txt
put: notes.txt
```

### スタッシュの内容を確認

```bash
$ shell-stash.sh
-rw-r--r--  notes.txt
1 item(s) in Shell Stash.
```

### スタッシュからファイルを取り出す

```bash
# ファイル名指定
$ shell-stash.sh p notes.txt
pop: notes.txt

# インタラクティブ（peco が必要）
$ shell-stash.sh p
```

### 全ファイルを取り出す

```bash
$ shell-stash.sh a
pop all file/directory
```

### スタッシュを空にする

```bash
$ shell-stash.sh e
empty shell stash.
```

### コピーモード

```bash
$ shell-stash.sh -c mydir    # コピーして入れる（元ファイルは残る）
$ shell-stash.sh -c p mydir  # コピーして取り出す（スタッシュにも残る）
```

## 重複ファイルの扱い

同名ファイルがすでにスタッシュにある場合、`file-1`、`file-2`... のように連番サフィックスが付与されます（最大99）。

## 必要なツール

- `peco` — ファイル名なしの `shell-stash.sh p` に必要
