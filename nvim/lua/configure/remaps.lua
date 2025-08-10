vim.cc = 1

vim.keymap.set('n', '<C-P>', ':bprev<CR>')
vim.keymap.set('n', '<C-N>', ':bnext<CR>')
vim.keymap.set('n', '<C-S>', function() Snacks.bufdelete() end)
vim.keymap.set('i', '<C-[>', '<ESC>')
vim.keymap.set('n', '<C-K>', function() require('conform').format() end)

vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = 'single' }) end)
vim.keymap.set('n', '<C-]>', function() vim.lsp.buf.definition() end)
vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end)
vim.keymap.set('n', '<leader>rf', ':Telescope lsp_references<CR>')
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- soft wrap by default
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- no soft wrap left right
vim.keymap.set('n', '<C-H>', '10zh')
vim.keymap.set('n', '<C-L>', '10zl')

vim.keymap.set('n', '<C-J>', ':AerialToggle!<CR>')
vim.keymap.set('n', '<C-M>', ':Telescope aerial<CR>')

-- undotree
vim.keymap.set('n', '<C-Q>', ':UndotreeToggle<CR>')

-- file tree
vim.keymap.set('n', '<leader>p', ':Vexplore!<CR>30<C-W>|')

-- gitsigns
vim.keymap.set('n', '<leader>gn', ':Gitsigns next_hunk<CR>')
vim.keymap.set('n', '<leader>gp', ':Gitsigns prev_hunk<CR>')
vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>')
vim.keymap.set('n', '<leader>gg', ':Gitsigns preview_hunk<CR>')
vim.keymap.set('n', '<leader>gb', ':Gitsigns blame<CR>')

-- -- keymaps for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

-- inline hints toggle
vim.keymap.set("n", "<leader>h", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end
)
