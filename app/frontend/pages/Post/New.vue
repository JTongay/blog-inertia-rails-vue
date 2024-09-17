<template>
  <Head title="New post"/>
  <title>New Post</title>

  <h1 class="text-3xl font-bold underline">{{ t('post.new.title') }}</h1>

  <Form
      :post="post"
      submitText="Create post"
      @onSubmit="handleSubmit"
  />

  <br/>

  <div>
    <Link href="/posts">{{ t('buttons.back_to_posts') }}</Link>
  </div>
</template>

<script setup lang="ts">
import {Link, Head} from '@inertiajs/vue3'
import Form from '../../components/form/PostForm.vue'
import {useI18n} from "vue-i18n";

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
const {t} = useI18n()
</script>

<i18n lang="yaml" locale="en-US">
buttons:
  back_to_posts: Back to posts
</i18n>
