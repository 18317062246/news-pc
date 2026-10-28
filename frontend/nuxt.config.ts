export default defineNuxtConfig({
  compatibilityDate: "2026-10-28",
  devtools: { enabled: false },
  css: ["~/assets/main.css"],
  runtimeConfig: {
    pcApiBase: "http://127.0.0.1:9010",
    public: { defaultCity: "bj" },
  },
  app: {
    head: {
      htmlAttrs: { lang: "zh-CN" },
      title: "中原资讯",
      meta: [
        { name: "viewport", content: "width=device-width, initial-scale=1" },
      ],
    },
  },
});
