<script setup>
import { Head, Link } from "@inertiajs/vue3";
import Form from "./Form.vue";

const { recipe } = defineProps(["recipe"]);

const handleSubmit = (form) => {
  form.transform((data) => ({ recipe: data }));
  form.patch(`/recipes/${recipe.id}`);
};
</script>

<template>
  <Head title="Editing recipe" />

  <div className="mx-auto md:w-2/3 w-full px-8 pt-8">
    <h1 class="font-bold text-4xl">Editing recipe</h1>

    <Form
      :recipe="recipe"
      submitText="Update Recipe"
      @onSubmit="handleSubmit"
    />
    <Link
      href="/recipes"
      class="ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium"
    >
      Back to recipes
    </Link>
  </div>
</template>
