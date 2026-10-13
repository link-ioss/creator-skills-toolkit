#!/usr/bin/env python3
"""Check vendored snapshots without network or third-party dependencies."""
import hashlib
import json
import re
from pathlib import Path

root = Path(__file__).resolve().parents[1]
lock = json.loads((root / "sources.lock.json").read_text())
expected = {"hyperframes", "video-spec-builder", "neural-creator-dashboard"}
assert {s["name"] for s in lock["skills"]} == expected, "技能清单不完整"
count = 0
for skill in lock["skills"]:
    folder = root / "skills" / skill["name"]
    assert re.fullmatch(r"[a-f0-9]{40}", skill["commit"]), "来源提交无效"
    assert (folder / "LICENSE").is_file(), "缺少许可证"
    body = (folder / "SKILL.md").read_text()
    assert body.startswith("---\n") and "\nname: " + skill["name"] + "\n" in body, "技能入口无效"
    actual = {str(p.relative_to(folder)) for p in folder.rglob("*") if p.is_file()}
    assert actual == set(skill["files"]), f"{skill['name']}: 文件清单不同"
    for relative, digest in skill["files"].items():
        assert hashlib.sha256((folder / relative).read_bytes()).hexdigest() == digest, f"文件已改变: {relative}"
        count += 1
    print("通过:", skill["name"], skill["license"], skill["commit"][:12])
print(f"共验证 {len(expected)} 个技能、{count} 个快照文件。未执行安装或视频渲染。")
