# Lytskill

两个用于 TikTok Shop 和电商工作的 Codex skills。

- `lyt-product-selection`：选品诊断、候选品筛选和低成本验证方案。
- `lyt-data-analysis`：电商数据诊断，基于 GMV 拆解定位问题，并给出可执行的下一步动作。

## 安装两个 Skills

运行下面这条命令，会自动把两个 skill 安装到 Codex 的全局 skills 目录 `~/.codex/skills`，不需要手动复制文件。

如果本地已经安装过旧版本，这条命令会先删除旧版本，再安装 GitHub 上的最新版本：

```bash
rm -rf ~/.codex/skills/lyt-product-selection ~/.codex/skills/lyt-data-analysis && \
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo YYYYYZhao/Lytskill \
  --path skills/lyt-product-selection skills/lyt-data-analysis \
  --dest ~/.codex/skills
```

安装完成后，重新打开 Codex，让新 skill 被加载。
