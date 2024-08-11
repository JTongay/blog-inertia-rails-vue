<template>
  <Head title="New post"/>
  <title>New Post</title>

  <h1 class="text-3xl font-bold underline">New post</h1>

  <Form
      :post="post"
      submitText="Create post"
      @onSubmit="handleSubmit"
  />

  <br/>

  <div>
    <Link href="/posts">Back to posts</Link>
  </div>
</template>

<script setup lang="ts">
import {Link, Head} from '@inertiajs/vue3'
import Form from './Form.vue'

type Props = {
  post: {
    title: string
    body: string
  }
}

defineProps<Props>()

const handleSubmit = (form) => {
  form.transform((data) => ({post: data}))
  form.post('/posts')
}
</script>
