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
    { 'https://github.com/ryanoasis/vim-devicons' },
    -- -- themes
    {
        "webhooked/kanso.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        'https://github.com/shaunsingh/nord.nvim',
    },
    {
        'https://github.com/shaunsingh/nord.nvim',
        lazy = false,
        priority = 1000
    },
    {
        'https://github.com/rebelot/kanagawa.nvim',
        lazy = false,
        priority = 1000
    },
    {
        "catppuccin/nvim",
        integrations = {
            alpha = true,
            aerial = true,
            blink_cmp = true,
            mason = true,
            nvim_surround = true,
            telescope = {
                enabled = true,
                style = "nvchad",
            },
            lsp_trouble = true,
        },
        name = "catppuccin",
        priority = 1000
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false,
        priority = 1000
    },
    {
        "bluz71/vim-nightfly-colors",
        name = "nightfly",
        lazy = false,
        priority = 1000
    },
    {
        "rose-pine/neovim",
        name = "rose-pine"
    },
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
    {
        'https://github.com/neovim/nvim-lspconfig',
    },
    -- -- lsp providers
    "williamboman/mason.nvim",
    -- -- mason configuraton with lsp
    'williamboman/mason-lspconfig.nvim',
    -- -- lsp autocomplete
    {
        'saghen/blink.cmp',
        version = '*',
        event = "InsertEnter",
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
                providers = {
                    cmdline = {
                        -- ignores cmdline completions when executing shell commands
                        enabled = function()
                            return vim.fn.getcmdtype() ~= ':' or not vim.fn.getcmdline():match("^[%%0-9,'<>%-%.]*!")
                        end
                    }
                }
            },
            completion = {
                accept = {
                    auto_brackets = { enabled = false },
                },
                documentation = {
                    window = {
                        border = 'rounded'
                    },
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    treesitter_highlighting = false,
                },
            },
            -- signature = {
            --     enabled = true,
            --     winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder',
            -- }
        },
        opts_extend = { "sources.default" }
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
