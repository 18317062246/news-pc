<script setup lang="ts">
defineProps<{ city: string }>();
const cities = [
  { code: "bj", name: "北京" },
  { code: "tj", name: "天津" },
  { code: "wh", name: "武汉" },
  { code: "cd", name: "成都" },
  { code: "nj", name: "南京" },
  { code: "zh", name: "珠海" },
];
</script>
<template>
  <header class="site-header">
    <div class="container header-inner">
      <NuxtLink :to="`/${city}/`" class="brand"
        >中原地产 <span>资讯</span></NuxtLink
      >
      <nav aria-label="城市切换">
        <NuxtLink
          v-for="item in cities"
          :key="item.code"
          :to="`/${item.code}/`"
          :class="{ active: item.code === city }"
          >{{ item.name }}</NuxtLink
        >
      </nav>
    </div>
  </header>
  <main class="container"><slot /></main>
  <footer class="container footer">中原资讯 · 房产资讯与置业知识</footer>
</template>
