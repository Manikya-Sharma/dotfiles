local servers = { 'clangd', 'pyright', 'ts_ls', 'lua_ls', 'taplo', 'rust_analyzer', 'tailwindcss' }

return {
    'williamboman/mason-lspconfig.nvim',
    opts = {
        ensure_installed = servers,
        automatic_installation = true,
    },
}
