return {
	"mcauley-penney/techbase.nvim",
	opts = {
		italic_comments = true,
	},
	init = function()
		vim.cmd.colorscheme("techbase")
	end,
	priority = 1000,
	-- waiting for better Treesitter highlighting
	enabled = false,
}
