<template>
  <div class="markdown-textarea">
    <v-container fluid>
      <v-textarea
          v-model="markdownContent"
          append-inner-icon="mdi-comment"
          @input="updatePreview"
          placeholder="Enter your Markdown here..."
      />
    </v-container>
    <div class="preview" v-html="htmlPreview"></div>
  </div>
</template>

<script setup lang="ts">
import {ref, computed} from 'vue';
import {marked} from 'marked';

const markdownContent = ref('');
const htmlPreview = computed(() => marked(markdownContent.value));

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