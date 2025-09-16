local has_mason, mason = pcall(require, "mason-registry")
if not has_mason then
	vim.notify("Mason not installed", "error", { title = "Config" })
else
	vim.lsp.enable(mason.get_installed_package_names())
	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})
	vim.diagnostic.config({ virtual_text = true })
end
