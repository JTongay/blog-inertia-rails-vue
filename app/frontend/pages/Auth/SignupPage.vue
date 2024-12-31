<template>
  <i18n-t keypath="title" tag="h1"/>
  <form @submit.prevent="handleSubmit">
    {{ props.errors }}
    <TextInput label="First Name" required v-model="form.firstName" id="firstName"/>
    <div v-if="form.errors.firstName" class="error">
      {{ form.errors.firstName }}
    </div>
    <TextInput label="Last Name" required v-model="form.lastName" id="lastName"/>
    <div v-if="form.errors.lastName" class="error">
      {{ form.errors.lastName }}
    </div>
    <TextInput label="Email" required v-model="form.email" id="email" type="email"/>
    <div v-if="form.errors.email" class="error">
      {{ form.errors.email }}
    </div>
    <TextInput label="Password" required v-model="form.password" id="password" type="password"/>
    <div v-if="form.errors.password" class="error">
      {{ form.errors.password }}
    </div>
    <v-btn type="submit" :disabled="form.processing" variant="outlined">
      Submit
    </v-btn>
  </form>
</template>

<script setup lang="ts">

import {useForm} from "@inertiajs/vue3";
import TextInput from "../../components/form/TextInput.vue";
import {useI18n} from "vue-i18n";

console.log("SignupPage")

type FormProps = {
  email: string
  firstName: string
  lastName: string
  password: string
}

const props = defineProps<{ errors: object }>()
console.log(props, "props")

const handleSubmit = (data) => {
  form.transform((formData) => ({
    user: {
      email: formData.email,
      first_name: formData.firstName,
      last_name: formData.lastName,
      password: formData.password
    }
  })).post("/auth")
}

const form = useForm<FormProps>({
  email: '',
  firstName: '',
  lastName: '',
  password: ''
})

useI18n()
</script>

<i18n lang="yaml" locale="en-US">
title: Sign up
</i18n>