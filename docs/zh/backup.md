# backup

一个将文件或目录打包为带时间戳 `.tar.gz` 归档的轻量级 Shell 脚本。

备份文件名自动生成为 `bk_YYYYMMDD_<名称>.tar.gz` 的格式。

## 安装

赋予脚本执行权限，并添加到 `PATH`：

```bash
chmod +x /path/to/shell-core-tools/backup/backup.sh
```

在 `~/.zshrc` 或 `~/.bashrc` 中添加：

```bash
export PATH="/path/to/shell-core-tools/backup:$PATH"
```

## 命令

| 命令 | 说明 |
|------|------|
| `backup.sh bk <文件>` | 创建备份归档 |
| `backup.sh bkrm <文件>` | 创建备份归档后删除原文件 |
| `backup.sh kb <文件>` | 从备份归档还原 |
| `backup.sh kbrm <文件>` | 还原后删除归档文件 |

## 使用示例

### 备份文件或目录

```bash
backup.sh bk mydir
# => 生成 bk_20260522_mydir.tar.gz
```

### 备份并删除原文件

```bash
backup.sh bkrm config.json
# 打包归档后删除 config.json
```

### 从备份还原

```bash
backup.sh kb bk_20260522_mydir.tar.gz
# => mydir 被还原
```

### 还原并删除归档

```bash
backup.sh kbrm bk_20260522_mydir.tar.gz
# 还原 mydir 后删除归档文件
```
