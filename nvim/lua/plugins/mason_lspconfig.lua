return {
    'williamboman/mason-lspconfig.nvim',
    config = function()
        local servers = { 'clangd', 'pyright', 'ts_ls', 'lua_ls', 'taplo', 'rust_analyzer' }
        require("mason-lspconfig").setup {
            ensure_installed = servers,
            automatic_installation = true,
        }
    end
}
