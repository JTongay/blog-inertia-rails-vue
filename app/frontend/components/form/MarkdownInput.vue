<template>
  <div class="markdown-textarea">
    <v-container fluid>
      <v-textarea
          v-model="markdownContent"
          append-inner-icon="mdi-comment"
          @input="updatePreview"
          :rules="[rules.required]"
          placeholder="Enter your Markdown here..."
      />
    </v-container>
    <div class="preview" v-html="htmlPreview"></div>
  </div>
</template>

<script setup lang="ts">
import {ref, computed} from 'vue';
import {marked} from 'marked';

type Props = {
  required: boolean
}

const props = withDefaults(defineProps<Props>(), {
  required: false
})
const model = defineModel<string>({type: String, default: undefined})
const markdownContent = ref(model.value);
const htmlPreview = computed(() => marked(markdownContent.value));
const rules = {
  required: (value: string) => {
    if (props.required) {
      return !!value || 'This field is required';
    }

    return true
  }
}

function updatePreview() {
  // No need to do anything, the computed property will handle the update
}
</script>

<style scoped>
.markdown-textarea {
  display: flex;
  gap: 20px;
}

.preview {
  width: 50%;
  min-height: 300px;
  padding: 10px;
  border: 1px solid #ccc;
  overflow-y: auto;
}
</style>