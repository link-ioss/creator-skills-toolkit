# 创作看板使用指南

该技能来自 luoluo-121/neural-creator-dashboard。当前版本采用 PolyForm Noncommercial 1.0.0；完整声明见 [技能授权文件](../skills/neural-creator-dashboard/NOTICE.md)。

## 首次启动

准备 Git、Node.js 22.12+ 和 npm，然后在合适的工作目录运行：

```bash
git clone https://github.com/luoluo-121/neural-creator-dashboard.git neural-dashboard
cd neural-dashboard
npm install
npm run verify
npm run build
npm run dev
```

终端保持运行，打开它打印的本地地址，通常是 `http://127.0.0.1:5173/`。若端口被占用，以终端实际地址为准。首页应有光球与五个水母模块，首次展示虚构示例数据。

## 电脑重启后再次打开

```bash
cd /你的项目路径/neural-dashboard
npm run dev
```

再打开终端输出的网址。收藏网址不会自动启动服务；启动失败时先查看终端错误。停止服务可在该终端按 Ctrl+C。

## 导入自己的 Markdown / Obsidian 笔记

由你确认要读取的目录，必要时先做本地备份：

```bash
npm run import -- --vault "/你的笔记目录" --account "你的账号名称" --followers 1000
```

关注数请替换为真实值；不是固定必填值。目录分类与作品指标字段见上游 README 和 `examples/vault/`。双链使用 `[[笔记名]]`，指标写在作品的 frontmatter 中。

导入会生成本地 `src/data/my-data.js` 并切换数据入口。查看效果后可用以下命令恢复示例：

```bash
npm run import -- --reset
```

个人笔记不应推送到公开仓库。选题、草稿等浏览器数据使用 localStorage，不会随 Git 仓库自动备份。

## 与视频制作怎么搭配

把选题整理进看板，在独立视频项目中使用 video-spec-builder 与 HyperFrames；完成后自行把作品链接和真实指标记录回笔记。当前没有自动跨工具同步、AI 问答后端或抖音/小红书抓取能力。
