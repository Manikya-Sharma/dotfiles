vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
			telemetry = { enable = false },
		},
	},
})

local inline_diag = pcall(require, "tiny-inline-diagnostic")
if not inline_diag then
	vim.diagnostic.config({ virtual_text = true })
end

vim.lsp.codelens.enable()
