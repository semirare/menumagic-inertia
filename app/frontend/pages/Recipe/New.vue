<template>
  <Head title="New recipe" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">New recipe</h1>

    <Form
      :recipe="recipe"
      submitText="Create Recipe"
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

const { recipe } = defineProps(['recipe'])

const handleSubmit = (form) => {
  form.transform((data) => ({ recipe: data }))
  form.recipe('/posts')
}
</script>
