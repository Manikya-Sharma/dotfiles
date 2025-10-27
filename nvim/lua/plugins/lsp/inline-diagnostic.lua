return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	init = function()
		vim.diagnostic.config({ virtual_text = false })
	end,
	opts = {
		options = {
			add_messages = {
				messages = true,
				display_count = true,
				use_max_severity = false,
				show_multiple_glyphs = true,
			},
			multilines = {
				enabled = true,
				always_show = true,
			},
		},
	},
}
