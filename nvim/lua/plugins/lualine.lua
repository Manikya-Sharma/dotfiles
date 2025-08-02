return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local statusline = require("arrow.statusline")
        local function arrow_status()
            return statusline.text_for_statusline_with_icons()
        end
        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
        }
        local lsp_status = {
            'lsp_status',
            icon = '',
            symbols = {
                done = '',
            }
        }
        local diff = {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' },
        }
        require("lualine").setup({
            theme = 'auto',
            options = {
                section_separators = { left = ' ', right = ' ' },
            },
            sections = {
                lualine_a = { { 'mode', separator = { left = '', right = '' } } },
                lualine_b = { 'filename' },
                lualine_c = { diagnostics, lsp_status },
                lualine_x = { arrow_status, 'branch' },
                lualine_y = { diff },
                lualine_z = { { 'location', separator = { left = '', right = '' } } },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = { diff },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = {},
        })
        vim.api.nvim_set_hl(0, "StatusLine", { link = "lualine_c_normal" })
    end
}
