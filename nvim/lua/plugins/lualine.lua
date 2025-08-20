return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local success, statusline = pcall(require, "arrow.statusline")
        local function arrow_status()
            if not success then
                vim.notify("Arrow not found", "error", { title = "Config" })
                return {}
            end
            return statusline.text_for_statusline_with_icons()
        end
        local diagnostics = {
            "diagnostics",
            sources = { "nvim_lsp" },
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
            separator = { left = '' },
        }
        local aerial = {
            'aerial',
            depth = -3,
            dense_sep = '.',
            dense = true,
            colored = true
        }
        local tabline = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { { 'buffers', symbols = { alternate_file = '' } } },
            lualine_x = { aerial, { 'tabs', show_modified_status = false } },
            lualine_y = {},
            lualine_z = {},
        }
        require("lualine").setup({
            theme = 'auto',
            options = {
                section_separators = { left = ' ', right = ' ' },
                component_separators = { left = ' ', right = ' ' },
            },
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'branch', diagnostics },
                lualine_x = { arrow_status, diff, lsp_status },
                lualine_y = {},
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = { diff },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = tabline,
            extensions = {}
        })
        vim.api.nvim_set_hl(0, "StatusLine", { link = "lualine_c_normal" })
    end
}
