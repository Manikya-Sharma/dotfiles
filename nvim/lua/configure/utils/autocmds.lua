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
		local has_lspconfig, _ = pcall(function()
			vim.cmd("LspStart")
		end)
		if not has_lspconfig then
			vim.notify("LspStart command could not run", vim.log.levels.WARN, { title = "Config" })
		end
	end,
})

-- start treesitter
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("treesitter-enable", {}),
	desc = "Enable treesitter in the buffer",
	pattern = "*",
	callback = function()
		local parser = vim.treesitter.get_parser(nil, nil, { error = false })
		local success = pcall(vim.treesitter.start)
		if parser and not success then
			vim.notify("TS could not be enabled", vim.log.levels.WARN, { title = "Config" })
		end
	end,
})

-- codelens
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client and client:supports_method("textDocument/codeLens") then
			vim.lsp.codelens.refresh()
			vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
				buffer = bufnr,
				callback = vim.lsp.codelens.refresh,
			})
		end
	end,
})
