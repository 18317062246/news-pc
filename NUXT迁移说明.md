# PC Nuxt 首版

这是增量迁移的第一版：Nuxt 负责首页、列表、详情；Spring Boot PC 提供新的 JSON 边界；news-api 保持原有职责。旧 JSP 和 URL 仍然保留。没有修改 news-api / news-wap。

## 目录和调用链

- IDEA 打开仓库根目录的 `pom.xml`，运行 `NewsWebApplication`。
- VS Code 打开 `frontend/`，安装 Vue - Official 扩展。
- 浏览器 → Nuxt `/api/pc/*` → PC `/pc-api/v1/*` → news-api。
- Nuxt 转发目标仅由服务端配置指定，不接受浏览器传入目标地址。

## 本地启动（Windows）

1. Java 使用 JDK 8、Maven（仓库旧版 Lombok 不适合直接使用 JDK 21）。
2. IDEA 启动 PC，默认 dev 端口 9010。程序参数可以覆盖上游：

   ```text
   --api.domain=http://127.0.0.1:8033/api/
   ```

   如果使用上述本机地址，还需要在 IDEA 启动 news-api 并正确配置其 MySQL。也可直接使用你已有的测试 API 地址；不需要同时启动 WAP。

3. Node.js 使用 24 LTS（至少 24.11）或满足 `frontend/package.json` engines 的版本。
4. 在 VS Code 终端：

   ```powershell
   cd frontend # 如果终端已经在 frontend 则不用执行
   Copy-Item .env.example .env
   npm ci
   npm run dev
   ```

5. 浏览器本机访问 3000 端口的 `/bj/`。若 PC 部署在 Tomcat 的非根 context 下，`.env` 中 `NUXT_PC_API_BASE` 必须包含 context，例如 `http://127.0.0.1:8080/news.pc`。

`.env` 只供开发/构建工具加载，不能提交。生产 Node 服务启动时需要从进程环境注入变量。

## 断点与问题定位

- Java：IDEA Debug 启动，在 `PcApiController` 设置断点。
- 页面：浏览器 F12 查看 Console、Network（浏览器发出的 `/api/pc/...`）。
- 首次 SSR 的 Java 请求由 Node 发起，查看 Nuxt 终端与 Java 日志。
- API 地址错误或上游失败会返回 502，不会伪装成“没有文章”。
- 改 `.vue` 会热更新；修改 Java 接口通常需重启 PC。

## 已实现的路由

- `/{city}/`：城市首页（首版为最新资讯信息流）。
- `/{city}/list/`：列表、关键词搜索、分页。
- `/{city}/list/c{type}`、`/{city}/list/c{type}/p{page}`、`/{city}/list/p{page}`：旧列表地址。
- `/{city}/c{type}/`：301 到栏目列表。
- `/{city}/detail/{id}.html`：SSR 详情、元信息、正文清理。
- 城市关闭返回 404；文章不存在 404；下架 410；服务故障 502。

Nuxt 保留用户指定的 `nuxt: ^4.5.2`、`vue: ^3.5.42` 范围，实际版本由已提交的 package-lock.json 固定。使用 `npm ci` 复现依赖。

## 验证

```text
# 仓库根目录，JDK 8
mvn package
# frontend
npm ci
npm run typecheck
npm test
npm run build
npm run test:smoke
```

`test:smoke` 需要 PATH 上的 Java 8、已构建的 `../target/news.pc-1.0.0.war` 和 `.output`。它启动隔离的测试上游（19019）、Java PC（19010）、Nuxt（13000），验证真实 HTTP 调用链、SSR 正文和 SEO title、分页、搜索、错误状态和后端故障。使用的是固定测试数据，不连接真实数据库，不表示真实业务数据已验收。退出时关闭它自己启动的服务。确保这些端口空闲。

## 本次云环境验证结果

- Java 8 / Maven：WAR 构建成功，5 项接口测试通过。
- Nuxt：生产构建、TypeScript 检查、2 项正文清理测试通过。
- 实际启动 Java WAR + Nuxt：7 个页面 SSR、6 个错误场景以及后端断连场景通过。
- Chromium：栏目导航、分页、搜索、详情跳转通过，未出现页面脚本异常或水合警告。
- 以上链路测试使用固定上游数据；Windows 发版和真实业务 API 联调尚未验证。

## Windows 发版

先发布包含 `PcApiController` 的新版 PC WAR，保留原 JSP；再部署 Nuxt。

1. 在与目标相同的 Windows 平台和受支持 Node 版本上执行 `npm ci`、`npm run build`（或通过 Windows CI 构建）。
2. 把完整 `.output` 目录上传到一个新的版本目录，保留上一版本。
3. 配置 Node Windows 服务的工作目录为版本目录，启动命令为 `node .output/server/index.mjs`。
4. 在服务进程环境中设置：

   ```text
   NUXT_PC_API_BASE=http://127.0.0.1:9010
   NUXT_PUBLIC_DEFAULT_CITY=bj
   NITRO_HOST=127.0.0.1
   NITRO_PORT=3000
   ```

5. IIS/Nginx 将 PC 页面和 `/api/pc/`、`/_nuxt/` 一起转发到 Nuxt。原 `/api/`、`/m/` 等既有转发按现有服务保留，避免误转发；`/pc-api/` 可仅在内网供 Nuxt 访问。
6. 建议先用测试域名验收。通过后切换 PC 流量；失败时将网关切回原 PC Java 服务。原 JSP 仍可承担回滚。

本版未在 Windows 机器执行发布，需在你的实际 IIS/Tomcat/Windows 服务环境验收。Node 服务应通过团队已有 Windows 服务管理方式注册，确保开机自启、异常重启与日志保留。

## 当前边界（正式替换前待完成）

本版是可运行的核心链路首版，不是全站一比一迁移。未迁移全部城市专属版式、百科/专题、关联房源展示、页脚备案接口、浏览计数/埋点、移动 UA 跳转。Nuxt 页面是新的简洁版式，不是原 JSP 的视觉复刻。关闭城市沿用 Java `notallow.citys`，北京栏目 659 沿用原过滤；其余城市细则需要逐项补齐。正文保留基本排版与安全图片/链接，旧内嵌脚本和 iframe 会被清理，需要业务确认受影响文章。真实测试/生产 API 的可达性、路径大小写兼容、真实数据字段、SEO 与旧站对照仍需验收。

首版 JSON 接口复用 PC 的 RestTemplate、api.domain 和城市配置；使用独立适配 Controller 调用现有 news-api。既有 NewsService 的房源、页脚等聚合逻辑留在原处，尚未全部接入新页面。
