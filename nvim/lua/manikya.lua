Servers = { 'clangd', 'pyright', 'typescript-language-server', 'lua-language-server', 'taplo', 'rust-analyzer',
    'tailwindcss-language-server', 'oxlint' }
-- MasonInstall clangd pyright typescript-language-server lua-language-server taplo rust-analyzer tailwindcss-language-server oxlint

require("configure/utils")
require("configure/options")
require("lazy-setup")
require("configure/lsp")
require("configure/remaps")
