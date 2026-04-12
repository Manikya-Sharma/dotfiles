vim.keymap.set("n", "<C-P>", function()
	vim.cmd("bprev")
end)
vim.keymap.set("n", "<C-N>", function()
	vim.cmd("bnext")
end)
vim.keymap.set("n", "<C-S>", Bufdelete)
vim.keymap.set("i", "<C-[>", "<ESC>")

local has_conform, conform = pcall(require, "conform")
vim.keymap.set("n", "<C-K>", function()
	if not has_conform then
		vim.notify("Conform not found", vim.log.levels.WARN, { title = "Config" })
		vim.lsp.buf.format()
	else
		conform.format({ async = true })
	end
end)

-- panes
vim.keymap.set("n", "|", function()
	vim.cmd("vsplit")
end)

vim.keymap.set("n", "-", function()
	vim.cmd("split")
end)

-- file path
vim.keymap.set("n", "<leader>fp", function()
	vim.cmd('let @+ = expand("%")')
	vim.notify("File path copied!", vim.log.levels.INFO, { title = "Config" })
end)
vim.keymap.set("n", "<C-G>", function()
	vim.notify(vim.api.nvim_buf_get_name(0))
end)

vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "single" })
end)
vim.keymap.set("n", "<C-]>", function()
	vim.lsp.buf.definition()
end)
vim.keymap.set("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end)
vim.keymap.set("n", "<leader>cl", function()
	vim.lsp.codelens.run()
end)
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- soft wrap by default
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- no soft wrap left right
vim.keymap.set("n", "<C-H>", "10zh")
vim.keymap.set("n", "<C-L>", "10zl")

local has_aerial = pcall(require, "aerial")
if has_aerial then
	vim.keymap.set("n", "<C-J>", function()
		vim.cmd("AerialToggle!")
	end)
	vim.keymap.set("n", "\\", function()
		vim.cmd("AerialToggle! left")
	end)
end

vim.keymap.set("n", "<leader>ll", function()
	vim.cmd("FzfLua lsp_document_symbols")
end)

-- undotree
vim.keymap.set("n", "<C-Q>", function()
	vim.cmd("packadd nvim.undotree")
	vim.cmd("Undotree")
end)

vim.keymap.set("n", "<TAB>", function()
	vim.cmd("Neotree toggle reveal")
end)

-- gitsigns
vim.keymap.set("n", "<leader>gn", function()
	vim.cmd("Gitsigns next_hunk")
end)
vim.keymap.set("n", "<leader>gp", function()
	vim.cmd("Gitsigns prev_hunk")
end)
vim.keymap.set("n", "<leader>gd", function()
	vim.cmd("Gitsigns diffthis")
end)
vim.keymap.set("n", "<leader>gg", function()
	vim.cmd("Gitsigns preview_hunk")
end)
vim.keymap.set("n", "<leader>gb", function()
	vim.cmd("Gitsigns blame")
end)

-- FzfLua
vim.keymap.set("n", "<leader>ff", function()
	vim.cmd("FzfLua files")
end)
vim.keymap.set("n", "<leader>fg", function()
	vim.cmd("FzfLua live_grep")
end, {})
vim.keymap.set("n", "<leader>fb", function()
	vim.cmd("FzfLua buffers")
end, {})
vim.keymap.set("n", "<leader>ft", function()
	vim.cmd("FzfLua diagnostics_document")
end, {})
vim.keymap.set("n", "<leader>rf", function()
	vim.cmd("FzfLua lsp_references")
end)

-- inline hints toggle
vim.keymap.set("n", "<leader>h", function()
	vim.notify("Toggle inlay hints", vim.log.levels.INFO, { title = "Config" })
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

-- cursorcolumn toggle
vim.keymap.set("n", "<leader>cc", function()
	local exists = vim.o.cursorcolumn
	if exists then
		vim.notify("Unset cursorcolumn", vim.log.levels.INFO, { title = "Config" })
		vim.cmd("set nocursorcolumn")
	else
		vim.notify("Set cursorcolumn", vim.log.levels.INFO, { title = "Config" })
		vim.cmd("set cursorcolumn")
	end
end)

-- smear
vim.keymap.set("n", "<leader>sm", function()
	local has_smear = pcall(require, "smear_cursor")
	if not has_smear then
		vim.notify("Smear not installed", vim.log.levels.ERROR, { title = "Config" })
	else
		vim.notify("Smear toggle", vim.log.levels.INFO, { title = "Config" })
		vim.cmd("SmearCursorToggle")
	end
end)

-- incremental selection
vim.keymap.set("n", "<M-O>", function()
	vim.cmd("normal! van")
end)
vim.keymap.set("n", "<M-I>", function()
	vim.cmd("normal! vin")
end)
vim.keymap.set("v", "<M-O>", function()
	vim.cmd("normal! an")
end)
vim.keymap.set("v", "<M-I>", function()
	vim.cmd("normal! in")
end)
