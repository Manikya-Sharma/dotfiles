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
vim.g.nightflyVirtualTextColor = true
vim.cmd.colorscheme "nightfly"
vim.cmd [[hi foldcolumn guibg=bg]]
vim.cmd [[hi foldcolumn guifg=#3b3b3b]]
-- -- lualine setup
require("lualine").setup({})
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
        file_ignore_patterns = { "node_modules" }
    }
})
-- harpoon setup
local harpoon = require("harpoon")
harpoon:setup()
-- basic telescope configuration for harpoon
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end
    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

-- lsp configuration

-- -- mason
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { 'clangd', 'pyright', 'tsserver', 'lua_ls', 'taplo', 'asm_lsp' }
}
-- -- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')
-- -- custom onattach
local on_attach = function(client, bufnr) end
-- -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pyright', 'tsserver', 'lua_ls', 'taplo', 'asm_lsp' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = function(fname)
            return vim.loop.cwd()
        end
    }
end
-- -- luasnip setup
local luasnip = require 'luasnip'
-- -- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = { expand = function(args) luasnip.lsp_expand(args.body) end, },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

