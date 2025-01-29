return {
    -- looks
    -- -- status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        'https://github.com/arkav/lualine-lsp-progress'
    },
    -- -- startup page
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = function()
            local dashboard = require("alpha.themes.dashboard")
            local logo = [[
                                  .
 .:......                       .:-.
::-==-:--::..                 ..:--.
 ...::-------:..             .:---:.
      ..-------:..          :=----:.
         .=+++==-:..     .-++==--:.
           -***++=-:.  .-=+++=--...
            :-=+*+=-:.:==++==-:...:
           ::::::++==++++++++++=------:::..
                ...:-=--........:-+***+++===:.
                                   .=++======...
                                    :=----=-..--
                                  ..:::::::..:.
                                .. ...
                                  ..
]]
            dashboard.section.header.val = vim.split(logo, "\n")
            dashboard.section.buttons.val = {
                dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
                dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
                dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
                dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
                dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
                dashboard.button("q", " " .. " Quit", ":qa<CR>"),
            }
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.opts.layout[1].val = 2
            return dashboard
        end,
        config = function(_, dashboard)
            require("alpha").setup(dashboard.opts)
            vim.api.nvim_create_autocmd("User", {
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = math.floor(stats.startuptime * 100) / 100
                    dashboard.section.footer.val = "󱐌 Lazy-loaded "
                        .. stats.loaded
                        .. "/"
                        .. stats.count
                        .. " plugins in "
                        .. ms
                        .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
    },
    'https://github.com/ryanoasis/vim-devicons',
    -- -- themes
    'https://github.com/rebelot/kanagawa.nvim',
    {
        "catppuccin/nvim",
        alpha = true,
        name = "catppuccin",
        priority = 1000
    },
    "nyoom-engineering/oxocarbon.nvim",
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
    {
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup {
            }
        end
    },
    lazy = false,
    priority = 1000,
    config = function()
        require('poimandres').setup {
            -- leave this setup function empty for default config
            -- or refer to the configuration section
            -- for configuration options
        }
    end,
    -- -- treesitter
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
    -- -- left side git bars
    {
        'https://github.com/lewis6991/gitsigns.nvim',
        config = function() require("gitsigns").setup() end
    },
    -- -- excess line length indicator
    'Bekaboo/deadcolumn.nvim',
    -- -- indent based highlighting
    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
        config = function()
            require("hlchunk").setup({
                indent = { enable = false },
                blank = { enable = false },
            })
        end
    },
    -- functional
    -- -- telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- -- surround parens functions
    {
        'https://github.com/kylechui/nvim-surround',
        event = "VeryLazy",
        config = function() require("nvim-surround").setup({}) end
    },
    -- -- code overview
    {
        'stevearc/aerial.nvim',
        opts = {
            layout = {
                min_width = 20
            }
        },

        --Optional dependencies
        dependencies = { "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons" },
    },
    -- -- code folds
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
            {
                "luukvbaal/statuscol.nvim",
                config = function()
                    local builtin = require("statuscol.builtin")
                    require("statuscol").setup({
                        relculright = true,
                        segments = {
                            { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
                            { text = { "%s" },                  click = "v:lua.ScSa" },
                            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
                        },
                    })
                end,
            },
        },
        event = "BufReadPost",
        opts = {
            provider_selector = function()
                return { "treesitter", "indent" }
            end,
        },

        init = function()
            vim.o.foldcolumn = "1" -- '0' is not bad
            vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
            vim.keymap.set("n", "zR", function()
                require("ufo").openAllFolds()
            end)
            vim.keymap.set("n", "zM", function()
                require("ufo").closeAllFolds()
            end)
        end,
    },
    -- -- undo tree
    'mbbill/undotree',
    -- -- register peek
    'junegunn/vim-peekaboo',
    -- lsp
    -- -- lsp providers
    "williamboman/mason.nvim",
    -- -- neovim lsp api
    'https://github.com/neovim/nvim-lspconfig',
    -- -- mason configuraton with lsp
    'williamboman/mason-lspconfig.nvim',
    -- -- lsp autocomplete
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        opts = {
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono',
                kind_icons = {
                    Text = "",
                    Method = "󰡱",
                    Function = "󰊕",
                    Constructor = "",
                    Field = "",
                    Variable = "󰂡",
                    Class = "",
                    Interface = "",
                    Module = "",
                    Property = "󰜢",
                    Unit = "",
                    Value = "󰎠",
                    Enum = "",
                    Keyword = "󰌋",
                    Snippet = "󰒕",
                    Color = "󰏘",
                    Reference = "",
                    File = "",
                    Folder = "󰉋",
                    EnumMember = "",
                    Constant = "󰏿",
                    Struct = "",
                    Event = "",
                    Operator = "󰆕",
                    TypeParameter = "󰅲",
                },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
                cmdline = {}
            },
            completion = {
                accept = {
                    auto_brackets = { enabled = false },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    treesitter_highlighting = false,
                },
            },
        },
        opts_extend = { "sources.default" }
    },
    -- -- better rust support
    {
        'mrcjkb/rustaceanvim',
        version = '^4',
        --Recommended
        ft = { 'rust' },
    },
    -- -- highlight comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    -- -- problems panel
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    -- -- incremental renaming
    {
        "smjonas/inc-rename.nvim",
        config = function() require("inc_rename").setup({}) end,
    },
    -- -- better haskell support
    {
        'mrcjkb/haskell-tools.nvim',
        version = '^3',
        --Recommended
        lazy = false,
        --This plugin is already lazy
    },
    -- -- types for neovim plugins
    "folke/neodev.nvim",
}
