import { test } from "node:test";
import assert from "node:assert/strict";
import { cleanArticle } from "../server/utils/article.mjs";
test("removes executable content from upstream article HTML", () => {
  const html = cleanArticle(
    '<p>正文</p><script>alert(1)</script><img src="https://example.com/a.jpg" onerror="alert(1)"><a href="javascript:alert(1)">链接</a><iframe src="https://evil.example"></iframe>',
  );
  assert.match(html, /正文/);
  assert.match(html, /https:\/\/example.com\/a.jpg/);
  assert.doesNotMatch(html, /script|onerror|javascript:|iframe/);
});
test("preserves editorial structure and safe links", () => {
  const html = cleanArticle(
    '<h2>政策</h2><p><strong>重点</strong><a href="https://example.com">来源</a></p>',
  );
  assert.match(html, /<h2>政策<\/h2>/);
  assert.match(html, /noopener/);
  assert.equal(cleanArticle(null), "");
});
