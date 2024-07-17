<template>
  <div>
    <p>
      <strong>Title:</strong>
      {{ post.title }}
    </p>
    <p>
      <strong>Body:</strong>
      {{ post.body }}
    </p>
  </div>
</template>

<script setup>
const { post } = defineProps(['post'])
</script>
