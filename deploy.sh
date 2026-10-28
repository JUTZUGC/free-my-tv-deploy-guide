#!/usr/bin/env bash
set -euo pipefail
# Free My TV APK 安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/simbasjungles/free-my-tv/blob/main/README.md
# 更新日期：2026-10-28
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

read -r -p "请输入电视 IP（例如 192.168.1.50）: " TV
curl -fL -o FreeMyTV.apk "https://github.com/simbasjungles/free-my-tv/releases/download/v1.2.0/FreeMyTV.apk"
echo "552ca7ade4dd35c38d31eeff5d665313b0fe4154b864e81b94f3df96716f966e  FreeMyTV.apk" | sha256sum -c -
if command -v adb >/dev/null 2>&1; then adb connect "$TV:5555" && adb install -r FreeMyTV.apk; else echo "未检测到 adb：请把 FreeMyTV.apk 拷到 U 盘，用电视文件管理器安装"; fi

echo ""

echo "安装完成：电视上打开 Free My TV → Home Screen → Free My TV，允许 USB 调试；需要推荐内容时在 Home Settings 填 TMDB key"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/simbasjungles/free-my-tv/blob/main/README.md"
