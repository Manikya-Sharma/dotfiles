-- ufo configuration
-- -- better fold icons
vim.opt.fillchars = {
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┫',
    vertright = '┣',
    verthoriz = '╋',
    eob = "~",
    fold = " ",
    foldopen = "",
    foldsep = " ",
    foldclose = ""
}

-- theme

-- -- nightfly theme setup
-- vim.g.nightflyVirtualTextColor = true
-- vim.cmd.colorscheme "nightfly"
-- vim.cmd [[hi foldcolumn guibg=bg]]
-- vim.cmd [[hi foldcolumn guifg=#3b3b3b]]
--

require("rose-pine").setup({
    styles = {
        bold = false,
        italic = true,
        transparency = false
    }
})
vim.opt.background = "dark"

vim.g.nord_disable_background = true
vim.cmd('colorscheme nord')
require("nord").set()

-- -- lualine setup

local trouble = require("trouble")
local symbols = trouble.statusline({
    mode = "lsp_document_symbols",
    groups = {},
    title = false,
    filter = { range = true },
    format = "{kind_icon}{symbol.name:Normal}",
    -- The following line is needed to fix the background color
    -- Set it to the lualine section you want to use
    hl_group = "lualine_c",
})

require("lualine").setup({
    options = {
        theme = function()
            local colors = {
                darkgray = "#16161d",
                gray = "#727169",
                innerbg = nil,
                outerbg = "#16161D",
                normal = "#88c0d0",
                insert = "#a3be8c",
                visual = "#d08770",
                replace = "#bf616a",
                command = "#ebcb8b",
            }
            return {
                inactive = {
                    a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
                    b = { fg = colors.gray, bg = colors.outerbg },
                    c = { fg = colors.gray, bg = colors.innerbg },
                },
                visual = {
                    a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
                    b = { fg = colors.gray, bg = colors.outerbg },
                    c = { fg = colors.gray, bg = colors.innerbg },
                },
                replace = {
                    a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
                    b = { fg = colors.gray, bg = colors.outerbg },
                    c = { fg = colors.gray, bg = colors.innerbg },
                },
                normal = {
                    a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
                    b = { fg = colors.gray, bg = colors.outerbg },
                    c = { fg = colors.gray, bg = colors.innerbg },
                },
                insert = {
                    a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
                    b = { fg = colors.gray, bg = colors.outerbg },
                    c = { fg = colors.gray, bg = colors.innerbg },
                },
                command = {
                    a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
                    b = { fg = colors.gray, bg = colors.outerbg },
                    c = { fg = colors.gray, bg = colors.innerbg },
                },
            }
        end,
        component_separators = '',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {
            'lsp_progress',
            {
                symbols.get,
                cond = symbols.has,
            }
        },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
})
vim.api.nvim_set_hl(0, "StatusLine", { link = "lualine_c_normal" })

-- tree sitter additional objects
require("treesitter")
require("nvim-treesitter.configs").setup({
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            }
        }
    }
})
-- -- telescope setup
require("telescope").setup({
    defaults = {
        file_ignore_patterns = { "node_modules" },
        mappings = {
            i = {
                ["<esc>"] = require("telescope.actions").close,
            }
        }
    }
})


-- oil.nvim
require("oil").setup({
    skip_confirm_for_simple_edits = true,
})


-- lsp configuration

-- -- mason
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { 'clangd', 'pyright', 'ts_ls', 'lua_ls', 'taplo' }
}
-- -- Add additional capabilities supported by nvim-cmp
-- local capabilities = require("blink.cmp").get_lsp_capabilities()
local lspconfig = require('lspconfig')
-- -- custom onattach
local on_attach = function(client, bufnr) end
-- -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pyright', 'ts_ls', 'lua_ls', 'taplo' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        root_dir = function(fname)
            return vim.loop.cwd()
        end
    }
end
