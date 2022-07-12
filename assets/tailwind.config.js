// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex'
  ],
  theme: {
    extend: {},
    colors: {
      slate: colors.slate,
      indigo: colors.indigo,
      'primary': '#111827',
      'primary-light': '#334155',
      'white': '#ffffff'
    }
  },
  plugins: [
    require('@tailwindcss/forms')
  ]
}
