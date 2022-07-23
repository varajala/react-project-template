#!/bin/bash
project_name="react-app"
test ! -z "$1" && project_name="$1"

mkdir $project_name
cd $project_name
git init

cat << EOF > .gitignore
node_modules
public/build
package-lock.json
EOF

cat << EOF > package.json
{
  "name": "$project_name",
  "version": "1.0.0",
  "description": "React project template with Typescript and Webpack",
  "main": "src/index.tsx",
  "scripts": {
    "build": "webpack",
    "start": "webpack serve --open"
  },
  "author": "$(git config user.name)",
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0"
  },
  "devDependencies": {
    "@types/react": "^18.0.14",
    "@types/react-dom": "^18.0.5",
    "ts-loader": "^9.3.1",
    "typescript": "^4.7.4",
    "webpack": "^5.73.0",
    "webpack-cli": "^4.10.0",
    "webpack-dev-server": "^4.9.2"
  }
}
EOF

cat << EOF > tsconfig.json
{
  "compilerOptions": {
    "sourceMap": true,
    "module": "commonjs",
    "target": "es5",
    "jsx": "react"
  },
  "include": [
    "src"
  ],
  "compileOnSave": false
}
EOF

cat << EOF > webpack.config.js
const path = require('path');

module.exports = {
  entry: './src/index.tsx',
  mode: 'development',
  output: {
    path: path.resolve(__dirname + '/public/build'),
    filename: 'app.bundle.js'
  },
  devServer: {
    host: '127.0.0.1',
    port: 8080,
    devMiddleware: {
      publicPath: '/public',
      writeToDisk: true
    }
  },
  resolve: {
    extensions: ['.ts', '.tsx', '.js']
  },
  module: {
    rules: [
      { test: /\.tsx?$/, loader: 'ts-loader' }
    ]
  }
}
EOF

mkdir public
cat << EOF > public/index.html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>$project_name</title>
    </head>

    <body>
        <div id="root"></div>
        <script src="./build/app.bundle.js"></script>
    </body>
</html>
EOF

mkdir src
cat << EOF > src/index.tsx
import * as React from "react";
import * as ReactDOM from "react-dom/client";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<h1>$project_name</h1>);
EOF

