# react-project-template

Script for creating a React project with Typescript and Webpack.
See [basarat/typescript-react](https://github.com/basarat/typescript-react/tree/master/01%20bootstrap)
for more info, this script will create similiar configuration.

## Use

Make the script executable with

    chmod u+x react-project-template.sh

Run the script

    ./react-project-template.sh "your-project-name-here"

This will create a new directory with the project name and create the following directory structure:
```
.
├── .gitignore
├── package.json
├── public
│   └── index.html
├── src
│   └── index.tsx
├── tsconfig.json
└── webpack.config.js

```

Navigate into the project directory and install all required packages with `npm install`.
Then build the app with `webpack` and start the dev server with `npm start`.

Change the package information in `package.json` if needed.

