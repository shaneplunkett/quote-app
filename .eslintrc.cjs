const { resolve } = require('node:path');

const project = resolve(__dirname, 'tsconfig.eslint.json');

/** @type {import('eslint').ESLint.ConfigData} */
module.exports = {
  root: true,
  plugins: ['simple-import-sort', 'import'],
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',

    // TODO: Use @vercel/style-guide or the below, to use type checked linting
    // 'plugin:@typescript-eslint/recommended-type-checked',
  ],
  parserOptions: {
    project,
  },
  rules: {
    curly: 'error',
    'no-console': 'warn',
    'simple-import-sort/imports': 'error',
    'simple-import-sort/exports': 'error',
    'import/no-default-export': 'warn',
    '@typescript-eslint/explicit-function-return-type': 'warn',
    '@typescript-eslint/no-explicit-any': 'warn',
    '@typescript-eslint/no-unused-vars': 'warn',
    '@typescript-eslint/ban-ts-comment': 'warn',
    '@typescript-eslint/ban-types': 'warn',
    '@typescript-eslint/no-loss-of-precision': 'warn',
    'func-style': ['warn', 'expression'],
    'prefer-arrow-callback': 'warn',
    'no-useless-escape': 'warn',
    'no-prototype-builtins': 'warn',
    'no-async-promise-executor': 'warn',
    'no-case-declarations': 'warn',
    'no-empty': 'warn',
    'no-unexpected-multiline': 'warn',
    'no-useless-catch': 'warn',
    'prefer-const': 'warn',
    'prefer-rest-params': 'warn',
    // Type checked:
    '@typescript-eslint/no-floating-promises': 'error',
  },
  settings: {
    'import/resolver': {
      typescript: {
        project,
      },
    },
  },
  ignorePatterns: [
    '.eslintrc.cjs',
    'jest.config.ts',
    'jest.config.integration.ts',
    'jest.config.unit.ts',
    'dist/**',
    'coverage/**',
    'scripts/**',
  ],
};
