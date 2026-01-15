<template>
  <Head>
    <title>Post #{{ post.slug }}</title>
    <meta name="description" content="your page description" />
  </Head>

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <div class="mx-8">
    <Post :post="post" />
    <Link href="/posts">Back to posts</Link>
  </div>
</template>

<script setup lang="ts">
import { Link, Head } from "@inertiajs/vue3";
import Post from "./Post.vue";
import { BlogPost } from "../../models";

type Props = {
  post: BlogPost;
  flash: {
    notice: string;
  };
};

defineProps<Props>();
</script>

<style scoped>
.notice {
  color: green;
}
</style>
