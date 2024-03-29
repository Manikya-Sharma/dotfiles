vim.keymap.set('n', '<C-M>',':bnext<CR>')
vim.keymap.set('n', '<C-P>',':bprev<CR>')
vim.keymap.set('i', '<C-[>', '<ESC>')
vim.keymap.set('n', '<C-K>', "mf<CR>:%!clang-format<CR>'fzz")
vim.keymap.set('n', 'K', ':RustLsp hover actions<CR>')

-- soft wrap by default
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- no soft wrap left right
vim.keymap.set('n', '<C-H>', '10zh')
vim.keymap.set('n', '<C-L>', '10zl')

-- toggle tree
vim.keymap.set('n', '<C-Q>', ':UndotreeToggle<CR>')

