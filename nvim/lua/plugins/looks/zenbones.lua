return {
	"zenbones-theme/zenbones.nvim",
	-- Optionally install Lush. Allows for more configuration or extending the colorscheme
	-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
	dependencies = "rktjmp/lush.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.zenbones = {
			darken_comments = 45,
			darken_noncurrent_window = true,
		}
		vim.cmd.colorscheme("tokyobones")
	end,
	enabled = false,
}
