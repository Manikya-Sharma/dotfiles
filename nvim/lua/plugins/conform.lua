return {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            python = { 'isort', 'black' },
            rust = { 'rustfmt', },
            javacript = { 'prettierd', 'prettier', stop_after_first = true, },
            javacriptreact = { 'prettierd', 'prettier', stop_after_first = true, },
            typescript = { 'prettierd', 'prettier', stop_after_first = true, },
            typescriptreact = { 'prettierd', 'prettier', stop_after_first = true, },
            cpp = { 'clang-format', },
            lua = { 'stylua' },
            toml = { 'taplo' },
            ["_"] = { lsp_format = 'fallback' },
        }
    },
}
