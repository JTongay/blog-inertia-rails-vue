import vue from '@vitejs/plugin-vue'
import {defineConfig} from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import vuetify from "vite-plugin-vuetify";
import FullReload from "vite-plugin-full-reload"
import vueDevTools from 'vite-plugin-vue-devtools'
import VueI18nPlugin from '@intlify/unplugin-vue-i18n/vite'
import {resolve} from 'node:path'
import {cwd} from "node:process"

export default defineConfig({
    plugins: [
        vue(),
        vueDevTools(),
        RubyPlugin(),
        vuetify({autoImport: true}),
        VueI18nPlugin({
            /* options */
            // locale messages resource pre-compile option
            include: [resolve(cwd(), "app/frontend/locale/**")]
        }),
        FullReload(["config/routes.rb", "app/views/**/*"], {delay: 200})
    ],
})
