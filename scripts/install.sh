#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
agent=codex
scope=(-g)
skills=(video-spec-builder hyperframes)
while (($#)); do
  case "$1" in
    --agent)
      if (($# < 2)) || [[ "$2" == -* ]]; then echo "--agent 需要宿主名称" >&2; exit 2; fi
      agent="$2"; shift 2 ;;
    --project) scope=(); shift ;;
    --with-dashboard) skills+=(neural-creator-dashboard); shift ;;
    -h|--help)
      echo "用法: bash scripts/install.sh [--agent codex|cursor|claude-code] [--project] [--with-dashboard]"
      echo "默认全局安装两个视频技能；看板为可选非商业组件。项目级安装使用当前工作目录。"
      exit 0 ;;
    *) echo "未知参数: $1" >&2; exit 2 ;;
  esac
done
command -v npx >/dev/null 2>&1 || { echo "未找到 npx。请安装 Node.js/npm 后重新打开终端。" >&2; exit 1; }
if [[ " ${skills[*]} " == *" neural-creator-dashboard "* ]]; then
  echo "看板组件采用 PolyForm Noncommercial 1.0.0；请阅读 skills/neural-creator-dashboard/LICENSE。"
fi
npx skills add "$ROOT" --skill "${skills[@]}" --agent "$agent" "${scope[@]}"
