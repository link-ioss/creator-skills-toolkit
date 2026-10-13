# Creator Skills Toolkit · 视频创作技能工具箱

把「想做一条视频」变成可执行的分镜、视频项目，以及持续积累的创作资料。

这是 link-ioss 整理的第三方技能合集与中文使用指南，**不是三个上游项目的原创发布**。适合保存到自己的工具库、重复使用，也方便分享给朋友。

> **许可证说明：** 教程与脚本采用 MIT；HyperFrames 技能采用 Apache-2.0；video-spec-builder 采用 MIT；看板技能采用 PolyForm Noncommercial 1.0.0。因此本仓库是混合许可合集，不能把整个合集称为“全部可自由商用的开源软件”。看板是可选的非商业组件。原作者、来源和许可证见 [授权与致谢](THIRD_PARTY_NOTICES.md)。

## 这三个技能分别做什么？

| 技能 | 用途 | 产物 |
|---|---|---|
| [video-spec-builder](skills/video-spec-builder/SKILL.md) | 梳理受众、目标、素材、节奏与逐镜头需求 | `video-spec.md` |
| [hyperframes](skills/hyperframes/SKILL.md) | 将需求交给适合的 HTML 视频制作流程，编排、预览与渲染 | 视频项目、预览和导出文件 |
| [neural-creator-dashboard](skills/neural-creator-dashboard/SKILL.md) | 把 Markdown / Obsidian 内容整理为创作神经网络看板 | 本地网页、笔记关联和数据展示 |

前两个组成视频工作流；看板用于内容积累，**不是制作视频的必需步骤**。

## 快速安装

准备好 Git、Node.js 22.12+（建议受支持的 LTS 版本）和支持 Agent Skills 的助手，例如 Codex、Claude Code 或 Cursor。`node -v`、`npm -v`、`npx --version` 应能正常输出版本。技能是给助手阅读的说明，安装技能并不等于安装了完整的视频渲染环境。

从本仓库安装视频技能到 Codex，全局可用：

```bash
npx skills add link-ioss/creator-skills-toolkit --skill video-spec-builder hyperframes --agent codex -g
```

可选：安装创作看板技能（先阅读其非商业许可）：

```bash
npx skills add link-ioss/creator-skills-toolkit --skill neural-creator-dashboard --agent codex -g
```

Cursor 用户把 `--agent codex` 换成 `--agent cursor`；Claude Code 用户换成 `--agent claude-code`。希望由安装器交互选择宿主时，去掉 `--agent codex`。`-g` 表示全局安装，去掉后只装到当前项目。

也可以下载仓库后安装：

```bash
git clone https://github.com/link-ioss/creator-skills-toolkit.git
cd creator-skills-toolkit
bash scripts/install.sh
# 安装视频技能及可选看板
bash scripts/install.sh --with-dashboard
# Cursor 项目级安装
bash scripts/install.sh --agent cursor --project
```

安装器可能询问是否覆盖同名技能。已有同名插件时，先确认希望使用的版本，避免多份同名技能造成混淆。安装后在新的消息或会话中调用。

## 下次做视频，直接这样说

**第一步：写需求与分镜。** 在助手里输入：

```text
请使用 video-spec-builder 帮我制作视频需求。
我要做一条 30 秒的竖屏产品介绍视频，发在抖音和小红书。
产品是［产品名称］，受众是［受众］，核心卖点是［一句话］。
现有素材是［图片、录屏、配音的路径］。
先补齐必要信息，输出 video-spec.md，暂时不要渲染。
```

**第二步：把确认过的分镜交给 HyperFrames。**

```text
请使用 hyperframes 制作视频。先读取我确认过的 video-spec.md。
沿用已有受众、时长、比例、素材和视觉选择，只问缺失或冲突的信息。
按当前 HyperFrames 工作流，在初始化后把确认内容落到 BRIEF.md，
并把逐镜头安排转成相应分镜文件；先给预览，再按我的反馈导出。
```

**第三步：修改与导出。**

```text
把第 2 个镜头延长 1 秒，删掉结尾重复文案；同步更新总时长和字幕。
完成后检查并重新预览，再导出适合发布的 MP4，告诉我输出路径。
```

不同宿主的斜杠命令支持不同，用自然语言点名技能即可。完整步骤见 [视频制作教程](docs/video-workflow.md)，更多可复制示例见 [提示词](examples/prompts.md)。

> **版本衔接：** video-spec-builder 主要输出 `video-spec.md`，当前 HyperFrames 使用 `BRIEF.md` 等项目文件。本合集提供交接方法，不假设两套格式天然完全兼容；转换时需要保留用户已确认的决定。HyperFrames 还会按工作流下载补充技能与运行依赖。

## 打开创作看板

在助手中说：

```text
请使用 neural-creator-dashboard，在新文件夹里启动示例看板并打开浏览器。
先使用虚构示例数据，等我提供笔记目录后再导入自己的内容。
```

手动运行、日后重新启动和笔记导入方法见 [看板教程](docs/dashboard.md)。看板源程序从上游取得，本仓库仅分发其技能文件与所需授权文件。

## 常见问题

- **`npx: command not found`：** 安装 Node.js 后重新打开终端，再检查 `node`、`npm` 和 `npx`。部分助手自带 Node，但终端没有 npm/npx，需要独立配置。
- **装完技能没有视频？** 安装完成后还需在助手中发起制作任务，并准备素材、补齐运行依赖。
- **能自动生成实拍素材吗？** 技能本身不保证具备图片、实拍视频、配音或音乐生成服务；额外服务可能需要账号和费用。
- **HyperFrames 提示缺技能？** 按它的安装流程运行 `npx hyperframes skills check`，必要时 `npx hyperframes skills update`；特定工作流按上游指引补装。
- **看板能自动获取抖音或小红书数据吗？** 当前上游看板不提供平台同步或 AI 调用；导入的是你提供的笔记和数据。
- **可以商用吗？** 分别检查组件、素材与外部服务的许可。当前看板组件没有授予商业使用权，不能用本仓库 MIT 许可替代它。

## 分享与维护

分享地址：<https://github.com/link-ioss/creator-skills-toolkit>

可以这样介绍：

> 我整理了一套视频创作技能工具箱：从需求与分镜到 HyperFrames 视频制作，再到创作笔记看板。附中文教程、安装命令和提示词，保留各原作者署名与授权说明。

本仓库的技能按版本快照保存；上游来源、提交和文件校验值见 [sources.lock.json](sources.lock.json)。HyperFrames 后续下载的工作流、CLI、模型和媒体服务不由该快照锁定。

维护方式见 [维护与验证](docs/maintenance.md)。请勿将个人笔记、客户素材、账号 Cookie、API 密钥或未公开作品提交到本仓库。

## 致谢

- [HeyGen / HyperFrames](https://github.com/heygen-com/hyperframes)
- [feicaiclub / video-spec-builder](https://github.com/feicaiclub/video-spec-builder)
- [luoluo-121 / neural-creator-dashboard](https://github.com/luoluo-121/neural-creator-dashboard)
