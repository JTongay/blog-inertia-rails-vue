/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/views/**/*.html.erb",
    "./app/frontend/**/*.vue",
  ],
  theme: {
    colors: {
      white: "#ffffff",
      black: "#000000",
      transparent: "transparent",

      // Neutral scale — slightly warm zinc tones
      neutral: {
        950: "#09090b",
        900: "#111113",
        850: "#18181b",
        800: "#1f1f23",
        700: "#2e2e33",
        600: "#3f3f46",
        500: "#52525b",
        400: "#71717a",
        300: "#a1a1aa",
        200: "#d4d4d8",
        100: "#e4e4e7",
        50: "#f4f4f5",
      },

      // Muted warm accent — desaturated amber/gold
      accent: {
        DEFAULT: "#b39660",
        light: "#c9ad7a",
        dim: "#8a7348",
        muted: "#6b5a3a",
      },
    },
    fontFamily: {
      sans: ['"Instrument Sans"', 'ui-sans-serif', 'system-ui', 'sans-serif'],
      serif: ['"Newsreader"', 'ui-serif', 'Georgia', 'serif'],
      mono: ['"JetBrains Mono"', 'ui-monospace', 'monospace'],
    },
    extend: {},
  },
  plugins: [],
};
