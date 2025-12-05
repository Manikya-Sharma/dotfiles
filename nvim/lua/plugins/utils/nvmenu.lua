local function exec_menu_function(func)
	return function()
		require("menu.utils").delete_old_menus()
		func()
	end
end

local buffer_menu_options = {
	{
		name = " LSP References",
		cmd = function()
			vim.lsp.buf.references()
		end,
		rtxt = "<leader>rf",
	},
	{
		name = " Code Actions",
		cmd = function()
			vim.lsp.buf.code_action()
		end,
		rtxt = "<leader>ca",
	},
	{
		name = "󰑕 LSP Rename",
		cmd = function()
			vim.lsp.buf.rename()
		end,
		rtxt = "<leader>rn",
	},
	{
		name = "separator",
	},
	{
		name = "Format Buffer",
		cmd = function()
			local ok, conform = pcall(require, "conform")
			if ok then
				conform.format({ lsp_fallback = true })
			else
				vim.lsp.buf.format()
			end
		end,
		rtxt = "<C-K>",
	},
	{
		name = "󰨚 Toggle Inlay Hints",
		cmd = function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end,
		rtxt = "<leader>h",
	},
	{
		name = " Cursor Column",
		cmd = function()
			if vim.o.cursorcolumn then
				vim.cmd("set nocursorcolumn")
			else
				vim.cmd("set cursorcolumn")
			end
		end,
		rtxt = "<leader>cc",
	},
}

local neotree_options = {
	{
		name = "  New file",
		cmd = exec_menu_function(function()
			vim.cmd("normal a")
		end),
		rtxt = "a",
	},
	{
		name = "  Delete",
		hl = "ExRed",
		cmd = exec_menu_function(function()
			vim.cmd("normal d")
		end),
		rtxt = "d",
	},
	{
		name = "  Rename",
		cmd = exec_menu_function(function()
			vim.cmd("normal r")
		end),
		rtxt = "r",
	},
	{
		name = "  Rename basename",
		cmd = exec_menu_function(function()
			vim.cmd("normal b")
		end),
		rtxt = "b",
	},
	{
		name = "  Copy",
		cmd = exec_menu_function(function()
			vim.cmd("normal y")
		end),
		rtxt = "y",
	},
	{
		name = "  Cut",
		cmd = exec_menu_function(function()
			vim.cmd("normal x")
		end),
		rtxt = "x",
	},
	{
		name = "  Paste",
		cmd = exec_menu_function(function()
			vim.cmd("normal p")
		end),
		rtxt = "p",
	},
	{ name = "separator" },
	{
		name = "Toggle hidden",
		cmd = exec_menu_function(function()
			vim.cmd("normal H")
		end),
		rtxt = "H",
	},
}

return {
	{ "nvzone/volt", lazy = true },
	{
		"nvzone/menu",
		lazy = true,
		init = function()
			vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
				require("menu.utils").delete_old_menus()
				vim.cmd.exec('"normal! \\<RightMouse>"')
				local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
				local ft = vim.bo[buf].ft
				if ft == "neo-tree" then
					require("menu").open(neotree_options, { mouse = true })
				else
					require("menu").open(buffer_menu_options, { mouse = true })
				end
			end, {})
		end,
	},
}
