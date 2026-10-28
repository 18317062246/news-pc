<script setup lang="ts">
const route = useRoute();
definePageMeta({
  key: (route) => route.path,
  validate: (route) => /^[a-z]{2,12}$/.test(String(route.params.city)),
});
</script>
<template><NewsFeed :city="String(route.params.city)" home /></template>
