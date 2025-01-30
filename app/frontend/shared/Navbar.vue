<script setup>
import { Link } from "@inertiajs/vue3";
</script>

<template>
  <div class="flex justify-end bg-blue-500">
    <Link :href="`/recipes`" class="p-2 bg-blue-200 border-r-2 border-black">
      Recipes
    </Link>
    <Link :href="`/plannings`" class="p-2 bg-blue-200"> Planning </Link>
  </div>
</template>
