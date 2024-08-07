<template>
  <Head title="Posts" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Posts</h1>

  <v-btn variant="tonal">
    Button
  </v-btn>
  <v-text-field label="Label"></v-text-field>

  <div>
    <div v-for="post in posts" :key="post.id">
      <Post :post="post" />
      <p>
        <Link :href="`/posts/${post.id}`">Show this post</Link>
      </p>
    </div>
  </div>

  <Link href="/posts/new">New post</Link>
</template>

<script setup>
import { Link, Head } from '@inertiajs/vue3'
import Post from './Post.vue'

const { posts, flash } = defineProps(['posts', 'flash'])
</script>

<style scoped>
.notice {
  color: green;
}
</style>
