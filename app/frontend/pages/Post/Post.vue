<template>
  <div>
    <p class="my-5">
      <strong class="block font-medium mb-1">Title:</strong>
      {{ post.title }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Body:</strong>
      {{ post.body }}
    </p>
    <p class="my-5">
      <strong class="block font-medium mb-1">Published at:</strong>
      {{ post.published_at }}
    </p>
  </div>
</template>

<script setup>
const { post } = defineProps(['post'])
</script>
