# Lytskill

两个用于 TikTok Shop 和电商工作的 Codex skills。

- `lyt-product-selection`：选品诊断、候选品筛选和低成本验证方案。
- `lyt-data-analysis`：电商数据诊断，基于 GMV 拆解定位问题，并给出可执行的下一步动作。

## 安装两个 Skills

这个仓库发布到 GitHub 后，可以用一条命令同时安装两个 skill：

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo YYYYYZhao/Lytskill \
  --path skills/lyt-product-selection skills/lyt-data-analysis
```

安装完成后，重启 Codex。
