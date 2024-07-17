import vue from '@vitejs/plugin-vue'
import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import vuetify from "vite-plugin-vuetify";
import FullReload from "vite-plugin-full-reload"

export default defineConfig({
  plugins: [
    vue(),
    RubyPlugin(),
    vuetify({autoImport: true}),
    FullReload(["config/routes.rb", "app/views/**/*"], { delay: 200 })
  ],
})
