<template>
  <div class="preview" v-html="htmlPreview"></div>
</template>

<script setup lang="ts">

import {computed, toRef} from "vue";
import {marked} from "marked";

type Props = {
  markdownContent: string
}

const {markdownContent} = defineProps<Props>()
const content = toRef(markdownContent)

const htmlPreview = computed(() => marked(content.value));
</script>

<style scoped>
.preview {
  width: 50%;
  min-height: 300px;
  padding: 10px;
  border: 1px solid #ccc;
  overflow-y: auto;
}
</style>