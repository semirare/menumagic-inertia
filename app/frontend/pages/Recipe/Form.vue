<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { computed } from "vue";

const { recipe, submitText } = defineProps(["recipe", "submitText"]);
const emit = defineEmits(["onSubmit"]);

const form = useForm({
  name: recipe.name || "",
});

const page = usePage();
const notice = computed(() => page.props.notice);
</script>

<template>
  <div v-if="notice" class="bg-green-100 text-green-800 p-3 rounded-md mb-4">
    {{ notice }}
  </div>
  <form @submit.prevent="emit('onSubmit', form)" class="contents">
    <div class="my-5">
      <label for="name">Name</label>
      <input
        type="text"
        name="name"
        id="name"
        v-model="form.name"
        class="block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full"
      />
      <div v-if="form.errors.name" :class="$style.error">
        {{ form.errors.name.join(", ") }}
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

<style module>
.label {
  display: block;
}
.error {
  color: red;
}
</style>
