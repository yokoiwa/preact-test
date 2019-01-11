path = require 'path'
DashboardPlugin = require 'webpack-dashboard/plugin'
HtmlWebpackPlugin = require 'html-webpack-plugin'

pathAbsolDist = path.join __dirname, 'dist'
pathAbsolSrc = path.join __dirname, 'src'

module.exports =
  watch: true
  mode: 'development'
  entry:
    index: './src/index.coffee'
  output:
    path: pathAbsolDist
    filename: '[name].js'
  plugins: [
    new HtmlWebpackPlugin
      template: './src/index.pug'
      path: pathAbsolDist
      filename: 'index.html'
  ,
    new DashboardPlugin()
  ]
  devServer:
    contentBase: pathAbsolSrc
    inline: true
    compress: true
    # host: 'localhost'
    # port: 8080
    public: '8080-dot-4410363-dot-devshell.appspot.com'
    hot: true
    # https: true
    watchContentBase: true
  module:
    rules: [
      test: /\.pug$/
      use: [
        loader: 'pug-loader'
      ]
    ,
      test: /\.coffee$/
      use: [
        loader: 'coffee-loader'
      ]
    ]
