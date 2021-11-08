module.exports = {
  mode: "jit",
  prefix: '',
  important: true,
  purge: {
    enabled: true,
    content: [
      './src/**/*.{html,ts,scss,js}',
    ]
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        'primary': '#FF7F57',
      },
      scale: {
        '200': '2',
        '300': '3'
      }
    },
  },
  variants: {
    extend: {},
  }
};
