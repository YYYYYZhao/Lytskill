# Lytskill

用于跨境电商业务的 skills。

- `lyt-problem-clarifier`：问题追问，先问用户做了哪些动作和数据断点，再决定如何诊断。
- `lyt-problem-diagnosis`：跨境电商问题定位，判断不出单、没流量、广告跑不出去等问题卡在哪个环节。
- `lyt-product-selection`：选品诊断、候选品筛选和低成本验证方案。
- `lyt-data-analysis`：电商数据诊断，基于 GMV 拆解定位问题，并给出可执行的下一步动作。

## 如何安装 Lytskill

#### Claude Code

```bash
claude plugin marketplace add YYYYYZhao/Lytskill
claude plugin install lyt@lytskill
```

#### 通用安装方式（适用于 Codex / Claude Code）

```bash
npx -y skills add YYYYYZhao/Lytskill -g --all
```

#### Trae Solo

Trae Solo 一个 zip 装一个 skill。从 [GitHub Releases](https://github.com/YYYYYZhao/Lytskill/releases) 下载最新的 `lytskill-版本号.zip`，解压后里面是 4 个独立的 skill zip（每个 zip 解压后根级是 `SKILL.md`），逐个拖进 Trae Solo 的「上传技能」窗口即可。

如果想本地构建，运行 `bash tools/build-skills.sh`，产物在 `dist/skills/`。

## 如何更新 Lytskill

#### Claude Code 插件市场安装的用户

```bash
claude plugin marketplace update lytskill
claude plugin update lyt@lytskill
/reload-plugins
```

#### 通过 `npx skills add` 安装的用户

重新运行一次同样的命令即可。安装和更新用的是同一条命令。

```bash
npx -y skills add YYYYYZhao/Lytskill -g --all
```
