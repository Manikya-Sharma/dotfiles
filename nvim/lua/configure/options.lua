vim.o.compatible = false -- disable compatibility with vi
vim.o.showmatch = true
vim.o.ignorecase = true  -- case insensitive
vim.o.smartcase = true
vim.o.hlsearch = false   -- highlight search remove
vim.o.incsearch = true   -- incremental search
vim.o.wrap = false       -- remove soft wrapping
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.number = true
vim.o.relativenumber = true
vim.o.cc = ''
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'
vim.o.ttyfast = true
-- yank highlight
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
    end,
})
vim.o.grepprg = 'rg --vimgrep --smart-case --follow'
vim.o.formatprg = 'clang-format'

vim.g.mapleader = " "
vim.g.netrw_liststyle = 3

-- use indent for fold
vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.g.markdown_folding = 1 -- enable markdown folding
