<template>
  <Head :title="`Post #${post.id}`" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <h1>Post #{{ post.id }}</h1>

  <Post :post="post" />

  <div>
    <Link :href="`/posts/${post.id}/edit`">Edit this post</Link> |
    <Link href="/posts">Back to posts</Link>

    <br />

    <Link
      :href="`/posts/${post.id}`"
      @click="onDestroy"
      as="button"
      method="delete"
    >
      Destroy this post
    </Link>
  </div>
</template>

<script setup>
import { Link, Head } from '@inertiajs/vue3'
import Post from './Post.vue'

const { post, flash } = defineProps(['post', 'flash'])

const onDestroy = (e) => {
  if (!confirm('Are you sure you want to delete this post?')) {
    e.preventDefault()
  }
}
</script>

<style scoped>
.notice {
  color: green;
}
</style>
