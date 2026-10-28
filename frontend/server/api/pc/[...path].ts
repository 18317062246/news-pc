import { cleanArticle } from "../../utils/article.mjs";

export default defineEventHandler(async (event) => {
  if (event.method !== "GET")
    throw createError({ statusCode: 405, statusMessage: "Method not allowed" });
  const path = getRouterParam(event, "path") || "";
  if (!/^[a-z]{2,12}\/(columns|news(?:\/[1-9]\d*)?)$/.test(path)) {
    throw createError({ statusCode: 404, statusMessage: "接口不存在" });
  }
  const config = useRuntimeConfig(event);
  const query = getQuery(event);
  // Only forward supported query parameters; the upstream host is server configuration.
  const params = Object.fromEntries(
    ["page", "pageSize", "typeId", "keyword"]
      .filter((key) => typeof query[key] === "string")
      .map((key) => [key, query[key]]),
  );
  try {
    const data = await $fetch<Record<string, any>>(
      `${config.pcApiBase.replace(/\/$/, "")}/pc-api/v1/${path}`,
      {
        query: params,
        timeout: 15000,
        retry: 0,
      },
    );
    if (data.article) data.article.Content = cleanArticle(data.article.Content);
    return data;
  } catch (error: any) {
    const status = error.response?.status || 502;
    throw createError({
      statusCode: status,
      statusMessage: "资讯请求失败",
      data: {
        message: error.data?.message || "资讯服务暂时不可用，请稍后重试",
      },
    });
  }
});
