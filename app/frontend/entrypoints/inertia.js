import {createInertiaApp} from '@inertiajs/vue3'
import {createApp, h} from 'vue'
import {createI18n} from "vue-i18n";
// Vuetify
import 'vuetify/styles'
import {createVuetify} from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import ENSchema from "../locale/en.yaml"

const vuetify = createVuetify({
    components,
    directives,
    theme: {}
})

// i18n
const i18n = createI18n({
    locale: 'en-US',
    messages: {'en-US': ENSchema}
})

createInertiaApp({
    // Set default page title
    // see https://inertia-rails.netlify.app/guide/title-and-meta
    //
    // title: title => title ? `${title} - App` : 'App',

    // Disable progress bar
    //
    // see https://inertia-rails.netlify.app/guide/progress-indicators
    // progress: false,

    resolve: (name) => {
        const pages = import.meta.glob('../pages/**/*.vue', {eager: true})
        return pages[`../pages/${name}.vue`]

        // To use a default layout, import the Layout component
        // and use the following lines.
        // see https://inertia-rails.netlify.app/guide/pages#default-layouts
        //
        // const page = pages[`./pages/${name}.vue`]
        // page.default.layout ||= (page) => createElement(Layout, null, page)
        // return page
    },

    setup({el, App, props, plugin}) {
        createApp({render: () => h(App, props)})
            .use(plugin)
            .use(vuetify)
            .use(i18n)
            .mount(el)
    },
})
