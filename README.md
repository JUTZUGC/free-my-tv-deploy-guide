# Free My TV APK 安装指南

> 第三方部署指南 · 非 Free My TV 官方仓库。官方项目：[simbasjungles/free-my-tv](https://github.com/simbasjungles/free-my-tv)
> 内容来自官方文档（2026-10-28）。项目迭代快，请以[官方文档](https://github.com/simbasjungles/free-my-tv/blob/main/README.md)为准。

[![⚡ APK 安装](https://img.shields.io/badge/%E2%9A%A1_APK_%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#apk安装推荐用百度搭子)

## APK 安装（推荐：用百度搭子）

> [!TIP]
> 不用 root、不卸载系统应用，让百度搭子用 ADB 把电视桌面换成 Free My TV。

⚠️ Android 版需要 Google TV / Android TV 8.0+，电视与电脑在同一局域网并开启 USB 调试。LG webOS 与三星 Tizen 有独立安装包，装法不同。不 root、不卸载系统应用，电视上可一键恢复原桌面。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/free-my-tv-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会下载并校验 APK，检测到 adb 时连接电视安装，否则提示用 U 盘安装，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## Free My TV 是什么？

Free My TV 是开源的5.1k stars，MIT，无广告的 Google TV / Android TV 桌面（协议：MIT，<img src="https://img.shields.io/github/stars/simbasjungles/free-my-tv?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

一个无广告的电视桌面：常用 App 放在玻璃货架，每小时从已安装的 App 里挑三部热门内容，带天气、加密行情、屏保与昼夜主题，设置全部在电视上完成。

- 无广告：没有赞助位、横幅和自动播放预告
- 你的 App 优先：货架上只放自己选的流媒体应用
- 每小时更新推荐：只从已安装的 App 里挑，最多六部
- 天气与行情：逐小时预报、日出日落、加密货币价格
- 昼夜主题：跟随所在城市真实日落切换明暗
- 可撤销：电视上一键恢复原厂桌面，不卸载任何应用

（来源：[官方仓库](https://github.com/simbasjungles/free-my-tv)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 5.1k stars | 近期增长最快的电视桌面项目之一 |
| 无广告 | 没有赞助位、横幅与自动播放推广 |
| 可撤销 | 电视上一键恢复原厂桌面 |
| 功能够全 | 推荐、天气、行情、屏保、昼夜主题都有 |
| 不 root | 不卸载系统应用，不动系统分区 |
| 多平台 | Google TV / Android TV、LG webOS、三星 Tizen |

| 需要注意 | 说明 |
|---|---|
| 需要 ADB | 电视必须开 USB 调试并授权电脑 |
| 推荐要 TMDB Key | 不填就没有每小时热门推荐 |
| LG / 三星装法不同 | 需要各自开发者模式，不能直接用 APK |
| Android 8+ | 老电视不支持 |
| 新项目 | 早期版本，更新频率较高 |

> 以上基于官方文档与社区反馈整理（2026-10-28），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
read -r -p "请输入电视 IP（例如 192.168.1.50）: " TV
curl -fL -o FreeMyTV.apk "https://github.com/simbasjungles/free-my-tv/releases/download/v1.2.0/FreeMyTV.apk"
echo "552ca7ade4dd35c38d31eeff5d665313b0fe4154b864e81b94f3df96716f966e  FreeMyTV.apk" | sha256sum -c -
if command -v adb >/dev/null 2>&1; then adb connect "$TV:5555" && adb install -r FreeMyTV.apk; else echo "未检测到 adb：请把 FreeMyTV.apk 拷到 U 盘，用电视文件管理器安装"; fi
```

安装包来源：[https://github.com/simbasjungles/free-my-tv/releases/tag/v1.2.0](https://github.com/simbasjungles/free-my-tv/releases/tag/v1.2.0)

## 验证状态

| 场景 | 状态 |
|---|---|
| Release v1.2.0 的 APK / webOS / Tizen 三个包与 SHA256 digest 已核对 | 已核对 2026-10-28 |
| README 确认 ADB 安装、TMDB Key 与恢复原桌面步骤 | 已核对 2026-10-28 |
| 未实测安装（本机无 Android TV 设备） | 说明 2026-10-28 |
| 非目标宿主调用被拦截（HOST_NOT_ALLOWED） | 已验证 2026-10-28 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

Free My TV 不含 MCP；本仓库的 MCP 只提供安装步骤、TMDB 配置与常见问题，不参与电视桌面控制。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-28）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\free-my-tv-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 电视先开 ADB

1. 设置 → 系统 → 关于 → 连按「Android TV OS build」7 次
2. 设置 → 系统 → 开发者选项 → 打开「USB 调试」
3. 设置 → 网络与互联网，记下电视 IP

装好后第一次打开 Free My TV，电视会问「允许 USB 调试吗」，勾选「始终允许」。

## 恢复与更新

- 恢复原桌面：打开 Free My TV → Home Screen → Original
- 更新：应用每周检查一次 Release，校验大小、SHA-256 与签名后再走系统安装器
- 自己编译的版本与 Release 签名不同，切回 Original 后先卸载再装

## 其它电视平台

| 平台 | 文件 |
|---|---|
| LG webOS | `FreeMyTV-webos.ipk` |
| 三星 Tizen | `FreeMyTV-tizen.wgt` |

这两个平台需要用各自的开发者模式与安装工具，步骤以仓库 README 对应章节为准。

## TMDB Key

推荐内容依赖 TMDB：到 TMDB 申请免费 API Key，在电视的 Home Settings → TMDB key 填入。不填也能用，只是没有每小时推荐。

> ⚠️ Android 14 上 Google Play Protect 可能拦截安装，选择「更多详情 → 仍要安装」。本项目不 root、不卸载系统应用；装前记下原桌面，需要时可一键恢复。

## 常见坑

- adb connect 失败：确认电视与电脑同网，USB 调试已开，端口 5555 可达
- 安装被 Play Protect 拦截：选「更多详情 → 仍要安装」
- 电视不弹授权：先在电视上打开 Free My TV，再回到电脑执行 adb install
- 没有推荐内容：到 Home Settings → TMDB key 填入免费 API Key
- 想换回原桌面：Home Screen → Original，随时可切回
- 自己编译的版本装不上：签名与 Release 不同，先卸载旧版
- LG / 三星装不了：这两个平台用 ipk / wgt，不能直接装 APK

## 免责声明

本仓库为第三方指南，与 Free My TV 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-28），项目迭代快，请以[官方文档](https://github.com/simbasjungles/free-my-tv/blob/main/README.md)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
