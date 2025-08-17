vim.keymap.set('n', '<C-P>', function() vim.cmd('bprev') end)
vim.keymap.set('n', '<C-N>', function() vim.cmd('bnext') end)
vim.keymap.set('n', '<C-S>', function()
    local success, snacks = pcall(require, "snacks")
    if not success then
        vim.notify("Snacks not found", "warn", { title = "Config" })
        vim.cmd('bd')
    else
        snacks.bufdelete()
    end
end)
vim.keymap.set('i', '<C-[>', '<ESC>')
vim.keymap.set('n', '<C-K>', function()
    local success, conform = pcall(require, "conform")
    if not success then
        vim.notify("Conform not found", "warn", { title = "Config" })
        vim.lsp.buf.format()
    else
        conform.format()
    end
end
)
vim.keymap.set('n', '<leader>fp', function()
    vim.cmd('let @+ = expand("%")')
    vim.notify("File path copied!", "info", { title = "Config" })
end);

vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = 'single' }) end)
vim.keymap.set('n', '<C-]>', function() vim.lsp.buf.definition() end)
vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end)
vim.keymap.set('n', '<leader>rf', function() vim.cmd('Telescope lsp_references') end)
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- soft wrap by default
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- no soft wrap left right
vim.keymap.set('n', '<C-H>', '10zh')
vim.keymap.set('n', '<C-L>', '10zl')

vim.keymap.set('n', '<C-J>', function() vim.cmd('AerialToggle!') end)
vim.keymap.set('n', '<C-M>', function() vim.cmd('Telescope aerial') end)

-- undotree
vim.keymap.set('n', '<C-Q>', function() vim.cmd('UndotreeToggle') end)

-- neotree
vim.keymap.set('n', '<leader> ', function() vim.cmd('Neotree toggle') end)
vim.keymap.set('n', '<leader>\'', function() vim.cmd('Neotree toggle reveal') end)

-- gitsigns
vim.keymap.set('n', '<leader>gn', function() vim.cmd('Gitsigns next_hunk') end)
vim.keymap.set('n', '<leader>gp', function() vim.cmd('Gitsigns prev_hunk') end)
vim.keymap.set('n', '<leader>gd', function() vim.cmd('Gitsigns diffthis') end)
vim.keymap.set('n', '<leader>gg', function() vim.cmd('Gitsigns preview_hunk') end)
vim.keymap.set('n', '<leader>gb', function() vim.cmd('Gitsigns blame') end)

-- -- keymaps for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

-- inline hints toggle
vim.keymap.set("n", "<leader>h", function()
    vim.notify("Toggle inlay hints", "info", { title = "Config" })
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end
)

-- cursorcolumn toggle
vim.keymap.set('n', '<leader>cc', function()
    local exists = vim.o.cursorcolumn
    if exists then
        vim.notify("Unset cursorcolumn", "info", { title = "Config" })
        vim.cmd('set nocursorcolumn')
    else
        vim.notify("Set cursorcolumn", "info", { title = "Config" })
        vim.cmd('set cursorcolumn')
    end
end)

-- smear
vim.keymap.set('n', '<leader>sm', function()
    local success = pcall(require, 'smear_cursor')
    if not success then
        vim.notify("Smear not installed", "error", { title = "Config" })
    else
        vim.notify("Smear toogle", "info", { title = "Config" })
        vim.cmd('SmearCursorToggle')
    end
end)
