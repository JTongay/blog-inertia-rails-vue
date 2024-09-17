<template>
  <form @submit.prevent="emit('onSubmit', form)" class="flex flex-column mx-10">
    <div>
      <v-text-field label="Title" v-model="form.title" id="title"/>
      <div v-if="form.errors.title" class="error">
        {{ form.errors.title.join(', ') }}
      </div>
    </div>
    <div>
      <MarkdownInput v-model="form.body" id="body"/>
      <div v-if="form.errors.body" class="error">
        {{ form.errors.body.join(', ') }}
      </div>
    </div>
    <div>
      <v-btn type="submit" :disabled="form.processing">
        {{ submitText }}
      </v-btn>
    </div>
  </form>
</template>

<script setup lang="ts">
import {useForm} from '@inertiajs/vue3'
import MarkdownInput from "./MarkdownInput.vue";
import MarkdownViewer from "../MarkdownViewer.vue";

type Props = {
  post?: {
    title: string
    body: string
  }
  submitText: string
}

const props = defineProps<Props>()
const emit = defineEmits(['onSubmit'])

const form = useForm<{ title: string, body: string }>({
  title: props.post.title || '',
  body: props.post.body || '',
})
console.log(form.body, "form body")
</script>

<style scoped>
.label {
  display: block;
}

.error {
  color: red;
}
</style>
