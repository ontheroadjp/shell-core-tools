# dirmarks

一个使用单字母别名为目录添加书签并快速跳转的 Shell 工具。

标记保存在 `~/.local/share/dirmarks/`（或 `$DIRMARKS_DATA_DIR`）中。

::: warning 注意
`dirmarks` 内部使用 `cd`，无法作为独立脚本运行。必须通过 **source** 加载使用。
:::

## 安装

在 `~/.zshrc` 或 `~/.bashrc` 中 source `dirmarks.fnc`：

```bash
source /path/to/shell-core-tools/dirmarks/dirmarks.fnc
```

重新加载 Shell：

```bash
source ~/.zshrc
```

自定义数据目录（可选）：

```bash
export DIRMARKS_DATA_DIR="$HOME/.config/dirmarks"
```

## 命令

### 标记目录

连续输入两次字母，将当前目录注册为对应标记：

| 命令 | 注册的标记 |
|------|-----------|
| `mm` | `m` |
| `nn` | `n` |
| `jj` | `j` |
| `kk` | `k` |
| `ll` | `l` |
| `ii` | `i` |
| `oo` | `o` |
| `uu` | `u` |

### 跳转到标记目录

输入单个字母即可跳转：

| 命令 | 动作 |
|------|------|
| `m` | 跳转到标记为 `m` 的目录 |
| `n` | 跳转到标记为 `n` 的目录 |
| `j` ～ `u` | 同上 |

### 交互式跳转

```bash
marks   # 通过 fzf 从所有标记中选择并跳转（需要 fzf）
```

## 使用示例

```bash
# 将 ~/Projects/myapp 标记为 'm'
$ cd ~/Projects/myapp
$ mm
markd!

# 移动到其他目录
$ cd /tmp

# 跳回标记目录
$ m
# => 回到 ~/Projects/myapp
```

## 依赖

- `fzf` — `marks` 命令所需
