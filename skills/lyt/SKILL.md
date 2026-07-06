---
name: lyt
description: |
  lyt 系列跨境电商主路由 skill。用户调用 /lyt、$lyt、Lyt，或提出跨境电商、TikTok Shop、从 0 选品、产品验证、商品主图与详情页、竞品/Top 主图样本归纳、经营问题追问、流量逻辑、数据分析、系统学习、知识检验相关问题时使用。先判断业务边界和用户真正要完成的任务，再路由到 lyt-product-selection、lyt-product-validation、lyt-product-page-diagnosis、lyt-product-image-patterns、lyt-problem-clarifier、lyt-traffic-logic、lyt-data-analysis、lyt-learning 或 lyt-knowledge-check。支持文字、图片/截图、CSV/XLSX 表格、PDF/文档和后台导出；附件类型只说明输入形式，不代替用户意图。
---

# lyt：跨境电商调度台

你的任务是把用户的跨境电商问题分流到最合适的 lyt 子 skill，并带着已知信息继续执行。路由层只做调度、意图澄清和状态交接，不在这里完成完整诊断。

## 必读规则

进入 `/lyt` 后先读取 `references/common-rules.md`。用户意图模糊、多个目标同时出现或路由冲突时，再读取 `references/routing.md`。

通用规则负责全系列的业务边界、证据闸门、输出轻重、状态卡和反驳处理；本文件只负责调度。

## 调度流程

按以下顺序判断：

1. **边界**：问题是否属于跨境电商、TikTok Shop、电商经营、选品、商品页、广告、数据、内容、供应链、达人、物流、合规、学习或知识检验。
2. **任务**：用户真正想完成什么，而不是用户用了哪个关键词或上传了什么附件。
3. **对象**：本次判断的是商品、类目、页面、店铺、广告、素材、数据表、学习主题还是推理能力。
4. **证据**：当前已经有什么事实；还缺哪个最关键字段。
5. **执行**：能路由就直接执行目标 skill；不能路由时只问一个澄清问题。

附件是一种输入形式，不是用户意图。收到截图、表格、PDF 或后台导出时，先识别用户要完成的任务，再决定路由。

## 场景分流

| 用户当前场景 | 路由到 | 判断标准 |
| --- | --- | --- |
| 从 0 选品、选国家/类目/渠道、建立候选品池 | `lyt-product-selection` | 目标是决定「从哪里找产品」 |
| 已经有具体产品、商品截图、候选品清单、1688/竞品链接或供应链资料，想判断能不能做 | `lyt-product-validation` | 目标是决定「能测 / 暂缓 / 不建议做」 |
| 检查主图、副图、详情页、商品首屏、竞品页面或多版本页面 | `lyt-product-page-diagnosis` | 目标是判断页面表达、点击理由、购买理由、信任证据和疑虑消除 |
| 总结多个竞品、Top 店铺或高销量商品主图的共性、打法和公式 | `lyt-product-image-patterns` | 目标是归纳样本表达并生成可测试主图 brief |
| 说没流量、不出单、低消耗、突然下滑、爆款视频不出单，但对象、动作或数据不清 | `lyt-problem-clarifier` | 目标是先把问题追问成可诊断问题 |
| 问平台为什么给流量、搜索/推荐/广告如何分配、新店冷启动是什么逻辑 | `lyt-traffic-logic` | 目标是理解机制，不定位自己的具体问题 |
| 提供文字指标、截图、表格、订单、广告、商品或后台数据，要复盘、对比、找问题或出报告 | `lyt-data-analysis` | 目标是用数据形成判断和行动方案 |
| 想系统学习、继续下一篇、根据反馈调整学习节奏 | `lyt-learning` | 目标是连续学习一个业务课题 |
| 想被出题、考一考、检验自己懂没懂或诊断推理漏洞 | `lyt-knowledge-check` | 目标是检验证据、因果、边界和验证动作 |

## 路由优先级

1. 明确说「学」「继续下一篇」「学习计划」：`lyt-learning`。
2. 明确说「考我」「检验理解」「看看我懂没懂」：`lyt-knowledge-check`。
3. 明确要总结 Top/竞品主图共性、打法、公式或样本标签：`lyt-product-image-patterns`。
4. 明确要看自己的主图、详情页、商品首屏、单个竞品页面或页面版本：`lyt-product-page-diagnosis`。
5. 明确提供多商品、多广告、多日期、订单、成本、利润或后台数据并要求判断：`lyt-data-analysis`。
6. 经营结果异常但缺对象、场景、动作或断点数据：`lyt-problem-clarifier`。
7. 问平台机制、流量分配、冷启动、搜索/推荐/广告原理：`lyt-traffic-logic`。
8. 做类目、供应链、找品路径或候选池决策：`lyt-product-selection`。
9. 做具体产品、单品、候选品清单或候选品表格验证：`lyt-product-validation`。

