const path = require('path');
const MiniCSSExtractPlugin = require('mini-css-extract-plugin');
const postcssPresetEnv = require('postcss-preset-env');
const devMode = process.env.NODE_ENV !== 'production';

module.exports = {
    entry: { main: './resources/assets/js/app.js' },
    output: {
        path: path.resolve(__dirname, 'public'),
        filename: 'js/app.js'
    },
    module: {
        rules: [
            {
                test: /\.tag$/,
                exclude: /node_modules/,
                loader: 'riot-tag-loader',
                query: {
                    type: 'es6',
                    hot: true
                }
            },
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: {
                    loader: 'babel-loader'
                } 
            },
            {
                test: /\.scss$/,
                use: [
                    { 
                        loader: 'style-loader'
                    }, 
                    {
                        loader: MiniCSSExtractPlugin.loader
                    }, 
                    {
                        loader: 'css-loader'
                    }, 
                    {
                        loader: 'postcss-loader',
                        options: {
                            ident: 'postcss',
                            plugins: devMode 
                                ? () => [
                                    postcssPresetEnv({
                                        browsers: ['>1%']
                                    })
                                ] 
                                : () => [
                                    postcssPresetEnv({
                                        browsers: ['>1%']
                                    }),
                                    require('cssnano')()
                                ]
                        }
                    }, 
                    {
                        loader: 'sass-loader'
                    }
                ]
            },
            {
                test: /\.(png|jpe?g|gif)$/,
                use: [
                    {
                        loader: 'file-loader',
                        options: {
                            name: '[name].[ext]',
                            publicPath: '../images',
                            emitFile: false
                        }
                    }
                ]
            }
        ]
    },
    plugins: [
        new MiniCSSExtractPlugin({
            filename: 'css/app.css',
        })
    ]
};