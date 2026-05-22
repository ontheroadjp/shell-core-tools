# dirmarks

ディレクトリを1文字のエイリアスでブックマークし、瞬時にジャンプできるシェルユーティリティです。

マークは `~/.local/share/dirmarks/`（または `$DIRMARKS_DATA_DIR`）に保存されます。

::: warning 注意
`dirmarks` は内部で `cd` を使用するため、スタンドアロンスクリプトとしては動作しません。必ず **ソース** して使用してください。
:::

## インストール

`dirmarks.fnc` を `~/.zshrc` または `~/.bashrc` でソースします。

```bash
source /path/to/shell-core-tools/dirmarks/dirmarks.fnc
```

シェルをリロード：

```bash
source ~/.zshrc
```

データディレクトリを変更する場合：

```bash
export DIRMARKS_DATA_DIR="$HOME/.config/dirmarks"
```

## コマンド

### ディレクトリをマークする

文字を2回打つと、現在のディレクトリをマークします。

| コマンド | 登録するマーク |
|---------|--------------|
| `mm` | `m` |
| `nn` | `n` |
| `jj` | `j` |
| `kk` | `k` |
| `ll` | `l` |
| `ii` | `i` |
| `oo` | `o` |
| `uu` | `u` |

### マークしたディレクトリにジャンプ

1文字を打つとジャンプします。

| コマンド | 動作 |
|---------|------|
| `m` | `m` としてマークしたディレクトリへジャンプ |
| `n` | `n` としてマークしたディレクトリへジャンプ |
| `j` ～ `u` | 同様 |

### インタラクティブジャンプ

```bash
marks   # fzf でマーク一覧から選択してジャンプ（fzf が必要）
```

## 使用例

```bash
# ~/Projects/myapp を 'm' としてマーク
$ cd ~/Projects/myapp
$ mm
markd!

# 別の場所へ移動
$ cd /tmp

# マーク先へジャンプ
$ m
# => ~/Projects/myapp に戻る
```

## 必要なツール

- `fzf` — `marks` コマンドに必要
