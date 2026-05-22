# shell-stash

Shell 中的临时文件暂存区。可以从任意目录将文件或目录放入暂存，需要时再取出。

## 安装

赋予脚本执行权限：

```bash
chmod +x /path/to/shell-core-tools/shell-stash/shell-stash.sh
```

添加到 `PATH`（在 `~/.zshrc` 或 `~/.bashrc` 中）：

```bash
export PATH="/path/to/shell-core-tools/shell-stash:$PATH"
```

暂存目录默认为 `~/.local/share/shell-stash/`。如需自定义：

```bash
export SHELL_STASH_DATA_DIR="$HOME/my-stash"
```

## 命令

| 命令 | 说明 |
|------|------|
| `shell-stash.sh` | 列出暂存区内容 |
| `shell-stash.sh <文件>` | 将文件/目录移入暂存区 |
| `shell-stash.sh -c <文件>` | 将文件/目录复制到暂存区 |
| `shell-stash.sh p [文件]` | 从暂存区取出文件/目录 |
| `shell-stash.sh -c p [文件]` | 从暂存区复制取出文件/目录 |
| `shell-stash.sh a` | 取出暂存区中的全部内容 |
| `shell-stash.sh e` | 清空暂存区（全部删除） |

::: tip 交互式取出
不指定文件名直接运行 `shell-stash.sh p`，将通过 `peco` 进行交互式选择。
:::

## 使用示例

### 将文件放入暂存区

```bash
$ shell-stash.sh notes.txt
put: notes.txt
```

### 查看暂存区内容

```bash
$ shell-stash.sh
-rw-r--r--  notes.txt
1 item(s) in Shell Stash.
```

### 从暂存区取出文件

```bash
# 指定文件名
$ shell-stash.sh p notes.txt
pop: notes.txt

# 交互式选择（需要 peco）
$ shell-stash.sh p
```

### 取出全部内容

```bash
$ shell-stash.sh a
pop all file/directory
```

### 清空暂存区

```bash
$ shell-stash.sh e
empty shell stash.
```

### 复制模式

```bash
$ shell-stash.sh -c mydir    # 复制放入，原文件保留
$ shell-stash.sh -c p mydir  # 复制取出，暂存区中保留
```

## 重名文件处理

若暂存区中已存在同名文件，将自动添加数字后缀（`file-1`、`file-2`……最多 99 个）。

## 依赖

- `peco` — 不指定文件名时的 `shell-stash.sh p` 所需
