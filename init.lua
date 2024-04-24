require("manikya")
vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data")
            .."/lazy/lazy.nvim" if not(vim.uv or vim.loop)
            .fs_stat(lazypath) then vim.fn
            .system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable",
                --latest stable release lazypath,
            }) end vim.opt
            .rtp : prepend(lazypath)

require("lazy").setup({
    {
        'nvim-lualine/lualine.nvim',
         dependencies = {'nvim-tree/nvim-web-devicons'}
    },
     'https://github.com/ryanoasis/vim-devicons',
     'https://github.com/rebelot/kanagawa.nvim',
    { 
      "nyoom-engineering/oxocarbon.nvim"
    }, 
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {'nvim-lua/plenary.nvim'}
    },
     'nvim-treesitter/nvim-treesitter',
     'nvim-treesitter/nvim-treesitter-textobjects',
    {
        'https://github.com/kylechui/nvim-surround',
          event = "VeryLazy",
          config = function() require("nvim-surround").setup({}) end
    },
     'mbbill/undotree',
     'junegunn/vim-peekaboo',
     'https://github.com/lewis6991/gitsigns.nvim',
    {
         "folke/flash.nvim",
         event = "VeryLazy",
         opts = {labels = "",modes = {char = {highlight = {backdrop = false}}}},
         keys = {},
     },
     {"williamboman/mason.nvim"},
     {
         'https://github.com/neovim/nvim-lspconfig',
     },
     'williamboman/mason-lspconfig.nvim',
     'hrsh7th/nvim-cmp',
     'hrsh7th/cmp-nvim-lsp',
     'saadparwaiz1/cmp_luasnip',
     'L3MON4D3/LuaSnip',
     {
         'mrcjkb/rustaceanvim',
         version = '^4',
         --Recommended 
	     ft = {'rust'},
     },
     {
        "folke/todo-comments.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        opts = {}
     },
     {
         "folke/trouble.nvim",
         dependencies = {"nvim-tree/nvim-web-devicons"},
         opts = {},
     },
     {
         'stevearc/aerial.nvim',
         opts = {},

         --Optional dependencies
          dependencies = {"nvim-treesitter/nvim-treesitter",
                             "nvim-tree/nvim-web-devicons"},
     },
     {
        "startup-nvim/startup.nvim",
          dependencies = {"nvim-telescope/telescope.nvim","nvim-lua/plenary.nvim"},
          config = function() 
            require "startup".setup({
              theme = "dashboard", }) 
        end
     },
     {
         "smjonas/inc-rename.nvim",
         config = function() require("inc_rename").setup() end,
     },
     {
        'mrcjkb/haskell-tools.nvim', version = '^3',
        --Recommended 
		 lazy = false,
		 --This plugin is already lazy
     },
     {
        'https://github.com/lewis6991/gitsigns.nvim',
        config = function() require("gitsigns").setup() end
     },
     {
       "shellRaining/hlchunk.nvim",
       event = { "UIEnter" },
       config = function()
         require("hlchunk").setup({
                indent = {enable = false},
                blank = {enable = false},
            })
       end
     },
})

-- vim.opt.background = "dark"
-- vim.cmd.colorscheme "oxocarbon"

vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', }
vim.cmd.colorscheme "nightfly"

require("lualine").setup {
    -- options = { theme = "palenight" }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>rn", ":IncRename ")
vim.keymap.set("n", "<leader>h",function() 
        vim.lsp.inlay_hint.enable( not vim.lsp.inlay_hint.is_enabled()) 
    end
)

require("treesitter") require("mason").setup() 
require("mason-lspconfig").setup{ 
    ensure_installed = { "lua_ls", "rust_analyzer" }
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')
-- custom onattach
local on_attach = function(client, bufnr)
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = { expand = function(args) luasnip.lsp_expand(args.body) end, },
    mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
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
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
    },
}
