<script setup lang="ts">
import type { Article } from "~/types/news";
const route = useRoute();
definePageMeta({
  key: (route) => route.path,
  validate: (route) =>
    /^[a-z]{2,12}$/.test(String(route.params.city)) &&
    /^[1-9]\d*$/.test(String(route.params.id)),
});
const city = String(route.params.city);
const { data, error } = await useFetch<{ article: Article }>(
  `/api/pc/${city}/news/${route.params.id}`,
);
if (error.value)
  throw createError({
    statusCode: error.value.statusCode || 502,
    statusMessage:
      error.value.statusCode === 410
        ? "文章已下架"
        : error.value.statusCode === 404
          ? "文章不存在"
          : "文章加载失败，请稍后再试",
  });
const article = computed(() => data.value?.article);
useSeoMeta({
  title: () => `${article.value?.Title || "文章详情"} - 中原资讯`,
  description: () => article.value?.Description || article.value?.Title,
});
</script>
<template>
  <SiteShell :city="city"
    ><nav class="breadcrumb">
      <NuxtLink :to="`/${city}/`">城市首页</NuxtLink> /
      <NuxtLink :to="`/${city}/list/`">资讯列表</NuxtLink> / 正文
    </nav>
    <article v-if="article" class="article">
      <p class="eyebrow">{{ article.Typename || "楼市资讯" }}</p>
      <h1>{{ article.Title }}</h1>
      <p class="article-meta">
        <time>{{ displayDate(article.PublishDate) }}</time
        ><span
          >来源：{{ article.Sources || article.Source || "中原资讯" }}</span
        >
      </p>
      <div class="article-body" v-html="article.Content" /></article
  ></SiteShell>
</template>
