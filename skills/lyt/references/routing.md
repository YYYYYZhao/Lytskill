# lyt 路由知识包

只在用户意图模糊、多个目标同时出现或路由冲突时读取。

## 子 skill 边界

| 子 skill | 负责 | 不负责 |
| --- | --- | --- |
| `lyt-product-selection` | 选类目、从 0 选品、候选品批量筛选、单品验证 | 不诊断广告和流量异常 |
| `lyt-product-page-diagnosis` | 诊断主图、详情页和商品首屏的信息表达、购买理由、证据与疑虑 | 不判断商品值不值得做，不代替完整店铺数据复盘 |
| `lyt-traffic-logic` | 解释搜索、推荐、商品卡、广告、冷启动的流量机制 | 不追问数据，不定位具体问题 |
| `lyt-problem-clarifier` | 用五层漏斗把模糊经营问题问清楚 | 不直接给完整诊断 |
| `lyt-data-analysis` | 分析文字、截图、表格和后台数据，完成数据体检、诊断、复盘或报告 | 不替代选品决策和平台机制讲解 |
| `lyt-learning` | 按反馈连续学习一个业务课题 | 不代替具体经营诊断 |
| `lyt-knowledge-check` | 用场景题检验推理，而不是背标准答案 | 不直接生成完整课程 |

## 意图冲突

| 用户说法 | 判断方式 |
| --- | --- |
| 「为什么没流量」 | 想理解平台机制走 `lyt-traffic-logic`；想定位自己的店铺走 `lyt-problem-clarifier` |
| 「这个产品为什么卖不动」 | 判断产品是否值得做走 `lyt-product-selection`；诊断已有经营数据走 `lyt-problem-clarifier` 或 `lyt-data-analysis` |
| 「帮我看看这张主图 / 详情页有什么问题」 | 检查页面表达走 `lyt-product-page-diagnosis`；判断商品是否值得做走 `lyt-product-selection` |
| 「有曝光但没人点，主图是不是有问题」 | 有主图或页面截图时走 `lyt-product-page-diagnosis`；没有页面和关键数据时先走 `lyt-problem-clarifier` |
| 「我想学会看数据」 | 走 `lyt-learning`；用户提供真实数据并要分析结论才走 `lyt-data-analysis` |
| 「考考我怎么判断广告低消耗」 | 走 `lyt-knowledge-check`；用户正在处理真实广告问题则走 `lyt-problem-clarifier` |
| 用户上传附件 | 先识别目标；选品资料走 `lyt-product-selection`，经营数据走 `lyt-data-analysis`，学习资料走 `lyt-learning`，检验材料走 `lyt-knowledge-check` |

## 常见输入

| 目标 | 可以提供 |
| --- | --- |
| 选品 | 国家/平台、阶段、能力、预算、候选品清单、商品截图、CSV/XLSX 表格、供应链资料 |
| 商品页诊断 | 主图、副图、详情页长图、商品首屏、竞品页面、修改前后版本、曝光点击加购下单数据 |
| 问题追问 | 对象、时间、场景、最近动作、当前结果、后台截图或提示 |
| 数据分析 | 文字指标、截图、CSV/XLSX 表格、订单表、广告表、商品表、竞品和后台导出 |
| 学习 | 课题、真实问题、PDF/文档、课程资料 |
| 知识检验 | 想检验的主题、当前学习内容、指定资料或案例 |

## 总原则

路由按用户要完成的任务判断，不按单个关键词判断。转交时带状态卡，不让用户从头再说。
