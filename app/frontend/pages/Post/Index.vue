<template>
  <Head title="Posts" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Posts</h1>

  <v-btn variant="tonal"> Button </v-btn>
  <v-text-field label="Label"></v-text-field>

  <div>
    <div v-for="post in posts" :key="post.slug">
      <Post :post="post" />
      <p>
        <Link :href="`/posts/${post.slug}`">Show this post</Link>
      </p>
    </div>
  </div>

  <Link href="/posts/new">New post</Link>
</template>

<script setup lang="ts">
import { Link, Head } from "@inertiajs/vue3";
import Post from "./Post.vue";
import { BlogPost } from "../../models";

interface Props {
  posts: BlogPost[];
  flash: {
    notice: string;
  };
}

const { posts, flash } = defineProps<Props>();
</script>

<style scoped>
.notice {
  color: green;
}
</style>
