<template>
  <Head title="New post" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">New post</h1>

    <Form
      :post="post"
      submitText="Create Post"
      @onSubmit="handleSubmit"
    />

    <Link
      href="/posts"
      class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Back to posts
    </Link>
  </div>
</template>

<script setup>
import { Head, Link } from '@inertiajs/vue3'
import Form from './Form.vue'

const { post } = defineProps(['post'])

const handleSubmit = (form) => {
  form.transform((data) => ({ post: data }))
  form.post('/posts')
}
</script>
