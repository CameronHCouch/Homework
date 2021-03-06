const path = require('path');

module.exports = {
  context: __dirname,
  entry: "./entry.jsx",
  output: {
    path: path.resolve(__dirname),
    filename: "./bundle.jsx",
},
  resolve: {
    extensions: ['.js', '.jsx', '*']
  },
  devtool: 'source-map',
  module: {
    rules: [
      {
        test: [/\.jsx?$/],
        exclude: /(node_modules)/,
        use: {
          loader: 'babel-loader',
          query: {
            presets: ['@babel/env', '@babel/react']
          }
        },
      }
    ]
  }
};