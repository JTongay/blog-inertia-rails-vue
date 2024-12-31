<template>
  <v-text-field
      :id="id || label.split(' ').join()"
      :label="label"
      v-model="model"
      :rules="[rules.required]"
      :type="type"
  />


</template>

<script setup lang="ts">
import {ref} from "vue";

type Props = {
  label: string
  required: boolean
  type: "text" | "number" | "email" | "password"
  id?: string
}

const props = withDefaults(defineProps<Props>(), {
  required: false,
  type: "text"
})

const model = defineModel<string>()
const localModel = ref<string>(model.value)

const rules = {
  required: (value: string) => {
    if (props.required) {
      return !!value || 'This field is required';
    }

    return true
  }
}
</script>