// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex'
  ],
  theme: {
    extend: {},
    colors: {
      'primary': '#111827',
      'primary-light': '#334155',
      'white': '#ffffff'
    }
  },
  plugins: [
    require('@tailwindcss/forms')
  ]
}