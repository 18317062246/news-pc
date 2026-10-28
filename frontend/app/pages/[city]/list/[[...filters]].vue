<script setup lang="ts">
const route = useRoute();
definePageMeta({
  key: (route) => route.path,
  validate: (route) => /^[a-z]{2,12}$/.test(String(route.params.city)),
  middleware: (to) => {
    const raw = Array.isArray(to.params.filters)
      ? to.params.filters.join("/")
      : String(to.params.filters || "");
    if (!raw) return;
    const match = /^(?:c([1-9]\d*)(?:\/p([1-9]\d*))?|p([1-9]\d*))\/?$/.exec(
      raw,
    );
    if (!match)
      return abortNavigation(
        createError({ statusCode: 404, statusMessage: "页面不存在" }),
      );
    to.params.type = match[1] || "";
    to.params.page = match[2] || match[3] || "1";
  },
});
</script>
<template><NewsFeed :city="String(route.params.city)" /></template>
