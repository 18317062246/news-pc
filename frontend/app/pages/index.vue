<script setup lang="ts">
const config = useRuntimeConfig();
await navigateTo(`/${config.public.defaultCity}/`, { redirectCode: 302 });
</script>
<template><p>正在前往城市资讯…</p></template>
