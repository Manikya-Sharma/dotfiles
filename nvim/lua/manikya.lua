Servers = {
	"clangd",
	"pyright",
	"typescript-language-server",
	"lua-language-server",
	"taplo",
	"rust-analyzer",
	"tailwindcss-language-server",
	"oxlint",
	"gopls",
}
-- MasonInstall clangd pyright typescript-language-server lua-language-server taplo rust-analyzer tailwindcss-language-server oxlint gopls

-- enable options plugins only for looks
Fancy = true

require("configure/utils")
require("configure/options")
require("lazy-setup")
require("configure/lsp")
require("configure/remaps")
