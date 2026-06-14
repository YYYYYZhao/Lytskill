# Lytskill

Lytskill 是一组面向 TikTok Shop / 跨境电商运营的 Agent skills。

它不是用来直接给「万能答案」的，而是帮你把模糊问题拆成可诊断的问题，把选品判断变成可验证的假设，把后台数据转成下一步动作。

可在 Claude Code、Codex、Cursor、Trae Solo 等支持 skill / system prompt 的 Agent 上使用。

**最新版本：v1.5.0**

## v1.5.0 更新内容

这次版本从 5 个 skill 扩展到 7 个，新增连续学习与知识检验能力，并同步升级主路由、附件处理、诊断口径和打包流程。

### 新增能力

- 新增 `lyt-learning`：把跨境电商、电商经营、选品、广告、数据、内容、供应链、商业模式和 AI 工作流课题拆成连续学习文章，根据用户上一轮反馈调整难度与下一篇方向。
- 新增 `lyt-knowledge-check`：通过真实业务场景题检验用户的结论、证据、因果链、适用边界和最小验证动作，不把复述概念当成真正掌握。
- 建立「学习一小节 → 用户反馈 → 知识检验 → 找到缺口 → 下一篇补缺」的学习闭环。

### 原有 Skills 升级

| Skill | 本次修改 |
|---|---|
| `lyt` | 主路由扩展到 6 个子 skill；新增连续学习、知识检验和附件意图判断；转交时携带已有背景、事实、假设与待验证项，减少重复追问。 |
| `lyt-product-selection` | 补充业务边界、附件处理、阶段分诊、选品边界、候选品池和低成本验证流程；区分事实、推断、假设、决策与置信度。 |
| `lyt-problem-clarifier` | 使用「概念、隐含假设、因果关系、事实前提、信息充分性」五层漏斗，只输出最前面的阻断层，并追问能够推进诊断的最小证据。 |
| `lyt-traffic-logic` | 明确只讲商品卡搜索、短视频推荐、广告/GMV Max、冷启动和成交链路的流量分配逻辑，不替代具体店铺或广告诊断。 |
| `lyt-data-analysis` | 新增数据体检、口径校验、小样本护栏、GMV 四变量、GMV Max、成本利润和竞品分析规则；结论统一拆成事实、推断、假设、决策与置信度。 |

### 输入与判断规则

- 全系列支持文字、截图、图片、CSV、XLSX、表格、PDF、文档和后台导出。
- 附件类型不再直接决定路由；先判断用户要做选品、问题定位、流量学习、数据分析、连续学习还是知识检验。
- 新增结论稳定协议：用户提出不同意见时，先判断属于替代解释、新数据、有效反例、逻辑纠错还是口径纠错，再决定维持、收窄或推翻原结论。
- 涉及平台规则、费用、佣金、物流和政策时，需要核查日期与最新可靠来源。

### 打包与发布

- Claude Code 插件清单已扩展为 7 个 skill。
- `VERSION` 与 marketplace 版本同步升级到 `1.5.0`。
- 构建脚本改为自动发现 `skills/` 下的全部 skill，不再维护固定打包名单。
- 总包包含 7 个可独立导入 Trae Solo 的 zip；每个包保留 `SKILL.md`、`agents/` 和该 skill 自带的 `references/`。

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
- 不知道平台流量是怎么分配的，想先搞清楚搜索、推荐、广告和成交链路的底层逻辑
- 不知道选什么产品，或已有候选品但不知道哪个值得测
- 有表格、截图、后台数据，但不知道问题到底卡在曝光、点击、成交还是客单价
- 想训练 Agent 按跨境电商业务逻辑追问、诊断和输出行动方案
- 想系统学习一个业务课题，并根据每轮反馈持续调整学习内容
- 想用真实场景题检验自己是否真正理解选品、流量、广告、数据和经营判断

## Skills 总览

| Skill | 用途 | 适合场景 |
|---|---|---|
| `lyt` | 主路由 | 用户不确定该用哪个 skill 时，先判断业务边界，再路由到选品、流量逻辑、问题追问、数据分析、连续学习或知识检验 |
| `lyt-problem-clarifier` | 问题追问 | 用户只给一句「为什么不出单 / 为什么没流量 / 为什么广告跑不出去」时，先追问动作和数据断点 |
| `lyt-traffic-logic` | 流量分配逻辑 | 用户想理解店铺、商品、商品卡、短视频、广告为什么有流量或没流量时，先讲清底层分配逻辑 |
| `lyt-product-selection` | 选品诊断 | 从 0 选品、类目拆解、候选品筛选、单品能不能测、表格批量筛选 |
| `lyt-data-analysis` | 数据分析诊断 | 根据截图、CSV/XLSX、后台数据、业务描述，拆解 GMV 变量并输出下一步动作 |
| `lyt-learning` | 连续学习 | 把业务课题拆成连续文章，根据上一轮反馈调整内容、难度和下一步 |
| `lyt-knowledge-check` | 知识检验 | 用真实场景题检验结论、证据、因果链、适用边界和最小验证动作 |

## 仓库结构

```text
Lytskill/
├── README.md
├── VERSION
├── skills/
│   ├── lyt/
│   │   └── SKILL.md
│   ├── lyt-problem-clarifier/
│   │   └── SKILL.md
│   ├── lyt-traffic-logic/
│   │   └── SKILL.md
│   ├── lyt-product-selection/
│   │   └── SKILL.md
│   ├── lyt-data-analysis/
│   │   └── SKILL.md
│   ├── lyt-learning/
│   │   └── SKILL.md
│   └── lyt-knowledge-check/
│       └── SKILL.md
├── tools/
└── dist/
```

## 推荐使用顺序

```text
不知道该用哪个
  ↓
lyt
  ↓
自动路由到选品 / 流量逻辑 / 问题追问 / 数据分析 / 连续学习 / 知识检验
```

```text
想先理解为什么没流量
  ↓
lyt-traffic-logic
  ↓
先搞清商品卡搜索 / 短视频推荐 / 广告流量 / 冷启动 / 成交链路
  ↓
再决定是否进入问题追问或数据分析
```

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

```text
想系统学习一个业务课题
  ↓
lyt-learning
  ↓
学习一小节 / 写反馈
  ↓
lyt-knowledge-check
  ↓
找到推理缺口并回到下一篇学习
```

## 使用提醒

- 不承诺收益，不输出「必爆」「稳赚」这类结论
- 平台规则、佣金、物流、禁限售等可能变化的信息，需要以官方或后台最新来源为准
- 数据越少，结论越保守
- 追问不是拖延，是为了避免把结果当原因
