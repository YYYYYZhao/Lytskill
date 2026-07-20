# lyt 路由知识包

只在用户意图模糊、多个目标同时出现或路由冲突时读取。通用证据规则见 `common-rules.md`；本文件只处理路由判断。

## 子 skill 边界

| 子 skill | 负责 | 不负责 |
| --- | --- | --- |
| `lyt-product-selection` | 从 0 选品、选国家/类目/渠道、能力分诊、供应链/货盘判断、候选品池构建 | 不验证具体产品，不做候选品排序 |
| `lyt-product-validation` | 验证已有产品、商品截图、候选品清单、1688/竞品链接、供应链资料或候选品表格，判断「能测 / 暂缓 / 不建议做」 | 不负责从 0 找方向，不解释平台流量机制 |
| `lyt-product-page-diagnosis` | 诊断主图、详情页和商品首屏的信息表达、购买理由、证据与疑虑 | 不判断商品值不值得做，不代替完整店铺数据复盘 |
| `lyt-product-image-patterns` | 归纳多个竞品、Top 店铺或高销量主图样本的表达共性，提炼可测试主图公式 | 不诊断自己的单张主图，不证明销量由主图造成 |
| `lyt-product-video-script` | 根据具体产品、产品资料或现有文案，生成可拍分镜、台词、屏幕文字、拍摄清单和内容假设 | 不判断产品能不能做，不分析已发布视频数据，不直接生成或剪辑视频 |
| `lyt-traffic-logic` | 解释搜索、推荐、商品卡、广告、冷启动的流量机制 | 不追问数据，不定位具体问题 |
| `lyt-problem-clarifier` | 用五层漏斗把模糊经营问题问清楚 | 不直接给完整诊断 |
| `lyt-data-analysis` | 分析文字、截图、表格和后台数据，完成数据体检、诊断、复盘或报告 | 不替代选品决策和平台机制讲解 |
| `lyt-learning` | 按反馈连续学习一个业务课题 | 不代替具体经营诊断 |
| `lyt-knowledge-check` | 用场景题检验推理，而不是背标准答案 | 不直接生成完整课程 |

## 调度判断维度

路由前先快速标记四件事：

| 维度 | 选项 |
| --- | --- |
| 用户目标 | 决策 / 诊断 / 解释 / 复盘 / 学习 / 检验 |
| 业务对象 | 类目 / 商品 / 页面 / 店铺 / 广告 / 内容 / 数据 / 学习主题 |
| 信息状态 | 只有一句话 / 有截图 / 有表格 / 有完整数据 / 有学习资料 |
| 当前动作 | 选什么 / 哪里断了 / 为什么这样 / 怎么验证 / 怎么学 / 会不会用 |

路由按「用户目标」优先，其次才看附件和关键词。

## 意图冲突

| 用户说法 | 判断方式 |
| --- | --- |
| 「为什么没流量」 | 想理解平台机制走 `lyt-traffic-logic`；想定位自己的店铺走 `lyt-problem-clarifier` |
| 「帮我选品」 | 没有具体产品走 `lyt-product-selection`；已有产品、截图、链接或候选清单走 `lyt-product-validation` |
| 「这个产品为什么卖不动」 | 判断产品是否值得做走 `lyt-product-validation`；诊断已有经营数据走 `lyt-problem-clarifier` 或 `lyt-data-analysis` |
| 「帮我看看这张主图 / 详情页有什么问题」 | 检查页面表达走 `lyt-product-page-diagnosis`；判断商品是否值得做走 `lyt-product-validation` |
| 「这些 Top / 竞品主图有什么共性、打法或公式」 | 样本归纳走 `lyt-product-image-patterns`；如果要诊断自己的页面，再转 `lyt-product-page-diagnosis` |
| 「这个产品怎么拍 / 根据这个产品写一份脚本」 | 生成分镜、台词和拍摄清单走 `lyt-product-video-script`；判断产品值不值得测走 `lyt-product-validation` |
| 「把这段产品文案变成可拍分镜」 | 走 `lyt-product-video-script`；已发布视频并要根据数据复盘时走 `lyt-data-analysis` |
| 「有曝光但没人点，主图是不是有问题」 | 有主图或页面截图时走 `lyt-product-page-diagnosis`；没有页面和关键数据时先走 `lyt-problem-clarifier` |
| 「为什么不出单 / 没流量 / 跑不出去」 | 只有一句现象、对象和动作不清走 `lyt-problem-clarifier`；已有对象、时间范围和核心指标走 `lyt-data-analysis` |
| 「广告低消耗怎么办」 | 要定位真实问题走 `lyt-problem-clarifier`；给了广告数据并要复盘走 `lyt-data-analysis`；问机制走 `lyt-traffic-logic` |
| 「爆款视频不出单」 | 先走 `lyt-problem-clarifier` 问清播放、点击、加购、下单断点；若有完整数据再转 `lyt-data-analysis` |
| 「我想学会看数据」 | 走 `lyt-learning`；用户提供真实数据并要分析结论才走 `lyt-data-analysis` |
| 「考考我怎么判断广告低消耗」 | 走 `lyt-knowledge-check`；用户正在处理真实广告问题则走 `lyt-problem-clarifier` |
| 用户上传附件 | 先识别目标；找方向资料走 `lyt-product-selection`，具体产品/候选品资料要判断能不能做走 `lyt-product-validation`，具体产品资料要生成拍摄脚本走 `lyt-product-video-script`，经营数据走 `lyt-data-analysis`，学习资料走 `lyt-learning`，检验材料走 `lyt-knowledge-check` |

## 常见输入

| 目标 | 可以提供 |
| --- | --- |
| 从 0 选品 | 国家/平台、阶段、能力、预算、禁区、类目方向、可用渠道 |
| 产品验证 | 商品名、商品截图、候选品清单、1688/竞品链接、采购价、售价、重量、供应链资料、CSV/XLSX 表格 |
| 商品页诊断 | 主图、副图、详情页长图、商品首屏、竞品页面、修改前后版本、曝光点击加购下单数据 |
| 主图样本归纳 | 多个竞品/Top 主图、图片文件夹、类目路径、国家/平台、店铺名、销量、价格、统计时间 |
| 产品视频脚本 | 产品图片/链接/资料、已确认卖点、国家/平台、目标语言、视频目标、人群/场景、风格、拍摄条件或现有文案 |
| 问题追问 | 对象、时间、场景、最近动作、当前结果、后台截图或提示 |
| 数据分析 | 文字指标、截图、CSV/XLSX 表格、订单表、广告表、商品表、竞品和后台导出 |
| 学习 | 课题、真实问题、PDF/文档、课程资料 |
| 知识检验 | 想检验的主题、当前学习内容、指定资料或案例 |

## 总原则

路由按用户要完成的任务判断，不按单个关键词判断。转交时带状态卡，不让用户从头再说。
