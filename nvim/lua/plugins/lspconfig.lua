local extra_configs = function()
    vim.lsp.config("lua_ls", {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" } }
            }
        }
    })
end

return {
    'https://github.com/neovim/nvim-lspconfig',
    init = function()
        vim.diagnostic.config({ virtual_text = true })
        local servers = { 'clangd', 'pyright', 'ts_ls', 'lua_ls', 'taplo', 'rust_analyzer', 'oxlint' }
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = servers,
            automatic_installation = true,
        }
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        vim.lsp.enable(servers)
        extra_configs()
        vim.lsp.config('*', capabilities)
    end
}
