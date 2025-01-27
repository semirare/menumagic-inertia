<template>
  <form @submit.prevent="emit('onSubmit', form)" class="contents">
    <div class="my-5">
      <label for="title">Title</label>
      <input
        type="text"
        name="title"
        id="title"
        v-model="form.title"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.title" :class="$style.error">
        {{ form.errors.title.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="body">Body</label>
      <textarea
        name="body"
        id="body"
        v-model="form.body"
        rows="4"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.body" :class="$style.error">
        {{ form.errors.body.join(', ') }}
      </div>
    </div>

    <div class="my-5">
      <label for="published_at">Published at</label>
      <input
        type="datetime-local"
        name="published_at"
        id="published_at"
        v-model="form.published_at"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.published_at" :class="$style.error">
        {{ form.errors.published_at.join(', ') }}
      </div>
    </div>

    <div class="inline">
      <button
        type="submit"
        :disabled="form.processing"
        class="rounded-lg py-3 px-5 bg-blue-600 text-white inline-block font-medium cursor-pointer"
      >
        {{ submitText }}
      </button>
    </div>
  </form>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'

const { post, submitText } = defineProps(['post', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  title: post.title || '',
  body: post.body || '',
  published_at: post.published_at || '',
})
</script>

<style module>
.label {
  display: block;
}
.error {
  color: red;
}
</style>
