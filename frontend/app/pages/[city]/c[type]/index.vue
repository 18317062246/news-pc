<script setup lang="ts">
const route = useRoute();
await navigateTo(
  {
    path: `/${route.params.city}/list/c${route.params.type}`,
    query: route.query,
  },
  { redirectCode: 301 },
);
</script>
<template><p>正在前往栏目…</p></template>
