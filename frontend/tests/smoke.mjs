// Runs the built Nuxt app and Java WAR against deterministic upstream fixtures.
import { createServer } from "node:http";
import { spawn } from "node:child_process";
import { once } from "node:events";
import { fileURLToPath } from "node:url";
import { resolve } from "node:path";
import assert from "node:assert/strict";
const frontend = fileURLToPath(new URL("..", import.meta.url));
const children = [];
const article = {
  id: 7,
  Title: "北京楼市测试资讯",
  Description: "用于验证完整链路的测试数据",
  Content: "<p>服务端渲染正文</p><script>alert(1)</script>",
  Upper: 1,
  PublishDate: "1728000000",
  Sources: "测试数据",
};
const upstream = createServer((req, res) => {
  const url = new URL(req.url, "http://localhost");
  let data;
  if (url.pathname === "/api/getcolumnlist")
    data = {
      Success: true,
      Result: [{ Id: 1, ColumnsName: "楼市动态", ChildList: [] }],
    };
  else if (url.pathname === "/api/getnewslist")
    data = {
      Success: true,
      Result: { NewsList: [{ ...article, ID: 7 }], PageTotal: 3 },
      Total: 21,
    };
  else if (url.pathname === "/api/getnewscontent")
    data = {
      Success: true,
      Result:
        url.searchParams.get("newsid") === "8"
          ? { ...article, Upper: 0 }
          : url.searchParams.get("newsid") === "9"
            ? {}
            : article,
    };
  else {
    res.writeHead(404);
    res.end();
    return;
  }
  res.setHeader("Content-Type", "application/json; charset=utf-8");
  res.end(JSON.stringify(data));
});
function start(command, args, cwd, env = {}) {
  const child = spawn(command, args, {
    cwd,
    env: { ...process.env, ...env },
    stdio: ["ignore", "pipe", "pipe"],
  });
  let log = "";
  child.stdout.on("data", (chunk) => {
    log = (log + chunk).slice(-20000);
  });
  child.stderr.on("data", (chunk) => {
    log = (log + chunk).slice(-20000);
  });
  children.push(child);
  return () => log;
}
async function wait(url, log) {
  for (let i = 0; i < 60; i++) {
    try {
      if ((await fetch(url)).ok) return;
    } catch {}
    await new Promise((resolve) => setTimeout(resolve, 500));
  }
  throw new Error(`Not ready: ${url}\n${log()}`);
}
try {
  upstream.listen(19019, "127.0.0.1");
  await once(upstream, "listening");
  const javaLog = start(
    "java",
    [
      "-jar",
      resolve(frontend, "../target/news.pc-1.0.0.war"),
      "--server.port=19010",
      "--api.domain=http://127.0.0.1:19019/api/",
      "--logging.file=./target/smoke-logs/pc.log",
      "--log.path=./target/smoke-logs",
    ],
    resolve(frontend, ".."),
  );
  await wait("http://127.0.0.1:19010/pc-api/v1/bj/columns", javaLog);
  const nuxtLog = start("node", [".output/server/index.mjs"], frontend, {
    NITRO_PORT: "13000",
    NITRO_HOST: "127.0.0.1",
    NUXT_PC_API_BASE: "http://127.0.0.1:19010",
  });
  await wait("http://127.0.0.1:13000/bj/", nuxtLog);
  for (const path of [
    "/bj/",
    "/bj/list/",
    "/bj/list/c1",
    "/bj/list/c1/p2",
    "/bj/list/p2",
    "/bj/list/?keyword=楼市",
    "/bj/detail/7.html",
  ]) {
    const response = await fetch(`http://127.0.0.1:13000${path}`);
    const html = await response.text();
    assert.equal(response.status, 200, `${path}: ${html.slice(0, 300)}`);
    assert.match(html, /北京楼市测试资讯/, path);
    if (path.includes("detail")) {
      assert.match(html, /服务端渲染正文/);
      assert.doesNotMatch(html, /alert\(1\)/);
      assert.match(html, /<title>北京楼市测试资讯/);
    }
    if (path.includes("/p2")) assert.match(html, /第 2 \/ 3 页/);
    console.log(`PASS SSR ${path}`);
  }
  for (const [path, status] of [
    ["/bj/detail/8.html", 410],
    ["/bj/detail/9.html", 404],
    ["/sz/", 404],
    ["/bj/list/nonsense", 404],
    ["/api/pc/bj/news?page=0", 400],
    ["/api/pc/bj/unknown", 404],
  ]) {
    assert.equal(
      (await fetch(`http://127.0.0.1:13000${path}`)).status,
      status,
      path,
    );
    console.log(`PASS ${status} ${path}`);
  }
  // Prove the frontend reports a failed backend instead of rendering a fake empty list.
  children[0].kill("SIGTERM");
  await once(children[0], "exit");
  assert.equal((await fetch("http://127.0.0.1:13000/bj/")).status, 502);
  console.log("PASS backend outage => 502");
} finally {
  for (const child of children)
    if (child.exitCode === null) child.kill("SIGTERM");
  upstream.close();
}
