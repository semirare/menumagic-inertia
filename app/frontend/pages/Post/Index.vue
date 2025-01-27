<template>
  <Head title="Posts" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <p
      v-if="flash.notice"
      class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block"
    >
      {{ flash.notice }}
    </p>

    <div class="flex justify-between items-center">
      <h1 class="font-bold text-4xl">Posts</h1>
      <Link
        href="/posts/new"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white block font-medium"
      >
        New post
      </Link>
    </div>

    <div class="min-w-full">
      <template v-for="post in posts" :key="post.id">
        <Post :post="post" />
        <p>
          <Link
            :href="`/posts/${post.id}`"
            class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
          >
            Show this post
          </Link>
        </p>
      </template>
    </div>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Post from './Post.vue'

const { posts, flash } = defineProps(['posts', 'flash'])
</script>
