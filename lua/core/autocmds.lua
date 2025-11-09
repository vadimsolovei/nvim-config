-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Better indentation for JavaScript/TypeScript files with styled-components
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Improve indentation for JS/TS files',
  group = vim.api.nvim_create_augroup('js-ts-indent', { clear = true }),
  pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  callback = function()
    vim.bo.indentexpr = '' -- Disable treesitter indent for template literals
    vim.bo.cindent = true -- Use C-style indentation rules (works better with templates)
    vim.bo.cinoptions = 'J1' -- Improve JavaScript indentation
  end,
})
