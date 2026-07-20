# Lytskill

Lytskill 是一组面向 TikTok Shop / 跨境电商运营的 Agent skills。

它不是用来直接给「万能答案」的，而是帮你把模糊问题拆成可诊断的问题，把选品判断变成可验证的假设，把产品事实转成可拍摄的短视频脚本，把后台数据转成下一步动作。

可在 Claude Code、Codex、Cursor、Trae Solo 等支持 skill / system prompt 的 Agent 上使用。

**作者**：[抖音](https://www.douyin.com/user/MS4wLjABAAAAHg0IWbUwK53zYsvxT3WNJ6HrXKOQdZOmY2XZT1M4ghNpWyyUhyC62naQI9__ISkj)

**最新版本：v1.9.0**

## v1.9.0 更新内容

这次版本从 11 个 skill 扩展到 12 个，新增 `lyt-product-video-script`，并重构 `lyt-product-selection` 的底层决策方式。

### 新增能力

- 根据产品图片、链接、资料、已确认卖点或现有文案，生成可直接拍摄的电商短视频脚本。
- 输出脚本简报、分镜、台词、屏幕文字、拍摄清单、表达风险和内容验证假设。
- 支持真人出镜、只露手、无人物、UGC、使用演示、痛点解决、对比、测评、场景和细节证明等拍摄方式。
- 支持目标市场语言与中文回译；默认只生成一份脚本，用户明确要求时才生成多角度测试组。
- 产品信息分为「可见事实 / 用户陈述 / 推断 / 未知」，不虚构功能、材质、认证、评价、销量和使用效果。

### 选品逻辑升级

- `lyt-product-selection` 重新定义为「在资源约束和信息不完整条件下，构造、比较并筛选可验证商业假设的决策系统」。
- 新增 7 条基本公理与 10 条决策原则，区分经营路径、商品边界和具体类目结论。
- 进入类目选择时，默认构建至少 3 个相互区分的候选方向；没有可比样本时，不给唯一优先类目。
- 新增证据层级与默认答案审查，避免只根据预算、能力和排除条件反复推荐同一类目。

### 路由与发布

- `lyt` 主路由新增产品短视频脚本入口，并明确区分「产品能不能做」与「产品怎么拍」。
- 选品、产品验证和商品页诊断均新增产品视频脚本转交入口。
- Claude Code 插件清单扩展为 12 个 skill。
- `VERSION` 与 marketplace 版本同步升级到 `1.9.0`。
- 构建脚本继续自动发现 `skills/` 下的全部 skill，无需维护固定打包名单。

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
- 已有商品主图或详情页，但不知道问题出在产品表达、点击理由、信任证据还是用户疑虑
- 有一张电商参考图，想反推生成提示词，或把自己的产品替换进参考图的构图和风格
- 已经有具体产品，但不知道短视频应该拍什么、怎么拍，或想把现有产品文案整理成可拍分镜
- 有表格、截图、后台数据，但不知道问题到底卡在曝光、点击、成交还是客单价
- 想训练 Agent 按跨境电商业务逻辑追问、诊断和输出行动方案
- 想系统学习一个业务课题，并根据每轮反馈持续调整学习内容
- 想用真实场景题检验自己是否真正理解选品、流量、广告、数据和经营判断

## Skills 总览

| Skill | 用途 | 适合场景 |
|---|---|---|
| `lyt` | 主路由 | 用户不确定该用哪个 skill 时，先判断业务边界，再路由到选品、产品验证、商品页诊断、主图样本归纳、图片提示词反推、产品视频脚本、流量逻辑、问题追问、数据分析、连续学习或知识检验 |
| `lyt-problem-clarifier` | 问题追问 | 用户只给一句「为什么不出单 / 为什么没流量 / 为什么广告跑不出去」时，先追问动作和数据断点 |
| `lyt-traffic-logic` | 流量分配逻辑 | 用户想理解店铺、商品、商品卡、短视频、广告为什么有流量或没流量时，先讲清底层分配逻辑 |
| `lyt-product-selection` | 从 0 选品 | 不知道卖什么、只知道大类目、想判断类目 / 国家 / 流量渠道是否适合自己，或想建立候选品池 |
| `lyt-product-validation` | 已有产品验证 | 已经有具体产品、候选品清单、商品截图、供应链资料或测试数据，想判断是否值得进入测试池 |
| `lyt-product-page-diagnosis` | 商品页诊断 | 检查主图、副图、详情页和商品首屏，定位产品理解、点击理由、信任证据、用户疑虑和页面归因问题 |
| `lyt-product-image-patterns` | 主图样本归纳 | 批量分析竞品主图、Top 店铺主图或高销量商品卡截图，提炼可测试的主图表达公式 |
| `lyt-image-to-prompt` | 图片提示词反推 | 拆解电商参考图，并把用户自己的产品合并进参考图的构图、场景和风格 |
| `lyt-product-video-script` | 产品视频脚本 | 根据具体产品、产品资料或现有文案，生成可拍分镜、台词、屏幕文字、拍摄清单和内容验证假设 |
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
│   ├── lyt-product-validation/
│   │   └── SKILL.md
│   ├── lyt-product-page-diagnosis/
│   │   └── SKILL.md
│   ├── lyt-product-image-patterns/
│   │   └── SKILL.md
│   ├── lyt-image-to-prompt/
│   │   └── SKILL.md
│   ├── lyt-product-video-script/
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
自动路由到选品 / 产品验证 / 商品页诊断 / 主图样本归纳 / 图片提示词 / 产品视频脚本 / 流量逻辑 / 问题追问 / 数据分析 / 连续学习 / 知识检验
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
lyt-product-validation
  ↓
判断候选品是否进入测试池
  ↓
lyt-data-analysis
  ↓
用测试数据继续判断
```

```text
已有具体产品或候选品清单
  ↓
lyt-product-validation
  ↓
事实 / 推断 / 假设分层
  ↓
能测 / 暂缓 / 不建议做
```

```text
已经有具体产品，想拍短视频
  ↓
lyt-product-video-script
  ↓
提取产品事实 / 确定人群场景 / 选择内容机制
  ↓
输出一份可拍分镜 / 台词 / 屏幕文字 / 拍摄清单
```

```text
已有商品主图或详情页
  ↓
lyt-product-page-diagnosis
  ↓
图片取证 / 信息风险检查 / 数据归因
  ↓
输出修改优先级和单变量验证计划
```

```text
有一批竞品或 Top 主图样本
  ↓
lyt-product-image-patterns
  ↓
标注表达标签 / 提炼高频共性
  ↓
输出可测试的主图公式和改图 brief
```

```text
有一张电商参考图
  ↓
lyt-image-to-prompt
  ↓
选择目标风格和图片生成工具
  ↓
继续上传自己的产品图
  ↓
保留参考图构图与风格，生成产品替换后的提示词
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
