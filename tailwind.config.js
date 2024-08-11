/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './app/helpers/**/*.rb',
        './app/assets/stylesheets/**/*.css',
        "./app/views/**/*.html.erb",
        "./app/frontend/**/*.vue",
        // "./index.html",
        // "./src/**/*.{js,ts,jsx,tsx}",
    ],
    theme: {
        extend: {},
    },
    plugins: [],
}

