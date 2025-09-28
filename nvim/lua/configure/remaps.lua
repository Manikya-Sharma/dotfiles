vim.keymap.set("n", "<C-P>", function()
	vim.cmd("bprev")
end)
vim.keymap.set("n", "<C-N>", function()
	vim.cmd("bnext")
end)
vim.keymap.set("n", "<C-S>", Bufdelete)
vim.keymap.set("i", "<C-[>", "<ESC>")
vim.keymap.set("n", "<C-K>", function()
	local has_conform, conform = pcall(require, "conform")
	if not has_conform then
		vim.notify("Conform not found", "warn", { title = "Config" })
		vim.lsp.buf.format()
	else
		conform.format({ async = true, lsp_fallback = true })
	end
end)

-- panes
vim.keymap.set("n", "|", function()
	vim.cmd("vsplit")
end)

vim.keymap.set("n", "-", function()
	vim.cmd("split")
end)

vim.keymap.set("n", "<M-h>", "<C-W>h")
vim.keymap.set("n", "<M-j>", "<C-W>j")
vim.keymap.set("n", "<M-k>", "<C-W>k")
vim.keymap.set("n", "<M-l>", "<C-W>l")
vim.keymap.set("n", "<M-s>", function()
	vim.cmd("q")
end)

-- file path
vim.keymap.set("n", "<leader>fp", function()
	vim.cmd('let @+ = expand("%")')
	vim.notify("File path copied!", "info", { title = "Config" })
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
vim.keymap.set("n", "<leader>rf", function()
	vim.cmd("Telescope lsp_references")
end)
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- soft wrap by default
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- no soft wrap left right
vim.keymap.set("n", "<C-H>", "10zh")
vim.keymap.set("n", "<C-L>", "10zl")

vim.keymap.set("n", "<C-J>", function()
	vim.cmd("AerialToggle!")
end)
vim.keymap.set("n", "\\", function()
	vim.cmd("AerialToggle! left")
end)
vim.keymap.set("n", "<C-M>", function()
	local has_aerial, aerial = pcall(require, "aerial")
	if not has_aerial then
		vim.notify("Aerial not found", "warn", { title = "Config" })
		vim.cmd("normal! ^M")
		return
	end
	local num_symbols = aerial.num_symbols(vim.api.nvim_get_current_buf())
	if num_symbols == 0 then
		vim.cmd("normal! ^M")
	else
		vim.cmd("Telescope aerial")
	end
end)

-- undotree
vim.keymap.set("n", "<C-Q>", function()
	vim.cmd("UndotreeToggle")
end)

-- neotree
vim.keymap.set("n", "<leader> ", function()
	vim.cmd("Neotree toggle")
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

-- -- keymaps for telescope
local has_telescope, builtin = pcall(require, "telescope.builtin")
if not has_telescope then
	vim.notify("Telescope not installed", "warn", { title = "Config" })
else
	vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
	vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
	vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
end
-- inline hints toggle
vim.keymap.set("n", "<leader>h", function()
	vim.notify("Toggle inlay hints", "info", { title = "Config" })
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

-- cursorcolumn toggle
vim.keymap.set("n", "<leader>cc", function()
	local exists = vim.o.cursorcolumn
	if exists then
		vim.notify("Unset cursorcolumn", "info", { title = "Config" })
		vim.cmd("set nocursorcolumn")
	else
		vim.notify("Set cursorcolumn", "info", { title = "Config" })
		vim.cmd("set cursorcolumn")
	end
end)

-- smear
vim.keymap.set("n", "<leader>sm", function()
	local has_smear = pcall(require, "smear_cursor")
	if not has_smear then
		vim.notify("Smear not installed", "error", { title = "Config" })
	else
		vim.notify("Smear toggle", "info", { title = "Config" })
		vim.cmd("SmearCursorToggle")
	end
end)

-- lensline
local has_lensline, lensline = pcall(require, "lensline")
if has_lensline then
	lensline.disable()
end
vim.keymap.set("n", "<leader>ll", function()
	if not has_lensline then
		vim.notify("Lensline not installed", "error", { title = "Config" })
	else
		vim.notify("Lensline toggle", "info", { title = "Config" })
		if lensline.is_enabled() then
			lensline.disable()
		else
			lensline.enable()
			lensline.show()
		end
	end
end)
