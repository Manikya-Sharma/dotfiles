local gh = function(href)
	return "https://github.com/" .. href
end

vim.pack.add({
	-- -- Neotree
	{
		src = gh("nvim-neo-tree/neo-tree.nvim"),
	},

	-- Neo tree dependencies
	{
		src = gh("nvim-lua/plenary.nvim"),
	},

	{
		src = gh("MunifTanjim/nui.nvim"),
	},

	-- -- indentline
	{
		src = gh("saghen/blink.indent"),
	},

	-- -- nvim surround
	{
		src = gh("kylechui/nvim-surround"),
	},

	-- -- arrow.nvim
	{
		src = gh("otavioschwanck/arrow.nvim"),
	},

	-- arrow nvim dependencies
	{
		src = gh("nvim-tree/nvim-web-devicons"),
	},

	-- -- fzf
	{
		src = gh("ibhagwan/fzf-lua"),
	},

	-- -- gitsigns
	{
		src = gh("lewis6991/gitsigns.nvim"),
	},

	-- -- overlook for popups
	{
		src = gh("WilliamHsieh/overlook.nvim"),
	},

	-- -- flash.nvim
	{
		src = gh("folke/flash.nvim"),
	},

	-- -- diffview
	{
		src = gh("sindrets/diffview.nvim"),
	},

	-- -- todo highlight
	{
		src = gh("folke/todo-comments.nvim"),
	},

	-- -- lsp
	{
		src = gh("mason-org/mason.nvim"),
	},
	{
		src = gh("neovim/nvim-lspconfig"),
	},
	{
		src = gh("mason-org/mason-lspconfig.nvim"),
	},

	-- -- blink
	{
		src = gh("saghen/blink.cmp"),
		version = vim.version.range("*"),
	},
	-- plugins to blink
	{
		src = gh("xzbdmw/colorful-menu.nvim"),
	},

	-- -- aerial
	{
		src = gh("stevearc/aerial.nvim"),
	},

	-- -- conform
	{
		src = gh("stevearc/conform.nvim"),
	},

	-- -- trouble nvim
	{
		src = gh("folke/trouble.nvim"),
	},

	-- -- incremental rename
	{
		src = gh("smjonas/inc-rename.nvim"),
	},

	-- -- statusline
	{
		src = gh("nvim-lualine/lualine.nvim"),
	},

	-- -- themes
	-- kanagawa
	{
		src = gh("rebelot/kanagawa.nvim"),
	},
})

require("plugins/neo-tree")
require("plugins/indent")
require("plugins/arrow")
require("plugins/fzf")
require("plugins/gitsigns")
require("plugins/overlook")
require("plugins/flash")
require("plugins/diffview")
require("plugins/blink")
require("plugins/aerial")
require("plugins/conform")
require("plugins/trouble")
require("plugins/lualine")
require("plugins/kanagawa")

require("todo-comments").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("colorful-menu").setup()
require("inc_rename").setup()
