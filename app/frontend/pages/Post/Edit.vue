<template>
  <Head title="Editing post"/>

  <h1>Editing post</h1>

  <Form
      :post="post"
      submitText="Update post"
      @onSubmit="handleSubmit"
  />

  <br/>

  <div>
    <Link :href="`/posts/${post.id}`">Show this post</Link>
    |
    <Link href="/posts">Back to posts</Link>
  </div>
</template>

<script setup>
import {Link, Head} from '@inertiajs/vue3'
import Form from '../../components/form/PostForm.vue'

const {post} = defineProps(['post'])

const handleSubmit = (form) => {
  form.transform((data) => ({post: data}))
  form.patch(`/posts/${post.id}`)
}
</script>
