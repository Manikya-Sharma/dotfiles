vim.g.mapleader = " "
vim.cc = 1

vim.keymap.set('n', '<C-P>',':bprev<CR>')
vim.keymap.set('n', '<C-N>',':bnext<CR>')
vim.keymap.set('i', '<C-[>', '<ESC>')
vim.keymap.set('n', '<C-K>', function() vim.lsp.buf.format() end)
vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end)

-- soft wrap by default
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- no soft wrap left right
vim.keymap.set('n', '<C-H>', '10zh')
vim.keymap.set('n', '<C-L>', '10zl')

-- toggle tree
vim.keymap.set('n', '<C-Q>', ':UndotreeToggle<CR>')

vim.keymap.set('n', '<C-J>', ':AerialToggle!<CR>')
vim.keymap.set('n', '<C-M>', ':Telescope aerial<CR>')

-- trouble.nvim
vim.keymap.set('n', '<C-T>', ':Trouble diagnostics toggle focus=true<CR>')

-- -- keymaps for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>rn", ":IncRename ")
-- -- inline hints toggle
vim.keymap.set("n", "<leader>h", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end
)
-- -- code actions
vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end)
