<template>
  <div class="space-y-6">
    <div class="text-center">
      <h1>{{ post.title }}</h1>

      <p>By {{ post.author }}</p>
      <small>Published on {{ post.authored_on }}</small>
    </div>
    <div v-html="post.content"></div>
  </div>
</template>

<script setup lang="ts">
import { BlogPost } from "../../models";

type Props = {
  post: BlogPost;
};

defineProps<Props>();
</script>
