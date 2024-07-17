<template>
  <Head title="New post" />

  <h1>New post</h1>

  <Form
    :post="post"
    submitText="Create post"
    @onSubmit="handleSubmit"
  />

  <br />

  <div>
    <Link href="/posts">Back to posts</Link>
  </div>
</template>

<script setup>
import { Link, Head } from '@inertiajs/vue3'
import Form from './Form.vue'

const { post } = defineProps(['post'])

const handleSubmit = (form) => {
  form.transform((data) => ({ post: data }))
  form.post('/posts')
}
</script>
