# Lytskill

Lytskill 是一组面向 TikTok Shop / 跨境电商运营的 Agent skills。

它不是用来直接给「万能答案」的，而是帮你把模糊问题拆成可诊断的问题，把选品判断变成可验证的假设，把后台数据转成下一步动作。

可在 Claude Code、Codex、Cursor、Trae Solo 等支持 skill / system prompt 的 Agent 上使用。

**最新版本：v1.2.1**

**v1.2.1 更新：**重点强化 `lyt-problem-clarifier` 和 `lyt-data-analysis` 对 TikTok Shop 商品成交额最大化广告，也就是 GMV Max 低消耗场景的判断边界，同时补全本仓库 README 的 skill 使用说明。

这次更新集中在 5 个方向：

- GMV Max 低消耗：不再套普通广告的地区、人群、出价方式、投放目标逻辑，改为围绕预算、投入产出比目标、产品选择、素材选择和实际消耗数据判断。
- 广告状态追问：用户没有主动提到审核中、受限、拒审或异常提示时，默认按正常投放中处理，不主动追问广告状态。
- 无视频素材场景：用户已经说明没视频素材时，直接按无可用视频素材处理，不再追问「素材是系统自动选还是自己没选」。
- 商品卡搜索入口：GMV Max 无素材且商品卡没有流量时，优先判断标题关键词、核心搜索词、商品卡自然曝光和真实搜索需求，不只归因为投入产出比目标偏紧。
- README 文档：补充每个 skill 的用途、适合场景、触发方式、示例、典型工作流和安装更新说明。

## 安装与更新

最简单的方式是直接把全部 skills 安装到本机：

```bash
npx -y skills add YYYYYZhao/Lytskill -g --all
```

如果你使用 Claude Code 插件市场，可以先添加仓库，再安装插件：

```bash
claude plugin marketplace add YYYYYZhao/Lytskill
claude plugin install lyt@lytskill
```

后续更新时，按你的安装方式处理：

| 安装方式 | 更新方式 |
|---|---|
| `npx skills add` | 重新运行同一条 `npx -y skills add YYYYYZhao/Lytskill -g --all` |
| Claude Code 插件 | 运行插件市场更新命令，然后重载插件 |

Claude Code 插件更新命令：

```bash
claude plugin marketplace update lytskill
claude plugin update lyt@lytskill
/reload-plugins
```

需要给 Trae Solo 使用时，可以下载 Release 里的压缩包。Trae Solo 通常按单个 skill 导入，解压后把每个独立 skill 包分别上传即可。

本地构建压缩包：

```bash
bash tools/build-skills.sh
```

构建产物会放在：

```text
dist/skills/
```

## 适合解决什么问题

- 不出单、没流量、广告低消耗、突然下滑，不知道先查哪里
- 不知道选什么产品，或已有候选品但不知道哪个值得测
- 有表格、截图、后台数据，但不知道问题到底卡在曝光、点击、成交还是客单价
- 想训练 Agent 按跨境电商业务逻辑追问、诊断和输出行动方案

## Skills 总览

| Skill | 用途 | 适合场景 |
|---|---|---|
| `lyt-problem-clarifier` | 问题追问 | 用户只给一句「为什么不出单 / 为什么没流量 / 为什么广告跑不出去」时，先追问动作和数据断点 |
| `lyt-product-selection` | 选品诊断 | 从 0 选品、类目拆解、候选品筛选、单品能不能测、表格批量筛选 |
| `lyt-data-analysis` | 数据分析诊断 | 根据截图、CSV/XLSX、后台数据、业务描述，拆解 GMV 变量并输出下一步动作 |

## 仓库结构

```text
Lytskill/
├── README.md
├── VERSION
├── skills/
│   ├── lyt-problem-clarifier/
│   │   └── SKILL.md
│   ├── lyt-product-selection/
│   │   └── SKILL.md
│   └── lyt-data-analysis/
│       └── SKILL.md
├── tools/
└── dist/
```

## 推荐使用顺序

```text
模糊问题
  ↓
lyt-problem-clarifier
  ↓
补齐动作和数据断点
  ↓
lyt-data-analysis
  ↓
输出诊断和行动项
```

```text
不知道做什么产品
  ↓
lyt-product-selection
  ↓
阶段分诊 / 能力分诊 / 候选品池
  ↓
lyt-data-analysis
  ↓
用测试数据继续判断
```

## 使用提醒

- 不承诺收益，不输出「必爆」「稳赚」这类结论
- 平台规则、佣金、物流、禁限售等可能变化的信息，需要以官方或后台最新来源为准
- 数据越少，结论越保守
- 追问不是拖延，是为了避免把结果当原因
