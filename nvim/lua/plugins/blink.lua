return {
    'saghen/blink.cmp',
    version = '*',
    init = function()
        local servers = { 'clangd', 'pyright', 'ts_ls', 'lua_ls', 'taplo', 'rust_analyzer' }
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        vim.lsp.enable(servers)
        vim.lsp.config('*', capabilities)
    end,
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
}
