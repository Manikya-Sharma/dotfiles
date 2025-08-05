return {
    'saghen/blink.cmp',
    dependencies = {
        "xzbdmw/colorful-menu.nvim"
    },
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
            menu = {
                draw = {
                    -- We don't need label_description now because label and label_description are already
                    -- combined together in label by colorful-menu.nvim.
                    columns = { { "kind_icon" }, { "label", gap = 1 } },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                    },
                },
            },
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
        keymap = { preset = 'enter' },
        signature = {
            enabled = true,
            winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder',
        }
    },
    opts_extend = { "sources.default" }
}
