<script setup lang="ts">
import type { Column, NewsPage } from "~/types/news";
const props = defineProps<{ city: string; home?: boolean }>();
const route = useRoute();
const keyword = ref(String(route.query.keyword || ""));
watch(
  () => route.query.keyword,
  (value) => {
    keyword.value = String(value || "");
  },
);
const page = computed(() =>
  Math.max(1, Number(route.params.page || route.query.page) || 1),
);
const typeId = computed(() =>
  String(route.params.type || route.query.typeId || ""),
);
const query = computed(() => ({
  page: page.value,
  pageSize: 10,
  ...(typeId.value ? { typeId: typeId.value } : {}),
  ...(route.query.keyword ? { keyword: String(route.query.keyword) } : {}),
}));
const { data: columns, error: columnError } = await useFetch<{
  columns: Column[];
}>(() => `/api/pc/${props.city}/columns`);
const { data, error, status, refresh } = await useFetch<NewsPage>(
  () => `/api/pc/${props.city}/news`,
  { query },
);
if (columnError.value || error.value) {
  const failure = error.value || columnError.value;
  throw createError({
    statusCode: failure?.statusCode || 502,
    statusMessage: "资讯加载失败，请检查 PC Java 服务与上游接口",
  });
}
const flatColumns = computed(() => {
  const flatten = (items: Column[]): Column[] =>
    items.flatMap((item) => [item, ...flatten(item.ChildList || [])]);
  return flatten(columns.value?.columns || []);
});
const currentTitle = computed(
  () =>
    flatColumns.value.find((item) => String(item.Id) === typeId.value)
      ?.ColumnsName || (props.home ? "城市资讯" : "资讯列表"),
);
useSeoMeta({
  title: () => `${currentTitle.value} - 中原资讯`,
  description: "关注城市楼市动态、房产政策与置业知识。",
  robots: () => (route.query.keyword ? "noindex,follow" : "index,follow"),
});
const pages = computed(() =>
  Math.max(1, Math.ceil((data.value?.total || 0) / 10)),
);
function listLink(nextPage: number) {
  return {
    path: `/${props.city}/list/`,
    query: {
      ...route.query,
      ...(typeId.value ? { typeId: typeId.value } : {}),
      page: nextPage,
    },
  };
}
function search() {
  navigateTo({
    path: `/${props.city}/list/`,
    query: keyword.value.trim() ? { keyword: keyword.value.trim() } : {},
  });
}
</script>
<template>
  <SiteShell :city="city">
    <section class="intro">
      <p class="eyebrow">CENTALINE NEWS</p>
      <h1>{{ currentTitle }}</h1>
      <p>了解城市动态，让每一次置业更有依据。</p>
    </section>
    <form class="search" role="search" @submit.prevent="search">
      <label for="keyword">资讯搜索</label
      ><input
        id="keyword"
        v-model="keyword"
        maxlength="100"
        placeholder="输入新闻关键词"
      /><button>搜索</button>
    </form>
    <nav class="tabs" aria-label="资讯栏目">
      <NuxtLink :to="`/${city}/list/`" :class="{ active: !typeId }"
        >全部资讯</NuxtLink
      ><NuxtLink
        v-for="column in flatColumns"
        :key="column.Id"
        :to="`/${city}/list/c${column.Id}`"
        :class="{ active: String(column.Id) === typeId }"
        >{{ column.ColumnsName }}</NuxtLink
      >
    </nav>
    <div class="section-heading">
      <h2>
        {{ route.query.keyword ? `搜索：${route.query.keyword}` : "最新资讯" }}
      </h2>
      <span>共 {{ data?.total || 0 }} 条</span>
    </div>
    <div v-if="error" class="empty" role="alert">
      资讯加载失败。<button @click="refresh()">重试</button>
    </div>
    <p v-else-if="status === 'pending'" class="empty" aria-live="polite">
      正在加载…
    </p>
    <p v-else-if="!data?.items.length" class="empty">
      暂无相关资讯，请尝试其他栏目或关键词。
    </p>
    <div v-else class="news-list">
      <article
        v-for="item in data.items"
        :key="item.ID ?? item.id"
        class="news-card"
      >
        <NuxtLink
          v-if="item.LitPic && /^(https?:)?\/\//.test(item.LitPic)"
          class="thumbnail"
          :to="`/${city}/detail/${item.ID ?? item.id}.html`"
          ><img :src="item.LitPic" :alt="item.Title" loading="lazy"
        /></NuxtLink>
        <div>
          <h3>
            <NuxtLink :to="`/${city}/detail/${item.ID ?? item.id}.html`">{{
              item.Title
            }}</NuxtLink>
          </h3>
          <p>{{ item.Description || "点击查看完整资讯" }}</p>
          <time>{{ displayDate(item.PublishDate) }}</time>
        </div>
      </article>
    </div>
    <nav v-if="pages > 1" class="pagination" aria-label="分页">
      <NuxtLink v-if="page > 1" :to="listLink(page - 1)">上一页</NuxtLink
      ><span>第 {{ page }} / {{ pages }} 页</span
      ><NuxtLink v-if="page < pages" :to="listLink(page + 1)">下一页</NuxtLink>
    </nav>
  </SiteShell>
</template>
