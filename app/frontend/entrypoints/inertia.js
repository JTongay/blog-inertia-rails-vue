import { createInertiaApp } from "@inertiajs/vue3";
import { createApp, h } from "vue";
// Vuetify
import "vuetify/styles";
import { createVuetify } from "vuetify";
import * as components from "vuetify/components";
import * as directives from "vuetify/directives";

const vuetify = createVuetify({
  components,
  directives,
  theme: {},
});

createInertiaApp({
  // Set default page title
  // see https://inertia-rails.netlify.app/guide/title-and-meta
  //
  title: (title) => {
    return title ? title : "Joey's Blog";
  },
  //  title: (title) => (title ? `${title} - App` : "App"),

  // Disable progress bar
  //
  // see https://inertia-rails.netlify.app/guide/progress-indicators
  // progress: false,

  resolve: (name) => {
    const pages = import.meta.glob("../pages/**/*.vue", { eager: true });
    return pages[`../pages/${name}.vue`];

    // To use a default layout, import the Layout component
    // and use the following lines.
    // see https://inertia-rails.netlify.app/guide/pages#default-layouts
    //
    // const page = pages[`./pages/${name}.vue`]
    // page.default.layout ||= (page) => createElement(Layout, null, page)
    // return page
  },

  defaults: {
    future: {
      useDataInertiaHeadAttribute: true,
    },
  },

  setup({ el, App, props, plugin }) {
    createApp({ render: () => h(App, props) })
      .use(plugin)
      .use(vuetify)
      .mount(el);
  },
});
