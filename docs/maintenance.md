# 维护与验证

## 本地验证

```bash
python3 scripts/verify.py
bash -n scripts/install.sh
bash scripts/install.sh --help
```

验证器检查三个技能入口、来源提交格式、许可证、清单完整性和逐文件 SHA-256。它不代表视频渲染或 AI 服务已端到端验证。

## 更新快照

1. 在临时目录获取上游明确提交，不要直接把整个工作目录拷贝进仓库。
2. 检查新的 LICENSE、NOTICE 和技能引用，确认许可或依赖是否改变。
3. 更新对应 `skills/` 内容并保留所需授权文件。
4. 在 `sources.lock.json` 中更新提交、文件清单和校验值。
5. 检查中文教程是否仍与上游一致，运行验证后提交。

HyperFrames 运行时还会按需更新领域技能；本仓库固定的是入口技能快照，不承诺所有运行依赖都永久固定。

## 发布

使用你自己的 GitHub 登录。建议仓库名 `creator-skills-toolkit`，公开可见。

如果已经安装并登录 GitHub CLI，在仓库根目录运行：

```bash
gh repo create link-ioss/creator-skills-toolkit --public --source=. --remote=origin --push
```

该命令仅用于尚不存在的远程仓库，不要用于覆盖其他项目。发布前检查 `git status` 和 `git diff --cached`，确认没有笔记、账号数据或密钥。网页上传时需保留目录结构。
