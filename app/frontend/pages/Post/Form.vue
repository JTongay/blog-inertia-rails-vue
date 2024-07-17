<template>
  <form @submit.prevent="emit('onSubmit', form)">
    <div>
      <label class="label" for="title">Title</label>
      <input type="text" name="title" id="title" v-model="form.title" />
      <div v-if="form.errors.title" class="error">
        {{ form.errors.title.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="body">Body</label>
      <input type="text" name="body" id="body" v-model="form.body" />
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

<script setup>
import { useForm } from '@inertiajs/vue3'

const { post, submitText } = defineProps(['post', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
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
