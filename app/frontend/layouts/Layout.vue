<script setup>
import { usePage } from "@inertiajs/vue3";
import { computed } from "vue";

const page = usePage();
const notice = computed(() => page.props.flash?.notice);
</script>

<template>
  <div>
    <header>
      <nav>
        <Navbar />
      </nav>
    </header>
    <main>
      <!-- Render the page content -->
      <!-- Global flash message -->
      <div
        v-if="notice"
        class="bg-green-100 text-green-800 p-3 rounded-md mb-4"
      >
        {{ notice }}
      </div>
      <slot />
    </main>
    <footer>
      <!-- Footer content -->
    </footer>
  </div>
</template>

<style scoped></style>
