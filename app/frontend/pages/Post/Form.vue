<template>
  <form @submit.prevent="emit('onSubmit', form)" class="flex flex-row">
    <div>
      <v-text-field label="Title" v-model="form.title" id="title"/>
      <div v-if="form.errors.title" class="error">
        {{ form.errors.title.join(', ') }}
      </div>
    </div>
    <div>
      <v-textarea v-model="form.body" id="body"/>
      <div v-if="form.errors.body" class="error">
        {{ form.errors.body.join(', ') }}
      </div>
    </div>
    <div>
      <button type="submit" :disabled="form.processing">
        {{ submitText }}
      </button>
    </div>
  </form>
</template>

<script setup lang="ts">
import {useForm} from '@inertiajs/vue3'

const {post, submitText} = defineProps(['post', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm<{ title: string, body: string }>({
  title: post.title || '',
  body: post.body || '',
})
</script>

<style scoped>
.label {
  display: block;
}

.error {
  color: red;
}
</style>