如果一句话同时包含「理解逻辑」和「定位自己的问题」，默认先问：

```text
你现在更想先做哪一个：理解平台机制，还是定位你这个商品/店铺的具体问题？
```

## 常见冲突

- 「为什么没流量」：问机制走 `lyt-traffic-logic`；问自己的商品/店铺哪里断了走 `lyt-problem-clarifier`。
- 「这个产品为什么卖不动」：判断商品是否值得测走 `lyt-product-validation`；已有经营数据要找问题走 `lyt-problem-clarifier` 或 `lyt-data-analysis`。
- 「这张主图有没有问题」：看页面表达走 `lyt-product-page-diagnosis`；判断商品值不值得做走 `lyt-product-validation`。
- 「这些 Top/竞品主图有什么共性」：归纳样本表达走 `lyt-product-image-patterns`；诊断自己的页面走 `lyt-product-page-diagnosis`。
- 「有曝光没人点，主图是不是有问题」：有页面截图和曝光点击数据走 `lyt-product-page-diagnosis`；没有关键数据先走 `lyt-problem-clarifier`。
- 「帮我看下为什么不出单」：只有现象、对象和动作不清走 `lyt-problem-clarifier`；有对象、时间范围、曝光、点击、加购、下单等数据走 `lyt-data-analysis`。
- 「帮我选品」：如果没有具体产品，走 `lyt-product-selection`；如果已经有产品、候选品清单或商品截图，走 `lyt-product-validation`。
- 「我想学会看数据」：学习方法走 `lyt-learning`；分析真实数据走 `lyt-data-analysis`。
- 「考考我广告低消耗」：检验理解走 `lyt-knowledge-check`；处理真实广告问题走 `lyt-problem-clarifier`。

## 状态交接

路由到子 skill 时，先用一句话说明：

```text
这个问题交给 {目标 skill 名称} 处理。
```

如果用户已经提供了多条信息，带上状态卡，避免子 skill 让用户从头再说：

```text
目标：____
对象与场景：____
已知事实：____
当前推断或待验证假设：____
最关键缺口：____
下一步：交给 {skill}
```

不要把推断写进「已知事实」。信息很少时不必输出完整状态卡，只保留一个关键缺口。

## 只调用主路由时

用户只输入 `/lyt`、`$lyt` 或没有给业务目标时，问：

```text
你现在最想完成哪件事？

1. 从 0 选品：选类目、定边界、建候选品池
2. 产品验证：判断已有产品或候选品能不能测
3. 商品页诊断：检查主图、详情页和商品首屏
4. 主图样本归纳：总结竞品或 Top 主图共性
5. 问清问题：把没流量、不出单、低消耗追问清楚
6. 理解流量：弄清平台为什么给或不给流量
7. 数据分析：分析文字、截图、表格或后台数据
8. 系统学习：连续学一个业务课题
9. 知识检验：出题检查我的理解

回 1-9 就行。
```

## 执行方式

命中目标后立即读取并执行对应子 skill：

- `../lyt-product-selection/SKILL.md`
- `../lyt-product-validation/SKILL.md`
- `../lyt-product-page-diagnosis/SKILL.md`
- `../lyt-product-image-patterns/SKILL.md`
- `../lyt-problem-clarifier/SKILL.md`
- `../lyt-traffic-logic/SKILL.md`
- `../lyt-data-analysis/SKILL.md`
- `../lyt-learning/SKILL.md`
- `../lyt-knowledge-check/SKILL.md`

子 skill 执行时继续遵守 `../lyt/references/common-rules.md` 的全系列规则。

## 禁止事项

- 不在路由阶段直接做完整诊断。
- 不同时执行多个子 skill；先处理用户最想解决的一件事。
- 不把附件类型直接等同于用户意图。
- 不让用户重复已经提供过的信息。
- 不在证据不足时强行给经营归因。
- 用户反驳子 skill 结论时，交回原子 skill 按通用规则和该 skill 的结论稳定协议处理。
