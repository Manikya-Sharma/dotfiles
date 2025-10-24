return {
	"sainnhe/everforest",
	priority = 1000,
	init = function()
		vim.g.everforest_enable_italic = true
		vim.g.everforest_background = "hard"
		vim.g.everforest_dim_inactive_windows = true
		vim.g.everforest_diagnostic_text_highlight = true
		vim.g.everforest_diagnostic_line_highlight = true
		vim.g.everforest_diagnostic_virtual_text = "colored"
		vim.g.everforest_transparent_background = true
		vim.cmd("colorscheme everforest")
	end,
}
