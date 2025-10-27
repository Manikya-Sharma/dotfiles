vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local inline_diag = pcall(require, "tiny-inline-diagnostic")
if not inline_diag then
	vim.diagnostic.config({ virtual_text = true })
end
