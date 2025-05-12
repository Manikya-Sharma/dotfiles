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

-- vim.g.nord_disable_background = true
-- vim.cmd('colorscheme nord')
-- require("nord").set()

vim.cmd('colorscheme kanso-ink')

-- -- lualine setup

local trouble = require("trouble")
local symbols = trouble.statusline({
    mode = "lsp_document_symbols",
    groups = {},
    title = false,
    filter = { range = true },
    format = "{kind_icon}{symbol.name}",
    -- The following line is needed to fix the background color
    -- Set it to the lualine section you want to use
    hl_group = "lualine_c",
})

require("lualine").setup({
    theme = { 'kanagawa' },
    options = {
        section_separators = { left = ' ', right = ' ' },
    },
    sections = {
        lualine_a = { { 'mode', separator = { left = '', right = '' }, right_padding = 2 } },
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
            { 'location', separator = { left = '', right = '' }, left_padding = 2 },
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


-- lsp configuration
vim.diagnostic.config({ virtual_text = true })
local servers = { 'clangd', 'pyright', 'ts_ls', 'lua_ls', 'taplo', 'rust_analyzer' }

-- -- mason
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = servers,
    automatic_installation = true,
}

-- -- Add additional capabilities
local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.enable(servers)
vim.lsp.config('*', capabilities)
