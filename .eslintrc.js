module.exports = {
  extends: 'airbnb-base',
  parserOptions: {
    ecmaVersion: 2017,
    sourceType: 'module',
  },
  env: { browser: true },
  plugins: ['compat'],
  rules: {
    'compat/compat': 2,
  },
  overrides: {
    files: ['.eslintrc.js', '*config*'],
    env: { node: true },
    rules: {
      'global-require': 0,
      'import/no-extraneous-dependencies': [1, { devDependencies: true }],
    },
  },
};
