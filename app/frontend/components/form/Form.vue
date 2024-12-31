<template>
  <form
      @submit.prevent="emit('onSubmit', form)"
      :form-data="$props.formData"
      novalidate
  >
    <slot name="inputs" :errors="form.errors"/>

    <slot name="submitBtn">
      <v-btn type="submit"
             :disabled="form.processing"
             variant="outlined"
      >
        <i18n-t keypath="submit" tag="span"/>
      </v-btn>
    </slot>
  </form>
</template>

<script setup lang="ts" generic="T extends Record<string, string | number>">
import {useForm} from '@inertiajs/vue3'
import {useI18n} from "vue-i18n";

type Props = {
  formData: T
}

type InputsSlotProps = {
  errors: Partial<Record<keyof T, string>>
}

type Slots = {
  inputs: (props: InputsSlotProps) => never
  submitBtn: never
}

const props = defineProps<Props>()
const form = useForm<T>(props.formData)
const emit = defineEmits(['onSubmit'])

defineSlots<Slots>()
useI18n()
</script>

<i18n lang="yaml" locale="en-US">
submit: Submit
</i18n>