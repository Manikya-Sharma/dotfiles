return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("catppuccin")
	end,
	opts = {
		flavour = "mocha",
		auto_integrations = true,
		show_end_of_buffer = true,
		dim_inactive = {
			enabled = true,
		},
		styles = {
			keywords = { "italic" },
			functions = { "bold", "italic" },
			types = { "bold" },
		},
	},
	enabled = false,
}
