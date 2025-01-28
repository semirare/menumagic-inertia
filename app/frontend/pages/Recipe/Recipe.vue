<template>
  <div>
    <p class="my-5">
      <strong class="block font-medium mb-1">Title:</strong>
      {{ recipe.name }}
    </p>
  </div>
</template>

<script setup>
const { recipe } = defineProps(['recipe'])
</script>
