# Free My TV APK 安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/simbasjungles/free-my-tv/blob/main/README.md
# 更新日期：2026-10-28
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

$TV = Read-Host '请输入电视 IP（例如 192.168.1.50）'
curl.exe -L --fail -o FreeMyTV.apk "https://github.com/simbasjungles/free-my-tv/releases/download/v1.2.0/FreeMyTV.apk"
if ((Get-FileHash FreeMyTV.apk -Algorithm SHA256).Hash.ToLower() -ne '552ca7ade4dd35c38d31eeff5d665313b0fe4154b864e81b94f3df96716f966e') { throw 'SHA256 校验失败，请重新下载' }
if (Get-Command adb -ErrorAction SilentlyContinue) { adb connect "$TV`:5555"; adb install -r .\FreeMyTV.apk } else { Write-Host '未检测到 adb：请把 FreeMyTV.apk 拷到 U 盘安装' }

Write-Host ''

Write-Host '安装完成：电视上打开 Free My TV → Home Screen → Free My TV，允许 USB 调试；需要推荐内容时在 Home Settings 填 TMDB key'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/simbasjungles/free-my-tv/blob/main/README.md'
