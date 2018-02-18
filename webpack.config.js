module.exports = {
  context: __dirname,
  entry: './js/blog.js',
  output: {
    path: `${__dirname}/public`,
    filename: 'blog.js',
  },
  module: {
    rules: [{
      test: /\.js$/,
      exclude: /node_modules/,
      loader: 'babel-loader',
      options: {
        presets: ['env'],
      },
    }],
  },
};
