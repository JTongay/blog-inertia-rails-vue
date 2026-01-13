<template>
  <Head :title="`Post #${post.slug}`" />

  <p v-if="flash.notice" class="notice">{{ flash.notice }}</p>

  <Post :post="post" />

  <div>
    <Link href="/posts">Back to posts</Link>

    <br />
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
