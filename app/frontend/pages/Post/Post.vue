<template>
  <div>
    <div class="text-center">
      <h1>{{ post.title }}</h1>

      <p>By {{ post.author }}</p>
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
