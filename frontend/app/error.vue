<script setup lang="ts">
import type { NuxtError } from "#app";
defineProps<{ error: NuxtError }>();
useSeoMeta({ title: "访问提示 - 中原资讯", robots: "noindex,follow" });
const config = useRuntimeConfig();
</script>
<template>
  <main class="error-page">
    <p class="eyebrow">{{ error.statusCode }}</p>
    <h1>{{ error.statusMessage || "页面暂时不可用" }}</h1>
    <p>请确认城市和文章地址，或稍后再试。</p>
    <button @click="clearError({ redirect: `/${config.public.defaultCity}/` })">
      返回首页
    </button>
  </main>
</template>
