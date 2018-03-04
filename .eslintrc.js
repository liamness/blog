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
    files: ['.eslintrc.js', '*.config.*js'],
    env: { node: true },
    rules: {
      'global-require': 0,
    },
  },
};
