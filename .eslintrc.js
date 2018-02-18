module.exports = {
  extends: 'airbnb-base',
  parserOptions: {
    ecmaVersion: 2017,
    sourceType: 'module',
  },
  env: { browser: true },
  plugins: ['compat'],
  rules: {
    'import/no-extraneous-dependencies': [1, { devDependencies: true }],
    'max-len': [2, 120],
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
