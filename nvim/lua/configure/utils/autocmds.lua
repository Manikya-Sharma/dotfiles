-- yank highlight
if not Fancy then
	vim.api.nvim_create_autocmd("TextYankPost", {
		group = vim.api.nvim_create_augroup("highlight_yank", {}),
		desc = "Hightlight selection on yank",
		pattern = "*",
		callback = function()
			vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
		end,
	})
end

-- start lsp on entering the buffer
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("lsp", {}),
	desc = "Enable lsp in the buffer",
	pattern = "*.*",
	callback = function()
		local has_lspconfig, _ = pcall(vim.cmd, "LspStart")
		if not has_lspconfig then
			vim.notify("LspStart command could not run", "warn", { title = "Config" })
		end
	end,
})
