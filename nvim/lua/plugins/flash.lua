return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			search = {
				enabled = true,
			},
			char = {
				enabled = false,
			},
		},
	},
	keys = {
		{
			"<leader>q",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
	},
}
