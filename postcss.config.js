module.exports = {
  plugins: [
    require('tailwindcss'),
    require('autoprefixer'),
    require('postcss-nested'),
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ],
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
    'postcss-easy-import': { prefix: '_', extensions: ['.css', '.scss'] },
  }
}
